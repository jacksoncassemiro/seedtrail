"""Generate Seedtrail's portable plugin from the kit's canonical sources."""
from pathlib import Path
import argparse
import hashlib
import json
import re
import shutil
import struct
import subprocess
import zipfile


def build(output):
    root = Path(__file__).resolve().parents[1]
    output = Path(output).resolve()
    if output == root or root in output.parents:
        raise ValueError('Choose an output directory outside the source repository.')
    manifest = json.loads((root / 'plugin/plugin.json').read_text(encoding='utf-8'))
    version = manifest['version']
    if not re.fullmatch(r'\d+\.\d+\.\d+', version):
        raise ValueError('An explicit semantic version is required.')
    package = output / manifest['name']
    if package.exists():
        raise ValueError('Package destination exists; choose a new output directory.')
    package.mkdir(parents=True)
    library = package / 'references/library'
    for directory in ('templates', 'scripts', 'docs', 'tests', 'assets', 'plugin', 'website'):
        shutil.copytree(root / directory, library / directory)
    for filename in ('LICENSE', 'README.md', 'README.pt-BR.md', 'CONTRIBUTING.md', 'SECURITY.md'):
        shutil.copy2(root / filename, library / filename)
    shutil.copy2(root / 'LICENSE', package / 'LICENSE')
    shutil.copy2(root / 'plugin/host-adaptation.md', package / 'references/host-adaptation.md')
    (package / 'assets').mkdir()
    shutil.copy2(root / 'assets/seedtrail-icon.png', package / 'assets/icon.png')
    (package / 'plugin.json').write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    guidance = '''## Plugin execution context

This is a procedure library, not the user's initialized project. Read [host adaptation](../../references/host-adaptation.md) before applying this procedure. Resolve bundled links relative to this file. Product documents in the library are templates; use the user's authoritative sources for decisions and results. Save deliverables only in the user's chosen project or artifact location, never in the installed library. Read only relevant references.

'''
    source_skills = sorted((root / 'templates/.agents/skills').glob('*/SKILL.md'))
    if len(source_skills) != 11:
        raise ValueError('Unexpected canonical skill inventory; review the distribution contract.')
    for source in source_skills:
        target = package / 'skills' / source.parent.name / 'SKILL.md'
        target.parent.mkdir(parents=True)
        text = source.read_text(encoding='utf-8-sig')
        text = text.replace('../../../.kit/', '../../references/library/templates/.kit/')
        text = text.replace('../../../docs/product/', '../../references/library/templates/docs/product/')
        text = text.replace('../../../.agents/skills/', '../../references/library/templates/.agents/skills/')
        closing = text.index('\n---', 3) + len('\n---')
        target.write_text(text[:closing] + '\n\n' + guidance + text[closing:].lstrip(), encoding='utf-8')
    git = subprocess.run(['git', '-C', str(root), 'rev-parse', 'HEAD'], capture_output=True, text=True)
    source_commit = git.stdout.strip() if git.returncode == 0 else None
    sources = {file.relative_to(root).as_posix(): hashlib.sha256(file.read_bytes()).hexdigest() for file in source_skills}
    (package / 'source.json').write_text(json.dumps({'repository': manifest['repository'], 'commit': source_commit, 'canonical_skills_sha256': sources}, indent=2) + '\n', encoding='utf-8')
    validate(package)
    archive = output / ('seedtrail-' + version + '.zip')
    with zipfile.ZipFile(archive, 'w', zipfile.ZIP_DEFLATED) as bundle:
        for file in sorted(package.rglob('*')):
            if file.is_symlink():
                raise ValueError('Symlinks are not distributed: ' + str(file))
            if file.is_file():
                bundle.write(file, file.relative_to(output).as_posix())
    with zipfile.ZipFile(archive) as bundle:
        if bundle.testzip() is not None:
            raise ValueError('ZIP integrity check failed.')
        for file in package.rglob('*'):
            if file.is_file() and bundle.read(file.relative_to(output).as_posix()) != file.read_bytes():
                raise ValueError('ZIP/source mismatch: ' + str(file))
    result = {'archive': str(archive), 'skills': len(source_skills), 'source_commit': source_commit, 'sha256': hashlib.sha256(archive.read_bytes()).hexdigest(), 'verified': ['skill metadata', 'portable links', 'listing lengths', 'PNG', 'ZIP/source equality'], 'limits': ['No native host installation/discovery or behavior certification.', 'Directory scans and verified developer identity are separate.']}
    (output / 'verification.json').write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8')
    print(json.dumps(result, indent=2))


def validate(package):
    for skill in (package / 'skills').glob('*/SKILL.md'):
        text = skill.read_text(encoding='utf-8')
        metadata = re.match(r'^---\s*\nname: ([a-z0-9-]+)\ndescription: [^\n]+\n---', text)
        if not metadata or metadata[1] != skill.parent.name:
            raise ValueError('Invalid skill metadata: ' + str(skill))
        for href in re.findall(r'\]\(([^)]+)\)', text):
            if re.match(r'^(https?://|#)', href):
                continue
            target = (skill.parent / href.split('#')[0]).resolve()
            if package.resolve() not in target.parents or not target.exists():
                raise ValueError('Missing or escaping reference: ' + href)
    manifest = json.loads((package / 'plugin.json').read_text(encoding='utf-8'))
    presentation = manifest['extensions']['com.openai']['interface']
    for key, maximum in [('displayName', 30), ('shortDescription', 30), ('longDescription', 4000), ('developerName', 80)]:
        if not 0 < len(presentation[key]) <= maximum:
            raise ValueError('Invalid listing length: ' + key)
    prompts = presentation['defaultPrompt']
    if len(prompts) > 3 or len(set(prompts)) != len(prompts) or any(not 0 < len(prompt) <= 128 or '\n' in prompt for prompt in prompts):
        raise ValueError('Invalid starter prompts.')
    for key in ('websiteURL', 'supportURL', 'privacyPolicyURL', 'termsOfServiceURL'):
        if not presentation[key].startswith('https://') or len(presentation[key]) > 1024:
            raise ValueError('Invalid public URL: ' + key)
    for key in ('logo', 'composerIcon'):
        data = (package / presentation[key]).read_bytes()
        if data[:8] != b'\x89PNG\r\n\x1a\n':
            raise ValueError('Expected a PNG icon.')
        width, height = struct.unpack('>II', data[16:24])
        if width != height or not 256 <= width <= 4096 or len(data) > 5 * 1024 * 1024:
            raise ValueError('Invalid icon dimensions/size.')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', required=True, help='New output directory outside this repository.')
    arguments = parser.parse_args()
    build(arguments.output)
