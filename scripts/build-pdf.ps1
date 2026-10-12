# Genera entrega/SemArq1_Merxirve.pdf desde latex/
$ErrorActionPreference = "Stop"
$miktexBin = "$env:LOCALAPPDATA\Programs\MiKTeX\miktex\bin\x64"
if (-not (Test-Path $miktexBin)) {
    throw "MiKTeX no encontrado en $miktexBin"
}
$env:Path = "$miktexBin;$env:Path"

$root = Split-Path -Parent $PSScriptRoot
$latex = Join-Path $root "latex"
$out = Join-Path $root "entrega"
$job = "SemArq1_Merxirve"
$common = @(
    "-interaction=nonstopmode",
    "-output-directory=$out",
    "-jobname=$job"
)

Set-Location $latex
pdflatex @common --enable-installer main.tex
Set-Location $out
biber --input-directory="$latex" $job
Set-Location $latex
pdflatex @common --enable-installer main.tex
pdflatex @common --enable-installer main.tex

Write-Host "PDF: $(Join-Path $out "$job.pdf")"
