#!/usr/bin/env bash
# Genera entrega/SemArq1_Merxirve.pdf desde latex/ (TeX Live o MiKTeX en PATH)
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
LATEX="$ROOT/latex"
OUT="$ROOT/entrega"
JOB="SemArq1_Merxirve"

for cmd in pdflatex biber; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "No se encontró '$cmd'. Instala TeX Live (pdflatex, biber) o MiKTeX." >&2
    exit 1
  fi
done

mkdir -p "$OUT"

if command -v latexmk >/dev/null 2>&1; then
  cd "$LATEX"
  latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
else
  common=(-interaction=nonstopmode "-output-directory=$OUT" "-jobname=$JOB")
  cd "$LATEX"
  pdflatex "${common[@]}" main.tex
  (cd "$OUT" && biber --input-directory="$LATEX" "$JOB")
  pdflatex "${common[@]}" main.tex
  pdflatex "${common[@]}" main.tex
fi

echo "PDF: $OUT/$JOB.pdf"
