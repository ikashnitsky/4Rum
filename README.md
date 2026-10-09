# 4R/um --a monthly R exchange meeting at Statistics Denmark

R forum meeting materials can be found locally at `Q:/Rforum`. Each meeting has its own subfolder; if the subfolder is empty, there were no materials to share at the particilar meeting. Meeting materials that are open  and can be interesting to wider audience are also shared/linked here. 

# Meetings

## 2026-10-23 joint meeting with R Meetup Copenhagen
 - Aksel Thomsen, Novo Nordisk
 - Greger Dubrow, DTU Food
 - Emil Thrandholm, Statistics Denmark

## 2026-09-25 Thomas Lin Pedersen -- ggsql
[sildes](https://thomasp85.github.io/2026_ggsql_4rum)

## 2026-06-26 IKX -- fastverse
[Fastverse]()
[{collapse}]()
[{polars}]()

# R-forum seminars

Seminar material from the 4R/um R-forum at DST. Each seminar has its own subfolder, named by date and presenter.

## 2026-05-29 IKX -- SAS to R conversion

Ilya Kashnitsky presents an approach to converting SAS code to R. The folder holds an HTML rendering of the material (`sas-to-r-dst.html`).

## 2026-04-24 JOC & IKX -- R course feedback

Joint session by JOC and IKX reviewing feedback from the R course. The folder is currently empty, so the material has not been added yet.

## 2026-03-27 IKX -- DB connection speed

Benchmarks for reading and writing Oracle tables from R (`ROracle` vs `ODBC`) against the STATPROD database. The Quarto report `test-speed.qmd` (with rendered `test-speed.html`) compares fetch sizes, column and date encodings, and an optimized write function (`write_oracle_optimized()`), with helper scripts for encoding and writing/reading.

## 2026-02-27 IKX -- parquet

Using the `arrow` package to write and read Parquet files, compared with CSV for speed and file size. Based on the `diamonds` dataset in `using-arrow-parquet.R`, with supporting import/export functions in `functions-parquet-import-export.R`.

## 2025-11-28 PHP -- dstmetadata

Presentation by PHP on the `dstmetadata` package for working with metadata from Statistics Denmark. The material is a PowerPoint file (`r_forum_DSTmetadata.pptx`).

## 2025-10-24 JHD -- vscode

Presentation by JHD on working with VS Code and R, with the slides in `2025-10-23_R-forum-roundtable.pptx`. The subfolder also contains a `AYB-sas` subfolder, which is currently empty.

## 2025-09-26 IKX -- quarto

Introduction to Quarto for scientific and technical publishing, presented as a reveal.js slide deck (`slides-4rum-ikx-quarto.qmd`). The slides use the dark theme with `zenburn` highlighting and embedded resources.

## 2025-05-16 MNT -- maps DK

Making municipality (kommune) maps of Denmark in R, including a custom ggplot theme and helper functions in Danish and English. The folder holds the R scripts (e.g., `Kommunekort_skabelon.R`, `ggplot_tema.R`, `funktioner_da.R`/`funktioner_en.R`), example maps (`map_70.png`, `map_70.svg`), the presentation, and a Word document describing the functions.

<!-- Folders not yet listed: 2026-06-IKX-fastverse (empty), 2026-09-25-Thomas-Lin-Pedersen-ggsql (link to slides only). The archive/ folder holds older sessions from 2023. -->
