#!/usr/bin/env python3
"""Checagem literal auxiliar de saídas para casos da skill Humanizar Natural.

Não mede qualidade de escrita, naturalidade ou equivalência semântica.
Uso: python3 scripts/checar_resultados.py --cases tests/casos.jsonl --outputs respostas.jsonl
"""

import argparse
import json
import re
import sys
import unicodedata
from pathlib import Path


def normalize(value: str) -> str:
    value = unicodedata.normalize("NFKD", value).casefold()
    value = "".join(c for c in value if not unicodedata.combining(c))
    return re.sub(r"\s+", " ", value).strip()


def load_jsonl(path: Path, key: str) -> dict[str, dict]:
    records: dict[str, dict] = {}
    with path.open(encoding="utf-8") as stream:
        for line_no, raw in enumerate(stream, 1):
            if not raw.strip():
                continue
            try:
                item = json.loads(raw)
            except json.JSONDecodeError as exc:
                raise ValueError(f"{path}:{line_no}: JSON inválido: {exc}") from exc
            if not isinstance(item, dict) or not isinstance(item.get(key), str):
                raise ValueError(f"{path}:{line_no}: campo obrigatório '{key}' ausente ou inválido")
            record_id = item[key]
            if record_id in records:
                raise ValueError(f"{path}:{line_no}: id duplicado: {record_id}")
            records[record_id] = item
    return records


def check(case: dict, response: str) -> list[str]:
    errors: list[str] = []
    normalized = normalize(response)
    for term in case.get("must_contain", []):
        if normalize(term) not in normalized:
            errors.append(f"Falta termo normalizado: {term!r}")
    for term in case.get("must_not_contain", []):
        if normalize(term) in normalized:
            errors.append(f"Termo indesejado: {term!r}")
    for term in case.get("must_contain_exact", []):
        if term not in response:
            errors.append(f"Falta trecho literal: {term!r}")
    max_words = case.get("max_words")
    if max_words is not None:
        word_count = len(response.split())
        if word_count > max_words:
            errors.append(f"Comprimento: {word_count} palavras (máximo {max_words})")
    return errors


def self_test() -> int:
    case = {
        "must_contain": ["amanhã", "consulta"],
        "must_not_contain": ["venho por meio deste"],
        "must_contain_exact": ["`npm ci`"],
        "max_words": 20,
    }
    assert check(case, "Amanha tenho consulta. Rode `npm ci`.") == []
    problems = check(case, "Venho por meio deste. Rodar npm install.")
    assert len(problems) == 4, problems
    print("Autoteste do verificador: OK (não executa nenhum modelo).")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cases", type=Path, help="Arquivo JSONL de casos")
    parser.add_argument("--outputs", type=Path, help="Arquivo JSONL com id e response")
    parser.add_argument("--self-test", action="store_true", help="Autoteste sem outputs externos")
    args = parser.parse_args()
    if args.self_test:
        return self_test()
    if not args.cases or not args.outputs:
        parser.error("informe --cases e --outputs, ou use --self-test")
    try:
        cases = load_jsonl(args.cases, "id")
        outputs = load_jsonl(args.outputs, "id")
    except (OSError, ValueError) as exc:
        print(f"Erro de entrada: {exc}", file=sys.stderr)
        return 2

    passed = 0
    failed = 0
    missing = sorted(set(cases) - set(outputs))
    unexpected = sorted(set(outputs) - set(cases))
    for case_id, case in cases.items():
        if case_id not in outputs:
            continue
        response = outputs[case_id].get("response")
        if not isinstance(response, str):
            problems = ["Campo 'response' ausente ou inválido"]
        else:
            problems = check(case, response)
        if problems:
            failed += 1
            print(f"FALHOU [{case_id}]: {'; '.join(problems)}")
        else:
            passed += 1
            print(f"PASSOU [{case_id}] — somente verificações literais")
    if missing:
        print(f"Sem resposta para {len(missing)} casos: {', '.join(missing)}")
    if unexpected:
        print(f"IDs desconhecidos: {', '.join(unexpected)}")
    print(f"Resumo: {passed} passaram; {failed} falharam; {len(missing)} sem resposta.")
    print("A revisão humana dos critérios semânticos é obrigatória.")
    return 1 if failed or missing or unexpected else 0


if __name__ == "__main__":
    raise SystemExit(main())
