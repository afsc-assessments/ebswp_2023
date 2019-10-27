---
title: "Chapter 1: Assessment of the Walleye Pollock Stock \\ in the Eastern Bering Sea"
date: "20:12 October 26, 2019"
output:
  html_document:
    df_print: paged
  pdf_document:
    toc: true
    highlight: zenburn
    fig_caption: yes
    includes:
      in_header: mystyles.sty
    keep_tex: yes
    template: ms.tex
fontsize: 11pt
header-includes:
  - \usepackage{fontspec}
geometry: margin=1in
fontfamily: mathpazo
#bibliography: ~/OneDrive/myref.bib
---
\pagenumbering{gobble}


----


\begin{centering}
  James Ianelli, Stan Kotwicki, Taina Honkalehto, \\
  Abigail McCarthy, Sarah Stienessen, Kirstin Holsman,\\
  Elizabeth Siddon and Ben Fissel \\
\fontfamily{cmr}
\fontsize{10}{12}
\selectfont
  Alaska Fisheries Science Center, National Marine Fisheries Service \\
  National Oceanic and Atmospheric Administration \\ 
  7600 Sand Point Way NE., Seattle, WA 98115-6349 \\
October 26, 2019 \\
\end{centering}
----



\clearpage
\begin{table}[ht]
\centering
\caption{Goodness of fit to primary data used for assessment model parameter estimation profiling over different constraints on the extent bottom-trawl survey selectivity/availability is allowed to change;  EBS pollock.} 
\label{tab:mod_prof_fits}
\begin{tabular}{lrrrrr}
  \hline
Component & lastyr & Model 16.1 & VAST & VAST+cold-pool & VAST ATS \\ 
  \hline
RMSE BTS & 0.24 & 0.20 & 0.16 & 0.17 & 0.17 \\ 
  RMSE ATS & 0.22 & 0.22 & 0.22 & 0.22 & 0.38 \\ 
  RMSE AVO & 0.21 & 0.20 & 0.20 & 0.20 & 0.22 \\ 
  RMSE CPUE & 0.09 & 0.09 & 0.09 & 0.09 & 0.09 \\ 
  SDNR BTS & 1.23 & 1.19 & 1.87 & 2.13 & 2.12 \\ 
  SDNR ATS & 1.11 & 1.10 & 1.13 & 1.14 & 2.94 \\ 
  SDNR AVO & 0.58 & 0.76 & 0.74 & 0.73 & 0.85 \\ 
  Eff. N Fishery & 1438.80 & 1373.22 & 1382.62 & 1377.72 & 1374.02 \\ 
  Eff. N BTS & 168.54 & 203.81 & 202.13 & 203.12 & 204.09 \\ 
  Eff. N ATS & 213.53 & 215.76 & 212.94 & 212.77 & 220.10 \\ 
  BTS NLL & 29.11 & 28.36 & 25.45 & 26.18 & 25.63 \\ 
  ATS NLL & 8.94 & 8.84 & 9.03 & 9.18 & 26.94 \\ 
  AVO NLL & 9.88 & 9.54 & 9.62 & 9.62 & 9.59 \\ 
  Fish Age NLL & 115.29 & 138.79 & 139.08 & 139.50 & 139.00 \\ 
  BTS Age NLL & 165.38 & 149.68 & 144.19 & 145.28 & 145.90 \\ 
  ATS Age NLL & 28.22 & 26.85 & 26.99 & 27.06 & 25.96 \\ 
   \hline
\end{tabular}
\end{table}

```
## Error in eval(expr, envir, enclos): object 'mod_scen' not found
```

```
## Error in tab_fit(modlst, mod_scen): object 'mod_scen' not found
```

\begin{table}[ht]
\centering
\caption{Goodness of fit to primary data used for assessment model parameter estimation for different model configurations, EBS pollock.} 
\label{tab:mod_fits}
\begin{tabular}{lrrrrr}
  \hline
Component & lastyr & Model 16.1 & VAST & VAST+cold-pool & VAST ATS \\ 
  \hline
RMSE BTS & 0.240 & 0.200 & 0.160 & 0.170 & 0.170 \\ 
  RMSE ATS & 0.220 & 0.220 & 0.220 & 0.220 & 0.380 \\ 
  RMSE AVO & 0.210 & 0.200 & 0.200 & 0.200 & 0.220 \\ 
  RMSE CPUE & 0.090 & 0.090 & 0.090 & 0.090 & 0.090 \\ 
  SDNR BTS & 1.230 & 1.190 & 1.870 & 2.130 & 2.120 \\ 
  SDNR ATS & 1.110 & 1.100 & 1.130 & 1.140 & 2.940 \\ 
  SDNR AVO & 0.580 & 0.760 & 0.740 & 0.730 & 0.850 \\ 
  Eff. N Fishery & 1438.800 & 1373.220 & 1382.620 & 1377.720 & 1374.020 \\ 
  Eff. N BTS & 168.540 & 203.810 & 202.130 & 203.120 & 204.090 \\ 
  Eff. N ATS & 213.530 & 215.760 & 212.940 & 212.770 & 220.100 \\ 
  BTS NLL & 29.110 & 28.360 & 25.450 & 26.180 & 25.630 \\ 
  ATS NLL & 8.940 & 8.840 & 9.030 & 9.180 & 26.940 \\ 
  AVO NLL & 9.880 & 9.540 & 9.620 & 9.620 & 9.590 \\ 
  Fish Age NLL & 115.290 & 138.790 & 139.080 & 139.500 & 139.000 \\ 
  BTS Age NLL & 165.380 & 149.680 & 144.190 & 145.280 & 145.900 \\ 
  ATS Age NLL & 28.220 & 26.850 & 26.990 & 27.060 & 25.960 \\ 
   \hline
\end{tabular}
\end{table}
<!--
#```{r child = 'text.Rmd'}
#```
#```{r child = 'ref.Rmd'}
#```
#```{r child = 'tab.Rmd'}
#```
#```{r child = 'figs.Rmd'}
#```
#```{r child = 'model.Rmd'}
#```
#```{r child = 'App.Rmd'}
#```
-->
 #\tableofcontents

 #\listoftables

 #\listoffigures


-->
