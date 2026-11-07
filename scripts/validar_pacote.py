#!/usr/bin/env python3
"""Verifica estrutura e integridade do pacote; não testa comportamento de modelos."""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SKILL = ROOT / 'skills' / 'humanizar-natural-ptbr' / 'SKILL.md'
MANIFEST = ROOT / 'scripts' / 'publicacao-manifest.txt'
TESTS = ROOT / 'tests' / 'casos.jsonl'
REQUIRED = [
    'README.md', 'LICENSE', 'CHANGELOG.md', 'SKILL.md', 'AGENTS.md', 'GEMINI.md',
    'gemini-extension.json', '.claude-plugin/plugin.json', '.cursor-plugin/plugin.json',
    'scripts/instalar.sh', 'scripts/instalar.ps1', 'publicar-humanizer.sh',
    'scripts/checar_resultados.py', 'scripts/validar_pacote.py',
    'skills/humanizar-natural-ptbr/SKILL.md', 'docs/COMPATIBILIDADE.md',
    'tests/PROTOCOLO.md', 'tests/casos.jsonl',
]


def check() -> None:
    errors: list[str] = []
    for relative in REQUIRED:
        if not (ROOT / relative).is_file():
            errors.append(f'Arquivo obrigatório ausente: {relative}')
    if errors:
        raise ValueError('; '.join(errors))
    canonical = SKILL.read_text(encoding='utf-8')
    if canonical != (ROOT / 'SKILL.md').read_text(encoding='utf-8'):
        errors.append('SKILL.md da raiz difere da fonte canônica')
    for ref_file in (SKILL.parent / 'references').glob('*.md'):
        if (ROOT / 'references' / ref_file.name).read_bytes() != ref_file.read_bytes():
            errors.append(f'Referência raiz divergente: {ref_file.name}')
    if not canonical.startswith('---\n') or '\n---\n' not in canonical[4:]:
        errors.append('Frontmatter YAML inválido')
    if not re.search(r'^name:\s*humanizar-natural-ptbr\s*$', canonical, re.M):
        errors.append('Campo name ausente/incorreto')
    if 'description:' not in canonical.split('\n---\n', 2)[0]:
        errors.append('Campo description ausente')
    for reference in re.findall(r'references/[\w.-]+\.md', canonical):
        if not (SKILL.parent / reference).is_file():
            errors.append(f'Referência não encontrada: {reference}')
    for relative in ['.claude-plugin/plugin.json', '.cursor-plugin/plugin.json', 'gemini-extension.json']:
        try:
            obj = json.loads((ROOT / relative).read_text(encoding='utf-8'))
            if not obj.get('name') or not obj.get('version'):
                raise ValueError('name/version ausentes')
            if obj.get('version') != '2.0.0':
                raise ValueError('Versão incorreta')
        except (ValueError, json.JSONDecodeError) as exc:
            errors.append(f'Manifesto inválido {relative}: {exc}')
    test_ids: set[str] = set()
    count = 0
    for no, line in enumerate(TESTS.read_text(encoding='utf-8').splitlines(), 1):
        if not line.strip():
            continue
        try:
            obj = json.loads(line)
            assert isinstance(obj['id'], str) and isinstance(obj['prompt'], str)
            assert obj['id'] not in test_ids
            assert len(obj.get('human_checks', [])) >= 1
            for key in ('must_contain', 'must_not_contain', 'must_contain_exact'):
                assert all(isinstance(v, str) for v in obj.get(key, []))
            test_ids.add(obj['id'])
            count += 1
        except (KeyError, AssertionError, json.JSONDecodeError) as exc:
            errors.append(f'Teste malformado na linha {no}: {exc}')
    if count < 35:
        errors.append(f'Poucos casos: {count} (<35)')
    if not MANIFEST.is_file():
        errors.append('Manifesto de publicação ausente')
    else:
        listed = [l for l in MANIFEST.read_text(encoding='utf-8').splitlines() if l and not l.startswith('#')]
        actual = sorted(str(p.relative_to(ROOT)) for p in ROOT.rglob('*') if p.is_file() and '.git' not in p.parts and not any(part.startswith('__pycache__') for part in p.parts))
        if sorted(set(listed)) != actual:
            errors.append(f'Manifesto não corresponde aos arquivos: faltantes={sorted(set(actual)-set(listed))}; extras={sorted(set(listed)-set(actual))}')
        if len(set(listed)) != len(listed):
            errors.append('Entradas repetidas no manifesto')
        if any('..' in Path(p).parts or Path(p).is_absolute() for p in listed):
            errors.append('Caminho inseguro no manifesto')
    if errors:
        raise ValueError('\n - '.join(errors))
    print(f'Pacote OK: {len(list(ROOT.rglob("*")))} entradas; {count} testes JSONL; estruturas e manifestos válidos.')
    print('Não foram executados testes com modelos; a naturalidade depende de avaliação humana.')


if __name__ == '__main__':
    try:
        check()
    except (ValueError, OSError) as exc:
        print(f'Falha na validação:\n - {exc}', file=sys.stderr)
        raise SystemExit(1)
