# Seminario de Arquitecturas de Software — Equipo Merxirve

**Un análisis comparativo de estilos basados en capas y dominio** — Ingeniería de Software (C311).

| Campo | Valor |
|-------|--------|
| Equipo | **Merxirve** |
| PDF de entrega | `entrega/SemArq1_Merxirve.pdf` (no está en git; ver [Compilar](#compilar-el-documento) y [CI](#integración-continua)) |
| Enunciado | [`docs/enunciado/SemArqCapas-1.pdf`](docs/enunciado/SemArqCapas-1.pdf) |
| Repositorio | [seminario IS Arquitecturas de Software](https://github.com/Anthonycg2003/seminario-IS-Arquitecturas-de-Software) (`Anthonycg2003/seminario-IS-Arquitecturas-de-Software`) |

## Integrantes (C311)

- Enrique González González
- Ernesto Javier Govea Varona
- Olivia Ortiz Arboláez
- Anthony Cruz Garcia
- Jose Manuel Porras Guerra

## Asignación de preguntas (issues)

Cada pregunta tiene una **issue fija** en GitHub ([#1](https://github.com/Anthonycg2003/seminario-IS-Arquitecturas-de-Software/issues/1)–[#6](https://github.com/Anthonycg2003/seminario-IS-Arquitecturas-de-Software/issues/6)). Las issues se crean al publicar el repo, **sin responsable asignado**.

1. Abrir la issue de tu pregunta y **asignarte** en **Assignees** (cada integrante se asigna a sí mismo).
2. Crear una **rama**, redactar en el `.tex` correspondiente y abrir un **pull request** hacia `main` (no hacer push directo a `main`; la rama está protegida).
3. Cerrar la issue cuando el PR esté mergeado y la sección revisada.

Antes de la entrega final, actualizar la **tabla de la portada** en [`latex/sections/00-portada.tex`](latex/sections/00-portada.tex) para que refleje las asignaciones reales (requisito del enunciado). El README no sustituye esa tabla.

| Pregunta | Issue | Archivo LaTeX |
|----------|-------|---------------|
| 1. Trade-offs N-Capas vs Clean/Hexagonal | [#1](https://github.com/Anthonycg2003/seminario-IS-Arquitecturas-de-Software/issues/1) | [`01-pregunta-tradeoffs.tex`](latex/sections/01-pregunta-tradeoffs.tex) |
| 2. Hexagonal vs Onion | [#2](https://github.com/Anthonycg2003/seminario-IS-Arquitecturas-de-Software/issues/2) | [`02-pregunta-hexagonal-onion.tex`](latex/sections/02-pregunta-hexagonal-onion.tex) |
| 3. DDD y Bounded Context | [#3](https://github.com/Anthonycg2003/seminario-IS-Arquitecturas-de-Software/issues/3) | [`03-pregunta-ddd-bounded-context.tex`](latex/sections/03-pregunta-ddd-bounded-context.tex) |
| 4. Inversión de dependencias | [#4](https://github.com/Anthonycg2003/seminario-IS-Arquitecturas-de-Software/issues/4) | [`04-pregunta-inversion-dependencias.tex`](latex/sections/04-pregunta-inversion-dependencias.tex) |
| 5. Kitty Problem / OCP | [#5](https://github.com/Anthonycg2003/seminario-IS-Arquitecturas-de-Software/issues/5) | [`05-pregunta-kitty-problem.tex`](latex/sections/05-pregunta-kitty-problem.tex) |
| 6. N-Capas y calidad | [#6](https://github.com/Anthonycg2003/seminario-IS-Arquitecturas-de-Software/issues/6) | [`06-pregunta-n-capas-calidad.tex`](latex/sections/06-pregunta-n-capas-calidad.tex) |

Detalle del flujo: [`docs/asignacion-preguntas.md`](docs/asignacion-preguntas.md). Mapa de issues: [`docs/github-issues.md`](docs/github-issues.md).

## Estructura del repositorio

```text
docs/enunciado/     Enunciado oficial
entrega/            PDF final (generado localmente o en CI; ignorado por git)
latex/              Fuentes del informe
diagrams/source/    Diagramas editables (.drawio, .puml, .mmd)
diagrams/export/    Exportaciones para incluir en el PDF
.github/            CI (compilación LaTeX)
```

## Compilar el documento

Requisitos: `pdflatex`, `biber` y (recomendado) `latexmk`.

- **Windows:** [MiKTeX](https://miktex.org/) (el script añade MiKTeX al `PATH` si está en la ruta por defecto).
- **Linux / macOS:** [TeX Live](https://www.tug.org/texlive/) — en Debian/Ubuntu suele bastar `sudo apt install texlive-full` o un subset con `latexmk` y `biber`.

Salida en todos los casos: `entrega/SemArq1_Merxirve.pdf`.

**Windows:**

```powershell
.\scripts\build-pdf.ps1
```

**Linux / macOS:**

```bash
./scripts/build-pdf.sh
# o, si no tiene permiso de ejecución:
bash scripts/build-pdf.sh
```

**Cualquier sistema con Make:**

```bash
make pdf
```

En Linux y macOS, `make pdf` ejecuta [`scripts/build-pdf.sh`](scripts/build-pdf.sh); en Windows, [`scripts/build-pdf.ps1`](scripts/build-pdf.ps1). Si hay `latexmk`, se usa [`latex/latexmkrc`](latex/latexmkrc); si no, `pdflatex` → `biber` → `pdflatex` × 2.

## Rama `main` protegida

Los cambios a `main` solo entran por **pull request**. GitHub exige que el workflow de CI termine en verde antes del merge (job **`build`** en *Compilar LaTeX*).

## Integración continua

El workflow [`.github/workflows/latex.yml`](.github/workflows/latex.yml) compila el informe cuando cambian archivos en `latex/`:

- En **pull requests**: comprueba que el LaTeX compila antes de mergear (requisito para integrar).
- Al integrar en **`main`**: vuelve a compilar y publica el PDF como artefacto **`SemArq1-pdf`** en la pestaña *Actions* del run (descarga desde *Artifacts*).

El PDF no se versiona en el repositorio para evitar commits binarios; la fuente de verdad es `latex/`.

## Bibliografía

Referencias en [`latex/references.bib`](latex/references.bib). Citas en el texto con `\parencite{clave}`.

## Licencia

Contenido original bajo [CC BY 4.0](LICENSE). Las obras citadas conservan sus propias licencias.
