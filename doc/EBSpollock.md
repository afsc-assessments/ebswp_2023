---
title: "Chapter 1: Assessment of the Walleye Pollock Stock \\ in the Eastern Bering Sea"
date: "22:52 October 29, 2019"
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
  James Ianelli, Ben Fissel, Kirstin Holsman, Taina Honkalehto, \\
  Stan Kotwicki, Cole Monnahan, Elizabeth Siddon, \\
  Sarah Stienessen, and James Thorson \\
\fontfamily{cmr}
\fontsize{10}{12}
\selectfont
  Alaska Fisheries Science Center, National Marine Fisheries Service \\
  National Oceanic and Atmospheric Administration \\ 
  7600 Sand Point Way NE., Seattle, WA 98115-6349 \\ October 29, 2019 \\ \end{centering}
----




#  Executive summary

This chapter covers the Eastern Bering Sea (EBS) region—the Aleutian Islands
region (Chapter 1A) and the Bogoslof Island area (Chapter 1B) are presented
separately.

### Summary of changes in assessment inputs

Relative to last year’s BSAI SAFE report, the
following substantive changes have been made in the EBS pollock stock
assessment.

#### Changes in the data

   1.	The 2019 NMFS bottom-trawl survey (BTS) biomass and abundance at age estimates were included. 

   2.  The 2018 NMFS acoustic-trawl survey (ATS) age composition data were updated using samples from the ATS survey
       (in last year's assessment the age-length key was mainly composed of samples from the BTS)

   2.  The 2019 opportunistic acoustic data from vessels (AVO) conducting the
   bottom trawl survey was used as an added index of pollock biomass in mid-
   water. 

   2.  Observer data for catch-at-age and average weight-at-age from
   the 2018 fishery were finalized and included. 

   2.  Total catch as reported by NMFS Alaska Regional office was updated and included through 2019.

### Changes in the assessment methods

There were some changes to the assessment model. We added the facility to incorporate a full time and age varying
matrix of natural mortality rates to be specified (previously we used a time-constant vector of natural-mortality-at-age).
This was done to provide an alternative evaluation of the output from the multi-species trophic model (CEATTLE; this volume).
Also, new information is becoming available on the relative availability of pollock to our bottom trawl 
survey gear. To make comparisons, control over the way selectivity in that survey impacts the relative
"catchability" for key age groups was modified and evaluated against the results from the availability study.
The control allows an approach to approximate the relative amount of process error to allow for selectivity
changes (previously, the process error variance was specified through the ascending logistic parameters).

We contineud to refine treatment of survey data via
spatial-temporal models for  creating an alternative index including the
broader region of the northern Bering Sea. Additionally, we applied the VAST model to age-specific data
to derive alternative estimates of age composition data for  
the bottom-trawl survey. Preliminary results from applying spatial smoothers to the acoustic index was
also provided as a sensitivity.

## Summary of EBS pollock results

\begin{table}[ht]
\centering
\begin{tabular}{lrr|rr}
  \hline
       & \multicolumn{2}{c|}{As estimated or $\mathit{specified}$ } & \multicolumn{2}{c}{As estimated or $\mathit{recommended}$ }  \\
       & \multicolumn{2}{c|}{$\mathit{last}$ year for:}  & \multicolumn{2}{c}{$\mathit{this}$ year for: }               \\
        Quantity & 2019      &2020   & 2020      &2021 \\ 
  \hline
	M (natural mortality rate, ages 3+)	&	0.3	&	0.3	&	0.3	&	0.3 \\
Tier	&	1a	&	1a	&	1a	&	1a \\
Projected total (age  3+) biomass (t) & 9,110,000 t & 8,156,000 t & 8,558,000 t & 6,985,000 t \\
Projected female  spawning  biomass (t) & 3,107,000 t & 2,725,000 t & 2,834,000  t & 2,497,000  t \\  
$B_0$ & 5,866,000 t & 5,866,000 t & 5,733,000  t & 5,733,000  t \\          
$B_{msy}$ & 2,280,000 t & 2,280,000 t & 2,156,000  t & 2,156,000  t \\          
$F_{OFL}$ & 0.645 & 0.645 & 0.609  & 0.609  \\                  
$maxF_{ABC}$  & 0.510 & 0.51  & 0.484  & 0.484  \\                  
$F_{ABC}$ & 0.356 & 0.375 &  &  \\                  
$OFL$ & 3,913,000 t & 3,082,000 t & 3,823,000  t & 1,925,000  t \\          
$maxABC$  & 3,096,000 t & 2,437,000 t & 3,036,000 t & 1,529,000 t \\      
$ABC$ & 2,163,000 t & 1,792,000 t & 2,581,000 t & 1,300,000  t \\        
\hline
Status	                              &	2017	      &	2018	      &		2018             &	2019          \\
\hline
Overfishing	                          &	No	        &	n/a	      &	No	                       &	n/a                 \\
Overfished	                          &	n/a	        &	No	      &	n/a	                       &	No                  \\
Approaching overfished	              &	n/a	        &	No	      &	n/a	                       &	No                  \\
\hline
\end{tabular}
\end{table}

## Response to SSC and Plan Team comments

### General comments 


Plan team If the survey index is going to include the NBS, then inclusion of
the NBS in compositional data should also be explored (although this should
not make much of a difference since the size compositions in the EBS and NBS
are sufficiently similar) (done) Conduct a sensitivity test of the VAST index,
with environmental covariates, by omitting one or two years of NBS data at a
time  Compare and contrast other model-based index estimates with the VAST
approach Regarding the apparent shift in year class dominance between 2012 and
2013, the possibility of a shift in mean length at age should be explored, as
should the possible influence of ageing error Full treatment of both the
existing model and models with alternative treatments of the data should
continue to be provided, along with maxABC values under Tier 3 for all models
Re-examine the geographic subset of data currently used to develop the AVO
index, specifically to see if including Bristol Bay data improves the
correlation Explore “A” season trends in mean weight at length with a GAM or
similar technique, to determine if the trends are either predominantly
environmental or predominantly fishery-driven Regarding sR, explore
alternative fixed values or estimation methods

## SSC General comments 
The SSC recommends that one additional column be added
to include concerns related to fishery/resource-use performance and behavior,
considering commercial as well as local/traditional knowledge for a broader
set of observations. This additional column should not include socio-economic
considerations, but rather indications of concern such as inability to catch
the TAC, or dramatic changes in spatial or temporal distribution that could
indicate anomalous biological conditions. The SSC requests that all authors
fill out the risk table in 2019, and that the PTs provide comment on the
author’s results in any cases where a reduction to the ABC may be warranted
(concern levels 2-4). 

_We included an expanded evaluation of fishery performance this year. Specifically, we 
examined the spatial pattern of the fishery and developed a statistic of dispersion
of individual tows_


xxxxxxxxxxx


_In this assessment, a complete time series approach using a spatio temporal
model for survey observations outside the standard area was developed and applied. This
approach used the spatio-temporal model's estimated covariance matrix over time to
fit the survey data (similar to the way the current, density-dependent correction is
applied for survey data from the standard bottom trawl survey area)._

_Relative to the ecosystem status report..._
the Team recommends that assessment authors be more fully integrated into the
prioritization of AFSC ecosystem research, in order to: 1) develop methods and
approaches (where appropriate) of linking ecosystem indicators to individual
species; 2) identify species-specific ecosystem “red-flags;” and 3) track
indicator performance retrospectively, as is done for some of the pollock
recruitment indicators.

_A more formal qualitative risk table as developed by the Plan Team and a working group
was used and is presented below in discussing ABC considerations_

### Comments specific to this assessment

 
# Introduction

## General

Walleye pollock (_Gadus chalcogrammus_; hereafter referred to as pollock) are
broadly distributed throughout the North Pacific with the largest
concentrations found in the Eastern Bering Sea. Also  known as
Alaska pollock, this species continues to play important roles ecologically
and economically.

## Review of Life History 

In the EBS pollock spawn generally in the period
March-May and in relatively localized regions during specific periods (Bailey
2000). Generally spawning begins nearshore north of Unimak Island in March and
April and later near the Pribilof Islands (Jung et al. 2006, Bacheler et al.
2010). Females are batch spawners with up to 10 batches of eggs per female per
year. Eggs and larvae of EBS pollock are planktonic for a period of about 90
days and appear to be sensitive to environmental conditions. These conditions
likely affect their dispersal into favorable areas (for subsequent separation
from predators) and also affect general food requirements for over-wintering
survival (Gann et al. 2015, Heintz et al., 2013, Hunt et al. 2011, 
Ciannelli et al. 2004). Duffy-Anderson et al. (2015) provide a
review of the early life history of EBS pollock.

Throughout their range juvenile pollock feed on a variety of planktonic
crustaceans,  including calanoid copepods and euphausiids. In the EBS shelf
region, one-year-old pollock are found throughout the water column, but also
commonly occur in the NMFS bottom trawl survey. Ages 2 and 3 year old pollock
are rarely caught in summer bottom trawl survey gear and are more common in
the  midwater zone as detected by mid-water acoustic trawl surveys. Younger
pollock are  generally found in the more northern parts of the survey area and
appear to move to the southeast as they age (Buckley et al. 2009).
Euphausiids, principally _Thysanoessa inermis_ and _T. raschii_, are among the
most important prey items for pollock in the Bering Sea (Livingston, 1991;
Lang et al., 2000; Brodeur et al., 2002; Cianelli et al., 2004; Lang et al.,
2005).  Pollock diets become more piscivorous with age, and cannibalism has
been commonly observed in this region. However, Buckley et al. (2016) showed
spatial patterns of pollock foraging by size of predators. For example, the
northern part of the the shelf region between the 100 and 200 m isobaths
(closest to the shelf break) tends to be more piscivorous than counterparts in
other areas.


## Stock structure

Data from the survey work in the Northern Bering Sea (NBS) region (north of
Nunivak Island to the Russian convention line and into Norton Sound) from 2017
and 2018, as shown below and evaluated in the appendix, suggests that there
are concentrations of pollock present which contrasts with the 2010 survey
when relatively few pollock were present. The pattern of temperatures in the
region likely affect the pollock distribution in ways that likely vary over
time.  However, there is evidence of a relationship between mean bottom
temperatures in the US zone on the EBS shelf and subsequent biomass estimates
in the  Navarin basin (the Russian area adjacent to the Convention Line; e.g.,
Stepanenko and Gritsay 2018,  Ianelli et al. 2015). Some genetic samples were
taken from pollock and collections continue. Pending funding availability,
analysis of these samples could  help ascertain the extent that these fish are
related to those observed in the normal EBS shelf survey area.   Genetic
samples taken from the 2017 summer bottom trawl survey from the Northern
Bering Sea can be compared with samples from the standard Bering Sea Unimak,
Pribilof, Bogoslof, and Zhemchug. This planned study should help improve stock
structure evaluation (last done in Ianelli et al. 2015).


# Fishery  
## Description of the directed fishery 

Historically, EBS pollock catches were low until directed foreign fisheries
began in 1964. Catches increased rapidly during the late 1960s and reached a
peak in 1970--75 when they ranged from 1.3 to 1.9 million t annually.
Following the peak catch in 1972, bilateral agreements with Japan and the USSR
resulted in reductions. During a 10-year period, catches by foreign vessels
operating in the “Donut Hole” region of the Aleutian Basin were substantial
totaling nearly 7 million t (Table \ref{tab:catch}).   A fishing moratorium
for this area was enacted in 1993 and only trace amounts of pollock have been
harvested from the Aleutian Basin region since then.  Since the late 1970s,
the average EBS pollock catch has been about 1.2 million t, ranging from 0.810
million t in 2009 to nearly 1.5 million t during 2003-- 2006 (Table
\ref{tab:catch}).  United States vessels began fishing for pollock in 1980 and
by 1987 they were able to take 99\% of the quota. Since 1988, U.S. flagged
vessels have been operating in this fishery.  The current observer program for
the domestic fishery formally began in 1991 and prior to that, observers were
deployed  aboard the foreign vessels since the late 1970s.  From the period
1991 to 2011 about 80\% of the catch was observed at sea or during dockside
offloading. Since 2011, regulations require that all vessels participating in
the pollock fishery carry at least one observer so nearly 100% of the pollock
fishing operations are monitored by scientifically trained observers.
Historical catch estimates used in the assessment, along with management
measures (i.e., ABCs and TACs) are shown in Table \ref{tab:abc_tac}. 


### Catch patterns

The \"A-season\" for directed EBS pollock fishing opens on January 20th and
fishing typically extends into early-mid April. During this season the fishery
targets pre-spawning pollock and produces pollock roe that, under optimal
conditions, can comprise over 4\% of the catch in weight. The second, or
\"B-season\" presently opens on June 10th and fishing extends through noon on
November 1st. The A-season fishery concentrates primarily north and west of
Unimak Island depending on ice conditions and fish distribution. There has
also been effort along the 100m depth contour (and deeper) between Unimak
Island and the Pribilof Islands. The general pattern by season (and area) has
varied over time with recent B-season catches occurring in the southeast
portion of the shelf (east of 170$^\circ$W longitude; Fig. \ref{fig:catch}).
Since 2011, regulations and industry-based measures to reduce Chinook salmon
bycatch have affected the spatial distribution of the fishery and to some
degree, the way individual vessel operators fish (Stram and Ianelli, 2014).


The catch estimates by sex for the seasons indicate that over time, the number
of males and females has been fairly equal (Fig. \ref{fig:catch_sex}). The
2018 A-season fishery spatial pattern had relatively high concentrations of
fishing on the shelf north of Unimak Island, especially compared to the
pattern observed in 2016 when the fishing activity extended farther north
(Fig. \ref{fig:catch_distn_a}).  The 2018 A-season catch rates continued to be
high improving even on the good conditions observed in 2016 and 2017 A (and B)
seasons (Fig. \ref{fig:aseas_cpue}). Beginning in 2017, due to  a regulatory
change, up to 45\% of the TAC could be taken in the A-season (previously only
40\% of the TAC could be taken). This conservation measure was made to allow
greater flexibility to avoid Chinook salmon in the B-season. To date, it
appears that the pollock fleet as a whole took advantage of  this added
flexibility (Fig. \ref{fig:prop_a_season}).

The fishing in summer-fall 2018 was again concentrated in the south eastern
area near the shelf break but also showed more catches in the northwestern
part compared to 2016 and 2017 (Fig. \ref{fig:catch_distn_b}).   The 2018
summer and fall (B-season) catch per hour fished was lower than the last few
years and fishing began slowly and improved to be about average (since 2011;
Fig. \ref{fig:bseas_cpue}).  Since 1979 the catch of EBS pollock has
averaged 1.19 million t with the lowest catches occurring in 2009 and 2010
when the limits were set to 0.81 million t due to stock declines (Table
\ref{tab:abc_tac}). Pollock retained and discarded catch (based on NMFS
observer estimates) in the Eastern Bering Sea and Aleutian Islands for 
1991--2019 are shown in Table \ref{tab:catch_disc}. Since 1991, estimates of
discarded pollock have ranged from a high of 9.1\% of total pollock catch in
1992 to recent lows of around 0.6\%. These low values reflect the
implementation of the NMFS' Improved Retention /Improved Utilization
program. Prior to the implementation of the American Fisheries Act (AFA) in
1999, higher discards may have occurred under the “race for fish” and
pollock marketable sizes were caught incidentally. Since
implementation of the AFA, the vessel operators have more time to pursue
optimal sizes of pollock for market since the quota is allocated to vessels
(via cooperative arrangements). In addition, several vessels have made gear
modifications to avoid retention of smaller pollock. In all cases, the
magnitude of discards counts as part of the total catch for management (to
ensure the TAC is not exceeded) and within the assessment. Bycatch of other
non-target, target, and prohibited species is presented in the section titled
Ecosystem Considerations below. In that section it is noted that the bycatch
of pollock in other target fisheries is more than double the bycatch of other
target species (e.g., Pacific cod) in the pollock fishery.


## Management measures

The EBS pollock stock is managed by NMFS regulations that provide limits on
seasonal catch. The NMFS observer program data provide near real-time
statistics during the season and vessels operate within well-defined limits.
In most years the TACs have been set well below the ABC value and catches have
stayed within these constraints (Table \ref{tab:abc_tac}). Allocations
of the TAC split first with 10\% to western Alaska communities as part of the
Community Development Quota (CDQ) program and the remainder between at-sea
processors and shore-based sectors. For a characterization of the CDQ program
see Haynie (2014).  Seung and Ianelli (2016) combined a fish population
dynamics model with an economic model to evaluate regional impacts.

Due to concerns that groundfish fisheries may impact the rebuilding of the
Steller sea lion population, a number of management measures have been
implemented over the years. Some measures were designed to reduce the
possibility of competitive interactions between fisheries and Steller sea
lions. For the pollock fisheries, seasonal fishery catch and pollock biomass
distributions (from surveys) indicated that the apparent disproportionately
high seasonal harvest rates within Steller sea lion critical habitat could
lead to reduced sea lion prey densities. Consequently, management measures
redistributed the fishery both temporally and spatially according to pollock
biomass distributions. This was intended to disperse fishing so that localized
harvest rates were more consistent with estimated annual exploitation rates. The
measures include establishing: 1) pollock fishery exclusion zones around sea
lion rookery or haulout sites; 2) phased-in reductions in the seasonal
proportions of TAC that can be taken from critical habitat; and 3) additional
seasonal TAC releases to disperse the fishery in time.

Prior to adoption of the above management measures, the pollock fishery
occurred in each of the three major NMFS management regions of the North
Pacific Ocean: the Aleutian Islands (1,001,780 km$^2$  inside the EEZ), the
Eastern Bering Sea (968,600 km$^2$), and the Gulf of Alaska (1,156,100 km$^2$). The
marine portion of Steller sea lion critical habitat in Alaska west of 150 $^{\circ}$ W
encompasses 386,770 km$^2$ of ocean surface, or 12\% of the fishery management
regions.

From 1995XX--1999 84,100 km$^2$, or 22\% of the Steller sea lion critical
habitat was closed to the pollock fishery. Most of this closure consisted of
the 10 and 20 nm radius all-trawl fishery exclusion zones around sea lion
rookeries (48,920 km$^2$, or 13\% of critical habitat). The remainder was
largely management area 518 (35,180 km$^2$, or 9\% of critical habitat) that
was closed pursuant to an international agreement to protect spawning stocks
of central Bering Sea pollock. In 1999, an additional 83,080 km$^2$ (21%) of critical habitat in the Aleutian
Islands was closed to pollock fishing along with 43,170 km$^2$  (11%) around sea
lion haulouts in the GOA and Eastern Bering Sea. In 1998, over 22,000 t of
pollock were caught in the Aleutian Island region, with over 17,000 t taken
within critical habitat region. Between 1999 and 2004 a directed fishery for
pollock was prohibited in this region. Subsequently, 210,350 km$^2$  (54%) of
critical habitat was closed to the pollock fishery. In 2000 the remaining
phased-in reductions in the proportions of seasonal TAC that could be caught
within the BSAI Steller sea lion Conservation Area (SCA) were implemented.

On the EBS shelf, an estimate (based on observer at-sea data) of the
proportion of pollock caught in the SCA has averaged about 44% annually.
During the A-season, the average is also about 44%. Nonetheless, the
proportion of pollock caught within the SCA varies considerably, presumably
due to temperature regimes and the relative population age structure.  The
annual proportion of catch within the SCA varies and has ranged from an annual
low of 11% in 2010 to high of 60% in 1998--the 2018 annual value was 54% but
was quite high in the  A-season (63\%; Table \ref{tab:catch_sca}).  The higher
values in recent years  were likely due to good fishing conditions close to
the main port.

The AFA reduced the capacity of the catcher/processor fleet and permitted the
formation of cooperatives in each industry sector by the year 2000. Because of
some of its provisions, the AFA gave the industry the ability to respond
efficiently to changes mandated for sea lion conservation and salmon bycatch
measures. Without such a catch-share program, these additional measures would
likely have been less effective and less economical (Strong and Criddle 2014).

An additional strategy to minimize potential adverse effects on sea lion
populations is to disperse the fishery throughout more of the pollock range on
the Eastern Bering Sea shelf. While the distribution of fishing during the
A-season is limited due to ice and weather conditions, there appears to be
some dispersion to the northwest area (Fig. \ref{fig:catch_distn_a}).

The majority (about 56\%) of Chinook salmon caught as bycatch in the pollock
fishery originate from western Alaskan rivers. An Environmental Impact
Statement (EIS) was completed in 2009 in conjunction with the Council’s
recommended bycatch management approach. This EIS evaluated the relative
impacts of different bycatch management approaches as well as estimated the
impact of bycatch levels on adult equivalent salmon (AEQ) returning to river
systems (NMFS/NPFMC 2009). As a result, revised Chinook salmon bycatch
management measures went into effect in 2011 which imposed new prohibited
species catch (PSC) limits. These limits, when reached,  close the fishery by
sector and season (Amendment 91 to the BSAI Groundfish Fishery Management Plan
(FMP) resulting from the NPFMC’s 2009 action). Previously, all measures for
salmon bycatch imposed seasonal area closures when PSC levels reached the
limit (fishing could continue outside of the closed areas). The current
program imposes a dual cap system by fishing sector and season. A  goal of
this system was to maintain incentives to avoid bycatch at a broad range of
relative salmon abundance (and encounter rates). Participants are also
required to take part in an incentive  program agreement (IPA). These IPAs are
approved and reviewed annually by NMFS  to ensure individual vessel
accountability. The fishery has been operating under  rules to implement this
program since January 2011.

Further measures to reduce salmon bycatch in the pollock fishery were
developed and the Council took action on Amendment 110 to the BSAI Groundfish
FMP in April 2015. These additional measures were designed to add protection
for Chinook salmon by imposing more restrictive PSC limits in times of low
western Alaskan Chinook salmon abundance. This included provisions within the
IPAs that reduce fishing in months of higher bycatch encounters and mandate
the use of salmon excluders in trawl nets. These provisions were also included
to provide more flexible management measures for chum salmon bycatch within
the IPAs rather than through regulatory provisions implemented by Amendment 84
to the FMP. The new measure also included additional seasonal flexibility in
pollock fishing so that more pollock (proportionally) could be caught during
seasons when salmon bycatch rates were low.  Specifically, an additional 5% of
the pollock can be caught in the A-season (effectively changing the seasonal
allocation from 40% to 45% (as noted above in Fig. \ref{fig:prop_a_season}).
These measures are all part of Amendment 110 and a summary of this and other
key management measures is provided in Table \ref{tab:mgt}.


## Economic conditions as of 2018

Alaska pollock is the dominant species in terms of catch in the Bering Sea \&
Aleutian Island (BSAI) region. In 2018 pollock accounted for 70\% of the
BSAI's FMP groundfish harvest and 90\% of the total pollock harvest in Alaska.
Retained catch of pollock increased 1.5\% to 1.38 million t in 2018 (Table \ref{tab:bsaiplck_exv}). BSAI
pollock first-wholesale value was \$1.38 billion 2018, which was 3\% increase 
from 2017 and above the 2005--2007 average of \$1.25 billion (Table \ref{tab:bsaiplck_wsl}). The higher revenues
in recent years is the combined effect of strong catch and production levels and 
a steady increase in the average first-wholesale price between 2016 and 2017. The 
increases in the average  first-wholesale price of pollock products in 2016 and 2017 
were largely due to increases the price of surimi products while the price increase 
in 2018 was largely due to an increase in the price of fillets.

Pollock is targeted exclusively with pelagic trawl gear. The catch of pollock
in the BSAI was rationalized with the passage of the
AFA in 1998,\footnote{The AFA was implemented in 1999 for
catcher/processors, and in 2000 for catcher vessel and motherships.} which,
among other things, established a proportional allocation of the total
allowable catch (TAC) among vessels in sectors which were allowed to form into
cooperatives.\footnote{The BSAI pollock TAC is divided between Community
Development Program (10\% off the top), with the remaining amount split among shore-based
catcher vessels (50\%), at-sea catcher/processors (40\%) and motherships (10\%).} 

Prior to 2008 pollock catches were high at approximately 1.4 million t in the
BSAI for an extended period (Table \ref{tab:bsaiplck_exv}). The U.S. accounted
for over 50\% of the global pollock catch (Table \ref{tab:bsaiplck_glbl}).
Between 2008--2010 conservation reductions in the pollock total allowable catch
(TAC) trimmed catches to an average 867 kt. The supply reduction
resulted in price increases for most pollock products, which mitigated the
short-term revenue loss (Table \ref{tab:bsaiplck_glbl}). Over this same
period, the pollock catch in Russia increased from an average of 1 million t
in 2005--2007 to 1.4 million t in 2008--2010 and Russia's share of global catch
increased to over 50\% and the U.S. share decreased to 35\%. Russia lacks the
primary processing capacity of the U.S. and much of their catch is exported to
China and is re-processed as twice-frozen fillets. Around the mid- to late-
2000s, buyers in Europe, an important segment of the fillet market, started to
source fish products with the MSC sustainability certification, and
retailers in the U.S. later began to follow suit. Asian markets, an important
export destination for a number of pollock products, have shown less interest
in requiring MSC certification. The U.S. was the only producer of MSC
certified pollock until 2013 when roughly 50\% of the Russian catch became MSC
certified.\footnote{Alaska caught pollock in
the BSAI became certified by the Marine Stewardship Council (MSC) in 2005, an
NGO based third-party sustainability certification, which some buyers seek.} 
Since 2010 the U.S. pollock stock rebounded with catches in the
BSAI ranging from 1.2--1.3 million t and Russia's catch has stabilized at 1.5
to 1.6 million t. The majority of pollock is exported; consequently exchange
rates can have a significant impact on market dynamics, particularly the
Dollar-Yen and Dollar-Euro.\footnote{Aggregate exports in Table \ref{tab:bsaiplck_glbl}
may not fully account for all pollock exports as products such as meal,
minced fish and other ancillary product may be coded as generic fish type for export purposes.}
In 2015 the official U.S. market name changed from "Alaska pollock" to
"pollock" enabling U.S. retailers to differentiate between pollock caught in
Alaska and Russia. Additionally, pollock more broadly competes with other whitefish that, 
to varying degrees, can serve as substitutes depending on the product. The pollock industry 
has avoided U.S. tariffs that would have a significant negative impact on them in the 
U.S.-China trade war. However, chinese tariffs on U.S. products could 
inhibit growth in that market.

This market environment accounts for some of the major trends in prices and
production across product types. Fillet prices peaked in 2008--2010 but
declined afterwards because of the greater supply from U.S. and Russia. The
2013 MSC certification of Russian-caught pollock enabled access to segments of
European and U.S. fillet markets, which has put continued downward pressure on
prices. Pollock roe prices and production have declined steadily over the last
decade as international demand has waned with changing consumer preferences in
Asia. Additionally, the supply of pollock roe from Russia has increased with
catch. The net effect has been not only a reduction in the supply of roe from
the U.S. industry, but also a significant reduction in roe prices which are
roughly half pre-2008 levels. Prior to 2008, roe comprised 23\% of the U.S.
wholesale value share, and since 2011 it has been roughly 10\% (Table \ref{tab:bsaiplck_wsl}). With the U.S.
supply reduction in 2008--2010, surimi production from pollock came under
increased pressure as U.S. pollock prices rose and markets sought cheaper
sources of raw materials (see Guenneugues and Ianelli 2013 for a global review
of surimi resources and market). This contributed to a growth in surimi from
warm-water fish of southeast Asia. Surimi prices spiked in 2008--2010 and have
since tapered off as production from warm-water species increased (as has
pollock). A relatively small fraction of pollock caught in Russian waters is
processed as surimi. Surimi is consumed globally, but Asian markets dominate
the demand for surimi and demand has remained strong.

The catch of pollock can be broadly divided between the shore-based sector
where catcher vessels make deliveries to inshore processors, and the at-sea
sector where catch is processed at-sea by catcher/processors and motherships
before going directly to the wholesale markets. The retained catch of the
shore-based sector increased 1\% increase to 718 kt. The value of these
deliveries (shore-based ex-vessel value) totaled \$236.7 million in 2018,
which was up 15\% from the ex-vessel value in 2017 driven mostly by a 14\%
increase in the ex-vessel price (Table \ref{tab:bsaiplck_exv}). 
The first-wholesale value of pollock products was
\$811 million for the at-sea sector and \$568 million for the shore-based
sector (Table \ref{tab:bsaiplck_wsl}). The higher revenue in recent years is
largely the result of increased catch levels as the average price of pollock
products has declined since peaking in 2008--2010 and since 2013 has been close
to the 2005--2007 average, though this varies across products types. The
average price of pollock products in 2018 decreased for the at-sea sector and
increased for the shore-based sectors. The increase in the at-sea sector
revenues was largely due to a decrease in surimi prices. Fillet product prices
increased 6.5\% in 2018. Roe prices also increased slightly however they 
remain low relative to levels roughly a decade ago.

The portfolios of products shore-based and at-sea processors produce are
similar. In both sectors the primary products processed from pollock are
fillets, surimi and roe, with each accounting for approximately 40\%, 40\%,
and 10\% of first-wholesale value (Table \ref{tab:bsaiplck_wsl}). The price of
products produced at-sea tend to be higher than comparable products produced
by the shore-based because of the shorter time span between catch, processing and
freezing. Since 2014 the price of fillets produced at-sea tend to be about
10\% higher, surimi prices tend to be about 30\% higher and the price of roe
about 50\% higher. Average prices for fillets produced at-sea also tend to be
higher because they produce proportionally more higher-priced fillet types
(like deep-skin fillets). The at-sea price first wholesale premium averaged
roughly \$0.30 per pound between 2005--2010 but has decreased to an average of
\$0.25 per pound between 2014--2018, in part, because the shore-based sector
increased their relative share of surimi production.\footnote{The at-sea price
premium is the difference between the average price of first-wholesale
products at-sea and the average price of first-wholesale products shore-
based.}

### Pollock fillets

A variety of different fillets are produced from pollock, with pin-bone-out
(PBO) and deep-skin fillets typically accounting for approximately 70\% and
30\% of production in the BSAI, respectively. Deep-skin fillet's share of
production  decreased to 34% in 2018. Total fillet production increased 7\%
to 168 kt in 2018, but since 2010 has increased with aggregate production and
catch and has been higher than the 2005--2007 average (Table
\ref{tab:bsaiplck_wsl}). The average price of fillet products in the BSAI
increased 7\% to \$1.37 per pound and is below the inflation adjusted average
price of fillets in 2005--2007 of \$1.49 per pound (2017 dollars).  Media
reports indicate that headed-and-gutted (H\&G) and fillet prices tended to be
strong throughout much of 2018 realtive to 2017. Pollock fillets sourced from Russia
are the direct competitor to Alaska sourced pollock fillets.
Fillets were a relatively small portion of Russian primary production
however, they plan to upgrade their fillet production capacity. Much of the
Russian catch goes to China for secondary processing into fillets so
this would do little to increase the overall volume, however, increased
primary fillet processing in Russia could increase competition with U.S.
produced single-frozen fillet products. Approximately 30\% of the fillets
produced in Alaska are estimated to remain in the domestic market, which
accounts for roughly 45\% of domestic pollock fillet consumption (AFSC
2016).\footnote{Additionally, roughly 10\% of the at-sea BSAI production is
processed as H\&G which is mostly exported, primarily to China, where is
reprocessed as fillets and some share of which returns to the U.S.. China also
processes H\&G from Russia into fillets which are also imported into the
domestic market. Current data collection does not allow us to estimate the
share of U.S. returning imports.} As pollock markets in recent years have
become increasingly tight, the industry has tried to maintain value by
increasing domestic marketing for fillet based product and creating product
types that are better suited to the American palette, in addition to increased
utilization of by-products. Reductions in whitefish supplies in 2018 may have put
upward pressure on pollock fillet prices. 

### Surimi seafood

Surimi production in 2018 was 196.5 kt, which was approximately the same as 2017 
was above the 2005--2007 average. Prices have, which have been rising since 2013, 
decrased 3\% to \$1.26 per pound in the BSAI in 2018 (Table
\ref{tab:bsaiplck_wsl}). Because surimi and fillets are both made from pollock
meat, activity in the fillet market can influence the decision of processors
to produce surimi as smaller average size of fish can incentivize surimi
production, particularly it yields a higher value than fillets. Additionally,
the supply of raw surimi material in Japan has been limited. 

### Pollock roe

Roe is a high priced product that is the focus of the A season catch destined
primarily for Asian markets. Roe production in the BSAI tapered off in the
late--2000s and since has generally fluctuated at under or near 20 kt annually,
production averaged 27 kt in 2005--2007 and was 20.6 kt in 2018, which was up
12\% from 2017 (Fig. \ref{fig:roe}). Prices peaked in the mid-2000s and have
followed a decreasing trend over the last decade which continued until 2015.
The Yen to U.S. Dollar exchange rate can influence prices and relatively stable 
through 2018 relative to 2017. The average roe price in the BSAI was up 0.5\%  in
2018 to \$2.89 per pound, and value rose 12\% value with in the increase in 
production to \$132 million (Table \ref{tab:bsaiplck_wsl}).

### Fish oil
Using oil production per 100 tons as a basic index (tons of oil per ton
retained catch) shows increases for the at-sea sector. In 2005--2007 it was
0.3\% and starting in 2008 it increased and leveled off after 2010 with over
1.5\% of the catch being converted to fish oil (Table \ref{tab:bsaiplck_oil}).
This represents about a 5-fold increase in recorded oil production during this
period. Oil production from the shore-based fleet was somewhat higher than the
at-sea processors prior to 2008 but has been relatively stable. Oil production 
estimates from the shore-based fleet may be
biased low because some production occurs at secondary processors (fishmeal
plants) in Alaska. The increased production of oil beginning in 2008 can be
attributed to the steady trend to add more value per ton of fish landed. 
The oil production index remained stable in 2018.

# Data
The following lists the data used in this assessment: 

\begin{table}[ht]
\centering
\label{tab:dataextent}
\begin{tabular}{p{1.5in}p{1.8in}p{2.8in}}
\hline
 Source & Type & Years \\
\hline
 Fishery & Catch biomass & 1964--2019 \\
 Fishery & Catch age composition & 1964--2018 \\
 Fishery & Japanese trawl CPUE & 1965--1976 \\
 EBS bottom trawl & Area-swept biomass and age-specific proportions & 1982--2019 \\
 Acoustic trawl survey & Biomass index and age-specific proportions & 1994, 1996, 1997, 1999, 2000, 2002, 2004, 2006--2010, 2012, 2014, 2016, 2018 \\
 Acoustic vessels of opportunity (AVO) & Biomass index & 2006--2019 \\
\hline
\end{tabular}
\end{table}

## Fishery 
### Catch
The catch-at-age composition was estimated using the methods described by
Kimura (1989) and modified by Dorn (1992). Length-stratified age data are used
to construct age-length keys for each stratum and sex. These keys are then
applied to randomly sampled catch length frequency data. The stratum-specific
age composition estimates are then weighted by the catch within each stratum
to arrive at an overall age composition for each year. Data were collected
through shore-side sampling and at-sea observers. The three strata for the EBS
were:  i) January–June (all areas, but mainly east of 170$^\circ$W); ii) INPFC area
51 (east of 170$^\circ$W) from July–December; and iii) INPFC area 52 (west of 170$^\circ$W)
from July–December. This method was used to derive the age compositions from
1991--2018 (the period for which all the necessary information is readily
available). Prior to 1991, we used the same catch-at-age composition estimates
as presented in Wespestad et al. (1996).

The catch-at-age estimation method uses a two-stage bootstrap re-sampling of
the data. Observed tows were first selected with replacement, followed by re-
sampling actual lengths and age specimens given that set of tows. This method
allows an objective way to specify the effective sample size for fitting
fishery age composition data within the assessment model. In addition,
estimates of stratum-specific fishery mean weights-at-age (and variances) are
provided which are useful for evaluating general patterns in growth and growth
variability. For example, Ianelli et al. (2007) showed that seasonal aspects
of pollock condition factor could affect estimates of mean weight-at-age. They
showed that within a year, the condition factor for pollock varies by more
than 15%, with the heaviest pollock caught late in the year from October-
December (although most fishing occurs during other times of the year) and the
thinnest fish at length tending to occur in late winter. They also showed that
spatial patterns in the fishery affect mean weights, particularly when the
fishery is shifted more towards the northwest where pollock tend to be smaller
at age. In 2011 the winter fishery catch consisted primarily of age 5 pollock
(the 2006 year class) and later in that year age 3 pollock (the 2008 year
class) were present. In 2012--2016 the 2008 year class was prominent in the
catches with 2015 showing the first signs of the 2012 year-class as three
year-olds in the catch (Fig. \ref{fig:catage}; Table \ref{tab:fsh_age}). The
sampling effort for age determinations, weight-length measurements, and length
frequencies is shown in Tables \ref{tab:fsh_meas}, \ref{tab:lw_meas}, and
\ref{tab:fsh_n}. Sampling for pollock lengths and ages by area has been shown
to be relatively proportional to catches (e.g., Fig. 1.8 in Ianelli et al.
2004).  The precision of total pollock catch biomass is considered high with
estimated  CVs to be on the order of 1\% (Miller 2005).

Scientific research catches are reported to fulfill requirements of the
Magnuson-Stevens Fisheries Conservation and Management Act. The annual
estimated research catches (1963--2018) from NMFS surveys in the Bering Sea
and Aleutian Islands Region are given in (Table \ref{tab:res_catch}). Since
these values represent extremely small fractions of the total removals
(about 0.02%) they are ignored for assessment purposes.

## Surveys

### Bottom trawl survey (BTS)

Trawl surveys have been conducted annually by the AFSC to assess the abundance
of crab and groundfish in the Eastern Bering Sea since 1979 and since 1982
using standardized gear and methods. For pollock, this survey has been
instrumental in providing an abundance index and information on the population
age structure. This survey is complemented by the acoustic trawl (AT) surveys
that sample mid-water components of the pollock stock. Between 1991 and 2018
the BTS biomass estimates ranged from 2.28 to 8.39 million t (Table
\ref{tab:bts_biom}; Fig. \ref{fig:bts_biom}).  In the mid-1980s and early
1990s several years resulted in above-average biomass estimates. The stock
appeared to be at lower levels during 1996--1999 then increased moderately
until about 2003 and since then has averaged just over 4 million t. These
surveys provide consistent measurements of environmental conditions, such as
the sea surface and bottom temperatures. Large-scale zoogeographic shifts in
the EBS shelf documented during a warming trend in the early 2000s were
attributed to temperature changes (e.g., Mueter and Litzow 2008). However,
after the period of relatively warm conditions ended in 2005, the next eight
years were mainly below average, indicating that the zoogeographic responses
may be less temperature-dependent than they initially appeared (Kotwicki and
Lauth 2013). Bottom temperatures increased in 2011 to about average from the
low value in 2010 but declined again in 2012--2013. However, in the period
2014--2016, bottom temperatures increased and reached a new high in 2016. In
2018 bottom temperatures were nearly as warm (after 2017 was
slightly above average) but was highly unusual due to the complete lack of 
"cold pool" (i.e., a defined area where water near bottom was less than zero degrees
C; Fig. \ref{fig:bts_temp}).  

Beginning in 1987 NMFS expanded the standard survey area farther to the
northwest. The pollock biomass levels found in the two northern strata were
highly variable, ranging from 1% to 22% of the total biomass; whereas the 2014
estimate was 12%, 2015 was 7%, and in the past two years is slightly below the
average (5%) at 4% and 3%--4% (Table \ref{tab:bts_biom}). In some years (e.g.,
1997 and 1998) some stations had high catches of pollock in that region and
this resulted in high estimates of sampling uncertainty (CVs of 95% and 65%
for 1997 and 1998 respectively). This region is contiguous with the Russian
border and these strata seem to improve coverage over the range of the
exploited pollock stock.

The 2018 bottom-trawl survey biomass estimate (design-based, area swept) was 3.11 million t, below
the average for this survey (4.7 million t). Particularly unusual this year
was the complete  lack of cold water on the bottom throughout the survey area
(Fig. \ref{fig:bts_temp_cpue}). Pollock appeared to be distributed more northerly in 2018 again (as was the
case in 2017 (Fig. \ref{fig:bts_3d}).  These figures also show that the
highest densities of pollock were at stations near Zhemchug Canyon.

The BTS abundance-at-age estimates show variability in year-class strengths
with substantial consistency over time (Fig. \ref{fig:bts_age}). Pollock above
40 cm in length generally appear to be fully selected and in some years many
1-year olds occur on or near the bottom (with modal lengths around 10--19 cm).
Age 2 or 3 pollock (lengths around 20--29 cm and 30--39 cm, respectively) are
relatively rare in this survey presumably because they are more pelagic as
juveniles. Observed fluctuations in survey estimates may be attributed to a
variety of sources including unaccounted-for variability in natural mortality,
survey catchability, and migrations. As an example, some strong year classes
appear in the surveys over several ages (e.g., the 1989 year class) while
others appear only at older ages (e.g., the 1992 and 2008 year class).
Sometimes initially strong year classes appear to wane in successive
assessments (e.g., the 1996 year class estimate (at age 1) dropped from 43
billion fish in 2003 to 32 billion in 2007 (Ianelli et al. 2007).
Retrospective analyses (e.g., Parma 1993) have also highlighted these
patterns, as presented in Ianelli et al. (2006, 2011). Kotwicki et al. (2013)
also found that the catchability of either the BTS or AT survey for pollock is
variable in space and time because it depends on environmental variables, and
is density-dependent in the case of the BTS survey.

The 2018 survey age compositions were developed from age-structures collected
during the survey (June-July) and processed at the AFSC labs within a few
weeks after the survey was completed. The level of sampling for lengths and
ages in the BTS is shown in (Table \ref{tab:bts_n}). The estimated numbers-at-
age from the BTS for strata (1--9 except for 1982--84 and 1986, when only strata
1--6 were surveyed) are presented in Table \ref{tab:bts_age} and contains the
values used for the index which accounts for density-dependence in bottom
trawl tows (Kotwicki et al. 2014). Mean body mass at ages from the survey are
shown in (Table \ref{tab:wt_bts}).

The bottom trawl survey has extended to the north in 2010, 2017, and again
this year (but was limited to 49 stations). Given that the pollock abundance
was quite high in 2017 and 2018, a method for incorporating this information
as part of the standard survey was desired. One approach for constructing a
full time series  that included the NBS area is to use observed spatial and
temporal correlations. We used the vector-autoregressive spatial temporal
(VAST) model of Thorson (2018b) together with the density- dependent corrected
CPUE values from each station (including stations where pollock were absent;
Table \ref{tab:bts_abund}). Please refer to the appendix for further details
on the implementation. The appendix also shows results that indicate the VAST
model diagnostics are reasonable and provide consistent interpretations
relative to the observations. Notably, results indicate increased uncertainty
in years and areas when stations were missing.  Application of this index
within the stock assessment model requires accounting for the temporal
covariation. Since this has been part of the assessment for the time series of
biomass used  in past years, including the covariance specification was simple
to implement and required no changes to the assessment model code.


### Acoustic trawl (AT) surveys
The AT surveys are conducted biennially and are designed to estimate the off-
bottom component of the pollock stock (compared to the BTS which are conducted
annually and provide an abundance index of the near-bottom pollock). The
number of trawl hauls, lengths, and ages sampled from the AT survey are
presented in (Table \ref{tab:ats_n}).  Estimated pollock biomass (to 3m from
bottom) for the shelf was above 4 million tons in the early years of the time
series (Table \ref{tab:bts_abund}). It dipped below 2 million t in 1991. Since
1994, the years for which AT survey estimates are available to within 0.5 m of
bottom, the biomass increased and remained between about 3 and 4.5 million t
for a decade (1994–2004). The early 2000s (a relatively ‘warm’ period) were
characterized by low pollock recruitment, which was subsequently reflected in
lower pollock biomass estimates between 2006 and 2012 (the ‘cold’ period;
Honkalehto and McCarthy 2015). In 2014 and 2016 (another ‘warm’ period) with
the growth of the strong 2012 year class, AT biomass estimates increased to
over 4 million t, exceeding levels observed in 1994-2004 (Tables
\ref{tab:bts_abund} and \ref{tab:ats_biom}).

In 2018 we estimated pollock by length and age for the surveyed area for that year
using routine AT survey methods (e.g., Honkalehto and McCarthy, 2015).
Estimates for pollock from the midwater layer between the surface and 3m were
combined with those from the bottom layer between 0.5 and 3m depth, as adopted
in 2016.  The pollock biomass estimate to within 0.5 m of the seafloor was
2.321 million t for the sampled ‘core’ area, which encompassed  92,283 nmi$^2$
in 2018 was 2.321 million t.  

xxxThe pollock biomass estimate was 237,722 t for
the northern extension area, which encompassed  6,900 nmi$^2$ outside of the
traditional AT survey area, pollock biomass was estimated to be 237,722 t. A
spatial comparison of these AT survey biomass estimates with the BTS biomass
is shown in Fig. \ref{fig:ats_bts}. 
The combined biomass estimate for the 2018 AT survey was 2.50
million t, below average for the time series since 1994  (Table
\ref{tab:ats_biom}).

Relative estimation errors for the total biomass were derived from a one-
dimensional (1D) geostatistical method, and accounts for observed spatial
structure for sampling along transects (Table \ref{tab:ats_biom}; Petitgas 1993, Walline 2007,
Williamson and Traynor 1996). As in previous assessments, the other sources of
error (e.g., target strength, trawl selectivity) were accounted for by
inflating the annual error estimates to have an overall average CV of 25\% for
application within the assessment model. Last year we estimated the 2018 EBS acoustic-trawl survey population numbers-at-age
based primarily on the BT survey age samples with supplemental
samples from the AT survey. This year those data were updated using only the AT age samples
(Fig. \ref{fig:at_age}; Table \ref{tab:ats_age}).

## Other time series used in the assessment

### Japanese fishery CPUE index 

An available time series relating the
abundance of pollock during the period 1965--1976 was included. This series is
based on Japanese  fishery catch rates which used the same size class of trawl
vessels   as presented in  Low and Ikeda (1980). A coefficient of variation of
20\% was applied.

### Biomass index from Acoustic-Vessels-of-Opportunity (AVO)

The details of how acoustic backscatter data from the two commercial fishing
vessels chartered for the eastern Bering Sea bottom trawl survey (BTS) were
used to compute a midwater abundance index for pollock can be found in
Honkalehto et al. (2011). This index was updated this year and shows acoustic-
trawl survey in the EBS. This biomass series shows a steady decrease since
2015 (Table \ref{tab:avo}).

A spatial comparison between the BTS data and AVO survey transects in 2018
suggests differences in the locales and densities of pollock (Fig.
\ref{fig:avo_bts}). This figure also shows that the AVO survey detected
densities that were less apparent in the BTS data.


#  Analytic approach
##  General model structure

A statistical age-structured assessment model conceptually outlined in
Fournier and Archibald (1982) and like Methot’s (1990) stock synthesis model
was applied over the period 1964--2019. A technical description is presented in
the Model Details section attached. The analysis was first introduced in the 1996 SAFE
report and compared to the cohort analyses that had been used previously and
was document Ianelli and Fournier 1998). The model was implemented using
automatic differentiation software developed as a set of libraries under the
C++ language (“ADMB,” Fournier et al. 2012). The data updated from last year’s
analyses include:

  - The 2019 EBS bottom trawl survey estimates of population numbers-at-
    age and biomass were added

  - The 2019 AVO acoustic backscatter data (as collected from the EBS bottom trawl survey vessels) 
    as a biomass index was added

  - The 2019 EBS acoustic-trawl survey estimates of population numbers-at-
    age were updated

  - The 2018 fishery age composition data were added 

  - The catch biomass estimates were updated through to the current year    

A simplified version of the assessment (with mainly the same data and
likelihood-fitting method) is included as a supplemental multi-species
assessment model. As presented since 2016, it allows for trophic interactions
among key prey and predator species and for pollock, and it can be used to
evaluate age and time-varying natural mortality estimates in addition to
alternative catch scenarios and management targets (see this volume:
[EBS multi-species model](https://www.afsc.noaa.gov/refm/stocks/plan_team/2018/EBSmultispp.pdf)).

## Description of alternative models

Model configuration options continue to be developed for
alternative data treatment. The spatio-temporal model fit to
BTS CPUE data _including stations from the NBS_ was expanded thanks to developments
of the application (Thorson 2019). 

This survey data model
applies the VAST (Thorson 2018) approach and due to allowing for
spatial and temporal correlation, is well suited to having missing stations in
some areas and years (and adjusts uncertainty accordingly). 

xxx

The second data
treatment simply increased the weight on the final two survey data points (by
reducing the CVs by a factor of 2). This was done because initial model runs
indicated relatively poor fits to these data and by adding some constraint, it
was hoped that structural aspects (and/or data conflicts) could be revealed.
Finally, the fourth model involved revisiting prior distribution on steepness
for the stock recruitment relationship (a response to Plan Team and SSC
requests). This included comparing a Beverton-Holt model with some recent
meta-analyses on priors for the steepness parameter based on Thorson et al. (2018) approach.

### Input sample size

Sample sizes assumed were re-evaluated in 2016 against the trade-off with
flexibility in time and age varying selectivity.  This resulted in tuning the
recent era (1991-present year) to average sample sizes of 350 for the fishery
and then using estimated values for the intermediate and earliest period (Table
\ref{tab:input_n}).  We assumed average values of 100 and 50 for the BTS and
ATS data, respectively with inter-annual variability reflecting the
variability in the number of hauls sampled for ages. The tuning aspects for
these effective sample size weights were estimated following Francis 2011
(equation TA1.8, hereafter referred to as Francis weights).

## Parameters estimated outside of the assessment model

### Natural mortality and maturity at age

The baseline 16.1 model specification has been to use constant natural
mortality rates at age (M=0.9, 0.45, and 0.3 for ages 1, 2, and 3+
respectively based on earlier work of Wespestad and Terry 1984). These values
have been applied to catch-age models and forecasts since 1982 and appear
reasonable for pollock. When predation was explicitly considered estimates
tend to be higher and more variable (Holsman et al. 2015; Livingston and
Methot 1998; Hollowed et al. 2000). Clark (1999) noted that specifying a
conservative (lower) natural mortality rate may be advisable when natural
mortality rates are uncertain. More recent studies confirm this (e.g., Johnson et al. 2015). In the 2014 assessment different natural
mortality vectors were evaluated in which the “Lorenzen” approach and that of
Gislason et al (2010) were tested. The values assumed for pollock natural
mortality-at-age and maturity-at-age (for all models; Smith 1981) consistent
with previous assessments were:

\begin{table}[ht]
\centering
\label{tab:dataextent}
\scalebox{0.9}{
\begin{tabular}{rrrrrrrrrrrrrrrr}
\hline
Age&1&2&3&4&5&6&7&8&9&10&11&12&13&14&15 \\
\hline
$M$&0.90&0.45&0.30&0.30&0.30&0.30&0.30&0.30&0.30&0.30&0.30&0.30&0.30&0.30&0.30 \\
$P_{mat}$&0.00&0.008&0.29&0.64&0.84&0.90&0.95&0.96&0.97&1.00&1.00&1.00&1.00&1.00&1.00 \\
\hline
\end{tabular}
}
\end{table}

In the supplemental multi-species assessment model alternative values of age
and time-varying natural mortality are presented. As in past years the estimates indicate
higher values than used here. 
In last year's evaluation of natural mortality
it was noted that the  survey age compositions favored lower values of M while
the fishery age  composition favored higher values. 
This is consistent with
the patterns seen in the  BTS survey data as they show increased
abundances of “fully selected” cohorts. Hence, given the model specification
(asymptotic selectivity for the BTS age composition data), lower natural
mortality rates would be consistent with those data. Given these trade-offs,
structural model assumptions were held to be the same as previous years for
consistency (i.e., the mortality schedule presented above).

Maturity-at-age values used for the EBS pollock assessment are originally
based on Smith (1981) and were reevaluated (e.g., Stahl 2004; Stahl and
Kruse 2008a; and Ianelli et al. 2005). These studies found inter-annual
variability but general consistency with the current assumed schedule of
proportion mature at age. 


### Length and Weight at Age

Age determination methods have been validated for pollock (Kimura et al. 1992;
Kimura et al. 2006, and Kastelle and Kimura 2006). EBS pollock size-at-age
show important differences in growth with differences by area, year, and
year class. Pollock in the northwest area are typically smaller at age than
pollock in the southeast area. The differences in average weight-at-age are
taken into account by stratifying estimates of catch-at-age by year, area,
season, and weighting estimates proportional to catch.

The assessment model for EBS pollock accounts for numbers of individuals in
the population. As noted above, management recommendations are based on
allowable catch levels expressed as tons of fish. While estimates of pollock
catch-at-age are based on large data sets, the data are only available up
until the most recent completed calendar year of fishing (e.g., 2018 for this
year). Consequently, estimates of weight-at-age in the
current year are required to map total catch biomass (typically equal to the
quota) to numbers of fish caught (in the current year). Therefore, these
estimates can have large impacts on recommendations (e.g., ABC and OFL).

The mean weight at age in the fishery can vary due to environmental conditions
in addition to spatial and temporal patterns of the fishery. Bootstrap
distributions of the within-year sampling variability indicate it is
relatively small compared to between-year variability in mean weights-at-age.
This implies that processes determining mean weights in the fishery cause more
variability than sampling (Table \ref{tab:wtage}). The coefficients of
variation between years are on the order of 6\% to 9\% (for the ages that are
targeted) whereas the sampling variability is generally around 1\% or 2\%. The
approach to account for the identified mean weight-at-age having clear year
and cohort effects was continued (e.g., Fig. \ref{fig:fsh_wtage_comb}).
Details were provided in appendix 1A of Ianelli et al. (2016). The results
from this method showed the relative variability between years and cohorts and
provide estimates (and uncertainty) for 2019--2021
(Table \ref{tab:wtage}). The changes in weight-at-age in the fishery are
substantial, especially for the apparent abundant year-classes (e.g., the 4--9
year-olds from 2012--2018 representing the 2008 year class; Fig.
\ref{fig:fsh_wtage_comb}).) 
To examine this more closely, we split the
bootstrap results into area-season strata and were able to get an overall
picture of the pattern by strata (Fig. \ref{fig:fsh_wtage}).  Breaking this
further by year and strata for recent years shows variability in the relative
body mass at age between strata and years (Fig. \ref{fig:fsh_wtage_strata}).
In summary, these figures support that accounting for year and cohort effects
is important in projecting body mass-at-age forward.

Extensive fishery observer data were available for examining patterns in
length-weight condition  (standardized for length over all years and areas,
1991--2018). The process for these data were:
 
   1. extract all data where non-zero measurements of pollock length and weight were available between the lengths of 35 and 60 cm for the EBS region

   2. compute the mean value of body mass (weight) for each cm length bin over all areas and time

   3. divide each weight measurement by that mean cm-specific value (the "standardization" step)

   4. plot these standardized values by different areas, years, months etc. to evaluate condition differences (pooling over ages is effective as there were no size-specific biases apparent)


In the first instance, the overarching seasonal pattern in body mass relative
to the mean shows that as the winter progresses prior to peak spawning,
pollock are generally skinnier than average whereas in July, the median is
about average(Fig. \ref{fig:fsh_lw_month}). As the summer/fall progresses,
fish were at their heaviest given length (Fig. \ref{fig:fsh_lw_month}). This
is also apparent when the data are aggregated by A- and B-seasons (and by east
and west of 170$^\circ$W; referred to as SE and NW respectively) when plotted
over time (Fig. \ref{fig:fsh_lw_str_yr_box} and \ref{fig:fsh_lw_str_box}).
Differences in seasons were most apparent. The A-season data indicated that
most pollock were below the global mean except for a few years whereas in the
southeast the B-season were mostly above average in all years. Computing just
the mean standardized value for each strata and year shows this pattern more
clearly (Fig. \ref{fig:fsh_lw_str_yr_mean}). Of particular concern is that in
the A-season, which is primarily focused on pre-spawning fish, the condition
of pollock appears to have been the skinniest (given length) for the past four
years in a row (Fig. \ref{fig:fsh_lw_str_yr_mean}).


## Parameters estimated within the assessment model

For the selected model, 952 parameters were estimated conditioned on data and
model assumptions. Initial age composition, subsequent recruitment, and stock-
recruitment parameters account for 78 parameters. This includes vectors
describing the initial age composition (and deviation from the equilibrium
expectation) in the first year (as ages 2--15 in 1964) and the recruitment mean
and deviations (at age 1) from 1964--2018 and projected recruitment variability
(using the variance of past recruitments) for five years (2020--2025). The two-
parameter stock-recruitment curve is included in addition to a term that
allows the average recruitment before 1964 (that comprises the initial age
composition in that year) to have a mean value different from subsequent
years. Note that the stock-recruit relationship is fit only to stock and
recruitment estimates from 1978 year-class through to the 2017 year-class.

Fishing mortality is parameterized to be semi-separable with year and age
(selectivity) components. The age component is allowed to vary over time;
changes are allowed in each year. The mean value of the age component is
constrained to equal one and the last 5 age groups (ages 11--15) are specified
to be equal. This latter specification feature is intended to reduce the
number of parameters while acknowledging that pollock in this age-range are
likely to exhibit similar life-history characteristics (i.e., unlikely to
change their relative availability to the fishery with age). The annual
components of fishing mortality result in  56 parameters and the age-time
selectivity schedule forms a 10x56 matrix of 560 parameters bringing the total
fishing mortality parameters to 616. The rationale for including time-
varying selectivity has recently been supported as a means to improve
retrospective patterns (Szuwalski, Ianelli, and Punt 2017) and as best
practice (Martell and Stewart, 2013).

For surveys and indices, the treatment of the catchability coefficient, and
interactions with age-specific selectivity require consideration. For the BTS
index, selectivity-at-age is estimated with a logistic curve in which year
specific deviations in the parameters is allowed. Such time-varying survey
selectivity is estimated to account for changes in the availability of pollock
to the survey gear and is constrained by pre-specified variance terms. For the
AT survey, which originally began in 1979 (the current series including data
down to 0.5m from bottom begins in 1994), optional parameters to allow for
age and time-varying patterns exist but for this assessment and other recent
assessments, ATS selectivity is constant over time. Overall, five
catchability coefficients were estimated: one each for the early fishery
catch-per-unit effort (CPUE) data (from Low and Ikeda, 1980), the early bottom
trawl survey data (where only 6 strata were surveyed), the main bottom trawl
survey data (including all strata surveyed), the AT survey data, and the AVO
data. An uninformative prior distribution is used for all of the indices. The
selectivity parameters for the 2 main indices total 135 (the CPUE and AVO data
mirror the fishery and AT survey selectivities, respectively).

Additional fishing mortality rates used for recommending harvest levels are
estimated conditionally on other outputs from the model. For example, the
values corresponding to the $F_{40\%}$ $F_{35\%}$ and $F_{MSY}$ harvest rates are found by
satisfying the constraint that, given age-specific population parameters
(e.g., selectivity, maturity, mortality, weight-at-age), unique values exist
that correspond to these fishing mortality rates. The likelihood components
that are used to fit the model can be categorized as:

*	Total catch biomass (log-normal, $\sigma=0.05$)    
* Log-normal indices of pollock biomass; bottom trawl surveys assume annual
 estimates of sampling error, as represented in Fig. \ref{fig:bts_biom}; for the AT index
 the annual errors were specified to have a mean of 0.20; while for the AVO
 data, a value relative to the AT index was estimated and gave a mean of
 about 0.25).
*	Fishery and survey proportions-at-age estimates (multinomial 
 	with effective sample sizes presented Table \ref{tab:input_n}).      
*	Age 1 index from the AT survey (CV set equal to 30\% as in prior assessments).    
*	Selectivity constraints: penalties/priors on age-age variability, time changes, 
    and decreasing (with age) patterns.    
*	Stock-recruitment: penalties/priors involved with fitting a stochastic 
  stock-recruitment relationship within the integrated model.     
*	“Fixed effects” terms accounting for cohort and year sources of variability
   in fishery mean weights-at-age estimated based on available data from 1991-2018
   and externally estimated variance terms as described in Appendix 1A of Ianelli et al. (2016).    

Work evaluating temperature and predation-dependent effects on the stock-
recruitment estimates continues (Spencer et al. 2016). This approach modified
the estimation of the stock-recruitment relationship by including the effect
of temperature and predation mortality. A relationship between recruitment
residuals and temperature was noted (similar to that found in Mueter et al.,
2011) and lower pollock recruitment during warmer conditions might be
expected. Similar results relating summer temperature conditions to subsequent
pollock recruitment for recent years were also found by Yasumiishi et al.
(2015). The extent that such relationships affect the stock-recruitment
estimates (and future productivity) is a continuing area of research.

# Results
## Model evaluation

A sequential sensitivity of available new data showed that adding the 2017 fishery 
catch-at-age data and the 2018 catch biomass information resulted in an increase in
spawning biomass estimates (Fig. \ref{fig:mod_data}). As survey data were added to the model,
the results become more similar to last year's estimate (for 2017 spawning biomass) and shows
a lower biomass estimate for 2018 (Fig. \ref{fig:mod_data}). Additional models for evaluations were     

  0. Last year's model ("Model 16.1") without any data update       

  1. The same as last year but with all data time series updated through the most recently available information       

  2. The same as last year but with the survey time series  including an alternative treatment of the 
     NBS indicative biomass (application of the VAST model for the bottom trawl
    survey index). This step included the revised VAST derived age compositions (Fig. \ref{fig:mod_data}). 
    - The rationale for considering this is the likelihood that pollock in the NBS are related and contribute to the EBS fishery  

  3. With Model 16.1 we evaluated the variability of the effective
  catchability of the bottom trawl survey for ages 3-8, the age range over
  which selectivity is allowed to vary. This pattern (and extent of
  variability) was compared with new independent analysis specifically dealing
  with the spatio-temporal patterns in 3 dimensions. 
    - This work provides new evidence on the extent of variability in
    effective catchability for the different survey gears used for assessing
    pollock.

The reference model (Model 16.1) when compared to the two with different data
treatments showed different patterns were fairly similar (Fig. \ref
{fig:mod_eval0c}). The spawning biomass
estimates and age compositions  indicates a slight shift in the scale of
spawning biomass estimates relative to last year (Fig. \ref{fig:mod_eval0a}).
The recent recruitment pattern (at age 1) shows an increase in  the 2014 value
(representing the 2013 year-class) and a decline in the 2013 estimate (the
2012 year-class; Fig. \ref{fig:mod_eval0b}). Diagnostics of model fits between the
set evaluated are given in Table \ref{tab:mod_fits}.

The BTS and ATS sample from distinct overlapping subsets of the water
column: the BT covers from bottom to midwater, and AT from midwater to surface. 
The proportion of fish available to each gear type depends on their vertical
distribution, which varies in space and time. In the current and
past assessments, this uncertainty counted as a type of process error (but with
somewhat subjective approach to specifying the degree of variability allowed).
A new method under development (Monnahan et al. in prep) provides a new method
that explicitly models the vertical distribution of fish in discrete, spatially-correlated depth strata. 
This model accounts for vertically-overlapping gears and is
informed by both acoustic and bottom trawl data sets simultaneously. 
These capabilities were added to the spatio-temporal standardization software
VAST (Thorson 2019) which provides a convenient analysis platform and allows
inclusion of temporal smoothing and environmental covariates, among other features. 
Spatial patterns of pollock density for some selected years are shown in Fig.
\ref{fig:layer1} and the relative availability to the gear types is shown in
Fig. \ref{fig:layer2}). As the results become available, a model configuration
using the combined index will be meshed as a direct alternative survey data 
series fitting (e.g., by explicitly modeling survey availability). 

This new study prompted an evaluation of the degree to which BTS selectivity 
(and effectively, catchability/availability) is allowed to vary over time. As
before, the ascending slope and age at 50% selected were modeled as independent
random walk processes with a penalty (or prior constraint or smoothness
regularization) specified to balance fitting composition and trend data from
all sources reasonably. 

A table showing the trade-offs in different model component fits shows that the
degree of penalty can be relatively small (high CV on random-walk variability)
without much repercussion on fitting different data components (e.g., the
standard deviation of the normalized residuals (SDNR) scores are near 1.0 and
not below (which would indicate over-fitting).


 xxx Table \ref{tab:mgt_quants}).

The fit to the early Japanese fishery CPUE data (Low and Ikeda 1980) is
consistent with the estimated population trends for this period (Fig.
\ref{fig:mod_cpue_fit}).   The model fits the fishery- independent index from
the 2006--2018 AVO data well indicating a downward trend since 2016 (Fig.
\ref{fig:mod_avo_fit}). The fits to the bottom-trawl survey biomass (the
density-dependent corrected series) appear to be reasonable (Fig.
\ref{fig:mod_bts_biom}). Similarly, the fits to the  acoustic-trawl survey
biomass series is consistent with the specified observation uncertainty (Fig.
\ref{fig:mod_ats_biom}).

The estimated parameters and standard errors are provided
[online](https://www.afsc.noaa.gov/refm/stocks/plan_team/2019/EBSpollock_params.pdf). 
The code for the model (with dimensions
and links to parameter names) and input files are available on request.

The input sample size (as tuned in 2016 using "Francis Weights") can be
evaluated visually for consistency with expectations of mean annual age for
the different gear types (Fig. \ref{fig:mod_mean_age}; Francis 2011). The
estimated selectivity pattern  changes over time and reflects to some degree
the extent to which the fishery is focused on particularly prominent year-
classes (Fig. \ref{fig:mod_fsh_sel}). The model fits the fishery age-
composition data quite well under this form of selectivity (Fig.
\ref{fig:mod_fsh_age}). 

Bottom-trawl survey selectivity (Fig. \ref{fig:mod_bts_sel}) and fits to the
numbers of age 2 and older pollock indicate that the model predicts fewer
pollock than observed in the 2014 and 2015 survey but slightly more than
observed in the 2012, 2013 and in 2016--17 (Fig. \ref{fig:mod_bts_biom}). The
pattern of bottom trawl survey age composition data in recent years shows a
decline in the abundance of older pollock since 2011. The 2006 year-class
observations are below model expectations in 2012 and 2013, partly due to the
fact that in 2010 the survey estimates are greater than the model predictions
(Fig. \ref{fig:mod_bts_age}). The model predicted much higher proportions of
age 6 (2012 year class) than observed in the 2018 survey data whereas the
expectations of 5-year old pollock was much lower than observations (both
surveys indicated that the 2013 year class was more abundant than the 2012
year-class).

The fit to the numbers of age 2 and older pollock in the AT
survey generally falls within the confidence bounds of the survey sampling
distributions (here assumed to have an average CV of 25\%) with a reasonable
pattern of residuals (Fig. \ref{fig:mod_ats_biom}). The AT age compositions
consistently track large year classes through the population and the model
fits these patterns reasonably well (Fig. \ref{fig:mod_ats_age}).

As in past assessments, an evaluation of the multivariate posterior distribution 
was performed by running a chain of 3 million Monte-Carlo Markov chain (MCMC) simulations
and saving every 600th iteration (final posterior draws totaled 5,000). A pairwise comparison
for some key parameters could be evaluated (along with their marginal distributions; 
Fig. \ref{fig:mcmc_pairs}). To compare the point estimates (highest posterior density) with
the mean of the posterior marginal distribution, overplotting the former on the latter
for the 2018 spawning biomass estimate were similar (Fig. \ref{fig:mcmc_marg}). 


## Time series results
The time series of begin-year biomass estimates (ages 3 and older) suggests
that the abundance of Eastern Bering Sea pollock remained at a high level from
1982--88, with estimates ranging from 8 to 11 million t (Table \ref{tab:biom_3plus}). 
Historically, biomass levels increased from 1979 to
the mid-1980s due to the strong 1978 and relatively strong 1982 and 1984 year
classes recruiting to the fishable population. The stock is characterized by
peaks in the mid-1980s, the mid-1990s and again appears to be increasing to
new highs over 13 million t in 2016 following the low in 2008 of 4.6 million t.
The estimate for 2018 is trending downward and is at just over 10 million t.

The level of fishing relative to biomass estimates show that the spawning
exploitation rate (SER, defined as the percent removal of egg production in
each spawning year) has been mostly below 20\% since 1980 (Fig. \ref{fig:mod_ser}).
During 2006 and 2007 the rate averaged more than 20\% and the average fishing
mortality for ages 3--8 increased during the period of stock decline. The
estimate for 2009 through 2016 was below 20\% due to the reductions in TACs
relative to the maximum permissible ABC values and increased in the spawning
biomass. The average F (ages 3--8) increased in 2011 to above 0.25 when the TAC
increased but has dropped since then and in 2016 is estimated at about 0.16.
Age specific fishing mortality rates reflect these patterns and show some
increases in the oldest ages from 2011--2013 but also indicate a decline in
recent years (Fig. \ref{fig:mod_F}). Last year's  estimates of age 3+ pollock
biomass were mostly higher than the estimates from previous years but this
year's estimates indicate a reduction, presumably due to below-average
recruitment since the 2013 year class (Fig. \ref{fig:mod_hist},
Table \ref{tab:biom_3plus}).

Estimated numbers-at-age are presented in (Table \ref{tab:est_n}) and
estimated catch-at-age values are presented in (Table \ref{tab:est_catage}).
Estimated summary biomass (age 3+), female spawning biomass, and age-1
recruitment are given in  (Table \ref{tab:biom_ssb_rec}).

To evaluate past management and assessment performance it can be useful to
examine estimated fishing mortality relative to reference values. For EBS
pollock, we computed the reference fishing mortality from Tier 1 (unadjusted)
and recalculated the historical values for $F_{MSY}$ (since selectivity has changed
over time). Since 1977 the current estimates of fishing mortality suggest that
during the early period, harvest rates were above $F_{MSY}$ until about 1980. Since
that time, the levels of fishing mortality have averaged about 35\% of the $F_{MSY}$ 
level (Fig. \ref{fig:mod_phase}).

## Recruitment
Model estimates indicate that both the 2008 and 2012 year classes are well
above average (Fig. \ref{fig:mod_rec}). The stock-recruitment curve as
fit within the integrated model shows a fair amount of variability both in the
estimated recruitments and in the uncertainty of the curve (Fig.
\ref{fig:mod_srr}). Note that the 2015 and 2016 year classes (as age 1 recruits in
2016 and 2017) are excluded from the stock-recruitment curve estimation.
Separate from fitting the stock- recruit relationship within the model,
examining the estimated recruits-per-spawning biomass shows variability over
time but seems to lack trend and also is consistent with the Ricker stock-
recruit relationship used within the model (Fig. \ref{fig:mod_rs}).

Environmental factors affecting recruitment are considered important and
contribute to the variability. Previous studies linked strong Bering Sea
pollock recruitment to years with warm sea temperatures and northward
transport of pollock eggs and larvae (Wespestad et al. 2000; Mueter et al.
2006). As part of the Bering-Aleutian Salmon International Survey (BASIS)
project research has also been directed toward the relative density and
quality (in terms of condition for survival) of young-of-year pollock. For
example, Moss et al. (2009) found age-0 pollock were very abundant and widely
distributed to the north and east on the Bering Sea shelf during 2004 and 2005
(warm sea temperature; high water column stratification) indicating high
northern transport of pollock eggs and larvae during those years. Mueter et
al. (2011) found that warmer conditions tended to result in lower pollock
recruitment in the EBS. This is consistent with the hypothesis that when sea
temperatures on the eastern Bering Sea shelf are warm and the water column is
highly stratified during summer, age-0 pollock appear to allocate more energy
to growth than to lipid storage (presumably due to a higher metabolic rate),
leading to low energy density prior to winter. This then may result in
increased over-winter mortality (Swartzman et al. 2005, Winter et al. 2005).
Ianelli et al. (2011) evaluated the consequences of current harvest policies
in the face of warmer conditions with the link to potentially lower pollock
recruitment and noted that the current management system is likely to face
higher chances of ABCs below the historical average catches.


## Retrospective analysis
Running the assessment model over a grid with progressively fewer years
included (going back to 20 years, i.e., assuming the data extent ended in
1997) results in a fair amount of variability in both spawning biomass and
recruitment (Fig. \ref{fig:mod_retro}) Although the variability is high, the
average bias appears to be low with Mohn's $\rho$ equal to 0.059
 for the 10 year retrospective and 0.104 if extended  back 20-years.

# Harvest recommendations
## Status summary

The estimate of $B_{MSY}$ is 2,156 kt (with a CV of 
24\%)  which is less than the projected 
2020 spawning biomass of 2,800 kt;  (Table
\ref{tab:res_summ}).  For 2019, the Tier 1 levels of yield are 
3,036,000 t from a fishable biomass estimated at around 6,276 kt
(Table \ref{tab:tier1_proj}; about 131\%  of the
$B_{MSY}$ level). A diagnostic (see section below on model details) on the impact 
of fishing shows that the 2019 spawning stock size is about 
60\%  of the predicted value had no fishing occurred
 since 1978 (Table \ref{tab:res_summ}). This compares with the 54\% 
of $B_{100}$\% (based on the SPR expansion using mean recruitment from 1978--2016) 
and 155\%
of $B_{0}$ (based on the estimated stock-recruitment curve). The latter two
values are based on expected recruitment from the mean value since 1978 or
from the estimated stock recruitment relationship.


Relative to Tier 3 indicators, the model indicates that spawning biomass will
be above $B_{40\%}$  (2,800 kt) in 2020. 
The probability that the current stock size is below 20\% of $B_{0}$ (a level important for additional
management measures related to Steller sea lion recovery) 
is <0.1\% for 2020 and 2021.


## Amendment 56 Reference Points

Amendment 56 to the BSAI Groundfish Fishery Management Plan (FMP) defines
overfishing level (OFL), the fishing mortality rate used to set OFL (FOFL),
the maximum permissible ABC, and the fishing mortality rate used to set the
maximum permissible ABC. The fishing mortality rate used to set ABC ($F_{ABC}$) may
be less than this maximum permissible level, but not greater. Estimates of
reference points related to maximum sustainable yield (MSY) are currently
available. However, their reliability is questionable. We therefore present
both reference points for pollock in the BSAI to retain the option for
classification in either Tier 1 or Tier 3 of Amendment 56. These Tiers require
reference point estimates for biomass level determinations. Consistent with
other groundfish stocks, the following values are based on recruitment
estimates from post-1976 spawning events:

\begin{table}[ht]
\begin{tabular}{lr}
$B_{MSY}$    &=	2,156 kt female spawning biomass    \\
$B_{0}$      &=	5,733 kt female spawning biomass    \\
$B_{100\%}$  &=	6,146 kt female spawning biomass   \\
$B_{40\%}$   &=	2,458 kt female spawning biomass    \\
$B_{35\%}$   &=	2,151 kt female spawning biomass    \\
\end{tabular}
\end{table}

## Specification of OFL and Maximum Permissible ABC

Assuming the stock-recruit relationship the 2020 spawning
biomass is estimated to be 2,834,000 t (at the time of spawning, assuming the
stock is fished at about recent catch levels). This is above the $B_{MSY}$ value of
2,156,000 t. Under Amendment 56, this stock has qualified under Tier 1 and the
harmonic mean value is considered a risk-averse policy since reliable
estimates of $F_{MSY}$ and its pdf are available (Thompson 1996). The exploitation-
rate type value that corresponds to the $F_{MSY}$ level was applied to the fishable
biomass for computing ABC levels. For a future year, the fishable biomass is
defined as the sum over ages of predicted begin-year numbers multiplied by age
specific fishery selectivity (normalized to the value at age 6) and mean body
mass. The uncertainty in the average weights-at-age projected for the fishery and
“future selectivity” has been demonstrated to affect the buffer between ABC
and OFL (computed as 1-ABC/OFL) for Tier 1 maximum permissible ABC (Ianelli et al. 2015).
The uncertainty in
future mean weights-at-age had a relatively large impact as did the selectivity
estimation.

Since the 2020 female spawning biomass is estimated to be above the $B_{MSY}$ level
(2,156 kt) and the $B_{40\%}$ value (2,458 kt) in 2020 and if the 2019 catch
is as specified above, then the OFL and maximum permissible ABC values by the
different Tiers would be:

\begin{table}[ht]
\centering
\begin{tabular}{lrlr}
  \hline
Tier & Year & MaxABC & OFL \\ 
  \hline
1a & 2020 & 3,036,000 & 3,823,000 \\ 
  1a & 2021 & 1,529,000 & 1,925,000 \\ 
   \hline
3a & 2020 & 2,022,000 & 2,507,000 \\ 
  3a & 2021 & 1,688,000 & 2,063,000 \\ 
   \hline
\end{tabular}
\end{table}

## Standard Harvest Scenarios and Projection Methodology

A standard set of projections is required for each stock managed under Tiers
1, 2, or 3 of Amendment 56 to the FMP. This set of projections encompasses seven harvest
scenarios designed to satisfy the requirements of Amendment 56, the National
Environmental Policy Act, and the Magnuson-Stevens Fishery Conservation and
Management Act (MSFCMA). While EBS pollock is generally considered to fall
within Tier 1, the standard projection model requires knowledge of future
uncertainty in $F_{MSY}$ . Since this would require a number of additional
assumptions that presume future knowledge about stock-recruit uncertainty, the
projections in this subsection are based on Tier 3.

For each scenario, the projections begin with the vector of 2019 numbers at
age estimated in the assessment. This vector is then projected forward to the
beginning of 2020 using the schedules of natural mortality and selectivity
described in the assessment and the best available estimate of total (year-
end) catch assumed for 2019. In each subsequent year, the fishing mortality
rate is prescribed on the basis of the spawning biomass in that year and the
respective harvest scenario. Annual recruits are simulated from an inverse
Gaussian distribution whose parameters consist of maximum likelihood estimates
determined from the estimated age-1 recruits. Spawning biomass is
computed in each year based on the time of peak spawning and the maturity and
weight schedules described in the assessment. Total catch is assumed to equal
the catch associated with the respective harvest scenario in all years. This
projection scheme is run 1,000 times to obtain distributions of possible
future stock sizes and catches under alternative fishing mortality rate
scenarios.

Five of the seven standard scenarios will be used in an Environmental
Assessment prepared in conjunction with the final SAFE. These five scenarios,
which are designed to provide a range of harvest alternatives that are likely
to bracket the final TAC for 2020, are as follows (“$maxFABC$” refers to the
maximum permissible value of FABC under Amendment 56):

\begin{description}
\item[Scenario 1:]   
In all future years, $F$ is set equal to max$F_{ABC}$. (Rationale:  Historically,
TAC has been constrained by ABC, so this scenario provides a likely upper
limit on future TACs).

\item[Scenario 2:]   
In 2020 and 2021 the catch is set equal to 1.35 million t
and in future years $F$ is set equal to the Tier 3 estimate (Rationale: this was
has been about equal to the catch level in recent years).

\item[Scenario 3:]   
In all future years, $F$ is set equal to the 2018 average $F$. (Rationale:
For some stocks, TAC can be well below ABC, and recent average $F$ may provide a
better indicator of $F_{TAC}$ than $F_{ABC}$.)

\item[Scenario 4:]   
Scenario 4: In all future years, $F$ is set equal to $F_{60\%}$. (Rationale:  This
scenario provides a likely lower bound on $F_{ABC}$ that still allows future
harvest rates to be adjusted downward when stocks fall below reference levels.

\item[Scenario 5:]   
Scenario 5: In all future years, $F$ is set equal to zero. (Rationale:  In
extreme cases, TAC may be set at a level close to zero.)

\item[Scenario 6:]   
In all future years, F is set equal to $F_{OFL}$. (Rationale:  This scenario
determines whether a stock is overfished. If the stock is expected to be 
1) below its MSY level in 2019 or 2) below half of its MSY level in 2019 or below
its MSY level in 2029 under this scenario, then the stock is overfished.)

\item[Scenario 7:]   
In 2020 and 2021, F is set equal to $maxFABC$, and in all subsequent years, F
is set equal to $F_{OFL}$. (Rationale:  This scenario determines whether a stock is
approaching an overfished condition. If the stock is 1) below its MSY level in
2021 or 2) below 1/2 of its MSY level in 2021 and expected to be below its MSY
level in 2031 under this scenario, then the stock is approaching an
overfished condition).

\end{description}

The latter two scenarios are needed to satisfy the MSFCMA’s requirement to
determine whether a stock is currently in an overfished condition or is
approaching an overfished condition (for Tier 3 stocks, the MSY level is
defined as $B_{35\%}$).

## Projections and status determination 

For the purposes of these projections, we present results based on selecting
the $F_{40\%}$ harvest rate as the $F_{ABC}$ value and use $F_{35\%}$ as a
proxy for $F_{MSY}$. Scenarios 1 through 7 were projected 14 years from 
2019 (Tables \ref{tab:tier3_C} through \ref{tab:tier3_SSB}). Under the
catch set to Tier 3 ABC estimates, the expected spawning biomass will
decline until 2020 and stabilize slightly above $B_{40\%}$ (in expectation,
Fig. \ref{fig:tier3_proj}).

Any stock that is below its minimum stock size threshold (MSST) is defined to
be overfished. Any stock that is expected to fall below its MSST in the next
two years is defined to be approaching an overfished condition. Harvest
scenarios 6 and 7 are used in these determinations as follows:

Is the stock overfished? This depends on the stock’s estimated spawning
biomass in 2019:

* If spawning biomass for 2019 is estimated to be below 1/2 $B_{35\%}$ the stock is below its MSST.   

* If spawning biomass for 2019 is estimated to be above $B_{35\%}$, the stock is above its MSST.   

* If spawning biomass for 2019 is estimated to be above 1/2 $B_{35\%}$ but below $B_{35\%}$,
 the stock’s status relative to MSST is determined by referring to harvest
 scenario 6 ((Tables \ref{tab:tier3_C} through \ref{tab:tier3_SSB}). If the mean spawning biomass for
 2029 is below $B_{35\%}$, the stock is below its MSST. Otherwise, the stock is
 above its MSST.

Is the stock approaching an overfished condition?  This is determined by
referring to harvest Scenario 7:

* If the mean spawning biomass for 2018 is below 1/2 $B_{35\%}$, the stock is approaching an overfished condition.  

* If the mean spawning biomass for 2018 is above $B_{35\%}$, the stock is not approaching an overfished condition.  

* If the mean spawning biomass for 2021 is above 1/2 $B_{35\%}$ but below $B_{35\%}$, the
  determination depends on the mean spawning biomass for 2028. If the mean
  spawning biomass for 2031 is below $B_{35\%}$, the stock is approaching an
  overfished condition. Otherwise, the stock is not approaching an overfished
  condition.

For scenarios 6 and 7, we conclude that pollock is above MSST for the year 
2019,  and it is expected to be above the "overfished condition" based on
Scenario 7 (the mean spawning biomass in 2019 is above the $B_{35\%}$
estimate; (Table \ref{tab:tier3_SSB}). Based on this, the EBS pollock stock is
being fished below the overfishing level and the stock size is estimated to be
above, abd stay above the overfished level.

## ABC Recommendation
ABC levels are affected by estimates of $F_{MSY}$ which depends principally on
the estimated stock-recruitment steepness parameter, demographic schedules
such as selectivity-at-age, maturity, and growth. The current stock size (both
spawning and fishable) is estimated to be  at above-average levels and
projections indicate declines.  Updated data and analysis result in an
estimate of 2019 spawning biomass (3,330 kt) which is about 
155\% of $B_{MSY}$ (2,156 kt). The replacement
yield---defined as the catch next year that is expected to achieve a 2020
spawning biomass estimate equal to that from 2019---is estimated to be about
0 t. Note that the negative value for replacement yield suggests that the
stock will decline even in the absence of any fishing. This follows a period of increases from 2008--2017 and
is expected. The extent that the stock will exhibit declines into the future depends 
on future recruitment, which is always uncertain. Some issues to consider in 
the medium-term are that

1.  The conditions in summer 2019 were exceptional with another near absence of a "cold pool",
   very warm conditions on the inner part of the EBS shelf, and being a third consecutive 
    year with significant abundances found outside of the standard survey area.

2.  It appears that recruitment has dropped since the 2013 year class and this is expected
to reduce spawning biomass below $B_{MSY}$ by 2021. 

3.  The BTS data continue to show low abundances of pollock aged 10 and older (Table \ref{tab:bts_age}).
Historically there had been good representation of older fish in data from
this survey. This is somewhat expected given the poor year-classes observed
during the period 2000--2005.

5.  The multispecies model suggests that the $B_{MSY}$ level is around 2.9 million
t instead of the  2.2 million t estimated in the current assessment (noting that
the total natural mortality is higher in the multispecies model).

9.  Pollock are an important prey species for other species in the ecosystem and apparent changes in the 
    distribution may shift their availability as prey. 

11. Finally, given the same estimated aggregate fishing effort in 2019, the 
estimated stock trend is
    downwards except at low catch levels (a replacement yield of 0 kt is the amount that would
    maintain the spawning stock constant). Being a negative value means that even without any fishing,the stock
    is projected to decline. Furthermore, the ability to catch roughly the same amount as in 2019 
    through to 2022 will require about *75\% more effort* (effectively) with a decline in spawning biomass of about 30\% compared to
    the current level (based on expected average recruitment; Fig. \ref{fig:proj_const_catch}).  

### Should the ABC be reduced below the maximum permissible ABC? 

The SSC in its September 2018 minutes recommended that assessment authors and
plan teams use the risk matrix table below when determining whether to
recommend an ABC lower than the maximum permissible. This was implemented for this year's recommendation. 

\clearpage

\begin{table}[ht]
\scalebox{0.88}{
\begin{tabular}{C{0.7in}L{1.5in}L{1.5in}L{1.5in}L{1.5in}}
\hline
 &\multicolumn{4}{c}{\textbf{Considerations}} \\
\hline
 &\textbf{Assessment-related} & \textbf{ Population dynamics} & \textbf
 {Environmental \& ecosystem }    & Fishery performance \\
\hline
Level 1 Normal   
& Typical to moderately increased uncertainty \& minor unresolved issues in assessment       
& Stock trends are typical for the stock; recent recruitment is within normal range.    
& No apparent environmental \& ecosystem concerns  
&  No apparent fishery/resource-use performance and/or behavior concerns \\ 
Level 2 Substantially increased concerns & Substantially increased assessment uncertainty unresolved issues.
& Stock trends are unusual; abundance increasing or decreasing faster than has been seen
  recently, or recruitment pattern is atypical. 
& Some indicators showing an adverse signals but the pattern is inconsistent
across all indicators. 
& Some indicators showing adverse signals but the pattern is inconsistent
across all indicators. \\
Level 3 Major Concern                    
& Major problems with the stock assessment, very poor fits to data, high level of 
uncertainty, strong retrospective bias. 
& Stock trends are highly unusual; very rapid changes in stock abundance, or highly atypical recruitment patterns.                           
& Multiple indicators showing consistent adverse signals a) across the same trophic level, 
and/or b) up or down trophic levels (i.e., predators and prey of stock) 
& Multiple indicators showing consistent adverse signals a) across different sectors, 
and/or b) different gear types
\\
Level 4 Extreme concern                  
& Severe problems with the stock assessment, severe retrospective bias. Assessment considered unreliable.          
& Stock trends are unprecedented. More rapid changes in stock abundance than have ever been seen previously, or a very long stretch of poor recruitment compared to previous patterns. 
& Extreme anomalies in multiple ecosystem indicators that are highly likely to impact the stock. Potential for cascading effects on other ecosystem components    
& Extreme anomalies in multiple performance indicators that are highly like to
impact the stock.
\\
\hline
\end{tabular}
}
\end{table}

The table is applied by evaluating the severity of three types of
considerations that could be used to support a scientific recommendation to
reduce the ABC from the maximum permissible. Examples of the types of concerns that
might be relevant include the following (as identified by the work-group):  

  1. Assessment considerations  
    -  _Data-inputs:_ biased ages, skipped surveys, lack of fishery-independent trend data  
    -  _Model fits:_ poor fits to fits to fishery or survey data, inability to simultaneously fit multiple data inputs.  
    -  _Model performance:_ poor model convergence, multiple minima in the likelihood surface, parameters hitting bounds.  
    -  _Estimation uncertainty:_ poorly-estimated but influential year classes.  
    -  Retrospective bias in biomass estimates.  

  2. Population dynamics considerations—decreasing biomass trend, poor recent
  recruitment, inability of the stock to rebuild, abrupt increase or decrease
  in stock abundance.  
  
  3. Environmental/ecosystem considerations—adverse trends in
  environmental/ecosystem indicators, ecosystem model results, decreases in
  ecosystem productivity, decreases in prey abundance or availability,
  increases or increases in predator abundance or productivity. 

  4. Fisheries considerations 

*Assessment considerations*   The EBS pollock assessment model appears to
track the  stock from year based on retrospective analysis (the pattern lacks
tendency to over or under estimate the stock trend. The model tracks the
available data well including  multiple abundance indices. Of minor concern
(presently) is the fact that the model estimate of declining abundance is
somewhat less than that suggested by the survey data. The data and model
appear to be consistent without big surprises relative to the ability to fit
the information and provide a trade-off between process and observation errors
(which combined, provide relatively high estimates of uncertainty). **We
therefore rated the assessment-related concern as level 1, normal.**

*Population dynamics considerations*  The age structure of EBS pollock  has
exhibited some peculiarities over time. On the positive side, some strong
year-classes appear to have increased in abundance based on the bottom-trawl
survey data (e.g., the 1992 and 2012 year classes). Conversely, the period
from 2000--2007 had relatively poor year-class strengths which resulted in
declines in stock below $\it{B_{msy}}$ and reduced TACs due to lower ABC
values. There also are clear density-dependent effects on growth, in
particular, the 2012 year class. The stock is estimated to be well above
$\it{B_{msy}}$ at present, but projections indicate a decline given recent
catch levels and future trends will depend on pollock survival at egg, larval,
and juvenile stages which may be compromised given the lack of a cold pool and
a  considerable redistribution into the northern part of the Bering Sea. It
seems likely that recruitment in the near term will be below average yet the
population dynamics, being data driven, projects recruitment to be average.
Additional age-specific aspects of the spawning population indicates that the
stock is at a low diversity of ages and the mean age of the spawning stock
(weighted by spawning output) are both at relatively low levels (Fig.
\ref{fig:age_diversity}). **We therefore rated the population-dynamic concern as
level 2, a substantially increased concern.**

*Environmental/Ecosystem considerations*
The winter of 2018/2019 began with near-average accumulation of sea ice in the Bering Sea 
during December and January, but warm, moist winds from the southwest persisted
throughout February and eroded sea ice to extremely low levels (only 2018 was lower). 
Trends in sea ice and resulting extent of the cold pool were similar between
2018 and 2019, although a small cold pool occurred in 2019 and may have
impacted pollock movement and ultimate distribution in 2019. That said, the
winters of 2017/2018 and 2018/2019 were remarkably similar in terms of sea ice phenology  
and (see Thoman in 2019 EBS ESR) extent as well as wind patterns, therefore ecosystem 
indicators from 2018 may provide insights into 2019 conditions for pollock. In 2018, warm 
water temperatures and salinity north of St. Lawrence Island may have contributed to the 
northward movement of pollock into the northern Bering Sea (see Eisner et al. in 2019 EBS 
ESR). With warm conditions persisting through winter 2018/2019, it is
possible that pollock remained in the northern Bering Sea or were able to move along the 
shelf (north or south) early in the spring/summer of 2019. The 2018 year class 
experienced favorable conditions between a cooler summer as age-0s (2018) followed by a 
warmer spring as age-1s (2019) (see Yasumiishi in 2019 EBS ESR). 


The 2018 year class was sampled using surface trawls in the southern and northern Bering Sea 
as age-0 in late summer 2018. Summer of 2018 was warm (above-average thermal
  conditions) and age-0 fish had low energy density across the shelf (see Siddon et al. and  
  Sewall et al. 2019 EBS ESR). The mean size of the 2018 year class was average but their 
  biomass index was below average (Whitehouse in 2019 EBS ESR). However, anomalous winds from 
  the southwest during February 2019 may have bolstered productivity over the shelf, 
  sustained metabolic demands, and subsidized overwinter survival of the 2018 year class of 
  pollock. 
 
 The 2019 condition of juvenile (age-1) and adult pollock based on length-weight
 residuals was assessed in the southern and northern survey regions. Over the southern shelf,
  age-1 pollock have had positive length-weight residuals for the past 4 years while adult 
  pollock had negative residuals in 2017-2018, but switched to positive residuals in 2019. 
  The negative values are driven by fish sampled in the inner domain where unprecedentedly 
  warm temperatures may have tested metabolic limits. Over the northern shelf, age-1 pollock 
  had positive residuals (although less positive than 2018) while adult pollock continued 
  negative residuals for the past 3 years (see Laman in 2019 EBS ESR). Over the southern 
  shelf, abundance increased 53% while biomass increased 75%, indicating movement of adult 
  fish back over the southern shelf. In the northern Bering Sea, abundance increased 59%, but 
  biomass decreased 11%, indicating successful recruitment of younger age classes of pollock 
  over the northern shelf (Britt Sept GPT presentation). 



Prey: Small copepods form the prey base for larval to early juvenile pollock during spring. 
Late juvenile pollock feed on a variety of planktonic crustaceans, including calanoid 
copepods and euphausiids (principally Thysanoessa inermis and T. raschii). Pollock diets 
become more piscivorous with age and cannibalism is commonly observed.

The number of small copepods available to juvenile pollock across the shelf during spring 
2019 was high compared to historical abundances and increased from spring to fall, indicating 
good foraging conditions for larval and juvenile pollock early in the year. However, the 
abundance of large (typically more lipid-rich) copepods was low overall (lower than in 2018). 
Although direct measurements of euphausiid abundances for both 2018 and 2019 indicate low 
abundances, age-0 fish diets from 2018 contained over 50% euphausiids, suggesting euphausiids 
may provide an alternative, lipid-rich prey source when large copepods are not as abundant.  
Indirect information on prey resources for pollock is discussed below under ‘Competitors’.

*Predators:* Pollock are cannibalistic and rates of cannibalism might be
expected to increase as the biomass of older, larger fish increases concurrent with increases 
in juvenile abundance. With the lack of a cold pool over the southern shelf or thermal 
barrier between the southern and northern shelves, spatial overlap and the potential for 
cannibalism are increased. Other predators of pollock include northern fur seals. At this 
time there are no indicators that suggest these populations are increasing in the eastern 
Bering Sea (although note that the Bogoslof Island population of northern fur seals is 
increasing while the Pribilof Islands populations are decreasing; see C. Kuhn ‘Noteworthy’ in 
the 2019 EBS ESR). Fur seal consumption of adult pollock generally increases in years when 
juvenile pollock are less abundant (Kuhn).


*Competitors:* While historical recruitment trends between Pacific cod and
walleye pollock have mirrored each other, suggesting the species respond similarly to 
environmental conditions, the timeseries appear to decouple after approximately 2010 and may 
indicate broad-scale transitions in the southeastern Bering Sea ecosystem (e.g., from 
pelagic- to benthic-dominated production) (Figure 1). The mechanisms driving early life 
history survival versus recruitment success of Pacific cod and walleye pollock may differ 
based on pelagic versus benthic habitat associations (e.g., prey availability). The 
decoupling of abundance timeseries after 2010 suggests a shift (or greater disparity) between 
drivers of survival in these two populations.

A widespread die-off event of short-tailed shearwaters began in the SEBS in June 2019 extended into the NBS and Chukchi Sea in August. These events may reflect 2018 conditions as shearwaters feed in the Bering Sea in summer before migrating to the southern hemisphere for breeding during the winter. Most sampled birds showed signs of emaciation; shearwaters are planktivorous birds and feed on euphausiids. 

*Fishery performance*
xxx
As noted above, the 2019 B-season suggested that the fishery was dispersed and
experienced relatively low catch rates compared to recent years. 


[From 2013-2017 prices for pollock decreased as global pollock supply has been high, but increased landings have had the combined effect of marginal increases in value. In 2018 prices for pollock increased. (Fissel)

The reduction in revenue from 2008-2010 was the result of conservation based reductions in 
the pollock TAC. In 2018, strong demand and reductions in global supply have
put upward pressure on whitefish product prices which has filtered through to ex-vessel 
market. As a result, revenue increased in 2018 in the pelagic forager group despite stable 
landings. (Fissel)]

Canadian-origin stock group of Chinook salmon is a key stock group used to define 
abundance-based bycatch caps in the EBS pollock fishery. Low juvenile abundance of this stock 
 group increases the probability that future bycatch caps will be reduced in the
 pollock fishery. (Murphy)_


### 2018 year class
  -   The 2018 year class experienced favorable conditions between a cooler
  summer as age-0s (2018) followed by a warmer spring as age-1s (2019);     
  -  The 2018 year class of age-0 fish had low energy density across the shelf,
  average mean size, and below average biomass index;     
  -  Anomalous winds from the southwest during February 2019 may have bolstered
  productivity over the shelf, sustained metabolic demands, and subsidized
  overwinter survival of the 2018 year class;     
  - 2019 Shearwater die-off events could reflect feeding conditions (i.e.,
  euphausiids) in the EBS in 2018.

### 2019 year class
  -  Second winter of low sea ice extent in the eastern Bering Sea (only 2018
  was lower);
  - A small cold pool occurred in 2019 and may have impacted pollock movement
  and distribution;
  - 2019 condition (length-weight residuals) of age-1 pollock was positive
  over the entire shelf; adult pollock condition was positive in the south, but negative in the north;
  - Over the southern shelf, abundance increased 53% while biomass increased
  75%, indicating movement of adult fish to the region;
  - Over the northern shelf, abundance increased 59%, but biomass decreased 11\%,
  indicating successful recruitment of younger age classes; 
  - Small copepod abundance was high, indicating good foraging conditions for larval  
   and juvenile pollock early in the year; 
  - Large copepod abundance was low
   overall;
  - Low abundances of euphausiids were observed in 2018 (MACE acoustic survey)
   and 2019 (RPA RZA), but age-0 fish diets from 2018 contained over 50% euphausiids;
  - Lack of cold pool over the southern shelf and thermal barrier between the
  southern and northern shelves suggests spatial overlap and the potential for cannibalism are increased;
  -  Fur seal consumption of adult pollock increases in years when juvenile
   pollock are less abundant;
  -  The decoupling of abundance timeseries for Pacific cod and walleye pollock
  after 2010 suggests a shift in drivers of survival in these two populations. 
  Mechanistic understanding of recruitment drivers is less well-known than for pollock.


**We therefore rated the Ecosystem concern as Level 2, substantially increased concern.**
Some indicators showing adverse signals relevant to the
stock but the pattern was inconsistent across indicators.

These results are summarized as:
\begin{table}[h]
\begin{tabular}{L{1.125in}L{1.125in}L{1.125in}L{1.125in}L{1.125in} }
\hline
 \multicolumn{4}{c}{Considerations}  & \\
Assessment-related & Population dynamics & Environmental or ecosystem
&Fisheries& Score (max of individual) \\
\hline
Level 1: No concern               & Level 2: Substantially increased concerns &
Level 2: Substantially increased concerns & dunno       & Level 2: Substantially increased
concerns \\
\hline
\end{tabular}
\end{table}

The overall score is level 2, the maximum of the individual scores, suggests
that setting an ABC below the maximum permissible is warranted. The SSC
recommended against using a table that showed example alternatives to select
buffers based on that risk level. Thompson (unpublished Sept 2018 plan team
document) tabulated the magnitude of buffers applied by the Plan Teams for the
period 2003--2017, and found that the mode of the buffers recommended was 10--20\%.
 Using this as a guideline, a buffer of 15\% would give an ABC as
$0.85 \times \text{ABC}_{max}$ = 2,580 kt).
In the past, the SSC has considered factors similar to those presented above 
and selected an ABC based on Tier 3 estimates. We recommend this added precaution again 
again this year, (i.e., ABC = 2,022 kt) 
which implies a buffer of  33\%.  

Recognizing that the actual catch will be constrained by other factors (the 2 million t BSAI
groundfish catch limit and bycatch avoidance measures),  applying the maximum
permissible Tier 1a ABC seems clearly risky. Such high catches would result in
unprecedented variability and removals from the stock (and require
considerably more capacity and effort). Less variability in catch  would also
result in less spawning stock variability (and reduce risks to the fishery
should another period of poor recruitments occur).  To more fully evaluate these
considerations performance indicators as modified from Ianelli et al. (2012)
were developed to evaluate some near-term risks given  alternative 2019 catch
values.  These indicators and rationale for including them are summarized in
Table \ref{tab:dec_tab_rationale}).   Model 16.1 results for these indicators
are provided in  Table \ref{tab:dec_table}. Each column of this table uses a
fixed 2019 catch and assumes the same effort  for the four additional
projection years (2020--2023).  Given this specification , there is a low
probability that any of the catches   shown in the first row would exceed the
$F_{MSY}$ level.  Also, in the near term it appears unlikely that the spawning
stock will be below $B_{MSY}$ (rows 3 and 4).  Relative to the historical mean
spawning biomass, by 2020 it is more likely than not that the spawning biomass
will be lower than the historical mean (fifth row). The range of catches
examined have relatively small or no impact on  the age diversity indicators.
However, for catch to equal the 2018 value, more fishing effort will likely be
required and there is an good chance that the proportion of the stock less
than age 6 will be greater than the historical average. In terms of catch
advice, aiming for  a catch between 1.25 and 1.374 million t results in a
roughly even chance that the stock in  2020 will be equal to the long term mean.
  
# Ecosystem considerations
In general, a number of key issues for ecosystem conservation and management can be highlighted. These include:    

  * Preventing overfishing;    

  * Avoiding habitat degradation;    

  * Minimizing incidental bycatch;    

  * Monitoring bycatch and the level of discards; and    

  * Considering multi-species trophic interactions relative to harvest policies.    

For the case of pollock in the Eastern Bering Sea, the NPFMC and NMFS continue
to manage the fishery on the basis of these issues in addition to the single-
species harvest approach (Hollowed et al. 2011). The prevention of overfishing
is clearly set out as the main guideline for management. Habitat degradation
has been minimized in the pollock fishery by converting the industry to
pelagic-gear only. Bycatch in the pollock fleet is closely monitored by the
NMFS observer program and managed on that basis. Discard rates of many species
have been reduced in this fishery and efforts to minimize bycatch continue.

In comparisons of the Western Bering Sea (WBS) with the Eastern Bering Sea
using mass-balance food-web models based on 1980--85 summer diet data, Aydin et
al. (2002) found that the production in these two systems is quite different.
On a per-unit-area measure, the western Bering Sea has higher productivity
than the EBS. Also, the pathways of this productivity are different with much
of the energy flowing through epifaunal species (e.g., sea urchins and
brittlestars) in the WBS whereas for the EBS, crab and flatfish species play a
similar role. In both regions, the keystone species in 1980--85 were pollock
and Pacific cod. This study showed that the food web estimated for the EBS
ecosystem appears to be relatively mature due to the large number of
interconnections among species. In a more recent study based on 1990--93 diet
data (see Appendix 1 of the Ecosystem Considerations chapter for methods),
pollock remain in a central role in the ecosystem. The diet of pollock is
similar between adults and juveniles with the exception that adults become
more piscivorous (with consumption of pollock by adult pollock representing
their third largest prey item).

Regarding specific small-scale ecosystems of the EBS, Ciannelli et al. (2004a,
2004b) presented an application of an ecosystem model scaled to data available
around the Pribilof Islands region. They applied bioenergetics and foraging
theory to characterize the spatial extent of this ecosystem. They compared
energy balance, from a food web model relevant to the foraging range of
northern fur seals and found that a range of 100 nautical mile radius encloses
the area of highest energy balance representing about 50% of the observed
foraging range for lactating fur seals. This has led to a hypothesis that fur
seals depend on areas outside the energetic balance region. This study
develops a method for evaluating the shape and extent of a key ecosystem in
the EBS (i.e., the Pribilof Islands). Furthermore, the overlap of the pollock
fishery and northern fur seal foraging habitat (see Sterling and Ream 2004,
Zeppelin and Ream 2006) will require careful monitoring and evaluation.

A brief summary of these two perspectives (ecosystem effects on pollock stock
and pollock fishery effects on ecosystem) is given in (Table \ref{tab:pscbycatch}). Unlike the
food-web models discussed above, examining predators and prey in isolation may
overly simplify relationships. This table serves to highlight the main
connections and the status of our understanding or lack thereof.


## Ecosystem effects on the EBS pollock stock 

The pollock stock condition appears to have benefited substantially from the
recent conditions in the EBS. The conditions on the shelf during 2008
apparently affected age-0 northern rock sole due to cold
conditions and apparently unfavorable currents that retain them into the over-
summer nursery areas (Cooper et al. 2014). It may be that such conditions
favor pollock recruitment. Hollowed et al. (2012) provided an extensive review
of habitat and density for age-0 and age-1 pollock based on survey
data. They noted that during cold years, age-0 pollock were distributed
primarily in the outer domain in waters greater than 1$^\circ$C and during warm
years, age-0 pollock were distributed mostly in the middle domain. This
temperature relationship, along with interactions with available food in
early-life stages, appears to have important implications for pollock
recruitment success (Coyle et al. 2011). The fact that the 2012 year-class
appears to be strong, as it ages that contribution to the stock will 
diminish.

A separate section presented again this year updates a multispecies model with
more recent data and is presented as a supplement to the BSAI SAFE report. In
this approach, a number of simplifications for the individual species data and
fisheries processes (e.g., constant fishery selectivity and the use of
design-based survey indices for biomass). However, that model mimics the
biomass levels and trends with the single species reasonably well. It also
allows specific questions to be addressed regarding pollock TACs. For example,
since predation (and cannibalism) is explicitly modeled, the impact of
relative stock sizes on subsequent recruitment to the fishery can be now be
directly estimated and evaluated (in the model presented here, cannibalism is
explicitly accounted for in the assumed Ricker stock-recruit relationship).


Euphausiids make up a large component of the pollock diet. The euphausiid abundance on the
Bering Sea shelf is presented as a section of the 2017 Ecosystem
Considerations Chapter of the SAFE report and shows a continued decline in
abundance since the peak in 2009 (for details see De Robertis et al. (2010) and
Ressler et al. (2012). The role that the apparent recent 2009 peak abundance
had in the survival of the 2008 year class of EBS pollock is interesting.
Contrasting this with how the feeding ecology of the 2012 year class (also
apparently well above average) may differ is something to evaluate in the
future.

## EBS pollock fishery effects on the ecosystem. 

Since the pollock fishery is primarily pelagic in nature, the bycatch of non-
target species is small relative to the magnitude of the fishery 
(Table \ref{tab:nontargbycatch}).
Jellyfish represent the largest component of the bycatch of non-target species
and had averaged around 5--6 kt per year but more than doubled in
2014 but has dropped in 2015 and been about average since then. The data on non-target species shows a high
degree of inter-annual variability, which reflects the spatial variability of
the fishery and high observation error. This variability may reduce the
ability to detect significant trends for bycatch species.

The catch of other target species in the pollock fishery (defined as any trawl 
set where the catch represents more than 80% of the catch) represents less than
1% of the total pollock catch. Incidental catch of Pacific cod has varied
but in the past three years it is about half of the 2011 and 2012 levels (Table \ref{tab:fmpbycatch}). 
There has been a marked in increase in the incidental
catch of Pacific ocean perch, sablefish, and Atka mackerel and a
decrease in flatfish species.
Proportionately, the incidental catch decreased since the
overall levels of pollock catch have increased since 2008. In fact, the bycatch of
pollock in other target fisheries is more than double the bycatch of target
species in the pollock fishery (Table \ref{tab:pollbycatch}).

The number of non-Chinook salmon (nearly all made up of chum salmon) taken
incidentally has steadily increased since 2014 with 2017 number in excess of
465 thousand fish but the 2018 level was slightly more than the
2003--2017 average of 227 thousand fish; Table \ref{tab:pscbycatch}). Chinook
salmon bycatch has also increased steadily since 2012 with the 2017 counts at
just below 30,000 (which was 18% below the 2003--2017 mean value). In 2018 the
bycatch  dropped back down to 13.5 thousand fish  (Table
\ref{tab:pscbycatch}).  Ianelli and Stram (2014) provided estimates of the
bycatch impact on Chinook salmon runs to the coastal west Alaska region and
found that the peak bycatch levels exceeded 7% of the total run return. Since
2011, the impact has been estimated to be below 2%. Updated estimates  given
new genetic information and these levels of PSC were provided to the
Council in 2018 and impact levels remain low.


# Data gaps and research priorities

The available data for EBS pollock are extensive yet many processes behind the
observed patterns continue to be poorly understood.  
The recent patterns of abundance observed in the northern Bering Sea provide an example.
As such, we recommend the following research priorities:

  -  Investigate using spatial processes for estimation purposes (e.g.,
combining acoustic and bottom trawl survey data). The application of the
geostatistical methods (presented for comparative purposes in this assessment)
seems like a reasonable approach to statistically model disparate data sources
for generating better abundance indices. Also, examine the potential to use
pelagic samples from the BASIS survey to inform recruitment and subsequent
spatial patterns.

  - Develop methods to use spatio-temporal models to estimate composition information (i.e., length and age).

  -  Study the relationship between climate and recruitment and trophic
interactions of pollock within the ecosystem would be useful for improving
ways to evaluate the current and alternative fishery management system. In
particular, studies investigating the processes affecting recruitment of
pollock in the different regions of the EBS (including potential for influx
from the GOA) should be pursued.

 - Apply new technologies (e.g., bottom-moored echosounders) to evaluate pollock movement between regions.

 - Expand genetic sample collections for pollock (and process availble samples) and apply high resolution genetic tools for stock structure analyses.

# Acknowledgements

We thank the survey staff who always collect samples diligently, especially
this year when extra effort was required to process data due to unforseen
problems with vessel operations.  The AFSC age-and-growth department is
thanked for their continued excellence in promptly processing the samples used
in this assessment.  Finally, thanks to the many colleagues who provided edits
and suggestions to improve this document and to  Jim Thorson for helping with
compiling the alternative index from bottom trawl survey data.

#```{r child = 'ref.Rmd'}
#```

# Tables

\clearpage

\renewcommand\thetable{\arabic{table}} 
\setcounter{table}{0}  

\begin{table}[ht]
\centering
\caption{Catch from the Eastern Bering Sea by area, the Aleutian Islands, the Donut Hole, and the Bogoslof Island area, 1979--2019 (2019 values through October 15th 2019). The southeast area refers to the EBS region east of 170W; the Northwest is west of 170W. Note: 1979--1989 data are from Pacfin, 1990--2019 data are from NMFS Alaska Regional Office, and include discards. The 2019 EBS catch estimates are preliminary. }
\label{tab:catch}
\begin{tabular}{crrrrrr}
\hline
& \multicolumn{3}{c}{Eastern Bering Sea  }             &             &               & \\
Year    &   Southeast   &   Northwest   &   Total   &Aleutians  &Donut  Hole&   Bogoslof    I.      \\
\hline                                                  
1979    &   368,848 &   566,866 &   935,714 &   9,446   &       &       \\
1980    &   437,253 &   521,027 &   958,280 &   58,157  &       &       \\
1981    &   714,584 &   258,918 &   973,502 &   55,517  &       &       \\
1982    &   713,912 &   242,052 &   955,964 &   57,753  &       &       \\
1983    &   687,504 &   293,946 &   981,450 &   59,021  &       &       \\
1984    &   442,733 &   649,322 &   1,092,055   &   77,595  &   181,200 &       \\
1985    &   604,465 &   535,211 &   1,139,676   &   58,147  &   363,400 &       \\
1986    &   594,997 &   546,996 &   1,141,993   &   45,439  &   1,039,800   &       \\
1987    &   529,461 &   329,955 &   859,416 &   28,471  &   1,326,300   &   377,436 \\
1988    &   931,812 &   296,909 &   1,228,721   &   41,203  &   1,395,900   &   87,813  \\
1989    &   904,201 &   325,399 &   1,229,600   &   10,569  &   1,447,600   &   36,073  \\
1990    &   640,511 &   814,682 &   1,455,193   &   79,025  &   917,400 &   151,672 \\
1991    &   653,555 &   542,109 &   1,195,664   &   98,604  &   293,400 &   316,038 \\
1992    &   830,559 &   559,741 &   1,390,299   &   52,362  &   10,000  &   241 \\
1993    &   1,094,429   &   232,173 &   1,326,602   &   57,138  &   1,957   &   886 \\
1994    &   1,152,575   &   176,777 &   1,329,352   &   58,659  &       &   556 \\
1995    &   1,172,306   &   91,941  &   1,264,247   &   64,925  &       &   334 \\
1996    &   1,086,843   &   105,939 &   1,192,781   &   29,062  &       &   499 \\
1997    &   819,889 &   304,544 &   1,124,433   &   25,940  &       &   163 \\
1998    &   971,388 &   132,515 &   1,103,903   &   22,054  &       &   8   \\
1999    &   782,983 &   206,698 &   989,680 &   1,010   &       &   29  \\
2000    &   839,177 &   293,532 &   1,132,710   &   1,244   &       &   29  \\
2001    &   961,977 &   425,220 &   1,387,197   &   825 &       &   258 \\
2002    &   1,160,334   &   320,442 &   1,480,776   &   1,177   &       &   1,042   \\
2003    &   933,191 &   557,588 &   1,490,779   &   1,649   &       &   24  \\
2004    &   1,090,008   &   390,544 &   1,480,552   &   1,158   &       &   0   \\
2005    &   802,154 &   680,868 &   1,483,022   &   1,621   &       &   0   \\
2006    &   827,207 &   660,824 &   1,488,031   &   1,745   &       &   0   \\
2007    &   728,249 &   626,253 &   1,354,502   &   2,519   &       &   0   \\
2008    &   482,698 &   507,880 &   990,578 &   1,278   &       &   9   \\
2009    &   358,252 &   452,532 &   810,784 &   1,662   &       &   73  \\
2010    &   255,132 &   555,075 &   810,207 &   1,285   &       &   176 \\
2011    &   747,890 &   451,151 &   1,199,041   &   1,208   &       &   173 \\
2012    &   618,869 &   586,343 &   1,205,212   &   975 &       &   71  \\
2013    &   695,667 &   575,098 &   1,270,765   &   2,964   &       &   57  \\
2014    &   858,240 &   439,180 &   1,297,419   &   2,375   &       &   427 \\
2015    &   696,249 &   625,331 &   1,321,581   &   915 &       &   733 \\
2016    &   1,167,088   &   185,571 &   1,352,659   &   1,257   &       &   1,005   \\
2017    &   1,178,112   &   181,162 &   1,359,274   &   1,507   &       &   186 \\
2018    &   1,020,904   &   325,711 &   1,346,615   &   1,778   &       &   133 \\
\hline                                                  
Avg.    &   788,905 &   414,351 &   1,203,256   &   25,481  &   697,696 &   30,505  \\
\end{tabular}
\end{table}

\clearpage

\begin{table}[ht]
\centering
\caption{Time series of 1964--1976 catch (left) and ABC, TAC, and catch for EBS pollock, 1977--2019 in t. Source: compiled from NMFS Regional office web site and various NPFMC reports. Note that the 2019 value is based on catch reported to October 25th 2019 plus an added component due to bycatch of pollock in other fisheries.}
\label{tab:abc_tac}
\begin{tabular}{rrrrrr}
\hline
Year    &   Catch   &   Year    &   ABC &   TAC &   Catch \\
\hline
1964    &   174,792 &   1977    &   950,000 &   950,000 &   978,370 \\
1965    &   230,551 &   1978    &   950,000 &   950,000 &   979,431 \\
1966    &   261,678 &   1979    &   1,100,000   &   950,000 &   935,714 \\
1967    &   550,362 &   1980    &   1,300,000   &   1,000,000   &   958,280 \\
1968    &   702,181 &   1981    &   1,300,000   &   1,000,000   &   973,502 \\
1969    &   862,789 &   1982    &   1,300,000   &   1,000,000   &   955,964 \\
1970    &   1,256,565   &   1983    &   1,300,000   &   1,000,000   &   981,450 \\
1971    &   1,743,763   &   1984    &   1,300,000   &   1,200,000   &   1,092,055   \\
1972    &   1,874,534   &   1985    &   1,300,000   &   1,200,000   &   1,139,676   \\
1973    &   1,758,919   &   1986    &   1,300,000   &   1,200,000   &   1,141,993   \\
1974    &   1,588,390   &   1987    &   1,300,000   &   1,200,000   &   859,416 \\
1975    &   1,356,736   &   1988    &   1,500,000   &   1,300,000   &   1,228,721   \\
1976    &   1,177,822   &   1989    &   1,340,000   &   1,340,000   &   1,229,600   \\
    		&       				&   1990    &   1,450,000   &   1,280,000   &   1,455,193   \\
    		&       				&   1991    &   1,676,000   &   1,300,000   &   1,195,664   \\
    		&       				&   1992    &   1,490,000   &   1,300,000   &   1,390,299   \\
    		&       				&   1993    &   1,340,000   &   1,300,000   &   1,326,602   \\
    		&       &   1994    &   1,330,000   &   1,330,000   &   1,329,352   \\
    		&       &   1995    &   1,250,000   &   1,250,000   &   1,264,247   \\
    		&       &   1996    &   1,190,000   &   1,190,000   &   1,192,781   \\
    		&       &   1997    &   1,130,000   &   1,130,000   &   1,124,433   \\
    		&       &   1998    &   1,110,000   &   1,110,000   &   1,102,159   \\
    		&       &   1999    &   992,000 &   992,000 &   989,680 \\
    		&       &   2000    &   1,139,000   &   1,139,000   &   1,132,710   \\
    		&       &   2001    &   1,842,000   &   1,400,000   &   1,387,197   \\
    		&       &   2002    &   2,110,000   &   1,485,000   &   1,480,776   \\
    		&       &   2003    &   2,330,000   &   1,491,760   &   1,490,779   \\
    		&       &   2004    &   2,560,000   &   1,492,000   &   1,480,552   \\
    		&       &   2005    &   1,960,000   &   1,478,500   &   1,483,022   \\
    		&       &   2006    &   1,930,000   &   1,485,000   &   1,488,031   \\
    		&       &   2007    &   1,394,000   &   1,394,000   &   1,354,502   \\
    		&       &   2008    &   1,000,000   &   1,000,000   &   990,578 \\
    		&       &   2009    &   815,000     &   815,000     &   810,784 \\
    		&       &   2010    &   813,000     &   813,000     &   810,206 \\
    		&       &   2011    &   1,270,000   &   1,252,000   &   1,199,041   \\
    &       &   2012    &   1,220,000   &   1,200,000   &   1,205,212   \\
    &       &   2013    &   1,375,000   &   1,247,000   &   1,270,768   \\
    &       &   2014    &   1,369,000   &   1,267,000   &   1,297,420   \\
    &       &   2015    &   1,637,000   &   1,310,000   &   1,321,581   \\
    &       &   2016    &   2,090,000   &   1,340,000   &   1,352,707   \\
    &       &   2017    &   2,800,000   &   1,345,000   &   1,343,217   \\
    &       &   2018    &   2,592,000   &   1,364,341   &   1,34xxxxx   \\
    &       &   2019    &   2,163,000   &   1,397,000   &   1,34xxxxx   \\
\hline                                          
    \multicolumn{3}{c}{1977--2019    mean}           &   1,455,902   &   1,241,006   &   1,188,382   \\
\hline
\end{tabular}
\end{table}

\clearpage

<!-- Retained and discarded pollock -->
\begin{table}[ht]
\centering
\caption{Estimates of discarded pollock (t), percent of total (in parentheses) and total catch for the Aleutians, Bogoslof, Northwest and Southeastern Bering Sea, 1991--2019. SE represents the EBS east of 170W, NW is the EBS west of 170W, source: NMFS Blend and catch-accounting system database. 2019 data are preliminary. Note that the higher discard rates in the Aleutian Islands and Bogoslof region reflect the lack of directed pollock fishing.}
\label{tab:catch_disc}
\scalebox{0.75}{
\begin{tabular}{crrrrr|rrrrr}
\hline
                  & \multicolumn{5}{c|}{Discarded pollock }                                     & \multicolumn{5}{c}{Total (retained plus discard) }     \\
                  & Aleut. Is. & Bog.     & NW            & SE            & Total           & Aleut. Is. & Bog. & NW      & SE        & Total     \\
\hline 
1991    &   5,231   (5\%)   &   20,327  (6\%)   &   48,257  (9\%)   &   66,792  (10\%)  &   140,607 (9\%)   &   98,604  &   316,038 &   542,109 &    653,555    &   1,610,306   \\
1992    &   2,986   (6\%)   &   240 (100\%) &   57,581  (10\%)  &   71,194  (9\%)   &   132,002 (9\%)   &   52,362  &   241 &   559,750 &    830,559    &   1,442,912   \\
1993    &   1,740   (3\%)   &   308 (35\%)  &   26,107  (11\%)  &   83,986  (8\%)   &   112,141 (8\%)   &   57,138  &   886 &   232,180 &    1,094,429  &   1,384,633   \\
1994    &   1,373   (2\%)   &   11  (2\%)   &   16,084  (9\%)   &   88,098  (8\%)   &   105,566 (8\%)   &   58,659  &   556 &   176,777 &    1,152,575  &   1,388,567   \\
1995    &   1,380   (2\%)   &   267 (80\%)  &   9,715   (11\%)  &   87,492  (7\%)   &   98,855  (7\%)   &   64,925  &   334 &   91,941  &    1,172,306  &   1,329,506   \\
1996    &   994 (3\%)   &   7   (1\%)   &   4,838   (5\%)   &   71,368  (7\%)   &   77,208  (6\%)   &   29,062  &   499 &   105,939 &    1,086,843  &   1,222,342   \\
1997    &   618 (2\%)   &   13  (8\%)   &   22,557  (7\%)   &   71,032  (9\%)   &   94,220  (8\%)   &   25,940  &   163 &   304,544 &    819,889    &   1,150,536   \\
1998    &   162 (1\%)   &   3   (39\%)  &   1,581   (1\%)   &   14,291  (1\%)   &   16,037  (1\%)   &   22,054  &   8   &   132,515 &    969,644    &   1,124,221   \\
1999    &   480 (48\%)  &   11  (39\%)  &   1,912   (1\%)   &   26,912  (3\%)   &   29,315  (3\%)   &   1,010   &   29  &   206,698 &    782,983    &   990,719 \\
2000    &   790 (64\%)  &   20  (67\%)  &   1,942   (1\%)   &   19,678  (2\%)   &   22,430  (2\%)   &   1,244   &   29  &   293,532 &    839,177    &   1,133,983   \\
2001    &   380 (46\%)  &   28  (11\%)  &   2,450   (1\%)   &   14,874  (2\%)   &   17,732  (1\%)   &   825 &   258 &   425,220 &    961,977    &   1,388,280   \\
2002    &   779 (66\%)  &   12  (1\%)   &   1,441   (tr)    &   19,430  (2\%)   &   21,661  (1\%)   &   1,177   &   1,042   &   320,442 &    1,160,334  &   1,482,995   \\
2003    &   468 (28\%)  &   19  (79\%)  &   2,959   (1\%)   &   13,795  (1\%)   &   17,241  (1\%)   &   1,649   &   24  &   557,588 &    933,191    &   1,492,453   \\
2004    &   287 (25\%)  &   0   (100\%) &   2,781   (1\%)   &   20,380  (2\%)   &   23,448  (2\%)   &   1,158   &   0   &   390,544 &    1,090,008  &   1,481,710   \\
2005    &   324 (20\%)  &   0   (89\%)  &   2,586   (tr)    &   14,838  (2\%)   &   17,748  (1\%)   &   1,621   &   0   &   680,868 &    802,154    &   1,484,643   \\
2006    &   311 (18\%)  &   0   (50\%)  &   3,677   (1\%)   &   11,877  (1\%)   &   15,865  (1\%)   &   1,745   &   0   &   660,824 &    827,207    &   1,489,776   \\
2007    &   425 (17\%)  &   0   (\%)    &   3,769   (1\%)   &   12,334  (2\%)   &   16,528  (1\%)   &   2,519   &   0   &   626,253 &    728,249    &   1,357,021   \\
2008    &   81  (6\%)   &   0   (\%)    &   1,643   (tr)    &   5,968   (1\%)   &   7,692   (1\%)   &   1,278   &   9   &   507,880 &    482,698    &   991,865 \\
2009    &   395 (24\%)  &   6   (8\%)   &   1,936   (tr)    &   4,014   (1\%)   &   6,352   (1\%)   &   1,662   &   73  &   452,532 &    358,252    &   812,519 \\
2010    &   142 (12\%)  &   53  (30\%)  &   1,271   (tr)    &   2,511   (1\%)   &   3,976   (tr)    &   1,235   &   176 &   555,075 &    255,132    &   811,618 \\
2011    &   75  (6\%)   &   23  (13\%)  &   1,378   (tr)    &   3,456   (tr)    &   4,932   (tr)    &   1,208   &   173 &   451,151 &    747,890    &   1,200,422   \\
2012    &   95  (10\%)  &   0   (\%)    &   1,191   (tr)    &   4,187   (1\%)   &   5,473   (tr)    &   975 &   71  &   586,343 &    618,869    &   1,206,258   \\
2013    &   108 (4\%)   &   0   (1\%)   &   1,226   (tr)    &   4,144   (1\%)   &   5,478   (tr)    &   2,964   &   57  &   575,098 &    695,667    &   1,273,786   \\
2014    &   138 (6\%)   &   54  (13\%)  &   1,787   (tr)    &   12,568  (1\%)   &   14,547  (1\%)   &   2,375   &   427 &   439,180 &    858,240    &   1,300,221   \\
2015    &    20     (2\%)   &   138 (19\%)  &   2,419   (tr)    &   7,053   (1\%)   &   9,638   (1\%)   &    916    &    733    &    625,331    &   696,250 &   1,323,230   \\
2016    &    59     (5\%)   &   7.24    (1\%)   &   998 (1\%)   &   8,141   (1\%)   &   9,209   (1\%)   &    1,257  &    1,004  &    185,572    &   1,167,089   &   1,354,922   \\
2017    &    18     (1\%) &   2.46    (1\%)   &   1,357   (1\%)   &   6,940   (1\%)   &   8,299   (1\%)   &    1,507  &    186    &    181,161    &   1,178,113   &   1,360,968   \\
2018    &    216    (12\%)    &   2.12    (1\%)   &   2,012   (1\%)   &   9,195   (1\%)   &   11,209  (1\%)   &    1,860  &    14     &    330,588    &   1,048,718   &   1,381,180   \\
2019    &    57     (4\%) &   0.129   (1\%)   &   1,793   (1\%)   &   6,475   (1\%)   &   8,268   (1\%)   &    1,462  &    117    &    292,339    &   1,035,640   &   1,329,559   \\
\hline
\end{tabular}
}
\end{table}

\clearpage

<!-- SCA Catch -->
\begin{table}[ht]
\centering
\caption{Total EBS shelf pollock catch recorded by observers (rounded to nearest 100 t) by year and season with percentages indicating the proportion of the catch that came from within the Steller sea lion conservation area (SCA), 1998--2019. The 2019 data are preliminary.} 
\label{tab:catch_sca} 
\begin{tabular}{crrr}
\hline
Year     &    A season      & B-season          & Total             \\
\hline    
1998     & 385,000 t (82\%) & 403,000 t (38\%)  & 788,000 t (60\%)   \\
1999     & 339,000 t (54\%) & 468,000 t (23\%)  & 807,000 t (36\%)   \\
2000     & 375,000 t (36\%) & 572,000 t (\ \ 4\%) & 947,000 t (16\%)   \\
2001     & 490,000 t (27\%) & 674,000 t (46\%)  & 1,164,000 t (38\%) \\
2002     & 512,200 t (56\%) & 689,100 t (42\%)  & 1,201,200 t (48\%) \\
2003     & 532,400 t (47\%) & 737,400 t (40\%)  & 1,269,800 t (43\%) \\
2004     & 532,600 t (45\%) & 710,800 t (34\%)  & 1,243,300 t (38\%) \\
2005     & 530,300 t (45\%) & 673,200 t (17\%)  & 1,203,500 t (29\%) \\
2006     & 533,400 t (51\%) & 764,300 t (14\%)  & 1,297,700 t (29\%) \\
2007     & 479,500 t (57\%) & 663,200 t (11\%)  & 1,142,700 t (30\%) \\
2008     & 341,700 t (46\%) & 498,800 t (12\%)  &   840,500 t (26\%)   \\
2009     & 282,700 t (39\%) & 388,800 t (13\%)  &  671,500 t (24\%)   \\
2010     & 269,800 t (15\%) & 403,100 t (\ 9\%)   & 672,900 t (11\%)   \\
2011     & 477,600 t (54\%) & 666,600 t (32\%)  & 1,144,200 t (41\%) \\
2012     & 457,100 t (52\%) & 687,500 t (17\%)  & 1,144,600 t (31\%) \\
2013     & 472,200 t (22\%) & 708,100 t (19\%)  & 1,180,300 t (20\%) \\
2014     & 482,800 t (38\%) & 741,200 t (37\%)  & 1,224,000 t (37\%) \\
2015     & 490,400 t (15\%) & 765,900 t (45\%)  & 1,256,300 t (33\%) \\
2016     & 510,700 t (35\%) & 784,000 t (62\%)  & 1,294,700 t (51\%) \\
2017     & 555,300 t (51\%) & 750,800 t (54\%)  & 1,306,100 t (53\%)  \\
2018     & 573,000 t (63\%) & 746,500 t (46\%)  & 1,319,500 t (54\%)  \\
2019     & XXX,000 t (63\%) & XXX,500 t (46\%)  & 1,XXX,XXX t (54\%)  \\
\hline
\end{tabular}
\end{table}

\clearpage

<!-- Management -->
\begin{table}[ht]
\centering
\caption{Highlights of some management measures affecting the pollock fishery.} 
\label{tab:mgt} 
\begin{tabular}{p{0.5in}p{5.5in}}
\hline
Year    &   Management  \\
\hline 
1977    &   Preliminary BSAI FMP implemented with several closure areas \\
1982    &   FMP implement for the BSAI  \\
1982    &   Chinook salmon bycatch limits established for foreign trawlers  \\
1984    &   2 million t groundfish OY limit established \\
1984    &   Limits on Chinook salmon bycatch reduced    \\
1990    &   New observer program established along with data reporting  \\
1992    &   Pollock CDQ program commences   \\
1994    &   NMFS adopts minimum mesh size requirements for trawl codends    \\
1994    &   Voluntary retention of salmon for foodbank donations    \\
1994    &   NMFS publishes individual vessel bycatch rates on internet  \\
1995    &   Trawl closures areas and trigger limits established for chum and Chinook salmon \\
1998    &   Improved utilization and retention in effect (reduced discarded pollock)    \\
1998    &   American Fisheries Act (AFA) passed \\
1999    &   The AFA was implemented for catcher/processors  \\
1999    &   Additional critical habitat areas around sea lion haulouts in the GOA and Eastern Bering Sea are closed.    \\
2000    &   AFA implemented for remaining sectors (catcher vessel and motherships)  \\
2001    &   Pollock industry adopts voluntary rolling hotspot program for chum salmon   \\
2002    &   Pollock industry adopts voluntary rolling hotspot program for Chinook salmon    \\
2005    &   Rolling hotspot program adopted in regulations to exempt fleet from triggered time/area closures for Chinook and chum salmon    \\
2011    &   Amendment 91 enacted, Chinook salmon management under hard limits   \\
2015    &   Amendment 110 (BSAI) Salmon prohibited species catch management in the Bering Sea pollock fishery (additional measures that change limits depending on Chinook salmon run-strength indices) and includes additional provisions for reporting requirements (see https://alaskafisheries.noaa.gov/fisheries/chinook-salmon-bycatch-management for update and general information) \\
2016    &   Measures of amendment 110 go into effect for 2017 fishing season; Chinook salmon runs above the 3-run index value so bycatch limits stay the same   \\
2017    &   Due to amendment 110 about 45\% of the TAC is taken in the A-season (traditionally only 40\% was allowed). \\
2018    &   In-river estimates of Chinook salmon (three river index) fell below the threshold and therefore a lower PSC limit applies (from a performance standard of 47,491 to 33,318 and a PSC limit from 60,000 to 45,000 Chinook salmon overall). Additionally, squid have been recategorized as an ecosystem component.  \\
2019    &   Some pollock sectors experienced high bycatch levels for chum and Chinook salmon and also for sablefish.\\
\hline
\end{tabular}
\end{table}

\clearpage
\begin{table}[ht]
\centering
\caption{BSAI pollock catch and ex-vessel data showing the total and retained catch (in kt), the 
number of vessels for all sectors and for trawl catcher vessels including
ex-vessel value (million US\$), price (US\$ per pound), and catcher vessel shares. 
Years covered include the
2005-2007 average, the 2008-2010 average, the 2011-2013 average, and annual from 2014-2018.}
\label{tab:bsaiplck_exv}
\scalebox{0.90}{

\begin{tabular}{lrrrrrrrr}
  \hline
 & Avg 05-07 & Avg 08-10 & Avg 08-10 & 2014 & 2015 & 2016 & 2017 & 2018 \\ 
  \hline
All sectors &  &  &  &  &  &  &  &  \\ 
  Catch & 1,444 & 872 & 1,227 & 1,300 & 1,323 & 1,355 & 1,361 & 1,381 \\ 
  Retained catch & 1,427 & 866 & 1,221 & 1,285 & 1,314 & 1,346 & 1,353 & 1,370 \\ 
  Vessels \# & 110.3 & 121 & 120.3 & 121 & 120 & 122 & 118 & 115 \\ 
  Catcher vessels (trawl) &  &  &  &  &  &  &  &  \\ 
  Retained catch    & 768.3 & 459.0 & 640.8 & 668.5 & 687.1 & 703.9 & 710.4 & 718.3 \\ 
  Ex-vessel value   & \$214.18  & \$184.89  & \$229.62  & \$226.54  & \$227.42  & \$209.36  & \$205.54  & \$236.67  \\ 
  Ex-vessel price   & \$0.13  & \$0.18  & \$0.16  & \$0.16  & \$0.15  & \$0.14  & \$0.14  & \$0.16  \\ 
  CV share of catch & 54\% & 53\% & 52\% & 52\% & 52\% & 52\% & 53\% & 52\% \\ 
  Vessels \#        & 89 & 89 & 88 & 87 & 87 & 89 & 87 & 88 \\ 
   \hline
\end{tabular}
}
Source: NMFS Alaska Region Blend and Catch-accounting System estimates; and
ADF\&G Commercial Operators Annual Reports (COAR). Data compiled and provided by
the Alaska Fisheries Information Network (AKFIN).
\end{table}

\begin{table}[ht]
\centering
\caption{BSAI pollock first-wholesale market data including production (kt),
value (million US\$), price (US\$ per pound) for all products and then
separately for other categories (head and gut, fillet, surimi, and roe
production). Years covered include the 
2005-2007 average, the 2008-2010 average, the 2011-2013 average, and annual from 2014-2018.}
\label{tab:bsaiplck_wsl}
\scalebox{0.84}{
\begin{tabular}{lrrrrrrrr}
  \hline
 & Avg 05-07 & Avg 08-10 & Avg 08-10 & 2014 & 2015 & 2016 & 2017 & 2018 \\ 
  \hline
 & BSAI &  &  &  &  &  &  &  \\ 
  All products volume & 498.25 & 355.99 & 487.56 & 525.54 & 520.94 & 534.89 & 523.94 & 532.44 \\ 
  All products value & \$1,246.4  & \$1,133.4  & \$1,324.7  & \$1,301.4  & \$1,275.0  & \$1,351.5  & \$1,338.1  & \$1,378.6  \\ 
  All products price & \$1.13  & \$1.44  & \$1.23  & \$1.12  & \$1.11  & \$1.15  & \$1.16  & \$1.17  \\ 
  At-sea value share & 59\% & 58\% & 59\% & 58\% & 60\% & 60\% & 62\% & 59\% \\ 
  Fillets volume     & 162.7 & 113.9 & 159.55 & 175.78 & 167.01 & 161.29 & 156.95 & 167.63 \\ 
  Fillets price      & \$1.24  & \$1.73  & \$1.51  & \$1.374 & \$1.355 & \$1.412 & \$1.286 & \$1.370 \\ 
  Fillets value share & 36\% & 38\% & 40\% & 41\% & 39\% & 37\% & 33\% & 37\% \\ 
  Surimi volume      & 173.05 & 100.99 & 153.27 & 171.33 & 187.74 & 190.82 & 196.73 & 196.53 \\ 
  Surimi price       & \$0.96  & \$1.63  & \$1.23  & \$1.105 & \$1.142 & \$1.194 & \$1.331 & \$1.259 \\ 
  Surimi value share & 29\% & 32\% & 32\% & 32\% & 37\% & 37\% & 43\% & 40\% \\ 
  Roe volume         & 27.03 & 17.63 & 16.14 & 20.60 & 18.75 & 14.26 & 18.43 & 20.64 \\ 
  Roe price          & \$4.84  & \$4.14  & \$3.78  & \$2.915 & \$2.291 & \$2.844 & \$2.877 & \$2.892 \\ 
  Roe value share    & 23\% & 14\% & 10\% & 10\% & 7\% & 7\% & 9\% & 10\% \\ 
  At-sea price premium & \$0.30  & \$0.32  & \$0.19  & 0.15 & 0.25 & 0.25 & 0.37 & 0.21 \\ 
   \hline
\end{tabular}
}
Source: NMFS Alaska Region Blend and Catch-accounting System estimates; NMFS    
Alaska Region At-sea Production Reports; and ADF\&G Commercial Operators Annual
Reports (COAR). Data compiled and provided by the Alaska Fisheries Information
Network (AKFIN).
\end{table}


\begin{table}[ht]
\centering
\caption{Alaska pollock U.S. trade and global market data showing global
production (in kt) and the U.S. and Russian shares followed by  U.S. export
volumes (kt), values (million US\$), export prices (US\$ per pound), 
import values (million US\$), and net exports (million US\$).
Subsequent rows show the breakout of export shares (of U.S. pollock) by
country (Japan, China and Europe) and the share of U.S. export volume and
value of fish  (i.e., H\&G and fillets), and other product categories (surimi
and roe).  Years covered include the 
2005-2007 average, the 2008-2010 average, the 2011-2013 average, and annual from 2014-2019 (2019 through June).}
\label{tab:bsaiplck_glbl}
\scalebox{0.78}{

\begin{tabular}{lrrrrrrrrr}
  \hline
 & Avg 05-07 & Avg 08-10 & Avg 08-10 & 2014 & 2015 & 2016 & 2017 & 2018 & 2019* \\ 
  \hline
Global pollock catch         & 2,854 & 2,662 & 3,241 & 3,245 & 3,373 & 3,476 & 3,488 & - & - \\ 
  U.S. share                 & 52\% & 35\% & 40\% & 44\% & 44\% & 44\% & 44\% & - & - \\ 
  Russian share              & 37\% & 53\% & 49\% & 47\% & 48\% & 50\% & 50\% & - & - \\ 
  BSAI share                 & 51\% & 33\% & 38\% & 40\% & 39\% & 39\% & 39\% & - & - \\ 
  Export volume              & 278.9 & 192.2 & 326.2 & 395 & 377.8 & 379.6 & 398 & 243.8 & 191.5 \\ 
  Export value               & \$867.4  & \$635.2  & \$943.6  & \$1,081.7  & \$1,038.2  & \$990.5  & \$1,007.6  & \$671.5  & \$586.8  \\ 
  Export price               & \$1.41  & \$1.50  & \$1.31  & \$1.24  & \$1.25  & \$1.18  & \$1.15  & \$1.25  & \$1.39  \\ 
  Import value               & \$173.40  & \$202.43  & \$166.58  & \$142.60  & \$130.48  & \$91.24  & \$74.98  & \$77.92  & \$53.70  \\ 
  Net exports                & \$694.00  & \$432.77  & \$777.03  & \$939.05  & \$907.76  & \$899.27  & \$932.51  & \$1,051.22  & \$533.07  \\ 
  Japan volume share & 34\% & 27\% & 21\% & 22\% & 25\% & 20\% & 22\% & 23\% & 24\% \\ 
  Japan value share & 38\% & 26\% & 19\% & 22\% & 26\% & 20\% & 23\% & 29\% & 27\% \\ 
  China volume share & 3\% & 9\% & 13\% & 15\% & 13\% & 12\% & 15\% & 14\% & 14\% \\ 
  China value Share & 2\% & 7\% & 11\% & 12\% & 11\% & 10\% & 13\% & 10\% & 9\% \\ 
  Europe volume share & 34\% & 37\% & 39\% & 38\% & 36\% & 35\% & 33\% & 33\% & 29\% \\ 
  Europe value share & 28\% & 37\% & 39\% & 39\% & 36\% & 35\% & 33\% & 33\% & 29\% \\ 
  Meat volume share & 33\% & 46\% & 50\% & 54\% & 49\% & 49\% & 49\% & 49\% & 45\% \\ 
  Meat value share & 27\% & 45\% & 48\% & 52\% & 46\% & 46\% & 47\% & 40\% & 39\% \\ 
  Surimi volume share & 57\% & 46\% & 45\% & 41\% & 45\% & 47\% & 47\% & 43\% & 43\% \\ 
  Surimi value share & 38\% & 33\% & 38\% & 34\% & 39\% & 42\% & 42\% & 39\% & 38\% \\ 
  Roe volume share & 10\% & 8\% & 5\% & 6\% & 5\% & 4\% & 5\% & 9\% & 13\% \\ 
  Roe value share & 35\% & 23\% & 14\% & 14\% & 15\% & 11\% & 11\% & 21\% & 23\% \\ 
   \hline
\end{tabular}
}
Notes: 2019 data thru June; Exports are from the US and are note specific to the BSAI region. 'Meat' 
includes fillets, H\&G, minced and other non-surimi meat based products. Europe refers to Austria, 
Belgium, Denmark, France, Germany, Greece, Ireland, Italy, Netherlands, Norway, Portugal, Spain, Sweden, 
Switzerland, and United Kingdom.\\
Source: FAO Fisheries \& Aquaculture Dept. Statistics
\url{http://www.fao.org/fishery/statistics/en}. NOAA Fisheries, Fisheries Statistics
Division, Foreign Trade Division of the U.S. Census Bureau,
\url{http://www.st.nmfs.noaa.gov/commercial-fisheries/foreign-trade/index}. U.S. Department
of Agriculture
\url{http://www.ers.usda.gov/data-products/agricultural-exchange-rate-data-set.aspx.}
\end{table}


\begin{table}[ht]
  \centering
  \caption{BSAI pollock fish oil production index (tons of oil per 100 tons of
retained catch); 
2005-2007 average, the 2008-2010 average, the 2011-2013 average, and annual from 2014-2018.}
  \label{tab:bsaiplck_oil}
  
\begin{tabular}{lrrrrrrrr}
  \hline
sector      & Avg 05-07 & Avg 08-10 & Avg 08-10 & 2014 & 2015 & 2016 & 2017 & 2018 \\ 
  \hline
All sectors & 1.25 & 2.03 & 1.76 & 2.19 & 1.84 & 2.06 & 1.92 & 1.93 \\ 
  Shoreside & 2.07 & 2.58 & 2.00 & 2.42 & 1.94 & 2.28 & 2.09 & 2.07 \\ 
  At sea      & 0.30 & 1.41 & 1.50 & 1.94 & 1.72 & 1.82 & 1.74 & 1.77 \\ 
   \hline
\end{tabular}

Source: NMFS Alaska Region Blend and Catch-accounting System estimates; NMFS  
Alaska Region At-sea Production Reports; and ADF\&G Commercial Operators Annual  
Reports (COAR). Data compiled and provided by the Alaska Fisheries Information  
Network (AKFIN).
\end{table}


\clearpage

<!-- catch-age? -->
\begin{table}[ht]
\centering
\caption{Eastern Bering Sea pollock catch at age estimates based on observer data, 1979--2018. Units are in millions of fish.} 
\label{tab:fsh_age} 
\scalebox{.8}{
\begin{tabular}{crrrrrrrrrrrrrrr}
\hline
Year & 1     & 2     & 3       & 4       & 5       & 6     & 7     & 8     & 9     & 10    & 11    & 12   & 13   & 14+  & Total \\
\hline

1979    &    101.4   &   543.0   &   719.8   &   420.1   &   392.5   &   215.5   &   56.3    &   25.7    &   35.9    &   27.5    &   17.6    &   7.9     &   3.0     &   1.1     &   2,567.0    \\
1980    &    9.8     &   462.2   &   822.9   &   443.3   &   252.1   &   210.9   &   83.7    &   37.6    &   21.7    &   23.9    &   25.4    &   15.9    &   7.7     &   3.7     &   2,421.0    \\
1981    &    0.6     &   72.2    &   1,012.7     &   637.9   &   227.0   &   102.9   &   51.7    &   29.6    &   16.1    &   9.3     &   7.5     &   4.6     &   1.5     &   1.0     &   2,175.0    \\
1982    &    4.7     &   25.3    &   161.4   &   1,172.2     &   422.3   &   103.7   &   36.0    &   36.0    &   21.5    &   9.1     &   5.4     &   3.2     &   1.9     &   1.0     &   2,004.0    \\
1983    &    5.1     &   118.6   &   157.8   &   312.9   &   816.8   &   218.2   &   41.4    &   24.7    &   19.8    &   11.1    &   7.6     &   4.9     &   3.5     &   2.1     &   1,745.0    \\
1984    &    2.1     &   45.8    &   88.6    &   430.4   &   491.4   &   653.6   &   133.7   &   35.5    &   25.1    &   15.6    &   7.1     &   2.5     &   2.9     &   3.7     &   1,938.0    \\
1985    &    2.6     &   55.2    &   381.2   &   121.7   &   365.7   &   321.5   &   443.2   &   112.5   &   36.6    &   25.8    &   24.8    &   10.7    &   9.4     &   9.1     &   1,920.0    \\
1986    &    3.1     &   86.0    &   92.3    &   748.6   &   214.1   &   378.1   &   221.9   &   214.3   &   59.7    &   15.2    &   3.3     &   2.6     &   0.3     &   1.2     &   2,041.0    \\
1987    &    -   &   19.8    &   111.5   &   77.6    &   413.4   &   138.8   &   122.4   &   90.6    &   247.2   &   54.1    &   38.7    &   21.4    &   28.9    &   14.1    &   1,379.0    \\
1988    &    -   &   10.7    &   454.0   &   421.6   &   252.1   &   544.3   &   224.8   &   104.9   &   39.2    &   96.8    &   18.2    &   10.2    &   3.8     &   11.7    &   2,192.0    \\
1989    &    -   &   4.8     &   55.1    &   149.0   &   451.1   &   166.7   &   572.2   &   96.3    &   103.8   &   32.4    &   129.0   &   10.9    &   4.0     &   8.5     &   1,784.0    \\
1990    &    1.3     &   33.0    &   57.0    &   219.5   &   200.7   &   477.7   &   129.2   &   368.4   &   65.7    &   101.9   &   9.0     &   60.1    &   8.5     &   13.9    &   1,746.0    \\
1991    &    0.4     &   113.2   &   44.4    &   88.9    &   151.8   &   181.9   &   509.7   &   81.5    &   292.9   &   29.5    &   143.9   &   18.2    &   88.3    &   71.8    &   1,816.0    \\
1992    &    2.0     &   88.2    &   670.8   &   130.3   &   82.9    &   110.2   &   136.2   &   254.8   &   102.7   &   152.5   &   57.9    &   45.4    &   13.7    &   75.5    &   1,923.0    \\
1993    &    0.1     &   6.9     &   243.6   &   1,144.4     &   108.0   &   73.9    &   68.5    &   53.1    &   91.6    &   20.5    &   35.2    &   10.9    &   13.5    &   23.3    &   1,894.0    \\
1994    &    1.2     &   35.6    &   58.6    &   347.4   &   1,067.2     &   180.5   &   57.7    &   18.7    &   12.4    &   20.2    &   9.2     &   10.2    &   7.6     &   12.1    &   1,839.0    \\
1995    &    -   &   0.4     &   77.1    &   148.5   &   406.8   &   767.1   &   121.9   &   32.0    &   11.2    &   8.1     &   17.7    &   5.2     &   6.7     &   10.4    &   1,613.0    \\
1996    &    -   &   16.7    &   51.9    &   82.6    &   161.5   &   362.8   &   481.6   &   186.0   &   32.6    &   14.1    &   8.4     &   8.7     &   4.5     &   11.0    &   1,422.0    \\
1997    &    1.6     &   77.9    &   39.2    &   107.6   &   472.7   &   282.6   &   252.6   &   200.1   &   65.4    &   14.0    &   5.9     &   5.3     &   3.3     &   14.4    &   1,543.0    \\
1998    &    0.2     &   42.3    &   85.6    &   70.9    &   154.8   &   697.0   &   202.0   &   131.0   &   107.5   &   29.1    &   6.1     &   6.2     &   2.4     &   9.2     &   1,544.0    \\
1999    &    0.2     &   9.6     &   294.4   &   224.6   &   102.3   &   159.7   &   470.8   &   130.7   &   56.3    &   34.1    &   3.7     &   2.3     &   0.8     &   2.2     &   1,492.0    \\
2000    &    -   &   15.3    &   80.3    &   425.8   &   347.0   &   105.2   &   170.4   &   357.6   &   86.0    &   29.5    &   22.3    &   5.3     &   1.3     &   1.6     &   1,648.0    \\
2001    &    -   &   3.1     &   46.9    &   154.7   &   582.6   &   410.5   &   135.9   &   127.0   &   157.3   &   59.0    &   34.4    &   16.0    &   5.4     &   5.7     &   1,738.0    \\
2002    &    0.9     &   47.0    &   108.6   &   213.4   &   287.4   &   602.3   &   270.2   &   100.6   &   86.3    &   96.8    &   33.9    &   15.3    &   11.0    &   4.5     &   1,878.0    \\
2003    &    -   &   14.1    &   408.6   &   323.5   &   367.2   &   307.1   &   331.2   &   158.8   &   49.5    &   38.4    &   36.1    &   22.7    &   6.8     &   6.7     &   2,071.0    \\
2004    &    -   &   0.5     &   90.1    &   825.4   &   483.7   &   239.0   &   168.5   &   155.2   &   63.2    &   15.5    &   18.6    &   26.8    &   8.9     &   14.0    &   2,109.0    \\
2005    &    -   &   4.1     &   51.1    &   399.4   &   859.1   &   483.5   &   157.6   &   68.7    &   68.3    &   30.8    &   9.6     &   8.9     &   3.0     &   5.0     &   2,149.0    \\
2006    &    -   &   10.0    &   83.2    &   293.3   &   615.3   &   592.6   &   283.6   &   109.9   &   49.5    &   40.7    &   17.0    &   8.3     &   8.4     &   11.6    &   2,123.0    \\
2007    &    1.6     &   16.9    &   60.5    &   137.5   &   388.6   &   508.7   &   300.1   &   139.5   &   47.6    &   27.4    &   24.2    &   9.5     &   6.1     &   14.2    &   1,683.0    \\
2008    &    -   &   25.9    &   57.6    &   79.4    &   148.8   &   308.4   &   242.0   &   149.3   &   82.5    &   21.8    &   18.4    &   14.0    &   8.9     &   15.7    &   1,173.0    \\
2009    &    -   &   1.3     &   175.9   &   199.9   &   82.4    &   112.9   &   123.4   &   104.0   &   65.9    &   40.5    &   23.9    &   7.6     &   8.2     &   12.3    &   958.0  \\
2010    &    1.0     &   27.2    &   30.8    &   557.9   &   220.6   &   55.0    &   42.5    &   56.6    &   52.9    &   31.8    &   16.0    &   8.8     &   6.2     &   10.3    &   1,118.0    \\
2011    &    0.4     &   11.4    &   192.8   &   115.6   &   809.5   &   284.4   &   64.1    &   37.7    &   38.3    &   40.2    &   25.3    &   12.8    &   1.8     &   8.3     &   1,643.0    \\
2012    &    -   &   23.7    &   117.8   &   943.8   &   173.7   &   433.1   &   139.9   &   37.0    &   17.6    &   14.7    &   16.2    &   13.8    &   7.8     &   8.9     &   1,948.0    \\
2013    &    1.7     &   0.8     &   65.3    &   342.1   &   955.5   &   195.2   &   155.9   &   69.1    &   20.1    &   13.3    &   12.5    &   12.0    &   7.9     &   10.4    &   1,862.0    \\
2014    &    -   &   39.6    &   31.4    &   168.6   &   397.4   &   752.2   &   210.3   &   86.3    &   29.2    &   9.0     &   4.6     &   4.7     &   4.5     &   9.0     &   1,747.0    \\
2015    &    -   &   15.7    &   633.2   &   194.8   &   229.1   &   385.2   &   509.4   &   88.2    &   43.0    &   17.2    &   3.2     &   2.2     &   3.3     &   4.0     &   2,128.0    \\
2016    &    -   &   0.5     &   91.7    &   1,389.7     &   159.3   &   175.3   &   175.5   &   223.1   &   34.7    &   13.2    &   7.9     &   0.5     &   1.3     &   -   &   2,273.0    \\
2017    &    -       &   2.0     &   29.8    &   551.4   &   894.6   &   214.7   &   147.5   &   123.2   &   96.3    &   21.5    &   7.8     &   6.3     &   0.6     &   0.4     &   2,096.0    \\
2018     &   -   &   1.4     &   13.8    &   114.1   &   1,216.7     &   504.0   &   105.5   &   82.2    &   60.9    &   26.6    &   4.2     &   1.2     &   0.3     &   1.1     &  2,131.99    \\
\hline                                                                                                                          
Avg.    &   6.8 &   53.2    &   201.2   &   373.3   &   410.6   &   325.4   &   203.8   &   113.4   &   65.3    &   33.3    &   22.9    &   11.6    &   7.9 &   11.4    &   1,836.87    \\
\hline
\end{tabular}
}
\end{table}

\clearpage

\begin{table}[ht]
\centering
\caption{Numbers of pollock NMFS observer samples measured for fishery catch length frequency (by sex and strata), 1977--2018.} 
\label{tab:fsh_meas} 
\begin{tabular}{crrrrrrr}
\hline
\multicolumn{8}{c}{ Length Frequency samples } \\
\hline
        & \multicolumn{2}{c}{ A Season } &\multicolumn{2}{c}{B Season SE } &\multicolumn{2}{c}{B Season NW} &   \\
Year    &   Males   &   Females &   Males   &   Females &   Males   &   Females &   Total   \\
\hline
1977    &   26,411  &   25,923  &   4,301   &   4,511   &   29,075  &   31,219  &   121,440 \\
1978    &   25,110  &   31,653  &   9,829   &   9,524   &   46,349  &   46,072  &   168,537 \\
1979    &   59,782  &   62,512  &   3,461   &   3,113   &   62,298  &   61,402  &   252,568 \\
1980    &   42,726  &   42,577  &   3,380   &   3,464   &   47,030  &   49,037  &   188,214 \\
1981    &   64,718  &   57,936  &   2,401   &   2,147   &   53,161  &   53,570  &   233,933 \\
1982    &   74,172  &   70,073  &   16,265  &   14,885  &   181,606 &   163,272 &   520,273 \\
1983    &   94,118  &   90,778  &   16,604  &   16,826  &   193,031 &   174,589 &   585,946 \\
1984    &   158,329 &   161,876 &   106,654 &   105,234 &   243,877 &   217,362 &   993,332 \\
1985    &   119,384 &   109,230 &   96,684  &   97,841  &   284,850 &   256,091 &   964,080 \\
1986    &   186,505 &   189,497 &   135,444 &   123,413 &   164,546 &   131,322 &   930,727 \\
1987    &   373,163 &   399,072 &   14,170  &   21,162  &   24,038  &   22,117  &   853,722 \\
1991    &   160,491 &   148,236 &   166,117 &   150,261 &   141,085 &   139,852 &   906,042 \\
1992    &   158,405 &   153,866 &   163,045 &   164,227 &   101,036 &   102,667 &   843,244 \\
1993    &   143,296 &   133,711 &   148,299 &   140,402 &   27,262  &   28,522  &   621,490 \\
1994    &   139,332 &   147,204 &   159,341 &   153,526 &   28,015  &   27,953  &   655,370 \\
1995    &   131,287 &   128,389 &   179,312 &   154,520 &   16,170  &   16,356  &   626,032 \\
1996    &   149,111 &   140,981 &   200,482 &   156,804 &   18,165  &   18,348  &   683,890 \\
1997    &   124,953 &   104,115 &   116,448 &   107,630 &   60,192  &   53,191  &   566,527 \\
1998    &   136,605 &   110,620 &   208,659 &   178,012 &   32,819  &   40,307  &   707,019 \\
1999    &   36,258  &   32,630  &   38,840  &   35,695  &   16,282  &   18,339  &   178,044 \\
2000    &   64,575  &   58,162  &   63,832  &   41,120  &   40,868  &   39,134  &   307,689 \\
2001    &   79,333  &   75,633  &   54,119  &   51,268  &   44,295  &   45,836  &   350,483 \\
2002    &   71,776  &   69,743  &   65,432  &   64,373  &   37,701  &   39,322  &   348,347 \\
2003    &   74,995  &   77,612  &   49,469  &   53,053  &   51,799  &   53,463  &   360,390 \\
2004    &   75,426  &   76,018  &   63,204  &   62,005  &   47,289  &   44,246  &   368,188 \\
2005    &   76,627  &   69,543  &   43,205  &   33,886  &   68,878  &   63,088  &   355,225 \\
2006    &   72,353  &   63,108  &   28,799  &   22,363  &   75,180  &   65,209  &   327,010 \\
2007    &   62,827  &   60,522  &   32,945  &   25,518  &   75,128  &   69,116  &   326,054 \\
2008    &   46,125  &   51,027  &   20,493  &   23,503  &   61,149  &   64,598  &   266,894 \\
2009    &   46,051  &   44,080  &   19,877  &   18,579  &   50,451  &   53,344  &   232,379 \\
2010    &   39,495  &   41,054  &   19,194  &   20,591  &   40,449  &   41,323  &   202,106 \\
2011    &   58,822  &   62,617  &   60,254  &   65,057  &   51,137  &   48,084  &   345,971 \\
2012    &   53,641  &   57,966  &   45,044  &   46,940  &   50,167  &   53,224  &   306,982 \\
2013    &   52,303  &   62,336  &   37,434  &   44,709  &   49,484  &   49,903  &   296,168 \\
2014    &   55,954  &   58,097  &   46,568  &   51,950  &   46,643  &   46,202  &   305,414 \\
2015    &   55,646  &   56,507  &   45,074  &   41,218  &   46,237  &   43,084  &   287,766 \\
2016    &   57,478  &   59,000  &   10,264  &   9,016   &   72,973  &   69,669  &   278,400 \\
2017    &   55,965  &   64,728  &   15,871  &   14,136  &   70,285  &   66,026  &   287,011 \\
2018    &   57,156  &   64,639  &   35,811  &   32,842  &   56,243  &   49,671  &   296,362 \\
\hline
\end{tabular}
\end{table}

\clearpage

\begin{table}[ht]
\centering
\caption{Number of EBS pollock measured for weight and length by sex and strata as collected by the NMFS observer program, 1977-2018}
\label{tab:lw_meas} 
\begin{tabular}{crrrrrrr}
\hline
\multicolumn{8}{c}{ Weight-length samples } \\
\hline
&\multicolumn{2}{c}{A Season}   &\multicolumn{2}{c}{B Season SE} & \multicolumn{2}{c}{B Season NW}   &        \\
         & Males  & Females     & Males  & Females     & Males & Females & Total  \\
\hline
1977    &   1,222   &   1,338   &   137 &   166 &   1,461   &   1,664   &   5,988   \\
1978    &   1,991   &   2,686   &   409 &   516 &   2,200   &   2,623   &   10,425  \\
1979    &   2,709   &   3,151   &   152 &   209 &   1,469   &   1,566   &   9,256   \\
1980    &   1,849   &   2,156   &   99  &   144 &   612 &   681 &   5,541   \\
1981    &   1,821   &   2,045   &   51  &   52  &   1,623   &   1,810   &   7,402   \\
1982    &   2,030   &   2,208   &   181 &   176 &   2,852   &   3,043   &   10,490  \\
1983    &   1,199   &   1,200   &   144 &   122 &   3,268   &   3,447   &   9,380   \\
1984    &   980 &   1,046   &   117 &   136 &   1,273   &   1,378   &   4,930   \\
1985    &   520 &   499 &   46  &   55  &   426 &   488 &   2,034   \\
1986    &   689 &   794 &   518 &   501 &   286 &   286 &   3,074   \\
1987    &   1,351   &   1,466   &   25  &   33  &   72  &   63  &   3,010   \\
1991    &   2,712   &   2,781   &   2,339   &   2,496   &   1,065   &   1,169   &   12,562  \\
1992    &   1,517   &   1,582   &   1,911   &   1,970   &   588 &   566 &   8,134   \\
1993    &   1,201   &   1,270   &   1,448   &   1,406   &   435 &   450 &   6,210   \\
1994    &   1,552   &   1,630   &   1,569   &   1,577   &   162 &   171 &   6,661   \\
1995    &   1,215   &   1,259   &   1,320   &   1,343   &   223 &   232 &   5,592   \\
1996    &   2,094   &   2,135   &   1,409   &   1,384   &   1   &   1   &   7,024   \\
1997    &   628 &   627 &   616 &   665 &   511 &   523 &   3,570   \\
1998    &   1,852   &   1,946   &   959 &   923 &   327 &   350 &   6,357   \\
1999    &   5,318   &   4,798   &   7,797   &   7,054   &   3,532   &   3,768   &   32,267  \\
2000    &   11,346  &   12,457  &   7,736   &   7,991   &   7,800   &   12,463  &   59,793  \\
2001    &   14,411  &   14,965  &   9,064   &   8,803   &   10,460  &   10,871  &   68,574  \\
2002    &   13,564  &   14,098  &   7,648   &   7,213   &   13,004  &   12,988  &   68,515  \\
2003    &   15,535  &   14,857  &   10,272  &   10,031  &   10,111  &   9,437   &   70,243  \\
2004    &   7,924   &   7,742   &   4,318   &   4,617   &   6,868   &   6,850   &   38,319  \\
2005    &   7,039   &   7,428   &   6,426   &   6,947   &   4,114   &   5,139   &   37,093  \\
2006    &   6,566   &   7,381   &   6,442   &   7,406   &   3,045   &   4,006   &   34,846  \\
2007    &   6,640   &   6,695   &   7,081   &   7,798   &   3,202   &   4,305   &   35,721  \\
2008    &   4,501   &   4,865   &   5,855   &   6,264   &   2,236   &   2,624   &   26,345  \\
2009    &   4,033   &   4,382   &   4,655   &   4,511   &   1,723   &   1,934   &   21,238  \\
2010    &   4,258   &   4,536   &   3,883   &   4,125   &   2,012   &   2,261   &   21,075  \\
2011    &   5,845   &   6,388   &   4,954   &   4,647   &   5,929   &   6,456   &   34,219  \\
2012    &   5,494   &   5,979   &   4,923   &   5,346   &   4,507   &   4,774   &   31,023  \\
2013    &   5,689   &   6,525   &   4,844   &   4,920   &   3,599   &   4,313   &   29,890  \\
2014    &   5,675   &   5,871   &   4,785   &   4,652   &   4,753   &   5,180   &   30,916  \\
2015    &   5,310   &   5,323   &   4,648   &   4,194   &   4,365   &   4,064   &   27,904  \\
2016    &   5,312   &   5,725   &   1,077   &   909 &   6,872   &   6,635   &   26,530  \\
2017    &   5,238   &   6,047   &   1,586   &   1,343   &   6,575   &   6,254   &   27,043  \\
2018    &   5,583   &   6,174   &   3,430   &   3,172   &   5,506   &   4,850   &   28,715  \\
\hline
\end{tabular}
\end{table}

\begin{table}[ht]
\centering
\caption{Numbers of pollock fishery samples used for age determination estimates by sex and strata, 1977--2018, as sampled by the NMFS observer program.} 
\label{tab:fsh_n} 
\begin{tabular}{crrrrrrr}
\hline
&\multicolumn{2}{c}{A Season}   &\multicolumn{2}{c}{B Season SE} & \multicolumn{2}{c}{B Season NW}   &        \\
         & Males  & Females     & Males  & Females     & Males & Females & Total  \\
\hline
1977 & 1,229 & 1,344 & 137 & 166 & 1,415 & 1,613 & 5,904  \\
1978 & 1,992 & 2,686 & 407 & 514 & 2,188 & 2,611 & 10,398 \\
1979 & 2,647 & 3,088 & 152 & 209 & 1,464 & 1,561 & 9,121  \\
1980 & 1,854 & 2,158 & 93  & 138 & 606   & 675   & 5,524  \\
1981 & 1,819 & 2,042 & 51  & 52  & 1,620 & 1,807 & 7,391  \\
1982 & 2,030 & 2,210 & 181 & 176 & 2,865 & 3,062 & 10,524 \\
1983 & 1,200 & 1,200 & 144 & 122 & 3,249 & 3,420 & 9,335  \\
1984 & 980   & 1,046 & 117 & 136 & 1,272 & 1,379 & 4,930  \\
1985 & 520   & 499   & 46  & 55  & 426   & 488   & 2,034  \\
1986 & 689   & 794   & 518 & 501 & 286   & 286   & 3,074  \\
1987 & 1,351 & 1,466 & 25  & 33  & 72    & 63    & 3,010  \\
1991 & 420   & 423   & 272 & 265 & 320   & 341   & 2,041  \\
1992 & 392   & 392   & 371 & 386 & 178   & 177   & 1,896  \\
1993 & 444   & 473   & 503 & 493 & 124   & 122   & 2,159  \\
1994 & 201   & 202   & 570 & 573 & 131   & 141   & 1,818  \\
1995 & 298   & 316   & 436 & 417 & 123   & 131   & 1,721  \\
1996 & 468   & 449   & 442 & 433 & 1     & 1     & 1,794  \\
1997 & 433   & 436   & 284 & 311 & 326   & 326   & 2,116  \\
1998 & 592   & 659   & 307 & 307 & 216   & 232   & 2,313  \\
1999 & 540   & 500   & 730 & 727 & 306   & 298   & 3,100  \\
2000    &   629 &   667 &   293 &   254 &   596 &   847 &   3,286   \\
2001    &   563 &   603 &   205 &   178 &   697 &   736 &   2,982   \\
2002    &   672 &   663 &   247 &   202 &   890 &   839 &   3,513   \\
2003    &   653 &   588 &   274 &   262 &   701 &   671 &   3,149   \\
2004    &   547 &   561 &   221 &   245 &   698 &   600 &   2,872   \\
2005    &   599 &   617 &   420 &   422 &   490 &   614 &   3,162   \\
2006    &   528 &   609 &   507 &   568 &   367 &   459 &   3,038   \\
2007    &   627 &   642 &   552 &   568 &   485 &   594 &   3,468   \\
2008    &   513 &   497 &   538 &   650 &   342 &   368 &   2,908   \\
2009    &   404 &   484 &   440 &   432 &   240 &   299 &   2,299   \\
2010    &   545 &   624 &   413 &   466 &   418 &   505 &   2,971   \\
2011    &   581 &   808 &   404 &   396 &   582 &   660 &   3,431   \\
2012    &   517 &   571 &   485 &   579 &   480 &   533 &   3,165   \\
2013    &   666 &   703 &   525 &   568 &   401 &   518 &   3,381   \\
2014    &   609 &   629 &   413 &   407 &   475 &   553 &   3,086   \\
2015    &   653 &   642 &   511 &   493 &   508 &   513 &   3,320   \\
2016    &   488 &   599 &   157 &   125 &   929 &   969 &   3,267   \\
2017    &   604 &   778 &   179 &   163 &   777 &   753 &   3,254   \\
2018    &   569 &   662 &   366 &   358 &   621 &   591 &   3,167   \\
\hline
\end{tabular}
\end{table}


\begin{table}[ht]
\centering
\caption{NMFS total pollock research catch by year in t, 1964--2019.}
\label{tab:res_catch}
\begin{tabular}{crrrrr}
\hline
Year & Bering Sea & Year & Bering Sea & Year & Bering Sea \\
\hline
1964 & 0          & 1982 & 682        & 2000 & 313        \\
1965 & 18         & 1983 & 508        & 2001 & 241        \\
1966 & 17         & 1984 & 208        & 2002 & 440        \\
1967 & 21         & 1985 & 435        & 2003 & 285        \\
1968 & 7          & 1986 & 163        & 2004 & 363        \\
1969 & 14         & 1987 & 174        & 2005 & 87         \\
1970 & 9          & 1988 & 467        & 2006 & 251        \\
1971 & 16         & 1989 & 393        & 2007 & 333        \\
1972 & 11         & 1990 & 369        & 2008 & 168        \\
1973 & 69         & 1991 & 465        & 2009 & 156        \\
1974 & 83         & 1992 & 156        & 2010 & 226        \\
1975 & 197        & 1993 & 221        & 2011 & 1322       \\
1976 & 122        & 1994 & 267        & 2012 & 219        \\
1977 & 35         & 1995 & 249        & 2013 & 183        \\
1978 & 94         & 1996 & 206        & 2014 & 308        \\
1979 & 458        & 1997 & 262        & 2015 & 256        \\
1980 & 139        & 1998 & 121        & 2016 & 198       \\
1981 & 466        & 1999 & 299        & 2017 & 226       \\
     &            &      &            & 2018 &           \\
\hline
\end{tabular}
\end{table}

\clearpage


\begin{table}[ht]
\centering
\caption{Survey biomass estimates (age 1+, t) of Eastern Bering Sea pollock based on  design-based area-swept expansion methods from NMFS bottom trawl surveys 1982--2019.}
\label{tab:bts_biom}
\begin{tabular}{crrrr}
\hline
     & \multicolumn{3}{c}{Survey biomass}                       &     \\
Year & Strata 1-6              & Strata 8-9  &   Total           & \%NW \\
\hline
1982	&	 2,858,400 	&	 54,469 	&	 2,912,869 	&	2\%	\\
1983	&	 5,921,380 	&	 -   	&	 5,921,380 	&	 -   	\\
1984	&	 4,542,405 	&	 -   	&	 4,542,405 	&	 -   	\\
1985	&	 4,560,122 	&	 637,881 	&	 5,198,003 	&	12\%	\\
1986	&	 4,835,722 	&	 -   	&	 4,835,722 	&	 -   	\\
1987	&	 5,111,645 	&	 386,788 	&	 5,498,433 	&	7\%	\\
1988	&	 7,003,983 	&	 179,980 	&	 7,183,963 	&	3\%	\\
1989	&	 5,906,477 	&	 643,938 	&	 6,550,415 	&	10\%	\\
1990	&	 7,107,218 	&	 189,435 	&	 7,296,653 	&	3\%	\\
1991	&	 5,067,092 	&	 62,446 	&	 5,129,538 	&	1\%	\\
1992	&	 4,316,660 	&	 209,493 	&	 4,526,153 	&	5\%	\\
1993	&	 5,196,453 	&	 98,363 	&	 5,294,816 	&	2\%	\\
1994	&	 4,977,639 	&	 49,686 	&	 5,027,325 	&	1\%	\\
1995	&	 5,409,297 	&	 68,541 	&	 5,477,838 	&	1\%	\\
1996	&	 2,981,680 	&	 143,573 	&	 3,125,253 	&	5\%	\\
1997	&	 2,868,734 	&	 693,429 	&	 3,562,163 	&	19\%	\\
1998	&	 2,137,049 	&	 550,706 	&	 2,687,755 	&	20\%	\\
1999	&	 3,598,688 	&	 199,786 	&	 3,798,474 	&	5\%	\\
2000	&	 4,985,064 	&	 118,565 	&	 5,103,629 	&	2\%	\\
2001	&	 4,145,746 	&	 51,108 	&	 4,196,854 	&	1\%	\\
2002	&	 4,755,668 	&	 197,770 	&	 4,953,438 	&	4\%	\\
2003	&	 8,106,358 	&	 285,902 	&	 8,392,261 	&	3\%	\\
2004	&	 3,744,501 	&	 118,473 	&	 3,862,974 	&	3\%	\\
2005	&	 4,731,068 	&	 137,548 	&	 4,868,616 	&	3\%	\\
2006	&	 2,845,553 	&	 199,827 	&	 3,045,380 	&	7\%	\\
2007	&	 4,158,234 	&	 179,986 	&	 4,338,220 	&	4\%	\\
2008	&	 2,834,093 	&	 189,174 	&	 3,023,267 	&	6\%	\\
2009	&	 2,231,225 	&	 51,185 	&	 2,282,410 	&	2\%	\\
2010	&	 3,550,981 	&	 186,898 	&	 3,737,878 	&	5\%	\\
2011	&	 2,945,641 	&	 166,672 	&	 3,112,312 	&	5\%	\\
2012	&	 3,281,223 	&	 206,005 	&	 3,487,229 	&	6\%	\\
2013	&	 4,297,970 	&	 277,433 	&	 4,575,403 	&	6\%	\\
2014	&	 6,552,849 	&	 877,104 	&	 7,429,952 	&	12\%	\\
2015	&	 5,944,325 	&	 450,034 	&	 6,394,359 	&	7\%	\\
2016	&	 4,698,430 	&	 211,650 	&	 4,910,080 	&	4\%	\\
2017	&	 4,688,500 	&	 125,873 	&	 4,814,373 	&	3\%	\\
2018	&	 3,015,612 	&	 97,185 	&	 3,112,797 	&	3\%	\\
2019	&	 xxxxx 	&	 xxxxx 	&	 xxxxx 	&	3\%	\\
\hline
Average	&	 4,484,154 	&	 224,241 	&	 4,708,394 	&	5\%	\\
\hline
\end{tabular}
\end{table}

\clearpage

\begin{table}[ht]
\centering
\caption{Sampling effort for pollock in the EBS from the NMFS bottom trawl survey 1982--2019.}
\label{tab:bts_n}
\begin{tabular}{crrrrrrrr}
\hline
Year & Number of & Lengths & Aged &  & Year & Number of & Lengths & Aged \\
     & Hauls &  &  &  &  & Hauls &  &  \\
\hline
1982 & 329 & 40,001 & 1,611 &  & 1999 & 373 & 32,532 & 1,385 \\
1983 & 354 & 78,033 & 1,931 &  & 2000 & 372 & 41,762 & 1,545 \\
1984 & 355 & 40,530 & 1,806 &  & 2001 & 375 & 47,335 & 1,641 \\
1985 & 434 & 48,642 & 1,913 &  & 2002 & 375 & 43,361 & 1,695 \\
1986 & 354 & 41,101 & 1,344 &  & 2003 & 376 & 46,480 & 1,638 \\
1987 & 356 & 40,144 & 1,607 &  & 2004 & 375 & 44,102 & 1,660 \\
1988 & 373 & 40,408 & 1,173 &  & 2005 & 373 & 35,976 & 1,676 \\
1989 & 373 & 38,926 & 1,227 &  & 2006 & 376 & 39,211 & 1,573 \\
1990 & 371 & 34,814 & 1,257 &  & 2007 & 376 & 29,679 & 1,484 \\
1991 & 371 & 43,406 & 1,083 &  & 2008 & 375 & 24,635 & 1,251 \\
1992 & 356 & 34,024 & 1,263 &  & 2009 & 375 & 24,819 & 1,342 \\
1993 & 375 & 43,278 & 1,385 &  & 2010 & 376 & 23,142 & 1,385 \\
1994 & 375 & 38,901 & 1,141 &  & 2011 & 376 & 36,227 & 1,734 \\
1995 & 376 & 25,673 & 1,156 &  & 2012 & 376 & 35,782 & 1,785 \\
1996 & 375 & 40,789 & 1,387 &  & 2013 & 376 & 35,908 & 1,847 \\
1997 & 376 & 35,536 & 1,193 &  & 2014 & 376 & 43,042 & 2,099 \\
1998 & 375 & 37,673 & 1,261 &  & 2015 & 376 & 54,241 & 2,320 \\
     &     &        &       &  & 2016 & 376 & 50,857 & 1,766 \\
     &     &        &       &  & 2017 & 376 & 47,873 & 1,623 \\
     &     &        &       &  & 2018 & 376 & 48,673 & 1,486 \\
     &     &        &       &  & 2019 & 376 & 42,382 & 1,519 \\
\hline
\end{tabular}
\end{table}

\clearpage

\begin{table}[ht]
\centering
\caption{Bottom-trawl survey estimated numbers \(millions\) at age used for the stock assessment model. Note that in 1982--84 and 1986 only strata 1--6 were surveyed. Note these estimates are based on design-based procedures.}
\label{tab:bts_age}
\scalebox{0.83}{
\begin{tabular}{crrrrrrrrrrrrrrrr}
\hline
Year & 1     & 2     & 3     & 4     & 5     & 6     & 7     & 8     & 9     & 10    & 11    & 12  & 13  & 14  & 15  & Total  \\ 
\hline
1982	 & 1,235	 & 2,944	 & 3,310	 & 4,340	 & 1,489	 & 203	 & 140	 & 67	 & 42	 & 26	 & 16	 & 10	 & 3	 & 1	 & 1	 & 13,827	\\
1983	 & 4,798	 & 734	 & 1,656	 & 2,980	 & 6,689	 & 2,042	 & 371	 & 198	 & 89	 & 77	 & 58	 & 20	 & 8	 & 7	 & 3	 & 19,731	\\
1984	 & 435	 & 363	 & 538	 & 1,535	 & 1,905	 & 4,451	 & 853	 & 189	 & 88	 & 31	 & 21	 & 8	 & 5	 & 6	 & 3	 & 10,431	\\
1985	 & 5,340	 & 430	 & 1,492	 & 692	 & 2,653	 & 2,011	 & 1,501	 & 298	 & 79	 & 64	 & 23	 & 8	 & 9	 & 1	 & 	 & 14,600	\\
1986	 & 2,774	 & 678	 & 533	 & 1,875	 & 1,135	 & 1,890	 & 1,653	 & 1,501	 & 471	 & 72	 & 33	 & 15	 & 1	 & 4	 & 1	 & 12,636	\\
1987	 & 379	 & 759	 & 1,032	 & 780	 & 4,741	 & 1,297	 & 1,202	 & 479	 & 1,521	 & 237	 & 71	 & 28	 & 5	 & 2	 & 2	 & 12,535	\\
1988	 & 1,455	 & 809	 & 1,898	 & 3,582	 & 1,562	 & 5,048	 & 1,497	 & 1,133	 & 647	 & 1,536	 & 145	 & 87	 & 18	 & 24	 & 12	 & 19,453	\\
1989	 & 972	 & 304	 & 467	 & 1,564	 & 3,884	 & 875	 & 3,474	 & 534	 & 663	 & 258	 & 812	 & 142	 & 124	 & 63	 & 87	 & 14,223	\\
1990	 & 2,076	 & 395	 & 142	 & 894	 & 1,808	 & 6,076	 & 1,221	 & 3,008	 & 304	 & 537	 & 82	 & 770	 & 67	 & 50	 & 68	 & 17,498	\\
1991	 & 3,025	 & 899	 & 326	 & 103	 & 629	 & 591	 & 1,964	 & 740	 & 1,594	 & 417	 & 563	 & 116	 & 349	 & 49	 & 44	 & 11,408	\\
1992	 & 1,566	 & 444	 & 2,303	 & 375	 & 409	 & 681	 & 616	 & 896	 & 401	 & 770	 & 272	 & 338	 & 146	 & 116	 & 92	 & 9,424	\\
1993	 & 2,553	 & 382	 & 835	 & 3,752	 & 818	 & 657	 & 340	 & 467	 & 634	 & 390	 & 343	 & 251	 & 197	 & 109	 & 130	 & 11,856	\\
1994	 & 1,667	 & 752	 & 580	 & 1,622	 & 4,394	 & 770	 & 200	 & 173	 & 193	 & 364	 & 222	 & 310	 & 117	 & 113	 & 187	 & 11,663	\\
1995	 & 2,231	 & 206	 & 385	 & 1,940	 & 2,615	 & 4,293	 & 1,824	 & 481	 & 294	 & 184	 & 346	 & 139	 & 256	 & 101	 & 145	 & 15,439	\\
1996	 & 1,488	 & 318	 & 126	 & 253	 & 897	 & 1,311	 & 1,213	 & 415	 & 103	 & 111	 & 75	 & 141	 & 46	 & 83	 & 110	 & 6,691	\\
1997	 & 2,502	 & 361	 & 84	 & 100	 & 1,459	 & 992	 & 731	 & 923	 & 160	 & 82	 & 62	 & 67	 & 111	 & 36	 & 123	 & 7,793	\\
1998	 & 678	 & 614	 & 300	 & 176	 & 303	 & 1,740	 & 500	 & 353	 & 284	 & 71	 & 33	 & 12	 & 26	 & 30	 & 70	 & 5,190	\\
1999	 & 1,123	 & 1,038	 & 966	 & 1,041	 & 589	 & 1,031	 & 2,554	 & 680	 & 322	 & 301	 & 110	 & 47	 & 19	 & 27	 & 93	 & 9,939	\\
2000	 & 1,105	 & 422	 & 532	 & 1,811	 & 1,792	 & 915	 & 765	 & 2,492	 & 975	 & 512	 & 217	 & 146	 & 45	 & 20	 & 86	 & 11,835	\\
2001	 & 1,812	 & 1,051	 & 569	 & 542	 & 1,369	 & 1,432	 & 615	 & 305	 & 908	 & 651	 & 249	 & 199	 & 79	 & 28	 & 76	 & 9,885	\\
2002	 & 788	 & 400	 & 812	 & 1,164	 & 1,206	 & 1,585	 & 825	 & 404	 & 552	 & 1,036	 & 516	 & 228	 & 135	 & 40	 & 43	 & 9,734	\\
2003	 & 535	 & 150	 & 969	 & 1,680	 & 2,021	 & 1,862	 & 2,495	 & 1,411	 & 646	 & 839	 & 1,714	 & 740	 & 278	 & 146	 & 105	 & 15,591	\\
2004	 & 389	 & 249	 & 160	 & 1,305	 & 1,301	 & 999	 & 588	 & 636	 & 314	 & 196	 & 195	 & 352	 & 150	 & 36	 & 28	 & 6,897	\\
2005	 & 353	 & 119	 & 226	 & 1,042	 & 2,940	 & 1,981	 & 1,035	 & 470	 & 357	 & 262	 & 70	 & 148	 & 241	 & 92	 & 95	 & 9,431	\\
2006	 & 862	 & 66	 & 69	 & 279	 & 910	 & 1,218	 & 799	 & 387	 & 221	 & 190	 & 91	 & 57	 & 82	 & 110	 & 109	 & 5,450	\\
2007	 & 1,945	 & 66	 & 165	 & 463	 & 1,436	 & 1,691	 & 1,231	 & 887	 & 377	 & 168	 & 157	 & 137	 & 62	 & 78	 & 151	 & 9,014	\\
2008	 & 525	 & 117	 & 96	 & 183	 & 516	 & 1,036	 & 820	 & 582	 & 371	 & 148	 & 124	 & 95	 & 43	 & 24	 & 149	 & 4,829	\\
2009	 & 791	 & 220	 & 462	 & 499	 & 289	 & 417	 & 558	 & 435	 & 316	 & 152	 & 101	 & 33	 & 33	 & 17	 & 69	 & 4,391	\\
2010	 & 471	 & 91	 & 244	 & 2,822	 & 1,288	 & 403	 & 343	 & 364	 & 383	 & 263	 & 227	 & 82	 & 50	 & 29	 & 62	 & 7,121	\\
2011	 & 1,128	 & 114	 & 212	 & 340	 & 1,779	 & 872	 & 252	 & 141	 & 221	 & 221	 & 185	 & 142	 & 60	 & 28	 & 76	 & 5,770	\\
2012	 & 1,145	 & 207	 & 362	 & 2,940	 & 729	 & 1,192	 & 406	 & 162	 & 122	 & 167	 & 139	 & 122	 & 102	 & 36	 & 65	 & 7,895	\\
2013	 & 1,189	 & 116	 & 223	 & 903	 & 4,639	 & 1,099	 & 695	 & 245	 & 83	 & 76	 & 100	 & 75	 & 70	 & 38	 & 50	 & 9,602	\\
2014	 & 2,121	 & 581	 & 222	 & 236	 & 1,306	 & 5,343	 & 2,840	 & 644	 & 358	 & 133	 & 51	 & 73	 & 74	 & 34	 & 92	 & 14,108	\\
2015	 & 1,056	 & 670	 & 2,161	 & 538	 & 1,083	 & 2,043	 & 4,110	 & 1,221	 & 295	 & 141	 & 18	 & 17	 & 29	 & 18	 & 36	 & 13,435	\\
2016	 & 703	 & 412	 & 653	 & 3,280	 & 1,331	 & 886	 & 1,245	 & 1,828	 & 358	 & 140	 & 45	 & 11	 & 11	 & 4	 & 7	 & 10,915	\\
2017	 & 574	 & 242	 & 451	 & 2,346	 & 2,834	 & 1,231	 & 844	 & 758	 & 893	 & 256	 & 91	 & 33	 & 5	 & 2	 & 7	 & 10,565	\\
2018	 & 864	 & 373	 & 167	 & 353	 & 2,571	 & 1,452	 & 492	 & 361	 & 366	 & 281	 & 89	 & 14	 & 2	 & 	 & 6	 & 7,391	\\
2019	 & 1,449	 & 388	 & 333	 & 363	 & 1,111	 & 4,294	 & 1,774	 & 418	 & 298	 & 171	 & 98	 & 43	 & 16	 & 3	 & 1	 & 10,761	\\
\hline																																	
Avg	& 1,476	 & 486	 & 686	 & 1,334	 & 1,853	 & 1,787	 & 1,173	 & 702	 & 429	 & 303	 & 204	 & 138	 & 81	 & 42	 & 65	 & 10,697	\\
\hline																																	
\end{tabular}
}
\end{table}

\clearpage

\begin{table}[ht]
\centering
\caption{Mean EBS pollock body mass (kg) at age as observed in the summer NMFS bottom trawl survey, 1982--2019.}
\label{tab:wt_bts}
\scalebox{0.8}{
\begin{tabular}{crrrrrrrrrrrrrrr}
\hline
\normalsize  Year & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 & 10 & 11 & 12 & 13 & 14 & 15+  \\
\hline
1982    & 0.032 & 0.075 & 0.167 & 0.349 & 0.429 & 0.666 & 1.023 & 1.124 & 1.202 & 1.378 & 1.588 & 1.626 & 1.881 & 1.802 & 2.668 \\
1983    & 0.017 & 0.141 & 0.240 & 0.360 & 0.493 & 0.578 & 0.727 & 1.074 & 1.126 & 1.020 & 1.121 & 1.130 & 1.558 & 1.115 & 1.936 \\
1984    & 0.014 & 0.072 & 0.264 & 0.359 & 0.483 & 0.617 & 0.757 & 1.018 & 1.220 & 1.407 & 1.528 & 1.689 & 1.345 & 1.468 & 2.079 \\
1985    & 0.014 & 0.104 & 0.264 & 0.410 & 0.514 & 0.649 & 0.784 & 0.926 & 1.428 & 1.132 & 1.298 & 1.727 & 1.629 & 1.614 & 2.570 \\
1986    & 0.012 & 0.102 & 0.183 & 0.356 & 0.462 & 0.638 & 0.718 & 0.851 & 1.012 & 1.291 & 1.322 & 1.149 & 2.295 & 2.165 & 2.422 \\
1987    & 0.017 & 0.110 & 0.262 & 0.354 & 0.432 & 0.525 & 0.705 & 0.795 & 0.896 & 1.005 & 1.198 & 1.400 & 1.740 & 2.020 & 2.275 \\
1988    & 0.018 & 0.108 & 0.296 & 0.355 & 0.457 & 0.521 & 0.601 & 0.754 & 0.851 & 1.002 & 1.203 & 1.216 & 1.712 & 0.952 & 1.802 \\
1989    & 0.016 & 0.092 & 0.168 & 0.385 & 0.455 & 0.529 & 0.629 & 0.673 & 0.927 & 0.924 & 1.046 & 1.078 & 1.124 & 1.187 & 1.284 \\
1990    & 0.013 & 0.102 & 0.153 & 0.378 & 0.505 & 0.572 & 0.612 & 0.723 & 0.794 & 1.049 & 1.079 & 1.137 & 1.081 & 1.287 & 1.386 \\
1991    & 0.019 & 0.108 & 0.157 & 0.354 & 0.486 & 0.579 & 0.695 & 0.740 & 0.873 & 0.911 & 1.093 & 1.201 & 1.266 & 1.425 & 1.924 \\
1992    & 0.014 & 0.113 & 0.285 & 0.371 & 0.512 & 0.625 & 0.780 & 0.841 & 0.900 & 0.990 & 1.107 & 1.260 & 1.393 & 1.350 & 1.391 \\
1993    & 0.012 & 0.072 & 0.314 & 0.456 & 0.503 & 0.553 & 0.663 & 0.796 & 0.977 & 1.029 & 1.153 & 1.257 & 1.392 & 1.550 & 1.699 \\
1994    & 0.015 & 0.086 & 0.223 & 0.474 & 0.573 & 0.635 & 0.716 & 0.976 & 1.172 & 1.128 & 1.200 & 1.331 & 1.433 & 1.521 & 1.698 \\
1995    & 0.013 & 0.088 & 0.145 & 0.380 & 0.486 & 0.628 & 0.654 & 0.801 & 0.939 & 1.172 & 1.136 & 1.308 & 1.353 & 1.434 & 1.683 \\
1996    & 0.017 & 0.081 & 0.142 & 0.340 & 0.506 & 0.597 & 0.733 & 0.815 & 0.972 & 1.059 & 1.299 & 1.393 & 1.437 & 1.548 & 1.659 \\
1997    & 0.016 & 0.053 & 0.181 & 0.363 & 0.439 & 0.591 & 0.707 & 0.806 & 0.974 & 1.023 & 1.163 & 1.311 & 1.289 & 1.474 & 1.598 \\
1998    & 0.016 & 0.070 & 0.173 & 0.334 & 0.474 & 0.523 & 0.698 & 0.837 & 0.925 & 0.997 & 1.081 & 1.359 & 1.357 & 1.750 & 1.804 \\
1999    & 0.014 & 0.080 & 0.210 & 0.356 & 0.422 & 0.560 & 0.635 & 0.776 & 0.985 & 1.014 & 1.116 & 1.202 & 1.624 & 1.757 & 1.924 \\
2000    & 0.010 & 0.063 & 0.228 & 0.376 & 0.456 & 0.530 & 0.650 & 0.709 & 0.782 & 0.956 & 1.160 & 1.212 & 1.342 & 1.500 & 1.868 \\
2001    & 0.016 & 0.069 & 0.169 & 0.374 & 0.505 & 0.601 & 0.674 & 0.771 & 0.857 & 0.911 & 1.099 & 1.207 & 1.412 & 1.396 & 1.688 \\
2002    & 0.011 & 0.097 & 0.252 & 0.390 & 0.536 & 0.650 & 0.678 & 0.808 & 0.891 & 0.928 & 0.939 & 1.097 & 1.189 & 1.370 & 1.835 \\
2003    & 0.021 & 0.106 & 0.334 & 0.437 & 0.567 & 0.671 & 0.729 & 0.833 & 0.889 & 0.957 & 0.967 & 1.021 & 1.029 & 1.132 & 1.184 \\
2004    & 0.019 & 0.099 & 0.297 & 0.481 & 0.556 & 0.680 & 0.756 & 0.791 & 0.942 & 0.951 & 1.038 & 1.048 & 1.123 & 1.343 & 1.438 \\
2005    & 0.018 & 0.079 & 0.220 & 0.404 & 0.528 & 0.605 & 0.702 & 0.801 & 0.874 & 0.913 & 1.014 & 1.064 & 1.098 & 1.193 & 1.321 \\
2006    & 0.009 & 0.081 & 0.156 & 0.387 & 0.524 & 0.612 & 0.723 & 0.811 & 0.914 & 1.045 & 1.100 & 1.184 & 1.279 & 1.257 & 1.375 \\
2007    & 0.012 & 0.095 & 0.276 & 0.427 & 0.547 & 0.671 & 0.777 & 0.846 & 0.926 & 1.078 & 1.126 & 1.110 & 1.328 & 1.301 & 1.423 \\
2008    & 0.014 & 0.054 & 0.232 & 0.413 & 0.522 & 0.643 & 0.762 & 0.867 & 0.934 & 1.071 & 1.222 & 1.206 & 1.379 & 1.544 & 1.577 \\
2009    & 0.010 & 0.113 & 0.223 & 0.408 & 0.551 & 0.675 & 0.840 & 0.914 & 0.960 & 1.173 & 1.170 & 1.440 & 1.449 & 1.546 & 1.784 \\
2010    & 0.018 & 0.078 & 0.237 & 0.404 & 0.546 & 0.678 & 0.899 & 0.984 & 1.021 & 1.124 & 1.157 & 1.274 & 1.457 & 1.559 & 1.966 \\
2011    & 0.015 & 0.112 & 0.229 & 0.429 & 0.551 & 0.646 & 0.802 & 1.004 & 1.105 & 1.152 & 1.249 & 1.306 & 1.431 & 1.463 & 1.671 \\
2012    & 0.013 & 0.080 & 0.205 & 0.362 & 0.535 & 0.669 & 0.805 & 0.948 & 1.211 & 1.239 & 1.296 & 1.343 & 1.440 & 1.658 & 1.913 \\
2013    & 0.017 & 0.069 & 0.222 & 0.421 & 0.495 & 0.624 & 0.834 & 0.978 & 1.093 & 1.225 & 1.297 & 1.343 & 1.468 & 1.609 & 1.730 \\
2014    & 0.016 & 0.100 & 0.212 & 0.367 & 0.489 & 0.610 & 0.667 & 0.905 & 0.996 & 1.126 & 1.327 & 1.332 & 1.382 & 1.497 & 1.664 \\
2015    & 0.019 & 0.093 & 0.287 & 0.387 & 0.518 & 0.601 & 0.727 & 0.814 & 1.048 & 1.081 & 1.329 & 1.585 & 1.366 & 1.579 & 1.773 \\
2016    & 0.023 & 0.083 & 0.234 & 0.435 & 0.512 & 0.607 & 0.695 & 0.777 & 0.842 & 0.922 & 1.079 & 1.096 & 1.395 & 1.708 & 1.839 \\
2017    & 0.022 & 0.098 & 0.200 & 0.397 & 0.529 & 0.598 & 0.691 & 0.743 & 0.824 & 0.830 & 0.960 & 0.856 & 1.336 & 1.506 & 1.701 \\
2018    & 0.020 & 0.073 & 0.204 & 0.375 & 0.501 & 0.614 & 0.706 & 0.752 & 0.843 & 0.883 & 0.965 & 0.963 & 1.133 & 1.175 & 1.218 \\
2019    & 0.016 & 0.089 & 0.234 & 0.435 & 0.546 & 0.639 & 0.711 & 0.792 & 0.844 & 0.926 & 0.898 & 0.978 & 0.948 & 1.401 & 1.854 \\
\hline
Avg & 0.016 & 0.089 & 0.223 & 0.391 & 0.504 & 0.611 & 0.728 & 0.847 & 0.973 & 1.053 & 1.161 & 1.248 & 1.392 & 1.478 & 1.753 \\
\hline
\end{tabular}
}
\end{table}

\clearpage

\begin{table}[ht]  
\centering  
\caption{Biomass (age 1+) of Eastern Bering Sea pollock as estimated by surveys 1979--2019 (millions of t). Note that the bottom-trawl survey data only represent biomass from the survey strata (1--6) areas in 1982--1984, and 1986. For all other years the estimates include strata 8--9. DDC indicates the values obtained from the Kotwicki et al. Density-Dependence Correction method and the VAST columns are for the standard survey area including the Northern Bering Sea (NBS) extension. AT survey data prior to 1994 represent estimates from the surface to 3m off bottom.}
\label{tab:bts_abund}
\begin{tabular}{crrrrr}
\hline
	&	\multicolumn{3}{c}{Bottom	trawl	survey}	&	AT	&	\\			
Year	&	DDC & VAST & VAST	+	NBS	&	Survey	&	age	3+ \\
\hline											\\		
1979	&		&		&		&	7.458\*	&	22\%	\\
1980	&		&		&		&		&		\\
1981	&		&		&		&		&		\\
1982	&	4.069	&	3.802	&	3.819	&	4.901\*	&	95\%	\\
1983	&	8.409	&	9.601	&	9.825	&		&		\\
1984	&	6.409	&	6.927	&	6.986	&		&		\\
1985	&	8.25	&	7.828	&	8.199	&	4.799\*	&	97\%	\\
1986	&	6.826	&	7.275	&	7.399	&		&		\\
1987	&	7.892	&	7.708	&	7.787	&		&		\\
1988	&	11.088	&	10.901	&	10.922	&	4.675\*	&	97\%	\\
1989	&	9.796	&	10.34	&	10.482	&		&		\\
1990	&	11.9	&	11.615	&	11.674	&		&		\\
1991	&	7.39	&	7.336	&	7.515	&	1.454\*	&	46\%	\\
1992	&	6.211	&	6.625	&	6.699	&		&		\\
1993	&	7.089	&	7.777	&	7.937	&		&		\\
1994	&	7.1	&	7.348	&	7.432	&	3.640	&	85\%	\\
1995	&	9.107	&	6.481	&	6.544	&		&		\\
1996	&	4.08	&	3.916	&	4.067	&	2.955	&	97\%	\\
1997	&	5.019	&	4.834	&	5.031	&	3.591	&	70\%	\\
1998	&	3.51	&	3.648	&	4.038	&		&		\\
1999	&	5.455	&	5.129	&	5.185	&	4.202	&	95\%	\\
2000	&	7.355	&	7.937	&	8.024	&	3.614	&	95\%	\\
2001	&	5.44	&	6.035	&	6.106	&		&		\\
2002	&	6.771	&	6.842	&	7.028	&	4.330	&	82\%	\\
2003	&	13.508	&	10.846	&	11.468	&		&		\\
2004	&	5.106	&	5.423	&	5.743	&	4.016	&	99\%	\\
2005	&	6.696	&	6.905	&	7.018	&		&		\\
2006	&	3.886	&	4.004	&	4.016	&	1.887	&	98\%	\\
2007	&	6.145	&	6.411	&	6.438	&	2.288	&	89\%	\\
2008	&	3.994	&	4.246	&	4.258	&	1.407	&	76\%	\\
2009	&	2.99	&	2.929	&	2.934	&	1.323	&	78\%	\\
2010	&	5.132	&	5.174	&	5.183	&	2.651	&	65\%	\\
2011	&	3.949	&	4.539	&	4.604	&		&		\\
2012	&	4.614	&	4.729	&	4.771	&	2.299	&	71\%	\\
2013	&	6.115	&	6.096	&	6.166	&		&		\\
2014	&	10.331	&	11.889	&	12.508	&	4.727	&	65\%	\\
2015	&	8.587	&	9.604	&	10.878	&		&		\\
2016	&	6.608	&	7.216	&	9.776	&	4.829	&	97\%	\\
2017	&	6.256	&	6.941	&	8.694	&		&		\\
2018	&	4.187	&	4.002	&	5.596	&	2.499	&	97\%	\\
\hline											
Avg	&	6.683	&	6.780	&	7.101	&	3.141	&		\\
\hline													
\end{tabular}													
\end{table}													


\clearpage

\begin{table}[ht]
\centering
\caption{Number of (age 1+) hauls and sample sizes for EBS pollock collected by the AT surveys. Sub-headings E and W represent collections east and west of 170W (within the US EEZ) and US represents the US sub-total and RU represents the collections from the Russian side of the surveyed region.}
\label{tab:ats_n}
\scalebox{0.8}{
\begin{tabular}{crrrrrrrrrrrrrrrr}
\hline
    &\multicolumn{4}{c}{Hauls} & \multicolumn{4}{c}{Lengths} & \multicolumn{4}{c}{Otoliths} &       \multicolumn{4}{c}{Number aged} \\
Year  & E  & W  & US  & RU      & E      & W      & US     & RU       & E     & W     & US    & RU          & E     & W     & US    & RU  \\
\hline
1979  &    &    & 25  &         &        &        & 7,722  &          &       &       & 0     &             &       &       & 2,610 &     \\
1982  & 13 & 31 & 48  &         & 1,725  & 6,689  & 8,687  &          & 840   & 2,324 & 3,164 &             & 783   & 1,958 & 2,741 &     \\
1985  &    &    & 73  &         &        &        & 19,872 &          &       &       & 2,739 &             &       &       & 2,739 &     \\
1988  &    &    & 25  &         &        &        & 6,619  &          &       &       & 1,471 &             &       &       & 1,471 &     \\
1991  &    &    & 62  &         &        &        & 16,343 &          &       &       & 2,062 &             &       &       & 1,663 &     \\
1994  & 25 & 51 & 76  & 19      & 4,553  & 21,011 & 25,564 & 8,930    & 1,560 & 3,694 & 4,966 & 1,270       & 612   & 932   & 1,770 & 455 \\
1996  & 15 & 42 & 57  &         & 3,551  & 13,273 & 16,824 &          & 669   & 1,280 & 1,949 &             & 815   & 1,111 & 1,926 &     \\
1997  & 25 & 61 & 86  &         & 6,493  & 23,043 & 29,536 &          & 966   & 2,669 & 3,635 &             & 936   & 1,349 & 2,285 &     \\
1999  & 41 & 77 & 118 &         & 13,841 & 28,521 & 42,362 &          & 1,945 & 3,001 & 4,946 &             & 946   & 1,500 & 2,446 &     \\
2000  & 29 & 95 & 124 &         & 7,721  & 36,008 & 43,729 &          & 850   & 2,609 & 3,459 &             & 850   & 1,403 & 2,253 &     \\
2002  & 47 & 79 & 126 &         & 14,601 & 25,633 & 40,234 &          & 1,424 & 1,883 & 3,307 &             & 1,000 & 1,200 & 2,200 &     \\
2004  & 33 & 57 & 90  & 15      & 8,896  & 18,262 & 27,158 & 5,893    & 1,167 & 2,002 & 3,169 & 461         & 798   & 1,192 & 2,351 & 461 \\
2006  & 27 & 56 & 83  &         & 4,939  & 19,326 & 24,265 &          & 822   & 1,871 & 2,693 &             & 822   & 1,870 & 2,692 &     \\
2007  & 23 & 46 & 69  & 4       & 5,492  & 14,863 & 20,355 & 1,407    & 871   & 1,961 & 2,832 & 319         & 823   & 1,737 & 2,560 & 315 \\
2008  & 9  & 53 & 62  & 6       & 2,394  & 15,354 & 17,748 & 1,754    & 341   & 1,698 & 2,039 & 177         & 338   & 1,381 & 1,719 & 176 \\
2009  & 13 & 33 & 46  & 3       & 1,576  & 9,257  & 10,833 & 282      & 308   & 1,210 & 1,518 & 54          & 306   & 1,205 & 1,511 & 54  \\
2010  & 11 & 48 & 59  & 9       & 2,432  & 20,263 & 22,695 & 3,502    & 653   & 1,868 & 2,521 & 381         & 652   & 1,598 & 2,250 & 379 \\
2012  & 17 & 60 & 77  & 14      & 4,422  & 23,929 & 28,351 & 5,620    & 650   & 2,045 & 2,695 & 418         & 646   & 1,483 & 2,129 & 416 \\
2014  & 52 & 87 & 139 & 3       & 28,857 & 8,645  & 37,502 & 747      & 1,739 & 849   & 2,588 & 72          & 845   & 1,735 & 2,580 & 72  \\
2016  & 37 & 71 & 108 &         & 10,912 & 24,134 & 35,046 &          & 880   & 1,514 & 2,394 &             & 876   & 1,513 & 2,388 &     \\
2018  & 36 & 55 &  91 &         & 11,031 & 18,654 & 29,685 &          & 1,105 & 1,515 & 2,620 &             & --    &   --  & --    &     \\
\hline
\end{tabular}
}
\end{table}

\clearpage

\begin{table}[ht]
\centering
\caption{Mid-water pollock biomass (near surface down to 3m from the bottom unless otherwise noted) by area as estimated from summer acoustic-trawl surveys on the U.S. EEZ portion of the Bering Sea shelf, 1994--2018 (Honkalehto et al. 2015). CVs for biomass estimates were assumed to average 25\% (inter-annual variability arises from the 1-dimensional variance estimation method). Note last column reflects biomass to 0.5m from bottom (as used in the model).} 
\label{tab:ats_biom} 
\begin{tabular}{ccrrrrrr}
\hline
	&	&	Area	&	\multicolumn{5}{c}{Biomass}	\\													
Year	&	Date	&	(nmi)$^2$	&	SCA	&	E170-SCA	&	W170	&	3m	total	&	0.5m	total	\\		
\hline																			
1994	&	9	Jul	-	19	Aug		&	78,251	&	0.312	&	0.399	&	2.176	&	2.886	&	3.64	\\
1996	&	20	Jul	-	30	Aug	&	93,810	&	0.215	&	0.269	&	1.826	&	2.311	&	2.955	\\
1997	&	17	Jul	-	4	Sept	&	102,770	&	0.246	&	0.527	&	1.818	&	2.592	&	3.591	\\
1999	&	7	Jun	-	5	Aug			&	103,670	&	0.299	&	0.579	&	2.408	&	3.285	&	4.202	\\
2000	&	7	Jun	-	2	Aug			&	106,140	&	0.393	&	0.498	&	2.158	&	3.049	&	3.614	\\
2002	&	4	Jun	-	30	Jul		&	99,526	&	0.647	&	0.797	&	2.178	&	3.622	&	4.33	\\
2004	&	4	Jun	-	29	Jul		&	99,659	&	0.498	&	0.516	&	2.293	&	3.307	&	4.016	\\
2006	&	3	Jun	-	25	Jul		&	89,550	&	0.131	&	0.254	&	1.175	&	1.560	&	1.887	\\
2007	&	2	Jun	-	30	Jul		&	92,944	&	0.084	&	0.168	&	1.517	&	1.769	&	2.288	\\
2008	&	2	Jun	-	31	Jul		&	95,374	&	0.085	&	0.029	&	0.883	&	0.997	&	1.407	\\
2009	&	9	Jun	-	7	Aug			&	91,414	&	0.070	&	0.018	&	0.835	&	0.924	&	1.323	\\
2010	&	5	Jun	-	7	Aug	    &	92,849	&	0.067	&	0.113	&	2.143	&	2.323	&	2.651	\\
2012	&	7	Jun	-	10	Aug		&	96,852	&	0.142	&	0.138	&	1.563	&	1.843	&	2.299	\\
2014	&	12	Jun	-	13	Aug	&	94,361	&	0.426	&	1.000	&	2.014	&	3.439	&	4.727	\\
2016	&	12	Jun	-	17	Aug	&	100,674	&	0.516	&	1.005	&	2.542	&	4.063	&	4.829	\\
2018	&	12	Jun	-	22	Aug	&	98,300	&	0.218	&	0.462	&	1.439	&	2.120	&	2.499	\\
\hline
\end{tabular}
\end{table}

\clearpage

\begin{table}[ht]
\centering
\caption{AT survey estimates of EBS pollock abundance-at-age (millions), 1979--2019. Age 2+ totals and age-1s were modeled as separate indices.} 
\label{tab:ats_age} 
\scalebox{0.9}{
\begin{tabular}{crrrrrrrrrrrr}
\hline
& \multicolumn{10}{c}{Age}                                                          & Age    &       \\
\hline
Year	&	1	&	2	&	3	&	4	&	5	&	6	&	7	&	8	&	9	&	10+	&	2+	&	Total	\\
\hline																									
1979    & 69,110 & 41,132 & 3,884 & 413   & 534   & 128   & 30    & 4   & 28  & 161 & 46,314 & 115,424 \\
1982    & 108    & 3,401  & 4,108 & 7,637 & 1,790 & 283   & 141   & 178 & 90  & 177 & 17,805 & 17,913  \\
1985    & 2,076  & 929    & 8,149 & 898   & 2,186 & 1,510 & 1,127 & 130 & 21  & 15  & 14,965 & 17,041  \\
1988    & 11     & 1,112  & 3,586 & 3,864 & 739   & 1,882 & 403   & 151 & 130 & 414 & 12,280 & 12,292  \\
1991    & 639    & 5,942  & 967   & 215   & 224   & 133   & 120   & 39  & 37  & 53  & 7,730  & 8,369   \\
1994	&	 983 	&	 4,094 	 & 	 1,216 	 & 	 1,833 	 & 	 2,262 	 & 	 386 	 & 	 107 	 & 	 97 	 & 	 54 	 & 	 175 	 & 	 10,224 	 & 	 11,207 	\\
1996	&	 1,800 	&	 567 	 & 	 552 	 & 	 2,741 	 & 	 915 	 & 	 634 	 & 	 585 	 & 	 142 	 & 	 39 	 & 	 129 	 & 	 6,303 	 & 	 8,103 	\\
1997	&	 13,251 	&	 2,879 	 & 	 440 	 & 	 536 	 & 	 2,327 	 & 	 546 	 & 	 313 	 & 	 291 	 & 	 75 	 & 	 152 	 & 	 7,557 	 & 	 20,808 	\\
1999	&	 607 	&	 1,780 	 & 	 3,717 	 & 	 1,810 	 & 	 652 	 & 	 398 	 & 	 1,548 	 & 	 526 	 & 	 180 	 & 	 228 	 & 	 10,839 	 & 	 11,446 	\\
2000	&	 460 	&	 1,322 	 & 	 1,230 	 & 	 2,588 	 & 	 1,012 	 & 	 327 	 & 	 308 	 & 	 950 	 & 	 278 	 & 	 241 	 & 	 8,256 	 & 	 8,716 	\\
2002	&	 723 	&	 4,281 	 & 	 3,931 	 & 	 1,435 	 & 	 839 	 & 	 772 	 & 	 389 	 & 	 149 	 & 	 184 	 & 	 637 	 & 	 12,617 	 & 	 13,340 	\\
2004	&	 83 	&	 313 	 & 	 1,216 	 & 	 3,118 	 & 	 1,637 	 & 	 568 	 & 	 291 	 & 	 281 	 & 	 121 	 & 	 255 	 & 	 7,800 	 & 	 7,883 	\\
2006	&	 525 	&	 217 	 & 	 291 	 & 	 654 	 & 	 783 	 & 	 659 	 & 	 390 	 & 	 145 	 & 	 75 	 & 	 149 	 & 	 3,364 	 & 	 3,888 	\\
2007	&	 5,775 	&	 1,041 	 & 	 345 	 & 	 478 	 & 	 794 	 & 	 729 	 & 	 407 	 & 	 241 	 & 	 98 	 & 	 114 	 & 	 4,246 	 & 	 10,021 	\\
2008	&	 71 	&	 2,915 	 & 	 1,047 	 & 	 166 	 & 	 161 	 & 	 288 	 & 	 235 	 & 	 136 	 & 	 102 	 & 	 98 	 & 	 5,147 	 & 	 5,218 	\\
2009	&	 5,197 	&	 816 	 & 	 1,733 	 & 	 277 	 & 	 68 	 & 	 84 	 & 	 117 	 & 	 93 	 & 	 65 	 & 	 84 	 & 	 3,337 	 & 	 8,533 	\\
2010	&	 2,568 	&	 6,404 	 & 	 984 	 & 	 2,295 	 & 	 446 	 & 	 73 	 & 	 33 	 & 	 37 	 & 	 38 	 & 	 81 	 & 	 10,390 	 & 	 12,958 	\\
2012	&	 177 	&	 1,989 	 & 	 1,693 	 & 	 2,710 	 & 	 280 	 & 	 367 	 & 	 113 	 & 	 36 	 & 	 25 	 & 	 93 	 & 	 7,305 	 & 	 7,482 	\\
2014	&	 4,751 	&	 8,655 	 & 	 969 	 & 	 1,161 	 & 	 1,119 	 & 	 1,770 	 & 	 740 	 & 	 170 	 & 	 79 	 & 	 80 	 & 	 14,743 	 & 	 19,494 	\\
2016	&	 353 	&	 1,185 	 & 	 4,546 	 & 	 4,439 	 & 	 1,194 	 & 	 487 	 & 	 557 	 & 	 650 	 & 	 130 	 & 	 114 	 & 	 13,302 	 & 	 13,655 	\\
2018 & 450    & 517   & 249   & 621   & 2,268 & 944   & 198   & 112 & 107 & 104 & 5,120  & 5,570  \\
\hline																									
Avg.	&	2,359	&	2,437	&	1,514	&	1,676	&	1,052	&	558	&	396	&	255	&	103	&	171	&	8,161	&	10,520	\\
Med.	&	665	&	1,551	&	1,131	&	1,622	&	877	&	516	&	311	&	147	&	88	&	121	&	7,679	&	9,369	\\
\hline																									
\end{tabular}
}
\end{table}

\clearpage

\begin{table}[ht]
\centering
\caption{An abundance index derived from acoustic data collected opportunistically aboard bottom-trawl survey vessels (AVO index; Honkalehto et al. 2014). Note values in parentheses are the coefficients of variation from using 1-D geostatistical estimates of sampling variability (Petitgas, 1993). See Honkalehto et al. (2011) for the derivation of these estimates. The column ``$CV_{AVO}$'' was assumed to have a mean value of 0.30 for model fitting purposes (scaling relative to the AT and BTS indices). }
\label{tab:avo}
\begin{tabular}{crrr}
\hline
Year    & AT scaled biomass index & AVO index &   $CV_{AVO}$  \\
\hline 
2006	&	1.560	(4\%)	&	0.555	9\%	&	26\%	\\
2007	&	1.769	(4\%)	&	0.638	14\%	&	44\%	\\
2008	&	0.997	(8\%)	&	0.316	20\%	&	33\%	\\
2009	&	0.924	(9\%)	&	0.285	42\%	&	62\%	\\
2010	&	2.323	(6\%)	&	0.679	13\%	&	44\%	\\
2011	&	$-no\,	survey-$&		0.543	11\%	&	29\%	\\
2012	&	1.843	(4\%)	&	0.661	9\%	&	32\%	\\
2013	&	$-no\,	survey-$&		0.694	6\%	&	20\%	\\
2014	&	3.439	(5\%)	&	0.897	5\%	&	22\%	\\
2015	&	$-no\,	survey-$&		0.953	5\%	&	23\%	\\
2016	&	4.063	(2\%)	&	0.776	5\%	&	19\%	\\
2017	&	$-no\,	survey-$&		0.730	5\%	&	18\%	\\
2018	&	2.499	(2\%)	&	0.672	5\%	&	17\%	\\
\hline
\end{tabular}
\end{table}


\clearpage

<!-- 
-->

\clearpage
<!-- sample size -->
\begin{table}[ht]
\centering
\caption{Pollock sample sizes assumed for the age-composition data likelihoods from the fishery, bottom-trawl survey, and AT surveys, 1964--2019. Note fishery sample size for 1964--1977 was fixed at 10.} 
\label{tab:input_n}
\begin{tabular}{rrrr}
  \hline
Year & Fishery & BTS & ATS \\ 
  \hline
1978 & 39 &  &  \\ 
  1979 & 39 &  &  \\ 
  1980 & 39 &  &  \\ 
  1981 & 39 &  &  \\ 
  1982 & 39 & 105 &  \\ 
  1983 & 39 & 126 &  \\ 
  1984 & 39 & 118 &  \\ 
  1985 & 39 & 125 &  \\ 
  1986 & 39 & 88 &  \\ 
  1987 & 39 & 105 &  \\ 
  1988 & 39 & 76 &  \\ 
  1989 & 39 & 80 &  \\ 
  1990 & 39 & 82 &  \\ 
  1991 & 401 & 71 &  \\ 
  1992 & 453 & 82 &  \\ 
  1993 & 569 & 90 &  \\ 
  1994 & 338 & 74 & 43 \\ 
  1995 & 572 & 75 &  \\ 
  1996 & 254 & 90 & 32 \\ 
  1997 & 582 & 78 & 49 \\ 
  1998 & 426 & 82 &  \\ 
  1999 & 519 & 90 & 67 \\ 
  2000 & 526 & 101 & 70 \\ 
  2001 & 390 & 107 &  \\ 
  2002 & 513 & 110 & 72 \\ 
  2003 & 453 & 107 &  \\ 
  2004 & 457 & 108 & 51 \\ 
  2005 & 482 & 109 &  \\ 
  2006 & 469 & 102 & 47 \\ 
  2007 & 529 & 97 & 39 \\ 
  2008 & 464 & 82 & 35 \\ 
  2009 & 362 & 87 & 26 \\ 
  2010 & 602 & 90 & 34 \\ 
  2011 & 561 & 113 &  \\ 
  2012 & 541 & 116 & 44 \\ 
  2013 & 625 & 120 &  \\ 
  2014 & 513 & 137 & 79 \\ 
  2015 & 668 & 151 &  \\ 
  2016 & 588 & 115 & 61 \\ 
  2017 & 587 & 105 &  \\ 
  2018 & 545 & 100 & 25 \\ 
  2019 &  & 100 &  \\ 
   \hline
\end{tabular}
\end{table}
\begin{table}[ht]
\centering
\caption{Mean weight-at-age (kg) estimates from the fishery (1991--2018; plus projections 2019--2021) showing the between-year variability (middle row) and sampling error (bottom panel) based on bootstrap resampling of observer data.} 
\label{tab:wtage}
\begin{tabular}{lrrrrrrrrrrrrrrr}
  \hline
Year & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 & 10 & 11 & 12 & 13 & 14 & 15 \\ 
  \hline
1964-1990 & 0.007 & 0.170 & 0.303 & 0.447 & 0.589 & 0.722 & 0.840 & 0.942 & 1.029 & 1.102 & 1.163 & 1.212 & 1.253 & 1.286 & 1.312 \\ 
  1991 & 0.007 & 0.150 & 0.292 & 0.476 & 0.604 & 0.728 & 0.839 & 0.873 & 1.014 & 1.127 & 1.129 & 1.251 & 1.240 & 1.308 & 1.249 \\ 
  1992 & 0.007 & 0.179 & 0.394 & 0.462 & 0.647 & 0.701 & 0.812 & 0.982 & 1.031 & 1.210 & 1.226 & 1.272 & 1.199 & 1.340 & 1.430 \\ 
  1993 & 0.007 & 0.331 & 0.497 & 0.610 & 0.650 & 0.754 & 0.904 & 1.040 & 1.211 & 1.232 & 1.391 & 1.538 & 1.610 & 1.646 & 1.584 \\ 
  1994 & 0.007 & 0.233 & 0.405 & 0.651 & 0.729 & 0.747 & 0.707 & 1.057 & 1.395 & 1.347 & 1.347 & 1.391 & 1.394 & 1.301 & 1.341 \\ 
  1995 & 0.007 & 0.153 & 0.377 & 0.498 & 0.735 & 0.840 & 0.856 & 0.986 & 1.220 & 1.315 & 1.388 & 1.477 & 1.390 & 1.773 & 1.341 \\ 
  1996 & 0.007 & 0.293 & 0.300 & 0.427 & 0.679 & 0.794 & 0.949 & 0.953 & 1.020 & 1.096 & 1.362 & 1.500 & 1.520 & 1.710 & 1.598 \\ 
  1997 & 0.007 & 0.187 & 0.298 & 0.471 & 0.559 & 0.747 & 0.893 & 1.072 & 1.091 & 1.243 & 1.346 & 1.443 & 1.668 & 1.423 & 1.383 \\ 
  1998 & 0.007 & 0.191 & 0.368 & 0.589 & 0.627 & 0.621 & 0.775 & 1.029 & 1.169 & 1.253 & 1.327 & 1.452 & 1.414 & 1.523 & 1.537 \\ 
  1999 & 0.007 & 0.188 & 0.405 & 0.507 & 0.643 & 0.701 & 0.728 & 0.891 & 1.037 & 1.250 & 1.248 & 1.431 & 1.413 & 1.584 & 1.236 \\ 
  2000 & 0.007 & 0.218 & 0.353 & 0.526 & 0.629 & 0.731 & 0.782 & 0.806 & 0.966 & 1.007 & 1.242 & 1.321 & 1.412 & 1.565 & 1.737 \\ 
  2001 & 0.006 & 0.227 & 0.327 & 0.503 & 0.669 & 0.788 & 0.958 & 0.987 & 1.063 & 1.115 & 1.314 & 1.435 & 1.563 & 1.433 & 1.702 \\ 
  2002 & 0.007 & 0.231 & 0.386 & 0.509 & 0.666 & 0.795 & 0.910 & 1.030 & 1.104 & 1.095 & 1.288 & 1.448 & 1.597 & 1.343 & 1.683 \\ 
  2003 & 0.006 & 0.276 & 0.489 & 0.547 & 0.649 & 0.767 & 0.862 & 0.953 & 1.081 & 1.200 & 1.200 & 1.206 & 1.361 & 1.377 & 1.699 \\ 
  2004 & 0.007 & 0.135 & 0.409 & 0.583 & 0.640 & 0.758 & 0.889 & 0.924 & 1.035 & 1.162 & 1.110 & 1.160 & 1.333 & 1.281 & 1.213 \\ 
  2005 & 0.007 & 0.283 & 0.346 & 0.508 & 0.642 & 0.741 & 0.882 & 0.954 & 1.062 & 1.096 & 1.225 & 1.276 & 1.251 & 1.174 & 1.373 \\ 
  2006 & 0.007 & 0.174 & 0.305 & 0.447 & 0.606 & 0.755 & 0.853 & 0.952 & 1.065 & 1.114 & 1.219 & 1.234 & 1.282 & 1.399 & 1.462 \\ 
  2007 & 0.007 & 0.155 & 0.346 & 0.506 & 0.641 & 0.781 & 0.962 & 1.098 & 1.182 & 1.275 & 1.304 & 1.477 & 1.500 & 1.738 & 1.520 \\ 
  2008 & 0.007 & 0.208 & 0.330 & 0.520 & 0.652 & 0.774 & 0.903 & 1.049 & 1.119 & 1.282 & 1.421 & 1.524 & 1.553 & 1.921 & 1.660 \\ 
  2009 & 0.007 & 0.136 & 0.340 & 0.526 & 0.704 & 0.879 & 1.002 & 1.125 & 1.399 & 1.490 & 1.563 & 1.614 & 1.814 & 1.996 & 2.230 \\ 
  2010 & 0.050 & 0.175 & 0.383 & 0.489 & 0.664 & 0.915 & 1.119 & 1.261 & 1.371 & 1.587 & 1.659 & 1.924 & 1.923 & 2.079 & 2.316 \\ 
  2011 & 0.031 & 0.205 & 0.290 & 0.509 & 0.665 & 0.808 & 0.976 & 1.225 & 1.346 & 1.518 & 1.585 & 1.621 & 2.176 & 1.754 & 2.287 \\ 
  2012 & 0.029 & 0.142 & 0.270 & 0.410 & 0.643 & 0.824 & 0.974 & 1.172 & 1.306 & 1.519 & 1.614 & 1.644 & 1.717 & 2.040 & 2.086 \\ 
  2013 & 0.095 & 0.144 & 0.289 & 0.442 & 0.564 & 0.782 & 1.131 & 1.284 & 1.426 & 1.692 & 1.834 & 1.806 & 1.960 & 2.187 & 2.207 \\ 
  2014 & 0.014 & 0.193 & 0.316 & 0.455 & 0.617 & 0.751 & 0.894 & 1.154 & 1.310 & 1.370 & 1.692 & 1.815 & 1.733 & 1.658 & 2.236 \\ 
  2015 & 0.025 & 0.181 & 0.404 & 0.461 & 0.570 & 0.690 & 0.786 & 0.888 & 1.146 & 1.203 & 1.355 & 1.914 & 1.450 & 1.617 & 2.627 \\ 
  2016 & 0.025 & 0.181 & 0.407 & 0.531 & 0.557 & 0.648 & 0.732 & 0.801 & 0.943 & 1.044 & 1.206 & 1.471 & 1.653 & 1.809 & 1.962 \\ 
  2017 & 0.025 & 0.191 & 0.404 & 0.498 & 0.651 & 0.694 & 0.750 & 0.827 & 0.893 & 0.911 & 1.018 & 1.085 & 1.614 & 1.798 & 1.954 \\ 
  2018 & 0.025 & 0.186 & 0.380 & 0.466 & 0.573 & 0.734 & 0.810 & 0.855 & 0.904 & 1.045 & 0.983 & 1.415 & 1.575 & 1.741 & 1.925 \\ 
  2019 & 0.025 & 0.186 & 0.392 & 0.523 & 0.620 & 0.734 & 0.883 & 0.922 & 0.979 & 1.073 & 1.160 & 1.317 & 1.490 & 1.627 & 1.804 \\ 
   \hline
\end{tabular}
\end{table}
xxxxx

\begin{table}[ht]
\centering
\caption{Mean weight-at-age (kg) estimates from the fishery (1991--2018; plus projections 2019--2021) showing the between-year variability (middle row) and sampling error (bottom panel) based on bootstrap resampling of observer data.}
\label{tab:wtage}
\scalebox{0.70}{
\begin{tabular}{crrrrrrrrrrrrrrr}
\hline
Year & 1     & 2     & 3     & 4     & 5     & 6     & 7     & 8     & 9     & 10    & 11    & 12    & 13    & 14    & 15    \\
\hline
1964--90 & 0.007 & 0.170 & 0.303 & 0.447 & 0.589 & 0.722 & 0.84 & 0.942 & 1.029 & 1.102 & 1.163 & 1.212 & 1.253 & 1.286 & 1.312 \\
1991 & 0.007 & 0.150 & 0.286 & 0.476 & 0.604 & 0.728 & 0.839 & 0.873 & 1.014 & 1.127 & 1.129 & 1.251 & 1.240 & 1.308 & 1.249 \\
1992 & 0.007 & 0.179 & 0.394 & 0.462 & 0.647 & 0.701 & 0.812 & 0.982 & 1.031 & 1.210 & 1.226 & 1.272 & 1.199 & 1.340 & 1.430 \\
1993 & 0.007 & 0.331 & 0.497 & 0.610 & 0.650 & 0.754 & 0.904 & 1.039 & 1.211 & 1.232 & 1.391 & 1.538 & 1.610 & 1.646 & 1.584 \\
1994 & 0.007 & 0.233 & 0.405 & 0.651 & 0.728 & 0.747 & 0.707 & 1.057 & 1.395 & 1.347 & 1.347 & 1.391 & 1.394 & 1.301 & 1.341 \\
1995 & 0.007 & 0.153 & 0.377 & 0.498 & 0.735 & 0.840 & 0.856 & 0.986 & 1.220 & 1.315 & 1.388 & 1.477 & 1.390 & 1.297 & 1.341 \\
1996 & 0.007 & 0.293 & 0.323 & 0.427 & 0.679 & 0.794 & 0.949 & 0.953 & 1.020 & 1.096 & 1.362 & 1.500 & 1.520 & 1.710 & 1.598 \\
1997 & 0.007 & 0.187 & 0.315 & 0.471 & 0.559 & 0.747 & 0.893 & 1.072 & 1.091 & 1.243 & 1.346 & 1.443 & 1.668 & 1.423 & 1.383 \\
1998 & 0.007 & 0.191 & 0.368 & 0.589 & 0.627 & 0.621 & 0.775 & 1.029 & 1.169 & 1.253 & 1.327 & 1.452 & 1.414 & 1.523 & 1.537 \\
1999 & 0.007 & 0.188 & 0.405 & 0.507 & 0.643 & 0.701 & 0.728 & 0.891 & 1.037 & 1.250 & 1.248 & 1.431 & 0.990 & 0.516 & 1.236 \\
2000 & 0.007 & 0.218 & 0.353 & 0.526 & 0.629 & 0.731 & 0.782 & 0.806 & 0.966 & 1.007 & 1.242 & 1.321 & 1.101 & 1.165 & 1.466 \\
2001 & 0.007 & 0.227 & 0.327 & 0.503 & 0.669 & 0.788 & 0.958 & 0.987 & 1.063 & 1.115 & 1.314 & 1.435 & 1.563 & 1.433 & 1.467 \\
2002 & 0.007 & 0.231 & 0.386 & 0.509 & 0.666 & 0.795 & 0.910 & 1.029 & 1.104 & 1.095 & 1.288 & 1.448 & 1.597 & 1.343 & 1.683 \\
2003 & 0.007 & 0.276 & 0.489 & 0.547 & 0.649 & 0.767 & 0.862 & 0.953 & 1.081 & 1.200 & 1.200 & 1.206 & 1.362 & 1.377 & 1.699 \\
2004 & 0.007 & 0.135 & 0.409 & 0.583 & 0.640 & 0.758 & 0.889 & 0.924 & 1.035 & 1.162 & 1.110 & 1.160 & 1.333 & 1.281 & 1.213 \\
2005 & 0.007 & 0.283 & 0.346 & 0.508 & 0.642 & 0.741 & 0.882 & 0.954 & 1.062 & 1.096 & 1.225 & 1.276 & 1.251 & 1.174 & 1.373 \\
2006 & 0.007 & 0.174 & 0.305 & 0.447 & 0.606 & 0.755 & 0.853 & 0.952 & 1.065 & 1.114 & 1.219 & 1.234 & 1.282 & 1.399 & 1.462 \\
2007 & 0.007 & 0.155 & 0.346 & 0.506 & 0.641 & 0.781 & 0.962 & 1.098 & 1.182 & 1.275 & 1.304 & 1.477 & 1.500 & 1.738 & 1.520 \\
2008 & 0.007 & 0.208 & 0.330 & 0.520 & 0.652 & 0.774 & 0.903 & 1.049 & 1.119 & 1.282 & 1.421 & 1.524 & 1.553 & 1.921 & 1.660 \\
2009 & 0.007 & 0.136 & 0.340 & 0.526 & 0.704 & 0.879 & 1.002 & 1.125 & 1.399 & 1.490 & 1.563 & 1.614 & 1.814 & 1.996 & 2.230 \\
2010 & 0.050 & 0.175 & 0.383 & 0.489 & 0.664 & 0.915 & 1.119 & 1.261 & 1.371 & 1.587 & 1.659 & 1.924 & 1.923 & 2.079 & 2.316 \\
2011 & 0.031 & 0.205 & 0.290 & 0.509 & 0.665 & 0.808 & 0.976 & 1.225 & 1.346 & 1.518 & 1.585 & 1.621 & 2.176 & 1.754 & 2.287 \\
2012 & 0.029 & 0.142 & 0.270 & 0.410 & 0.643 & 0.824 & 0.974 & 1.172 & 1.306 & 1.519 & 1.614 & 1.644 & 1.717 & 2.040 & 2.086 \\
2013 & 0.095 & 0.144 & 0.289 & 0.442 & 0.564 & 0.782 & 1.131 & 1.284 & 1.426 & 1.692 & 1.834 & 1.806 & 1.960 & 2.187 & 2.207 \\
2014 & 0.014 & 0.193 & 0.316 & 0.455 & 0.617 & 0.751 & 0.894 & 1.154 & 1.310 & 1.370 & 1.692 & 1.815 & 1.733 & 1.658 & 2.236 \\
2015 & 0.025 & 0.181 & 0.404 & 0.461 & 0.570 & 0.690 & 0.786 & 0.888 & 1.146 & 1.203 & 1.355 & 1.914 & 1.450 & 1.617 & 2.627 \\
2016 & 0.025 & 0.181 & 0.407 & 0.531 & 0.557 & 0.648 & 0.732 & 0.801 & 0.943 & 1.044 & 1.206 & 0.672 & 1.075 & 1.822 & 1.567 \\
2017 & 0.025 & 0.191 & 0.404 & 0.498 & 0.651 & 0.694 & 0.750 & 0.827 & 0.893 & 0.911 & 1.018 & 1.085 & 0.377 & 0.678 & 0.751 \\
2018 & 0.025 & 0.186 & 0.380 & 0.466 & 0.573 & 0.734 & 0.810 & 0.855 & 0.904 & 1.045 & 0.983 & 1.200 & 0.517 & 0.375 & 1.235 \\
2019 & 0.025 & 0.186 & 0.282 & 0.371 & 0.457 & 0.545 & 0.655 & 0.774 & 0.908 & 1.041 & 1.210 & 1.351 & 1.540 & 1.700 & 1.867 \\
\hline   
Avg &   0.016   &   0.199   &   0.360   &   0.506   &   0.640   &   0.762   &   0.888   &   1.021   &   1.158   &   1.263   &   1.370   &   1.453   &   1.493   &   1.542   &   1.687   \\
CV  &   NA  &   25\%    &   16\%    &   11\%    &   7\% &   8\% &   12\%    &   13\%    &   13\%    &   14\%    &   13\%    &   18\%    &   19\%    &   23\%    &   24\%    \\
\hline   
\multicolumn{14}{c}{Sampling CV (from bootstrap), ages 1 and 2 were excluded}                                                                \\
\hline
1991&&& 7.6\% & 5.0\% & 1.8\% & 1.8\% & 1.6\% & 2.9\% & 1.6\% & 4.2\% & 2.6\% & 4.9\% & 2.4\% & 6.0\% & 3.4\%   \\
1992&&& 3.3\% & 3.8\% & 4.6\% & 5.0\% & 2.4\% & 2.0\% & 2.8\% & 2.3\% & 3.3\% & 3.4\% & 8.3\% & 4.7\% & 4.9\%   \\
1993&&& 1.5\% & 0.6\% & 2.4\% & 4.6\% & 5.4\% & 3.6\% & 2.0\% & 3.0\% & 3.3\% & 4.6\% & 5.2\% & 8.3\% & 5.1\%   \\
1994&&& 7.6\% & 1.8\% & 0.9\% & 2.3\% & 6.2\% & 10.7\% &    5.1\% & 4.5\% & 4.7\% & 4.1\% & 5.6\% & 10.3\% &    6.8\%   \\
1995&&& 4.7\% & 3.5\% & 1.8\% & 1.0\% & 2.2\% & 3.5\% & 6.7\% & 6.6\% & 3.9\% & 8.8\% & 4.7\% & 32.4\% &    9.6\%   \\
1996&&& 7.9\% & 7.6\% & 3.3\% & 1.8\% & 1.0\% & 1.8\% & 3.4\% & 4.9\% & 10.6\% &    7.8\% & 6.6\% & 4.2\% & 13.9\%  \\
1997&&& 8.2\% & 2.4\% & 1.4\% & 1.7\% & 1.5\% & 1.8\% & 3.1\% & 5.5\% & 10.1\% &    7.5\% & 14.3\% &    7.5\% & 6.1\%   \\
1998&&& 6.3\% & 5.7\% & 3.3\% & 1.2\% & 2.6\% & 2.8\% & 2.0\% & 4.7\% & 7.7\% & 9.9\% & 12.5\% &    12.6\% &    10.9\%  \\
1999&&& 1.1\% & 1.3\% & 2.0\% & 1.8\% & 0.8\% & 2.3\% & 3.2\% & 3.6\% & 12.8\% &    12.4\% &    45.9\% &    110.0\% &   23.7\%  \\
2000&&& 3.7\% & 1.0\% & 1.0\% & 2.1\% & 1.5\% & 1.0\% & 2.7\% & 5.6\% & 4.1\% & 9.7\% & 47.0\% &    67.1\% &    35.8\%  \\
2001&&& 4.3\% & 2.9\% & 1.2\% & 1.5\% & 2.8\% & 2.4\% & 1.8\% & 4.4\% & 4.9\% & 6.2\% & 8.9\% & 9.8\% & 31.8\%  \\
2002&&& 3.5\% & 1.7\% & 1.7\% & 1.0\% & 1.4\% & 2.5\% & 2.9\% & 2.5\% & 4.5\% & 4.5\% & 6.4\% & 25.2\% &    15.9\%  \\
2003&&& 1.0\% & 1.9\% & 1.4\% & 1.4\% & 1.3\% & 2.0\% & 3.4\% & 4.7\% & 4.4\% & 5.4\% & 10.0\% &    20.4\% &    13.2\%  \\
2004&&& 4.1\% & 0.9\% & 1.3\% & 2.0\% & 1.7\% & 1.8\% & 2.9\% & 6.6\% & 5.4\% & 4.6\% & 10.4\% &    12.8\% &    7.4\%   \\
2005&&& 4.8\% & 1.1\% & 0.8\% & 1.1\% & 2.0\% & 3.0\% & 2.7\% & 4.9\% & 7.2\% & 5.5\% & 21.6\% &    22.6\% &    24.3\%  \\
2006&&& 4.4\% & 1.6\% & 0.9\% & 1.0\% & 1.5\% & 2.6\% & 3.2\% & 3.2\% & 8.1\% & 10.6\% &    8.7\% & 10.8\% &    8.4\%   \\
2007&&& 2.7\% & 2.0\% & 1.0\% & 0.9\% & 1.3\% & 1.9\% & 3.3\% & 4.4\% & 4.3\% & 7.7\% & 10.4\% &    6.7\% & 5.7\%   \\
2008&&& 3.2\% & 2.2\% & 1.5\% & 0.9\% & 1.3\% & 1.8\% & 2.3\% & 5.4\% & 6.2\% & 5.7\% & 5.2\% & 12.0\% &    6.3\%   \\
2009&&& 1.6\% & 1.7\% & 3.7\% & 2.0\% & 1.8\% & 2.3\% & 2.7\% & 3.7\% & 7.3\% & 6.4\% & 5.0\% & 15.2\% &    4.0\%   \\
2010&&& 6.8\% & 0.7\% & 1.4\% & 3.5\% & 2.7\% & 2.9\% & 2.5\% & 3.0\% & 4.5\% & 4.5\% & 6.4\% & 6.1\% & 5.3\%   \\
2011&&& 1.8\% & 2.5\% & 0.7\% & 1.3\% & 3.1\% & 3.3\% & 3.7\% & 3.4\% & 3.9\% & 5.5\% & 14.5\% &    8.3\% & 9.2\%   \\
2012&&& 3.0\% & 0.6\% & 2.4\% & 1.0\% & 2.2\% & 4.5\% & 6.3\% & 7.1\% & 5.5\% & 6.1\% & 8.2\% & 11.0\% &    22.5\%  \\
2013&&& 3.0\% & 1.2\% & 0.7\% & 2.4\% & 2.2\% & 2.9\% & 5.2\% & 5.5\% & 5.7\% & 5.9\% & 6.9\% & 10.5\% &    6.5\%   \\
2014&&& 5.5\% & 1.7\% & 1.1\% & 0.7\% & 1.7\% & 2.4\% & 4.3\% & 9.7\% & 9.6\% & 10.1\% &    8.8\% & 16.5\% &    6.9\%   \\
2015&&& 0.6\% & 1.8\% & 1.4\% & 0.9\% & 0.8\% & 2.4\% & 3.6\% & 6.2\% & 13.5\% &    11.6\% &    12.8\% &    14.6\% &    17.7\%  \\
2016&&& 2.9\% & 0.3\% & 1.7\% & 1.5\% & 1.8\% & 1.4\% & 4.9\% & 7.0\% & 10.4\% &    108.5\% &   65.8\% &    39.0\% &    70.8\%  \\
2017&&& 7.4\% & 0.9\% & 0.6\% & 1.3\% & 1.5\% & 1.6\% & 1.8\% & 5.1\% & 8.0\% & 13.6\% &    110.0\% &   113.2\% &   111.1\% \\
2018&&& 6.5\% & 2.6\% & 0.5\% & 0.9\% & 1.8\% & 2.3\% & 2.5\% & 4.1\% & 15.0\% &    50.4\% &    105.9\% &   110.2\% &   65.4\%  \\
\hline
\end{tabular}
}
\end{table}

\clearpage
\begin{table}[ht]
\centering
\caption{Goodness of fit to primary data used for assessment model parameter estimation profiling over different constraints on the extent bottom-trawl survey selectivity/availability is allowed to change;  EBS pollock.} 
\label{tab:mod_prof_fits}
\begin{tabular}{lrrrrr}
  \hline
Component & CV70\% & CV50\% & CV20\% & CV10\% & CV05\% \\ 
  \hline
RMSE BTS & 0.19 & 0.20 & 0.25 & 0.29 & 0.31 \\ 
  RMSE ATS & 0.22 & 0.22 & 0.22 & 0.23 & 0.25 \\ 
  RMSE AVO & 0.20 & 0.20 & 0.20 & 0.20 & 0.20 \\ 
  RMSE CPUE & 0.09 & 0.09 & 0.09 & 0.09 & 0.09 \\ 
  SDNR BTS & 1.02 & 1.19 & 1.79 & 2.23 & 2.47 \\ 
  SDNR ATS & 1.10 & 1.10 & 1.11 & 1.14 & 1.22 \\ 
  SDNR AVO & 0.76 & 0.75 & 0.74 & 0.72 & 0.71 \\ 
  Eff. N Fishery & 1365.51 & 1372.40 & 1392.26 & 1372.23 & 1278.89 \\ 
  Eff. N BTS & 208.52 & 203.80 & 178.75 & 159.65 & 141.48 \\ 
  Eff. N ATS & 215.18 & 215.53 & 214.51 & 209.21 & 200.07 \\ 
  BTS NLL & 20.81 & 28.35 & 64.62 & 99.66 & 122.72 \\ 
  ATS NLL & 8.84 & 8.85 & 8.97 & 9.33 & 10.33 \\ 
  AVO NLL & 9.55 & 9.54 & 9.53 & 9.60 & 9.71 \\ 
  Fish Age NLL & 137.34 & 138.83 & 143.86 & 149.91 & 159.59 \\ 
  BTS Age NLL & 146.41 & 149.94 & 168.84 & 190.99 & 239.72 \\ 
  ATS Age NLL & 26.81 & 26.89 & 27.61 & 28.90 & 30.68 \\ 
   \hline
\end{tabular}
\end{table}
\begin{table}[ht]
\centering
\caption{Goodness of fit to primary data used for assessment model parameter estimation for different model configurations, EBS pollock.} 
\label{tab:mod_fits}
\begin{tabular}{lrrrrr}
  \hline
Component & lastyr & Model 16.1 & VAST & VAST+cold-pool & VAST ATS \\ 
  \hline
RMSE BTS & 0.240 & 0.210 & 0.160 & 0.170 & 0.170 \\ 
  RMSE ATS & 0.220 & 0.220 & 0.220 & 0.220 & 0.380 \\ 
  RMSE AVO & 0.210 & 0.200 & 0.200 & 0.200 & 0.220 \\ 
  RMSE CPUE & 0.090 & 0.080 & 0.090 & 0.090 & 0.090 \\ 
  SDNR BTS & 1.230 & 1.230 & 1.870 & 2.130 & 2.120 \\ 
  SDNR ATS & 1.110 & 1.110 & 1.130 & 1.140 & 2.940 \\ 
  SDNR AVO & 0.580 & 0.740 & 0.730 & 0.730 & 0.850 \\ 
  Eff. N Fishery & 1438.800 & 1255.210 & 1381.970 & 1377.120 & 1374.020 \\ 
  Eff. N BTS & 168.540 & 202.150 & 202.170 & 203.170 & 204.090 \\ 
  Eff. N ATS & 213.530 & 218.190 & 212.750 & 212.590 & 220.100 \\ 
  BTS NLL & 29.110 & 30.040 & 25.440 & 26.180 & 25.630 \\ 
  ATS NLL & 8.940 & 8.910 & 9.010 & 9.140 & 26.940 \\ 
  AVO NLL & 9.880 & 9.580 & 9.620 & 9.620 & 9.590 \\ 
  Fish Age NLL & 115.290 & 144.170 & 139.130 & 139.540 & 139.000 \\ 
  BTS Age NLL & 165.380 & 150.520 & 144.440 & 145.530 & 145.900 \\ 
  ATS Age NLL & 28.220 & 26.600 & 27.030 & 27.110 & 25.960 \\ 
   \hline
\end{tabular}
\end{table}




\begin{table}[ht]
\centering
\caption{Summary of different model results and the stock condition for EBS pollock. Biomass units are thousands of t.} 
\label{tab:mgt_quants}
\begin{tabular}{lrrrr}
  \hline
Component & Model 16.1 & VAST & VAST+cold-pool & VAST ATS \\ 
  \hline
${B}_{2020}$ & 2,800 & 3,000 & 3,000 & 2,700 \\ 
  $CV_{B_{2020}}$ & 0.12 & 0.12 & 0.11 & 0.13 \\ 
  $B_{MSY}$ & 2,156 & 2,156 & 2,161 & 1,887 \\ 
  $CV_{B_{MSY}}$ & 0.24 & 0.24 & 0.24 & 0.21 \\ 
  ${B}_{2020}/B_{MSY}$ & 131\% & 138\% & 141\% & 146\% \\ 
  $B_0$ & 5,733 & 5,762 & 5,780 & 5,189 \\ 
  $B_{35\%}$ & 2,151 & 2,183 & 2,192 & 1,895 \\ 
  SPR rate at $F_{MSY}$ & 28\% & 27\% & 27\% & 28\% \\ 
  Steepness & 0.66 & 0.66 & 0.66 & 0.65 \\ 
  Est. $B_{2018} / B_{2018,no fishing}$ & 0.6 & 0.64 & 0.64 & 0.67 \\ 
  $B_{2018} / B_{MSY}$ & 155\% & 159\% & 162\% & 170\% \\ 
   \hline
\end{tabular}
\end{table}


\begin{table}[ht]
\centering
\caption{Estimated billions of EBS pollock at age (columns 2--11) from the 2018 assessment model.} 
\label{tab:est_n}
\scalebox{0.8}{
\begin{tabular}{rrrrrrrrrrr}
  \hline
Year & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 & 10+ \\ 
  \hline
1964 & 6.47 & 3.55 & 2.24 & 0.48 & 0.21 & 0.41 & 0.18 & 0.06 & 0.04 & 0.22 \\ 
  1965 & 21.43 & 2.62 & 2.23 & 1.59 & 0.30 & 0.13 & 0.26 & 0.12 & 0.04 & 0.17 \\ 
  1966 & 15.27 & 8.70 & 1.65 & 1.57 & 0.99 & 0.19 & 0.08 & 0.16 & 0.07 & 0.13 \\ 
  1967 & 25.85 & 6.19 & 5.46 & 1.16 & 1.00 & 0.63 & 0.12 & 0.05 & 0.11 & 0.14 \\ 
  1968 & 22.30 & 10.47 & 3.84 & 3.57 & 0.68 & 0.58 & 0.37 & 0.07 & 0.03 & 0.14 \\ 
  1969 & 26.33 & 9.03 & 6.47 & 2.51 & 2.09 & 0.40 & 0.34 & 0.22 & 0.04 & 0.10 \\ 
  1970 & 23.66 & 10.65 & 5.55 & 4.10 & 1.48 & 1.24 & 0.24 & 0.21 & 0.13 & 0.09 \\ 
  1971 & 14.53 & 9.53 & 6.40 & 3.32 & 2.35 & 0.83 & 0.69 & 0.13 & 0.11 & 0.11 \\ 
  1972 & 11.90 & 5.83 & 5.59 & 3.60 & 1.75 & 1.18 & 0.42 & 0.35 & 0.06 & 0.10 \\ 
  1973 & 27.41 & 4.78 & 3.32 & 2.93 & 1.76 & 0.84 & 0.57 & 0.20 & 0.16 & 0.07 \\ 
  1974 & 20.44 & 11.03 & 2.64 & 1.62 & 1.32 & 0.78 & 0.37 & 0.25 & 0.08 & 0.09 \\ 
  1975 & 17.86 & 8.24 & 5.89 & 1.15 & 0.70 & 0.57 & 0.34 & 0.16 & 0.10 & 0.07 \\ 
  1976 & 14.18 & 7.22 & 4.66 & 2.70 & 0.53 & 0.33 & 0.27 & 0.16 & 0.07 & 0.07 \\ 
  1977 & 15.27 & 5.74 & 4.19 & 2.36 & 1.30 & 0.26 & 0.16 & 0.13 & 0.08 & 0.07 \\ 
  1978 & 26.98 & 6.19 & 3.37 & 2.33 & 1.23 & 0.66 & 0.13 & 0.08 & 0.07 & 0.07 \\ 
  1979 & 63.53 & 10.94 & 3.67 & 1.89 & 1.22 & 0.62 & 0.34 & 0.07 & 0.04 & 0.07 \\ 
  1980 & 26.33 & 25.78 & 6.64 & 2.17 & 1.03 & 0.61 & 0.31 & 0.17 & 0.03 & 0.05 \\ 
  1981 & 32.57 & 10.69 & 16.01 & 4.23 & 1.22 & 0.53 & 0.31 & 0.16 & 0.09 & 0.04 \\ 
  1982 & 17.43 & 13.23 & 6.72 & 10.96 & 2.58 & 0.69 & 0.30 & 0.17 & 0.09 & 0.07 \\ 
  1983 & 50.11 & 7.08 & 8.37 & 4.79 & 7.19 & 1.58 & 0.42 & 0.18 & 0.11 & 0.10 \\ 
  1984 & 13.42 & 20.37 & 4.48 & 6.02 & 3.25 & 4.60 & 0.99 & 0.26 & 0.12 & 0.13 \\ 
  1985 & 32.32 & 5.46 & 12.91 & 3.23 & 4.13 & 2.06 & 2.88 & 0.62 & 0.17 & 0.15 \\ 
  1986 & 12.06 & 13.14 & 3.46 & 9.26 & 2.22 & 2.71 & 1.27 & 1.79 & 0.38 & 0.20 \\ 
  1987 & 6.75 & 4.90 & 8.33 & 2.48 & 6.35 & 1.47 & 1.71 & 0.79 & 1.12 & 0.36 \\ 
  1988 & 5.66 & 2.75 & 3.12 & 6.02 & 1.75 & 4.33 & 0.97 & 1.12 & 0.51 & 0.96 \\ 
  1989 & 11.83 & 2.30 & 1.74 & 2.18 & 4.13 & 1.13 & 2.74 & 0.59 & 0.70 & 0.92 \\ 
  1990 & 50.45 & 4.81 & 1.46 & 1.24 & 1.47 & 2.66 & 0.71 & 1.63 & 0.36 & 1.00 \\ 
  1991 & 26.32 & 20.51 & 3.05 & 1.04 & 0.81 & 0.85 & 1.52 & 0.39 & 0.88 & 0.77 \\ 
  1992 & 22.22 & 10.70 & 13.00 & 2.21 & 0.71 & 0.49 & 0.49 & 0.78 & 0.21 & 0.83 \\ 
  1993 & 45.83 & 9.03 & 6.77 & 9.05 & 1.49 & 0.44 & 0.26 & 0.23 & 0.35 & 0.43 \\ 
  1994 & 15.30 & 18.63 & 5.74 & 4.81 & 5.75 & 0.98 & 0.26 & 0.14 & 0.12 & 0.41 \\ 
  1995 & 10.50 & 6.22 & 11.86 & 4.20 & 3.28 & 3.37 & 0.59 & 0.15 & 0.08 & 0.31 \\ 
  1996 & 22.77 & 4.27 & 3.96 & 8.71 & 2.99 & 2.08 & 1.83 & 0.34 & 0.09 & 0.23 \\ 
  1997 & 30.87 & 9.26 & 2.71 & 2.89 & 6.33 & 2.04 & 1.21 & 0.91 & 0.16 & 0.17 \\ 
  1998 & 15.16 & 12.55 & 5.86 & 1.97 & 2.06 & 4.29 & 1.27 & 0.67 & 0.49 & 0.17 \\ 
  1999 & 16.37 & 6.16 & 7.97 & 4.25 & 1.40 & 1.39 & 2.59 & 0.76 & 0.38 & 0.36 \\ 
  2000 & 25.50 & 6.66 & 3.92 & 5.68 & 2.96 & 0.95 & 0.90 & 1.54 & 0.46 & 0.45 \\ 
  2001 & 34.87 & 10.37 & 4.24 & 2.84 & 3.84 & 1.90 & 0.60 & 0.52 & 0.85 & 0.54 \\ 
  2002 & 23.31 & 14.18 & 6.60 & 3.08 & 1.96 & 2.33 & 1.05 & 0.33 & 0.29 & 0.80 \\ 
  2003 & 14.27 & 9.48 & 9.01 & 4.78 & 2.10 & 1.20 & 1.19 & 0.54 & 0.17 & 0.61 \\ 
  2004 & 6.51 & 5.80 & 6.03 & 6.36 & 3.24 & 1.24 & 0.62 & 0.59 & 0.27 & 0.43 \\ 
  2005 & 4.62 & 2.65 & 3.69 & 4.37 & 4.00 & 1.97 & 0.70 & 0.32 & 0.31 & 0.39 \\ 
  2006 & 11.59 & 1.88 & 1.69 & 2.68 & 2.89 & 2.21 & 1.06 & 0.39 & 0.18 & 0.41 \\ 
  2007 & 24.93 & 4.71 & 1.20 & 1.19 & 1.74 & 1.62 & 1.10 & 0.54 & 0.20 & 0.32 \\ 
  2008 & 13.48 & 10.14 & 3.00 & 0.84 & 0.77 & 0.97 & 0.79 & 0.55 & 0.28 & 0.28 \\ 
  2009 & 49.86 & 5.48 & 6.45 & 2.16 & 0.55 & 0.44 & 0.46 & 0.38 & 0.27 & 0.29 \\ 
  2010 & 21.28 & 20.27 & 3.49 & 4.63 & 1.42 & 0.33 & 0.22 & 0.23 & 0.20 & 0.29 \\ 
  2011 & 13.21 & 8.65 & 12.90 & 2.55 & 2.95 & 0.86 & 0.19 & 0.13 & 0.13 & 0.26 \\ 
  2012 & 11.57 & 5.37 & 5.51 & 9.39 & 1.76 & 1.46 & 0.41 & 0.09 & 0.06 & 0.19 \\ 
  2013 & 53.61 & 4.71 & 3.42 & 3.98 & 6.15 & 1.14 & 0.69 & 0.19 & 0.04 & 0.12 \\ 
  2014 & 50.76 & 21.79 & 3.00 & 2.47 & 2.65 & 3.71 & 0.68 & 0.36 & 0.09 & 0.08 \\ 
  2015 & 13.17 & 20.64 & 13.87 & 2.18 & 1.68 & 1.62 & 2.08 & 0.35 & 0.18 & 0.09 \\ 
  2016 & 8.42 & 5.35 & 13.14 & 9.76 & 1.43 & 1.04 & 0.87 & 1.08 & 0.18 & 0.14 \\ 
  2017 & 14.81 & 3.42 & 3.41 & 9.63 & 6.05 & 0.91 & 0.62 & 0.50 & 0.59 & 0.17 \\ 
  2018 & 17.49 & 6.02 & 2.18 & 2.50 & 6.64 & 3.68 & 0.51 & 0.34 & 0.27 & 0.43 \\ 
  2019 & 18.52 & 7.11 & 3.84 & 1.61 & 1.76 & 3.93 & 2.26 & 0.29 & 0.19 & 0.42 \\ 
   \hline
\end{tabular}
}
\end{table}

\clearpage

\begin{table}[ht]
\centering
\caption{Estimated millions of EBS pollock caught at age (columns 2--11) from the 2018 assessment model.} 
\label{tab:est_catage}
\scalebox{0.8}{
\begin{tabular}{rrrrrrrrrrr}
  \hline
Year & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 & 10+ \\ 
  \hline
1964 & 8.85 & 38.09 & 85.60 & 62.28 & 27.20 & 52.56 & 22.94 & 7.07 & 4.31 & 25.16 \\ 
  1965 & 28.90 & 29.05 & 98.87 & 213.63 & 39.65 & 16.38 & 30.67 & 13.46 & 4.23 & 18.50 \\ 
  1966 & 20.65 & 101.20 & 78.72 & 192.86 & 119.35 & 21.96 & 9.23 & 17.55 & 7.83 & 13.76 \\ 
  1967 & 64.87 & 139.09 & 555.67 & 211.40 & 183.20 & 114.09 & 21.86 & 9.43 & 18.37 & 23.37 \\ 
  1968 & 64.04 & 262.66 & 395.26 & 657.11 & 121.19 & 101.75 & 64.42 & 12.48 & 5.46 & 24.65 \\ 
  1969 & 91.02 & 255.28 & 809.14 & 442.71 & 361.04 & 67.56 & 58.60 & 39.06 & 7.73 & 19.06 \\ 
  1970 & 140.67 & 487.52 & 934.39 & 804.35 & 316.10 & 264.04 & 52.79 & 49.89 & 32.96 & 22.99 \\ 
  1971 & 121.26 & 615.17 & 1341.78 & 833.39 & 666.61 & 231.44 & 196.24 & 41.76 & 37.10 & 40.90 \\ 
  1972 & 89.03 & 508.00 & 1428.91 & 1068.29 & 537.51 & 361.05 & 128.72 & 119.31 & 22.49 & 38.33 \\ 
  1973 & 181.95 & 519.13 & 992.97 & 998.13 & 618.21 & 295.65 & 198.70 & 75.96 & 62.74 & 27.96 \\ 
  1974 & 118.18 & 1454.82 & 954.97 & 592.28 & 489.17 & 288.25 & 137.05 & 98.57 & 34.90 & 37.42 \\ 
  1975 & 68.49 & 744.86 & 1967.25 & 373.40 & 222.24 & 179.38 & 105.91 & 52.61 & 36.53 & 24.09 \\ 
  1976 & 38.99 & 529.51 & 1290.63 & 828.98 & 159.44 & 95.90 & 77.87 & 46.86 & 23.69 & 24.22 \\ 
  1977 & 29.75 & 366.98 & 902.41 & 609.94 & 347.99 & 69.00 & 42.29 & 34.69 & 22.28 & 20.29 \\ 
  1978 & 42.82 & 355.83 & 710.09 & 597.77 & 345.06 & 183.92 & 37.21 & 23.07 & 20.68 & 22.57 \\ 
  1979 & 79.76 & 428.92 & 641.54 & 441.23 & 347.65 & 178.96 & 95.98 & 19.43 & 13.08 & 21.32 \\ 
  1980 & 22.47 & 537.19 & 804.73 & 459.69 & 269.20 & 167.04 & 82.84 & 44.95 & 9.62 & 15.08 \\ 
  1981 & 15.87 & 119.36 & 1054.57 & 654.14 & 251.51 & 110.42 & 63.98 & 32.57 & 18.75 & 9.53 \\ 
  1982 & 4.71 & 84.73 & 218.67 & 1092.04 & 380.54 & 101.36 & 44.00 & 26.14 & 13.85 & 11.44 \\ 
  1983 & 9.66 & 41.47 & 204.68 & 353.82 & 844.93 & 212.71 & 55.78 & 24.40 & 14.89 & 13.99 \\ 
  1984 & 2.13 & 96.87 & 111.10 & 390.49 & 407.18 & 614.73 & 134.19 & 35.45 & 15.91 & 18.21 \\ 
  1985 & 4.27 & 26.31 & 354.36 & 194.31 & 408.17 & 303.20 & 410.52 & 87.16 & 23.07 & 21.78 \\ 
  1986 & 1.23 & 56.12 & 93.59 & 597.01 & 206.63 & 352.01 & 177.97 & 232.70 & 51.65 & 26.37 \\ 
  1987 & 0.42 & 14.09 & 184.31 & 108.19 & 436.86 & 141.04 & 163.17 & 88.00 & 123.15 & 38.06 \\ 
  1988 & 0.40 & 9.82 & 150.63 & 379.98 & 187.21 & 545.97 & 147.31 & 160.11 & 72.30 & 129.60 \\ 
  1989 & 0.71 & 7.65 & 56.08 & 163.62 & 465.90 & 153.45 & 473.68 & 94.77 & 100.89 & 127.77 \\ 
  1990 & 3.61 & 21.71 & 44.74 & 129.74 & 283.68 & 525.34 & 162.16 & 381.46 & 79.57 & 202.71 \\ 
  1991 & 1.72 & 94.51 & 62.17 & 76.77 & 124.52 & 163.69 & 408.58 & 86.88 & 246.69 & 212.84 \\ 
  1992 & 1.76 & 71.65 & 683.95 & 165.78 & 98.25 & 121.10 & 162.51 & 274.80 & 83.70 & 316.48 \\ 
  1993 & 1.98 & 20.04 & 231.12 & 1118.84 & 142.31 & 75.85 & 67.70 & 57.61 & 90.44 & 105.76 \\ 
  1994 & 0.47 & 32.22 & 69.88 & 339.48 & 1042.03 & 165.23 & 52.40 & 26.70 & 22.39 & 75.89 \\ 
  1995 & 0.28 & 9.74 & 89.20 & 143.97 & 409.27 & 777.98 & 116.49 & 28.88 & 14.31 & 53.24 \\ 
  1996 & 0.70 & 14.59 & 48.27 & 142.00 & 195.50 & 391.74 & 522.65 & 100.43 & 22.18 & 51.80 \\ 
  1997 & 0.94 & 59.17 & 40.94 & 99.39 & 467.13 & 288.29 & 263.42 & 218.01 & 47.67 & 44.31 \\ 
  1998 & 0.36 & 42.86 & 100.22 & 76.04 & 154.39 & 682.20 & 205.56 & 137.41 & 113.24 & 37.28 \\ 
  1999 & 0.29 & 11.67 & 266.34 & 219.24 & 103.67 & 157.45 & 452.10 & 127.61 & 61.72 & 57.99 \\ 
  2000 & 0.46 & 11.66 & 81.62 & 421.77 & 348.76 & 114.36 & 166.15 & 336.95 & 83.40 & 73.66 \\ 
  2001 & 0.67 & 15.95 & 62.51 & 168.44 & 609.77 & 419.64 & 131.76 & 112.35 & 168.60 & 99.77 \\ 
  2002 & 0.51 & 32.65 & 124.69 & 215.20 & 297.40 & 628.54 & 281.58 & 88.54 & 70.34 & 167.30 \\ 
  2003 & 0.32 & 17.00 & 372.49 & 348.11 & 367.97 & 307.02 & 345.78 & 152.91 & 43.76 & 130.59 \\ 
  2004 & 0.12 & 7.76 & 111.39 & 830.42 & 508.41 & 255.34 & 162.06 & 149.16 & 60.87 & 84.40 \\ 
  2005 & 0.08 & 3.69 & 65.15 & 404.47 & 883.73 & 473.83 & 159.12 & 69.19 & 62.49 & 70.25 \\ 
  2006 & 0.23 & 3.84 & 65.55 & 288.35 & 608.47 & 629.82 & 286.34 & 100.98 & 43.98 & 90.58 \\ 
  2007 & 0.49 & 10.89 & 48.22 & 135.38 & 377.07 & 490.47 & 315.29 & 141.55 & 49.75 & 76.90 \\ 
  2008 & 0.25 & 21.38 & 69.80 & 84.72 & 154.66 & 306.03 & 237.87 & 157.60 & 77.00 & 72.02 \\ 
  2009 & 0.82 & 7.72 & 167.37 & 210.13 & 90.85 & 118.79 & 123.98 & 101.09 & 71.11 & 76.57 \\ 
  2010 & 0.28 & 25.16 & 39.13 & 562.42 & 225.26 & 61.47 & 47.06 & 55.56 & 46.54 & 65.95 \\ 
  2011 & 0.23 & 13.92 & 203.54 & 147.12 & 851.02 & 270.10 & 58.65 & 37.41 & 36.80 & 75.49 \\ 
  2012 & 0.19 & 10.11 & 112.76 & 945.13 & 196.68 & 462.80 & 127.25 & 29.11 & 18.36 & 56.91 \\ 
  2013 & 0.79 & 6.20 & 65.16 & 350.95 & 984.48 & 195.07 & 179.68 & 59.16 & 13.48 & 36.96 \\ 
  2014 & 0.69 & 28.38 & 51.06 & 181.94 & 403.43 & 786.04 & 184.03 & 97.49 & 25.41 & 23.33 \\ 
  2015 & 0.19 & 19.02 & 604.75 & 207.72 & 238.17 & 384.21 & 546.95 & 92.17 & 51.90 & 26.99 \\ 
  2016 & 0.09 & 2.82 & 120.63 & 1388.24 & 174.31 & 180.74 & 174.97 & 242.68 & 38.06 & 28.67 \\ 
  2017 & 0.14 & 1.59 & 28.56 & 577.55 & 935.22 & 201.00 & 139.71 & 111.69 & 121.63 & 35.33 \\ 
  2018 & 0.13 & 1.90 & 12.90 & 112.90 & 1164.89 & 549.69 & 101.03 & 65.81 & 49.15 & 68.82 \\ 
  2019 & 0.16 & 2.57 & 25.94 & 82.59 & 347.55 & 663.04 & 507.63 & 63.33 & 39.29 & 75.84 \\ 
   \hline
\end{tabular}
}
\end{table}

\clearpage

\begin{table}[ht]
\centering
\caption{Estimated EBS pollock age 3+ biomass, female spawning biomass, and age 1 recruitment for 1964--2019. Biomass units are thousands of t, age-1 recruitment is in millions of pollock.} 
\label{tab:biom_ssb_rec}
\scalebox{0.8}{
\begin{tabular}{rrrrrrr}
  \hline
Year & SSB & CV.SSB & Recruitment & CV.Rec... & Age.3..Biomass & CV.. \\ 
  \hline
1964 & 575 & 26 & 6,405 & 38 & 1,833 & 22 \\ 
  1965 & 666 & 22 & 22,440 & 24 & 2,232 & 20 \\ 
  1966 & 775 & 21 & 14,963 & 32 & 2,391 & 20 \\ 
  1967 & 977 & 19 & 25,556 & 26 & 3,644 & 17 \\ 
  1968 & 1,206 & 19 & 20,098 & 31 & 4,163 & 17 \\ 
  1969 & 1,453 & 18 & 29,552 & 23 & 5,264 & 16 \\ 
  1970 & 1,646 & 18 & 21,165 & 30 & 5,911 & 15 \\ 
  1971 & 1,732 & 17 & 12,635 & 38 & 6,354 & 13 \\ 
  1972 & 1,641 & 17 & 12,178 & 33 & 6,037 & 13 \\ 
  1973 & 1,337 & 19 & 30,032 & 17 & 4,859 & 14 \\ 
  1974 & 953 & 24 & 19,928 & 20 & 3,601 & 16 \\ 
  1975 & 839 & 21 & 19,415 & 16 & 3,730 & 13 \\ 
  1976 & 894 & 16 & 14,178 & 17 & 3,704 & 11 \\ 
  1977 & 973 & 13 & 14,529 & 15 & 3,692 & 9 \\ 
  1978 & 1,020 & 12 & 27,893 & 9 & 3,612 & 9 \\ 
  1979 & 1,009 & 11 & 63,042 & 6 & 3,588 & 8 \\ 
  1980 & 1,153 & 9 & 26,604 & 9 & 4,534 & 7 \\ 
  1981 & 1,845 & 6 & 32,672 & 8 & 8,387 & 5 \\ 
  1982 & 2,721 & 5 & 16,490 & 11 & 9,536 & 5 \\ 
  1983 & 3,350 & 5 & 52,065 & 6 & 10,802 & 5 \\ 
  1984 & 3,605 & 5 & 13,523 & 10 & 10,632 & 5 \\ 
  1985 & 3,886 & 5 & 32,150 & 6 & 12,622 & 4 \\ 
  1986 & 4,112 & 4 & 11,520 & 10 & 11,820 & 4 \\ 
  1987 & 4,207 & 4 & 6,783 & 10 & 12,180 & 3 \\ 
  1988 & 4,105 & 3 & 5,688 & 10 & 11,266 & 3 \\ 
  1989 & 3,606 & 3 & 11,625 & 7 & 9,389 & 3 \\ 
  1990 & 2,846 & 3 & 50,615 & 3 & 7,445 & 3 \\ 
  1991 & 2,096 & 4 & 26,359 & 5 & 5,910 & 3 \\ 
  1992 & 2,244 & 3 & 22,048 & 6 & 9,357 & 3 \\ 
  1993 & 3,189 & 3 & 46,445 & 4 & 11,698 & 3 \\ 
  1994 & 3,545 & 3 & 14,927 & 7 & 11,435 & 3 \\ 
  1995 & 3,737 & 3 & 10,238 & 7 & 12,975 & 3 \\ 
  1996 & 3,706 & 3 & 22,739 & 5 & 11,058 & 3 \\ 
  1997 & 3,503 & 3 & 30,818 & 4 & 9,705 & 3 \\ 
  1998 & 3,214 & 3 & 14,993 & 6 & 9,745 & 3 \\ 
  1999 & 3,233 & 3 & 16,620 & 5 & 10,674 & 3 \\ 
  2000 & 3,250 & 3 & 26,020 & 4 & 9,817 & 3 \\ 
  2001 & 3,272 & 3 & 35,392 & 3 & 9,547 & 3 \\ 
  2002 & 3,086 & 3 & 23,590 & 4 & 9,858 & 3 \\ 
  2003 & 3,241 & 3 & 14,125 & 5 & 11,773 & 2 \\ 
  2004 & 3,339 & 3 & 6,520 & 7 & 11,070 & 2 \\ 
  2005 & 3,069 & 3 & 4,736 & 8 & 9,254 & 3 \\ 
  2006 & 2,518 & 3 & 11,360 & 6 & 7,091 & 3 \\ 
  2007 & 2,088 & 3 & 24,888 & 4 & 5,734 & 3 \\ 
  2008 & 1,557 & 4 & 13,736 & 6 & 4,676 & 3 \\ 
  2009 & 1,638 & 4 & 49,986 & 4 & 5,832 & 3 \\ 
  2010 & 1,868 & 4 & 21,735 & 6 & 6,161 & 3 \\ 
  2011 & 2,237 & 4 & 13,030 & 8 & 8,648 & 3 \\ 
  2012 & 2,575 & 4 & 11,847 & 9 & 8,577 & 3 \\ 
  2013 & 2,851 & 4 & 54,643 & 8 & 8,431 & 4 \\ 
  2014 & 2,711 & 5 & 52,784 & 10 & 7,777 & 5 \\ 
  2015 & 2,791 & 5 & 13,765 & 16 & 10,962 & 6 \\ 
  2016 & 3,595 & 7 & 8,392 & 25 & 13,838 & 7 \\ 
  2017 & 4,075 & 8 & 13,607 & 20 & 12,322 & 8 \\ 
  2018 & 3,677 & 9 & 16,693 & 21 & 9,915 & 9 \\ 
  2019 & 3,334 & 11 & 19,842 & 20 & 9,258 & 10 \\ 
   \hline
\end{tabular}
}
\end{table}
\clearpage

\begin{table}[ht]
\centering
\caption{Estimates of begin-year age 3 and older biomass (thousands of tons) and coefficients of variation (CV) for the current assessment compared to 2012--2018 assessments for EBS pollock.} 
\label{tab:biom_3plus}
\scalebox{0.85}{
\begin{tabular}{rrrrrrrrrrrrrrr}
  \hline
Year & Current & CV & 2018 & CV & 2017 & CV & 2016 & CV & 2015 & CV & 2014 & CV & 2013 & CV \\ 
  \hline
1964 & 1,833 & 22 & 1,744 & 22 & 1,779 & 22 & 1,834 & 22 & 1,869 & 24 & 1,622 & 21 & 1,602 & 21 \\ 
  1965 & 2,232 & 20 & 2,124 & 20 & 2,165 & 20 & 2,229 & 20 & 2,324 & 22 & 2,076 & 19 & 2,051 & 19 \\ 
  1966 & 2,391 & 19 & 2,277 & 19 & 2,326 & 19 & 2,404 & 19 & 2,563 & 22 & 2,186 & 19 & 2,149 & 19 \\ 
  1967 & 3,644 & 17 & 3,504 & 17 & 3,566 & 17 & 3,667 & 17 & 3,888 & 19 & 3,397 & 16 & 3,344 & 16 \\ 
  1968 & 4,163 & 17 & 4,011 & 17 & 4,082 & 17 & 4,198 & 17 & 4,495 & 18 & 3,870 & 16 & 3,800 & 16 \\ 
  1969 & 5,264 & 15 & 5,105 & 16 & 5,174 & 15 & 5,294 & 15 & 5,690 & 16 & 5,220 & 15 & 5,145 & 16 \\ 
  1970 & 5,911 & 14 & 5,757 & 15 & 5,820 & 14 & 5,936 & 14 & 6,424 & 15 & 6,252 & 15 & 6,178 & 15 \\ 
  1971 & 6,354 & 13 & 6,209 & 13 & 6,260 & 13 & 6,360 & 13 & 6,858 & 14 & 6,945 & 13 & 6,884 & 13 \\ 
  1972 & 6,037 & 12 & 5,902 & 12 & 5,940 & 12 & 6,024 & 12 & 6,431 & 13 & 6,353 & 13 & 6,299 & 13 \\ 
  1973 & 4,859 & 13 & 4,729 & 13 & 4,765 & 13 & 4,845 & 13 & 5,161 & 14 & 4,748 & 16 & 4,692 & 16 \\ 
  1974 & 3,601 & 16 & 3,474 & 16 & 3,510 & 16 & 3,589 & 16 & 3,846 & 17 & 3,348 & 19 & 3,291 & 20 \\ 
  1975 & 3,730 & 12 & 3,585 & 12 & 3,611 & 12 & 3,679 & 12 & 3,868 & 13 & 3,554 & 13 & 3,515 & 13 \\ 
  1976 & 3,704 & 10 & 3,515 & 10 & 3,538 & 10 & 3,608 & 10 & 3,872 & 11 & 3,609 & 10 & 3,577 & 10 \\ 
  1977 & 3,692 & 9 & 3,426 & 8 & 3,446 & 8 & 3,535 & 8 & 3,939 & 10 & 3,642 & 9 & 3,612 & 9 \\ 
  1978 & 3,612 & 8 & 3,250 & 8 & 3,273 & 8 & 3,375 & 8 & 3,888 & 9 & 3,556 & 9 & 3,524 & 9 \\ 
  1979 & 3,588 & 8 & 3,087 & 8 & 3,116 & 8 & 3,239 & 8 & 3,859 & 9 & 3,426 & 8 & 3,386 & 8 \\ 
  1980 & 4,534 & 7 & 3,856 & 6 & 3,896 & 6 & 4,068 & 6 & 4,887 & 8 & 4,372 & 7 & 4,307 & 7 \\ 
  1981 & 8,387 & 5 & 7,314 & 5 & 7,453 & 5 & 7,813 & 4 & 9,054 & 6 & 8,527 & 5 & 8,320 & 6 \\ 
  1982 & 9,536 & 4 & 8,448 & 5 & 8,645 & 5 & 9,056 & 4 & 10,289 & 5 & 9,766 & 5 & 9,496 & 5 \\ 
  1983 & 10,802 & 4 & 9,556 & 4 & 9,849 & 4 & 10,240 & 4 & 11,383 & 5 & 10,911 & 4 & 10,560 & 5 \\ 
  1984 & 10,632 & 4 & 9,428 & 4 & 9,731 & 4 & 10,033 & 4 & 11,040 & 5 & 10,601 & 4 & 10,239 & 5 \\ 
  1985 & 12,622 & 3 & 11,615 & 4 & 11,887 & 4 & 12,237 & 3 & 12,951 & 4 & 12,838 & 4 & 12,409 & 4 \\ 
  1986 & 11,820 & 3 & 11,039 & 3 & 11,278 & 4 & 11,531 & 3 & 12,019 & 4 & 12,036 & 4 & 11,621 & 4 \\ 
  1987 & 12,180 & 2 & 11,734 & 3 & 11,922 & 3 & 12,143 & 3 & 12,334 & 4 & 12,615 & 3 & 12,243 & 3 \\ 
  1988 & 11,266 & 2 & 11,125 & 3 & 11,291 & 3 & 11,497 & 3 & 11,536 & 4 & 11,906 & 3 & 11,583 & 3 \\ 
  1989 & 9,389 & 2 & 9,422 & 3 & 9,568 & 3 & 9,755 & 3 & 9,700 & 4 & 10,128 & 3 & 9,860 & 3 \\ 
  1990 & 7,445 & 3 & 7,536 & 3 & 7,671 & 3 & 7,812 & 3 & 7,701 & 4 & 8,101 & 3 & 7,891 & 4 \\ 
  1991 & 5,910 & 3 & 5,920 & 4 & 6,054 & 4 & 6,183 & 4 & 6,063 & 5 & 6,331 & 4 & 6,170 & 4 \\ 
  1992 & 9,357 & 2 & 9,065 & 3 & 9,276 & 3 & 9,476 & 3 & 9,472 & 3 & 9,704 & 3 & 9,561 & 3 \\ 
  1993 & 11,698 & 2 & 11,181 & 2 & 11,427 & 2 & 11,627 & 2 & 11,712 & 3 & 11,840 & 3 & 11,712 & 3 \\ 
  1994 & 11,435 & 2 & 10,957 & 2 & 11,188 & 2 & 11,313 & 2 & 11,418 & 3 & 11,402 & 3 & 11,306 & 3 \\ 
  1995 & 12,975 & 2 & 12,508 & 2 & 12,757 & 2 & 13,000 & 2 & 13,177 & 3 & 13,135 & 3 & 13,074 & 3 \\ 
  1996 & 11,058 & 2 & 10,751 & 2 & 10,979 & 2 & 11,239 & 2 & 11,358 & 3 & 11,235 & 3 & 11,198 & 3 \\ 
  1997 & 9,705 & 3 & 9,395 & 2 & 9,603 & 2 & 9,837 & 2 & 9,940 & 3 & 9,816 & 3 & 9,801 & 3 \\ 
  1998 & 9,745 & 2 & 9,422 & 2 & 9,609 & 2 & 9,908 & 2 & 9,990 & 3 & 9,906 & 3 & 9,902 & 3 \\ 
  1999 & 10,674 & 2 & 10,390 & 2 & 10,561 & 2 & 10,751 & 2 & 10,853 & 3 & 10,799 & 3 & 10,791 & 3 \\ 
  2000 & 9,817 & 2 & 9,582 & 2 & 9,735 & 2 & 9,955 & 2 & 10,068 & 3 & 10,031 & 3 & 10,020 & 3 \\ 
  2001 & 9,547 & 2 & 9,335 & 2 & 9,479 & 2 & 9,702 & 2 & 9,854 & 3 & 9,818 & 3 & 9,802 & 3 \\ 
  2002 & 9,858 & 2 & 9,698 & 2 & 9,811 & 2 & 10,025 & 2 & 10,276 & 3 & 10,221 & 3 & 10,182 & 3 \\ 
  2003 & 11,773 & 2 & 11,657 & 2 & 11,750 & 2 & 12,080 & 2 & 12,365 & 3 & 12,278 & 2 & 12,211 & 2 \\ 
  2004 & 11,070 & 2 & 10,999 & 2 & 11,073 & 2 & 11,401 & 2 & 11,591 & 3 & 11,493 & 2 & 11,416 & 2 \\ 
  2005 & 9,254 & 2 & 9,197 & 2 & 9,272 & 2 & 9,598 & 2 & 9,705 & 3 & 9,601 & 3 & 9,521 & 3 \\ 
  2006 & 7,091 & 2 & 7,035 & 2 & 7,110 & 2 & 7,390 & 2 & 7,446 & 3 & 7,343 & 3 & 7,261 & 3 \\ 
  2007 & 5,734 & 3 & 5,683 & 3 & 5,762 & 3 & 6,046 & 3 & 6,045 & 4 & 5,932 & 4 & 5,840 & 4 \\ 
  2008 & 4,676 & 3 & 4,651 & 3 & 4,726 & 3 & 4,945 & 3 & 4,849 & 4 & 4,721 & 4 & 4,607 & 4 \\ 
  2009 & 5,832 & 3 & 5,837 & 3 & 5,943 & 3 & 6,374 & 3 & 6,331 & 5 & 6,068 & 4 & 5,879 & 5 \\ 
  2010 & 6,161 & 3 & 6,185 & 3 & 6,327 & 3 & 6,657 & 3 & 6,680 & 5 & 5,936 & 5 & 5,622 & 6 \\ 
  2011 & 8,648 & 3 & 8,788 & 3 & 9,107 & 3 & 9,637 & 3 & 10,053 & 7 & 8,895 & 6 & 7,927 & 7 \\ 
  2012 & 8,577 & 3 & 8,722 & 3 & 9,051 & 4 & 9,626 & 4 & 10,164 & 8 & 8,822 & 7 & 7,853 & 9 \\ 
  2013 & 8,431 & 3 & 8,547 & 4 & 8,873 & 4 & 9,504 & 5 & 10,337 & 9 & 9,540 & 8 & 8,261 & 10 \\ 
  2014 & 7,777 & 4 & 7,855 & 4 & 8,143 & 5 & 8,947 & 6 & 9,805 & 10 & 8,960 & 9 & 8,045 & 11 \\ 
  2015 & 10,962 & 5 & 11,345 & 6 & 11,913 & 8 & 12,407 & 10 & 10,970 & 11 & 9,203 & 9 & 7,778 & 12 \\ 
  2016 & 13,838 & 7 & 13,293 & 7 & 13,549 & 10 & 13,495 & 12 & 11,292 & 12 & NA & NA & NA & NA \\ 
  2017 & 12,322 & 8 & 11,785 & 8 & 12,049 & 11 & 13,033 & 13 & NA & NA & NA & NA & NA & NA \\ 
  2018 & 9,915 & 9 & 10,202 & 9 & 10,965 & 11 & NA & NA & NA & NA & NA & NA & NA & NA \\ 
  2019 & 9,258 & 9 & 9,110 & 10 & NA & NA & NA & NA & NA & NA & NA & NA & NA & NA \\ 
   \hline
\end{tabular}
}
\end{table}

\begin{table}[ht]
\centering
\caption{Summary of model 16.1 results and the stock condition for EBS pollock. Biomass units are thousands of t.} 
\label{tab:res_summ}
\begin{tabular}{lr}
  \hline
Component & Model 16.1 \\ 
  \hline
${B}_{2020}$ & 2,800 \\ 
  $CV_{B_{2020}}$ & 0.12 \\ 
  $B_{MSY}$ & 2,156 \\ 
  $CV_{B_{MSY}}$ & 0.24 \\ 
  ${B}_{2020}/B_{MSY}$ & 131\% \\ 
  $B_0$ & 5,733 \\ 
  $B_{35\%}$ & 2,151 \\ 
  SPR rate at $F_{MSY}$ & 28\% \\ 
  Steepness & 0.66 \\ 
  Est. $B_{2019} / B_{2019,no fishing}$ & 0.6 \\ 
  $B_{2019} / B_{MSY}$ & 155\% \\ 
   \hline
\end{tabular}
\end{table}


\begin{table}[ht]
\centering
\caption{Summary results of Tier 1 2019 yield projections for EBS pollock.} 
\label{tab:tier1_proj}
\begin{tabular}{lr}
  \hline
Component & Model 16.1 \\ 
  \hline
2020 fishable biomass (GM) & 6,276,000 \\ 
  Equilibrium fishable biomass at MSY & 3,927,000 \\ 
  MSY R (HM) & 0.484 \\ 
  2020 Tier 1 ABC & 3,036,000 \\ 
  2020 Tier 1 $F_{OFL}$ & 0.609 \\ 
  2020 Tier 1 OFL & 3,823,000 \\ 
  MSY R (HM) & 0.411 \\ 
  Recommended ABC & 2,581,000 \\ 
   \hline
\end{tabular}
\end{table}

\clearpage

\begin{table}[ht]
\centering
\caption{Tier 3 projections of EBS pollock catch for the 7 scenarios.} 
\label{tab:tier3_C}
\scalebox{0.85}{
\begin{tabular}{rrrrrrrr}
  \hline
Catch & Scenario.1 & Scenario.2 & Scenario.3 & Scenario.4 & Scenario.5 & Scenario.6 & Scenario.7 \\ 
  \hline
2019 & 1,390 & 1,390 & 1,390 & 1,390 & 1,390 & 1,390 & 1,390 \\ 
  2020 & 2,021 & 1,350 & 1,263 & 897 & 0 & 2,507 & 2,021 \\ 
  2021 & 1,360 & 1,324 & 1,084 & 821 & 0 & 1,414 & 1,360 \\ 
  2022 & 1,188 & 1,444 & 1,001 & 785 & 0 & 1,248 & 1,475 \\ 
  2023 & 1,250 & 1,340 & 1,027 & 818 & 0 & 1,352 & 1,422 \\ 
  2024 & 1,413 & 1,444 & 1,132 & 907 & 0 & 1,545 & 1,565 \\ 
  2025 & 1,497 & 1,505 & 1,202 & 970 & 0 & 1,626 & 1,631 \\ 
  2026 & 1,543 & 1,547 & 1,253 & 1,019 & 0 & 1,660 & 1,661 \\ 
  2027 & 1,567 & 1,569 & 1,289 & 1,055 & 0 & 1,674 & 1,675 \\ 
  2028 & 1,575 & 1,571 & 1,307 & 1,076 & 0 & 1,676 & 1,676 \\ 
  2029 & 1,554 & 1,553 & 1,299 & 1,075 & 0 & 1,648 & 1,648 \\ 
  2030 & 1,552 & 1,555 & 1,304 & 1,081 & 0 & 1,646 & 1,646 \\ 
  2031 & 1,540 & 1,541 & 1,298 & 1,079 & 0 & 1,634 & 1,634 \\ 
  2032 & 1,537 & 1,536 & 1,295 & 1,078 & 0 & 1,631 & 1,631 \\ 
   \hline
\end{tabular}
}
\end{table}
\begin{table}[ht]
\centering
\caption{Tier 3 projections of EBS pollock ABC (given catches in Table \ref{tab:tier3_C}) for the 7 scenarios.} 
\label{tab:tier3_ABC}
\scalebox{0.85}{
\begin{tabular}{rrrrrrrr}
  \hline
ABC & Scenario.1 & Scenario.2 & Scenario.3 & Scenario.4 & Scenario.5 & Scenario.6 & Scenario.7 \\ 
  \hline
2019 & 2,413 & 2,413 & 1,504 & 1,067 & 0 & 2,997 & 2,997 \\ 
  2020 & 2,021 & 2,021 & 1,263 & 897 & 0 & 2,507 & 2,507 \\ 
  2021 & 1,360 & 1,688 & 1,084 & 821 & 0 & 1,414 & 1,674 \\ 
  2022 & 1,188 & 1,444 & 1,001 & 785 & 0 & 1,248 & 1,475 \\ 
  2023 & 1,250 & 1,340 & 1,027 & 818 & 0 & 1,352 & 1,422 \\ 
  2024 & 1,413 & 1,446 & 1,132 & 907 & 0 & 1,545 & 1,565 \\ 
  2025 & 1,497 & 1,511 & 1,202 & 970 & 0 & 1,626 & 1,631 \\ 
  2026 & 1,543 & 1,551 & 1,253 & 1,019 & 0 & 1,660 & 1,661 \\ 
  2027 & 1,567 & 1,573 & 1,289 & 1,055 & 0 & 1,674 & 1,675 \\ 
  2028 & 1,575 & 1,578 & 1,307 & 1,076 & 0 & 1,676 & 1,676 \\ 
  2029 & 1,554 & 1,558 & 1,299 & 1,075 & 0 & 1,648 & 1,648 \\ 
  2030 & 1,552 & 1,556 & 1,304 & 1,081 & 0 & 1,646 & 1,646 \\ 
  2031 & 1,540 & 1,542 & 1,298 & 1,079 & 0 & 1,634 & 1,634 \\ 
  2032 & 1,537 & 1,539 & 1,295 & 1,078 & 0 & 1,631 & 1,631 \\ 
   \hline
\end{tabular}
}
\end{table}
\begin{table}[ht]
\centering
\caption{Tier 3 projections of EBS pollock fishing mortality for the 7 scenarios.} 
\label{tab:tier3_F}
\scalebox{0.85}{
\begin{tabular}{rrrrrrrr}
  \hline
F & Scenario.1 & Scenario.2 & Scenario.3 & Scenario.4 & Scenario.5 & Scenario.6 & Scenario.7 \\ 
  \hline
2019 & 0.226 & 0.226 & 0.226 & 0.226 & 0.226 & 0.226 & 0.226 \\ 
  2020 & 0.433 & 0.267 & 0.248 & 0.169 & 0.000 & 0.573 & 0.433 \\ 
  2021 & 0.385 & 0.317 & 0.248 & 0.169 & 0.000 & 0.460 & 0.385 \\ 
  2022 & 0.374 & 0.406 & 0.248 & 0.169 & 0.000 & 0.452 & 0.486 \\ 
  2023 & 0.382 & 0.391 & 0.248 & 0.169 & 0.000 & 0.471 & 0.480 \\ 
  2024 & 0.388 & 0.391 & 0.248 & 0.169 & 0.000 & 0.483 & 0.486 \\ 
  2025 & 0.392 & 0.393 & 0.248 & 0.169 & 0.000 & 0.491 & 0.491 \\ 
  2026 & 0.395 & 0.395 & 0.248 & 0.169 & 0.000 & 0.494 & 0.494 \\ 
  2027 & 0.395 & 0.395 & 0.248 & 0.169 & 0.000 & 0.492 & 0.492 \\ 
  2028 & 0.393 & 0.393 & 0.248 & 0.169 & 0.000 & 0.490 & 0.490 \\ 
  2029 & 0.394 & 0.394 & 0.248 & 0.169 & 0.000 & 0.490 & 0.490 \\ 
  2030 & 0.393 & 0.393 & 0.248 & 0.169 & 0.000 & 0.488 & 0.488 \\ 
  2031 & 0.393 & 0.392 & 0.248 & 0.169 & 0.000 & 0.488 & 0.488 \\ 
  2032 & 0.393 & 0.392 & 0.248 & 0.169 & 0.000 & 0.487 & 0.487 \\ 
   \hline
\end{tabular}
}
\end{table}
\begin{table}[ht]
\centering
\caption{Tier 3 projections of EBS pollock spawning biomass (kt) for the 7 scenarios.} 
\label{tab:tier3_SSB}
\scalebox{0.85}{
\begin{tabular}{rrrrrrrr}
  \hline
SSB & Scenario.1 & Scenario.2 & Scenario.3 & Scenario.4 & Scenario.5 & Scenario.6 & Scenario.7 \\ 
  \hline
2019 & 3,215 & 3,215 & 3,215 & 3,215 & 3,215 & 3,215 & 3,215 \\ 
  2020 & 2,685 & 2,789 & 2,802 & 2,853 & 2,967 & 2,601 & 2,685 \\ 
  2021 & 2,206 & 2,478 & 2,546 & 2,727 & 3,188 & 2,006 & 2,206 \\ 
  2022 & 2,168 & 2,367 & 2,553 & 2,806 & 3,528 & 1,980 & 2,126 \\ 
  2023 & 2,313 & 2,394 & 2,719 & 3,023 & 3,968 & 2,125 & 2,174 \\ 
  2024 & 2,449 & 2,483 & 2,890 & 3,236 & 4,384 & 2,243 & 2,259 \\ 
  2025 & 2,523 & 2,539 & 3,014 & 3,400 & 4,754 & 2,294 & 2,300 \\ 
  2026 & 2,572 & 2,582 & 3,111 & 3,533 & 5,084 & 2,326 & 2,328 \\ 
  2027 & 2,587 & 2,593 & 3,160 & 3,610 & 5,333 & 2,331 & 2,332 \\ 
  2028 & 2,575 & 2,580 & 3,171 & 3,642 & 5,512 & 2,315 & 2,315 \\ 
  2029 & 2,564 & 2,569 & 3,172 & 3,659 & 5,650 & 2,303 & 2,303 \\ 
  2030 & 2,551 & 2,555 & 3,167 & 3,664 & 5,756 & 2,291 & 2,291 \\ 
  2031 & 2,549 & 2,551 & 3,167 & 3,672 & 5,847 & 2,291 & 2,291 \\ 
  2032 & 2,562 & 2,564 & 3,180 & 3,690 & 5,934 & 2,305 & 2,305 \\ 
   \hline
\end{tabular}
}
\end{table}

\clearpage


\begin{table}[ht]
\centering
\caption{Bycatch estimates (t) of FMP species caught in the BSAI directed pollock fishery, 1997--2018 based on then NMFS Alaska Regional Office reports from observers (2018 data are preliminary). } 
\label{tab:fmpbycatch}
\scalebox{0.85}{
\begin{tabular}{rrrrrrrrrrr}
  \hline
\begin{sideways} Year \end{sideways} & \begin{sideways} Pacific.Cod \end{sideways} & \begin{sideways} Rock.Sole \end{sideways} & \begin{sideways} Flathead.Sole \end{sideways} & \begin{sideways} Arrowtooth.Flounder \end{sideways} & \begin{sideways} Pacific.Ocean.Perch \end{sideways} & \begin{sideways} Yellowfin.Sole \end{sideways} & \begin{sideways} Sablefish \end{sideways} & \begin{sideways} Sharks \end{sideways} & \begin{sideways} Sculpin \end{sideways} & \begin{sideways} Other \end{sideways} \\ 
  \hline
1991 & 24,310 & 5,120 & 0 & 5,719 & 418 & 417 & 9 & 0 & 0 & 10,722 \\ 
  1992 & 24,005 & 7,233 & 2 & 4,311 & 173 & 892 & 7 & 0 & 0 & 14,716 \\ 
  1993 & 20,930 & 8,713 & 0 & 1,222 & 282 & 1,102 & 1 & 0 & 0 & 7,548 \\ 
  1994 & 14,409 & 3,009 & 0 & 2,010 & 170 & 1,207 & 1 & 0 & 0 & 4,171 \\ 
  1995 & 19,776 & 2,179 & 2,175 & 1,177 & 142 & 675 & 12 & 0 & 0 & 1,021 \\ 
  1996 & 15,174 & 2,042 & 3,207 & 1,844 & 303 & 1,797 & 7 & 0 & 0 & 1,638 \\ 
  1997 & 8,262 & 1,522 & 2,350 & 984 & 428 & 605 & 2 & 0 & 0 & 1,026 \\ 
  1998 & 6,255 & 770 & 2,047 & 1,712 & 616 & 1,744 & 2 & 0 & 0 & 885 \\ 
  1999 & 3,220 & 1,058 & 1,885 & 272 & 120 & 349 & 7 & 0 & 0 & 610 \\ 
  2000 & 3,432 & 2,687 & 2,510 & 978 & 21 & 1,465 & 12 & 0 & 0 & 987 \\ 
  2001 & 3,879 & 1,672 & 2,199 & 529 & 574 & 594 & 21 & 0 & 0 & 1,312 \\ 
  2002 & 5,886 & 1,885 & 1,844 & 607 & 543 & 768 & 34 & 0 & 0 & 1,272 \\ 
  2003 & 5,968 & 1,418 & 1,501 & 617 & 935 & 209 & 48 & 0 & 0 & 1,861 \\ 
  2004 & 6,436 & 2,553 & 2,104 & 556 & 393 & 841 & 16 & 0 & 0 & 1,328 \\ 
  2005 & 7,413 & 1,125 & 2,351 & 651 & 652 & 63 & 11 & 0 & 0 & 1,234 \\ 
  2006 & 7,291 & 1,360 & 2,862 & 1,088 & 735 & 256 & 8 & 0 & 0 & 2,219 \\ 
  2007 & 5,629 & 510 & 4,225 & 2,795 & 624 & 85 & 11 & 0 & 0 & 2,028 \\ 
  2008 & 6,971 & 2,149 & 4,315 & 1,715 & 335 & 552 & 4 & 0 & 0 & 3,373 \\ 
  2009 & 7,875 & 7,591 & 4,665 & 2,202 & 114 & 270 & 2 & 0 & 0 & 4,495 \\ 
  2010 & 6,964 & 2,241 & 4,357 & 1,466 & 230 & 1,056 & 2 & 0 & 0 & 2,338 \\ 
  2011 & 10,040 & 8,480 & 4,885 & 1,599 & 659 & 1,082 & 1 & 65 & 315 & 310 \\ 
  2012 & 10,061 & 6,701 & 3,968 & 748 & 705 & 1,496 & 0 & 54 & 286 & 356 \\ 
  2013 & 8,957 & 6,319 & 3,146 & 965 & 610 & 2,087 & 0 & 43 & 219 & 339 \\ 
  2014 & 5,213 & 4,359 & 2,553 & 757 & 1,300 & 1,953 & 1 & 75 & 190 & 724 \\ 
  2015 & 8,302 & 1,709 & 2,259 & 402 & 2,516 & 863 & 0 & 51 & 186 & 412 \\ 
  2016 & 4,980 & 1,141 & 1,629 & 297 & 3,273 & 895 & 18 & 58 & 124 & 470 \\ 
  2017 & 5,955 & 1,825 & 956 & 208 & 4,818 & 623 & 101 & 92 & 81 & 324 \\ 
  2018 & 4,271 & 1,150 & 1,038 & 278 & 4,122 & 788 & 447 & 62 & 60 & 350 \\ 
  2019 & 6,160 & 1,192 & 1,086 & 390 & 6,463 & 440 & 1,245 & 93 & 55 & 464 \\ 
   \hline
\end{tabular}
}
\end{table}
\begin{table}[ht]
\centering
\caption{Bycatch estimates (t) of pollock caught in the other non-pollock EBS directed fisheries, 1997--2019 based on then NMFS Alaska Regional Office reports from observers.} 
\label{tab:pollbycatch}
\scalebox{0.9}{
\begin{tabular}{rrrrrrrr}
  \hline
\begin{sideways} Year \end{sideways} & \begin{sideways} Pacific.Cod \end{sideways} & \begin{sideways} Yellowfin.Sole \end{sideways} & \begin{sideways} Rock.Sole \end{sideways} & \begin{sideways} Flathead.Sole \end{sideways} & \begin{sideways} Other.flatfish \end{sideways} & \begin{sideways} Other.fisheries \end{sideways} & \begin{sideways} Total \end{sideways} \\ 
  \hline
1991 & 10,695 & NA & 9,711 & NA & 6,219 & 2,528 & 29,154 \\ 
  1992 & 20,778 & 13,100 & 9,824 & NA & 1,242 & 757 & 45,704 \\ 
  1993 & 31,299 & 15,253 & 18,582 & NA & 2,572 & 632 & 68,339 \\ 
  1994 & 26,594 & 33,200 & 15,784 & NA & 6,751 & 108 & 82,438 \\ 
  1995 & 25,691 & 27,041 & 7,766 & 1,851 & 3,309 & 113 & 65,773 \\ 
  1996 & 22,382 & 22,254 & 7,698 & 4,082 & 1,338 & 840 & 58,597 \\ 
  1997 & 33,658 & 24,100 & 9,123 & 2,983 & 421 & 90 & 70,376 \\ 
  1998 & 10,468 & 15,339 & 3,960 & 2,369 & 298 & 1,283 & 33,720 \\ 
  1999 & 21,131 & 8,701 & 5,207 & 4,040 & 324 & 1,604 & 41,009 \\ 
  2000 & 14,508 & 13,425 & 5,480 & 6,467 & 372 & 748 & 41,003 \\ 
  2001 & 11,570 & 16,502 & 4,577 & 4,337 & 131 & 759 & 37,879 \\ 
  2002 & 15,255 & 14,489 & 9,942 & 1,934 & 75 & 262 & 41,959 \\ 
  2003 & 15,926 & 11,578 & 4,924 & 2,983 & 306 & 642 & 36,362 \\ 
  2004 & 18,650 & 10,383 & 8,975 & 5,162 & 607 & 819 & 44,599 \\ 
  2005 & 14,109 & 10,312 & 7,235 & 3,662 & 261 & 1,334 & 36,917 \\ 
  2006 & 15,168 & 5,966 & 6,986 & 2,663 & 53 & 1,252 & 32,090 \\ 
  2007 & 20,319 & 4,020 & 3,245 & 3,417 & 319 & 892 & 32,214 \\ 
  2008 & 9,533 & 9,827 & 4,930 & 4,102 & 6 & 730 & 29,131 \\ 
  2009 & 7,875 & 7,036 & 6,171 & 3,160 & 20 & 338 & 24,602 \\ 
  2010 & 6,406 & 5,156 & 6,097 & 2,997 & 3 & 402 & 21,063 \\ 
  2011 & 8,991 & 8,673 & 6,931 & 1,473 & 1 & 1,128 & 27,200 \\ 
  2012 & 8,383 & 11,199 & 6,703 & 903 & 14 & 1,248 & 28,452 \\ 
  2013 & 9,101 & 20,171 & 7,327 & 2,010 & 33 & 2,242 & 40,886 \\ 
  2014 & 11,511 & 24,700 & 11,270 & 4,106 & 8 & 2,491 & 54,089 \\ 
  2015 & 9,077 & 21,281 & 9,381 & 2,632 & 27 & 2,762 & 45,163 \\ 
  2016 & 9,094 & 22,306 & 11,848 & 1,666 & 49 & 2,422 & 47,387 \\ 
  2017 & 8,346 & 23,414 & 5,616 & 1,956 & 149 & 2,014 & 41,497 \\ 
  2018 & 8,061 & 28,235 & 5,182 & 2,833 & 4 & 1,643 & 45,961 \\ 
  2019 & 4,936 & 19,828 & 3,085 & 6,851 & 73 & 979 & 35,754 \\ 
   & NA & NA & NA & NA & NA & NA & NA \\ 
   \hline
\end{tabular}
}
\end{table}
\begin{table}[ht]
\centering
\caption{Bycatch estimates (t) of non-target species caught in the BSAI directed pollock fishery, 2003--2019, based on observer data as processed through the catch accounting system (NMFS Regional Office, Juneau, Alaska).} 
\label{tab:nontargbycatch}
\scalebox{0.9}{
\begin{tabular}{rrrrrrrrrrr}
  \hline
\begin{sideways} Year \end{sideways} & \begin{sideways} Scypho.jellies \end{sideways} & \begin{sideways} Misc.fish \end{sideways} & \begin{sideways} Eulachon.Osmerid \end{sideways} & \begin{sideways} Sea.star \end{sideways} & \begin{sideways} Eelpouts \end{sideways} & \begin{sideways} Grenadier \end{sideways} & \begin{sideways} Sea.pen \end{sideways} & \begin{sideways} Lanternfish \end{sideways} & \begin{sideways} Snails \end{sideways} & \begin{sideways} All.other \end{sideways} \\ 
  \hline
2003 & 5,591 & 98 & 9 & 88 & 1 & 20 & 0 & 0 & 0 & 1 \\ 
  2004 & 6,490 & 87 & 20 & 7 & 0 & 14 & 0 & 0 & 0 & 1 \\ 
  2005 & 5,084 & 146 & 12 & 9 & 1 & 14 & 1 & 0 & 6 & 2 \\ 
  2006 & 2,657 & 147 & 92 & 8 & 20 & 15 & 1 & 9 & 0 & 6 \\ 
  2007 & 2,150 & 198 & 136 & 4 & 118 & 27 & 3 & 5 & 0 & 6 \\ 
  2008 & 3,711 & 103 & 4 & 6 & 7 & 27 & 1 & 0 & 0 & 6 \\ 
  2009 & 3,703 & 58 & 4 & 4 & 2 & 3 & 1 & 0 & 0 & 1 \\ 
  2010 & 2,153 & 116 & 0 & 4 & 0 & 1 & 1 & 0 & 0 & 1 \\ 
  2011 & 6,571 & 216 & 2 & 18 & 0 & 1 & 2 & 0 & 0 & 1 \\ 
  2012 & 2,454 & 124 & 1 & 3 & 0 & 0 & 2 & 0 & 0 & 1 \\ 
  2013 & 4,734 & 101 & 0 & 2 & 0 & 0 & 1 & 0 & 0 & 2 \\ 
  2014 & 11,036 & 40 & 2 & 5 & 2 & 0 & 3 & 0 & 0 & 4 \\ 
  2015 & 4,748 & 87 & 21 & 28 & 9 & 1 & 2 & 0 & 0 & 2 \\ 
  2016 & 2,185 & 70 & 5 & 48 & 22 & 3 & 1 & 0 & 0 & 2 \\ 
  2017 & 5,776 & 46 & 3 & 4 & 18 & 2 & 0 & 0 & 0 & 0 \\ 
   \hline
\end{tabular}
}
\end{table}
\begin{table}[ht]
\centering
\caption{Bycatch estimates of prohibited species caught in the BSAI directed pollock fishery, 1997--2019 based on the AKFIN (NMFS Regional Office) reports from observers. Herring and halibut units are in t, all others represent numbers of individuals caught. Data for 2019 are preliminary.} 
\label{tab:pscbycatch}
\scalebox{0.8}{
\begin{tabular}{rrrrrrrrrrrr}
  \hline
\begin{sideways} Year \end{sideways} & \begin{sideways} Bairdi.Tanner.Crab \end{sideways} & \begin{sideways} Chinook.Salmon \end{sideways} & \begin{sideways} Halibut \end{sideways} & \begin{sideways} Halibut.mort \end{sideways} & \begin{sideways} Herring \end{sideways} & \begin{sideways} Non.Chinook.Salmon \end{sideways} & \begin{sideways} Snow.Crab \end{sideways} & \begin{sideways} Other.King.Crab \end{sideways} & \begin{sideways} Red.King.Crab \end{sideways} & \begin{sideways} Blue.King.Crab \end{sideways} & \begin{sideways} Golden..King.Crab \end{sideways} \\ 
  \hline
1991 & 1,398,106 & 39,054 & 2,156 & NA & 3,159 & 28,709 & 4,380,022 & 33,345 & 17,777 & NA & NA \\ 
  1992 & 1,500,764 & 33,672 & 2,220 & NA & 646 & 40,186 & 4,569,662 & 20,384 & 43,873 & NA & NA \\ 
  1993 & 1,649,103 & 36,618 & 1,326 & NA & 527 & 241,979 & 738,259 & 1,925 & 58,140 & NA & NA \\ 
  1994 & 371,213 & 31,889 & 963 & 688 & 1,626 & 92,010 & 811,733 & 513 & 42,360 & NA & NA \\ 
  1995 & 153,992 & 13,403 & 491 & 397 & 904 & 17,754 & 206,651 & 941 & 4,644 & NA & NA \\ 
  1996 & 89,415 & 55,472 & 382 & 320 & 1,241 & 77,173 & 63,398 & 215 & 5,933 & NA & NA \\ 
  1997 & 17,046 & 44,320 & 257 & 200 & 1,134 & 65,414 & 216,152 & 393 & 137 & NA & NA \\ 
  1998 & 57,036 & 51,244 & 352 & 278 & 800 & 60,676 & 123,400 & 5,093 & 14,286 & NA & NA \\ 
  1999 & 2,397 & 10,381 & 153 & 124 & 799 & 44,610 & 15,829 & 7 & 90 & NA & NA \\ 
  2000 & 1,484 & 4,242 & 110 & 90 & 482 & 56,866 & 6,480 & 121 & NA & NA & NA \\ 
  2001 & 5,060 & 30,937 & 242 & 199 & 225 & 53,903 & 5,653 & 5,139 & 105 & NA & NA \\ 
  2002 & 2,112 & 32,401 & 165 & 137 & 108 & 77,177 & 2,697 & 193 & 16 & NA & NA \\ 
  2003 & 732 & 43,095 & 88 & 74 & 967 & 179,987 & 608 & NA & 52 & 8 & 0 \\ 
  2004 & 1,091 & 48,799 & 96 & 81 & 1,095 & 441,188 & 640 & NA & 26 & 4 & 1 \\ 
  2005 & 601 & 66,208 & 119 & 100 & 593 & 703,076 & 2,016 & NA & 0 & 0 & 1 \\ 
  2006 & 1,288 & 80,915 & 132 & 111 & 433 & 305,793 & 2,567 & NA & 288 & 0 & 3 \\ 
  2007 & 1,465 & 116,329 & 312 & 269 & 351 & 86,380 & 3,033 & NA & 7 & 0 & 3 \\ 
  2008 & 9,025 & 20,602 & 373 & 311 & 127 & 15,119 & 8,894 & NA & 670 & 8 & 33 \\ 
  2009 & 6,155 & 12,284 & 541 & 436 & 64 & 45,960 & 7,312 & NA & 1,136 & 19 & 0 \\ 
  2010 & 12,734 & 9,816 & 334 & 266 & 351 & 13,649 & 9,445 & NA & 1,122 & 28 & 0 \\ 
  2011 & 10,964 & 25,499 & 459 & 378 & 376 & 193,754 & 6,471 & NA & 577 & 25 & 0 \\ 
  2012 & 5,547 & 11,349 & 462 & 388 & 2,352 & 22,387 & 6,189 & NA & 343 & 0 & 0 \\ 
  2013 & 12,426 & 13,109 & 334 & 271 & 958 & 125,525 & 8,605 & NA & 316 & 34 & 107 \\ 
  2014 & 12,521 & 15,135 & 239 & 199 & 159 & 219,837 & 19,454 & NA & 368 & 0 & 148 \\ 
  2015 & 8,872 & 18,329 & 152 & 130 & 1,488 & 237,803 & 8,339 & NA & 0 & 0 & 0 \\ 
  2016 & 2,293 & 22,203 & 116 & 103 & 1,431 & 343,208 & 1,165 & NA & 439 & 0 & 106 \\ 
  2017 & 7,235 & 30,076 & 85 & 88 & 965 & 467,749 & 3,392 & NA & 186 & 0 & 64 \\ 
  2018 & 2,249 & 13,726 & 55 & 62 & 474 & 295,818 & 5,142 & NA & 565 & 0 & 53 \\ 
  2019 & 2,557 & 22,374 & 100 & 109 & 1,017 & 336,091 & 6,024 & NA & 413 & 99 & 445 \\ 
   \hline
\end{tabular}
}
\end{table}


\clearpage

\begin{table}[ht]
\centering
\caption{Ecosystem considerations for BSAI pollock and the pollock fishery.}
\label{tab:ecosys_tab}
\scalebox{0.80}{
\begin{tabular}{p{1.5in}p{1.5in}p{1.5in}p{1.5in}}
\hline
Indicator                                                   & Observation                                                              & Interpretation                                                                                                      & Evaluation                                                                                            \\
\hline
\multicolumn{4}{c}{\textbf{Ecosystem effects on EBS pollock}}                                                                          \\
\hline
\multicolumn{4}{l}{\textit{Prey availability or abundance trends}} \\
Zooplankton                                                 & Stomach contents, AT and ichthyoplankton surveys, changes mean wt-at-age & Data improving, indication of increases from 2004--2009 and subsequent decreasees (for euphausiids in 2012 and 2014) & Variable abundance-indicates important recruitment (for prey)  \\
\hline
\multicolumn{4}{l}{\textit{Predator population trends}} \\
Marine mammals                                              & Fur seals declining, Steller sea lions increasing slightly               & Possibly lower mortality on pollock                                                                                 & Probably no concern                                                                                   \\
Birds                                                       & Stable, some increasing some decreasing                                  & Affects young-of-year mortality                                                                                     & Probably no concern                                                                                   \\
Fish (Pollock, Pacific cod, halibut)                        & Stable to increasing                                                     & Possible increases to pollock mortality                                                                             &                                                                                                       \\
\hline
\multicolumn{4}{l}{\textit{Changes in habitat quality}} \\
Temperature regime                                          & Cold years pollock distribution towards NW on average                    & Likely to affect surveyed stock                                                                                     & Some concern, the distribution of pollock availability to different surveys may change systematically \\
Winter-spring environmental conditions                      & Affects pre-recruit survival                                             & Probably a number of factors                                                                                        & Causes natural variability                                                                            \\
Production                                                  & Fairly stable nutrient flow from upwelled BS Basin                       & Inter-annual variability low                                                                                        & No concern                                                                                            \\
\hline
\multicolumn{4}{c}{\textbf{Fishery effects on ecosystem}} \\
\hline
\multicolumn{4}{l}{\textit{Fishery contribution to bycatch}} \\
Prohibited species                                          & Stable, heavily monitored                                                & Likely to be safe                                                                                                   & No concern                                                                                            \\
Forage (including herring, Atka mackerel, cod, and pollock) & Stable, heavily monitored                                                & Likely to be safe                                                                                                   & No concern                                                                                            \\
HAPC biota                                                  & Likely minor impact                                                      & Likely to be safe                                                                                                   & No concern                                                                                            \\
Marine mammals and birds                                    & Very minor direct-take                                                   & Safe                                                                                                                & No concern                                                                                            \\
Sensitive non-target species                                & Likely minor impact                                                      & Data limited, likely to be safe                                                                                     & No concern                                                                                            \\
Fishery concentration in space and time                     & Generally more diffuse                                                   & Mixed potential impact (fur seals vs Steller sea lions)                                                             & Possible concern                                                                                      \\
Fishery effects on amount of large size target fish         & Depends on highly variable year-class strength                           & Natural fluctuation                                                                                                 & Probably no concern                                                                                   \\
Fishery contribution to discards and offal production       & Decreasing                                                               & Improving, but data limited                                                                                         & Possible concern                                                                                      \\
Fishery effects on age-at-maturity and fecundity            & Maturity study (gonad collection) underway                               & NA                                                                                                                  & Possible concern                                                                                      \\
\hline
\end{tabular}
}
\end{table}

\clearpage

\begin{table}[ht]
\centering
\caption{Details and explanation of the decision table factors selected in response to the Plan Team requests (as originally proposed in the 2012 assessment).}
\label{tab:dec_tab_rationale}
\scalebox{0.98}{
\begin{tabular}{L{1.2in}L{2.3in}L{2.8in}}
\toprule
Term & Description                                                                                                                              & Rationale                                                                                                                                                                                                                \\
\midrule
$P\left[F_{2019}>F_{MSY}\right]$  & Probability that the fishing mortality in 2019 exceeds $F_{MSY}$                 & OFL definition is based on $F_{MSY}$ \\
\midrule
$P\left[B_{2020}<B_{MSY}\right]$  & Probability that the spawning biomass in 2020 is less than $B_{MSY}$             & $B_{MSY}$ is a reference point target and biomass in 2020 provides an indication of the impact of 2019 fishing                                                                                   \\
\midrule
$P\left[B_{2021}<B_{MSY}\right]$  & Probability that the spawning biomass in 2021 is less than $B_{MSY}$ & $B_{MSY}$ is a reference point target and biomass in 2023 provides an indication of the impact of fishing in 2019 and 2020                                                                       \\
\midrule
$P\left[B_{2020}<\bar{B}\right]$  & Probability that the spawning biomass in 2020 is less than the 1978--2018 mean    & To provide some perspective of what the stock condition might be relative to historical estimates after fishing in 2019.                                                                    \\
\midrule
$P\left[B_{2023}<\bar{B}\right]$  & Probability that the spawning biomass in 2023 is less than the long term mean & To provide some perspective of what the stock condition might be relative to historical estimates after fishing in 2019.                                                                    \\
\midrule
$P\left[B_{2023}<B_{2019}\right]$  & Probability that the spawning biomass in 2023 is less than that estimated for 2019 & To provide a medium term expectation of stock status relative to 2019 levels                                                                                                                \\
\midrule
$P\left[B_{2021}<B_{20\%}\right]$  & Probability that the spawning biomass in 2021 is less than $B_{20\%}$            & $B_{20\%}$ had been selected as a Steller Sea Lion lower limit for allowing directed fishing                                                                                                    \\
\midrule
$P\left[p_{a_5,2021}>\bar{p}_{a_5}\right]$   & Probability that in 2023 the proportion of age 1--5 pollock in the population exceeds the long-term mean & To provide some relative indication of the age composition of the population relative to the long term mean.                                                                     \\
\midrule
$P\left[D_{2020}<D_{1994}\right]$   & Probability that the diversity of ages represented in the spawning biomass (by weight) in 2020 is less than the value estimated for 1994 & To provide a relative index on the abundance of different age classes in the 2020 population relative to 1994 (a year identified as having low age composition diversity)                 \\
\midrule
$P\left[D_{2023}<D_{1994}\right]$   & Probability that the diversity of ages represented in the spawning biomass (by weight) in 2023 is less than the value estimated for 1994 & To provide a medium-term relative index on the abundance of different age classes in the population relative to 1994 (a year identified as having low age composition diversity)          \\
\midrule
$P\left[E_{2019}>E_{2018}\right]$   & Probability that the theoretical fishing effort in 2019 will be greater than that estimated in 2018.     & To provide the relative effort that is expected (and hence some idea of costs).                                                                                                                     \\
\bottomrule
\end{tabular}
}
\end{table}

\clearpage

\begin{table}[ht]
\centering
\caption{Outcomes of decision (expressed as chances out of 100) given different 2019 catches (first row, in kt). Note that for the 2017 and later year-classes average values were assumed. Constant Fs based on the 2019 catches were used for subsequent years. } 
\label{tab:dec_table}
\scalebox{1}{
\begin{tabular}{rrrrrrrrr}
  \hline
 & 10 & 500 & 1000 & 1250 & 1387 & 1500 & 1750 & 2000 \\ 
  \hline
$P\left[F_{2020}>F_{MSY}\right]$ & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 \\ 
  $P\left[B_{2021}<B_{MSY}\right]$  & 20 & 15 & 16 & 17 & 30 & 17 & 18 & 19 \\ 
  $P\left[B_{2022}<B_{MSY}\right]$  & 18 & 12 & 13 & 14 & 30 & 15 & 16 & 17 \\ 
  $P\left[B_{2021}<\bar{B}\right]$  & 70 & 49 & 53 & 57 & 92 & 60 & 64 & 67 \\ 
  $P\left[B_{2024}<\bar{B}\right]$  & 25 & 16 & 17 & 19 & 42 & 20 & 22 & 24 \\ 
  $P\left[B_{2024}<B_{2020}\right]$  & 26 & 18 & 19 & 20 & 39 & 22 & 23 & 24 \\ 
  $P\left[B_{2022}<B_{20\%}\right]$ & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 \\ 
  $P\left[p_{a_5,2022}>\bar{p}_{a_5}\right]$  & 49 & 34 & 37 & 40 & 65 & 42 & 44 & 46 \\ 
  $P\left[D_{2021}<D_{1994}\right]$   & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\ 
  $P\left[D_{2024}<D_{1994}\right]$   & 3 & 1 & 1 & 1 & 9 & 2 & 2 & 2 \\ 
  $P\left[E_{2020}>E_{2019}\right]$   & 30 & 2 & 5 & 9 & 63 & 14 & 19 & 25 \\ 
   \hline
\end{tabular}
}
\end{table}

\clearpage


# Figures

![Pollock catch estimates (t) from the Eastern Bering Sea by season and region. The A-season is defined as from Jan-May and B-season from June-October.\label{fig:catch}](figs/catch.pdf)   


![Estimate of EBS pollock catch numbers by sex for the A season (January-May) and B seasons (June-October) and total.\label{fig:catch_sex}](figs/catch_sex.pdf)   


![EBS pollock catch distribution during A-season, 2017--2019. Column height is proportional to total catch.\label{fig:catch_distn_a}](figs/catch_distn_a.png)   


![A-season EBS fleet-wide nominal pollock catch (kg) per hour of fishing recorded by NMFS scientific observers.\label{fig:aseas_cpue}](figs/cpue_aseason.png)   


![Proportion of the annual EBS pollock TAC by month during the A-season, 2000--2019. The higher value observed since 2017 was due to Amendment 110 of the FMP to allow greater flexibility to avoid Chinook salmon.\label{fig:prop_a_season}](figs/catchp.png)   


![EBS pollock catch distribution during B-season, 2017--2019. Column height is proportional to total catch. Note that directed fishery for pollock generally is finished prior to October; the labels are indicative full-year catches.\label{fig:catch_distn_b}](figs/catch_distn_b.png)   


![B-season EBS fleet-wide nominal pollock catch (kg) per hour of fishing recorded by NMFS scientific observers.\label{fig:bseas_cpue}](figs/cpue_bseason.png)   


![EBS pollock roe production in A and B seasons , 2000-2019.\label{fig:roe}](figs/roe.pdf)   


![EBS pollock fishery estimated catch-at-age data (in number) for 1992--2018. Age 10 represents pollock age 10 and older. The 2008 year-class is shaded in green.\label{fig:catage}](figs/catage.png)   

\clearpage



![Bottom-trawl survey biomass estimates with error bars representing 1 standard deviation (density-dependent correction method; DDC) for EBS pollock. Horizontal line represents the long-term mean. Note these values differ from the design-based versions in Table \ref{tab:bts_abund}.\label{fig:bts_biom}](figs/bts_biom.png)   


![Bottom and surface temperatures for the Bering Sea from the NMFS summer bottom-trawl surveys (1982--2018). Dashed lines represent mean values.\label{fig:bts_temp}](figs/bts_temp.pdf)   


![EBS pollock CPUE (shades = relative kg/hectare) and bottom temperature isotherms in degrees C; from the bottom trawl survey data 2011--2018.\label{fig:bts_temp_cpue}](figs/bts_temp_cpue.pdf)   


![Bottom trawl survey pollock catch in kg per hectare for 2016 - 2018. Height of vertical lines are proportional to station-specific pollock densities by weight (kg per hectare) with constant scales for all years.\label{fig:bts_3d}](figs/bts_3d.png)   


![Pollock abundance levels by age and year as estimated directly from the NMFS bottom-trawl surveys (1990--2019). The 2006,2008, and 2012 year-classes are shaded differently."  
16,at_age,"Pollock abundance at age estimates from the AT survey comparing the estimates based primarily on BTS age data used last year and the updates for this year's assessment.\label{fig:bts_age}](figs/bts_age_comp.png)   


![Pollock abundance levels by age and year as estimated directly from the NMFS bottom-trawl surveys (1990--2019) using standard 'design-based' (DB) and VAST approaches.\label{fig:vastage}](figs/ATS_age_update.png)   


![EBS pollock ATS transects (superimposed) over bottom-trawl survey stations and density estimates (in both settings contoured in the yellow-red heat map) for 2018.\label{fig:ats_bts}](figs/vastage.png)   
 

![Recent fishery average weight-at-age anomaly (relative to mean) by strata for ages 3--10, 2013--2017. Vertical shape reflects uncertainty in the data (wider shapes being more precise), colors are consistent with cohorts.\label{fig:fsh_wtage_strata}](figs/fsh_wtage_comb.pdf)   


![EBS pollock model evaluation results of female spawning biomass comparing model (and data) alternatives. Note that the 'with NBS' model is almost identical to model 16.1.\label{fig:mod_eval0a}](figs/fsh_wtage.pdf)   


![For the mature component of the EBS pollock stock, time series of estimated average age and diversity of ages (using the Shannon-Wiener H statistic), 1980--2018.\label{fig:age_diversity}](figs/fsh_wtage_strata.pdf)   


![Pollock index values for the standard survey region, the NBS, and combined based on the VAST application to density-dependent corrected CPUE values from the BTS data, 1982--2019. The different lines are smoothed trends for with and without including the cold-pool extent as a covariate.\label{fig:vast_idx}](figs/fsh_lw_month.png)   


![EBS pollock body mass (given length) anomaly (standardized by overall mean body mass at each length) by year and season/area strata, 1991--2018, aggregated by strata.\label{fig:fsh_lw_str_box}](figs/fsh_lw_str_yr_box.pdf)   


![EBS pollock body mass (given length) anomaly (standardized by overall mean body mass at each length) by year and season/area strata shown as mean values with a fitted loess smooth trend, 1991--2018.\label{fig:fsh_lw_str_yr_mean}](figs/fsh_lw_str_box.pdf)   


![Locations of stations used for the VAST moldel, 1982--2018.\label{fig:bts_data_by_yr}](figs/fsh_lw_str_yr_mean.pdf)   


![Plot of age-1 abundance for walleye pollock (orange; in millions) and Pacific cod (blue; in 1000s) as estimated in the 2018 stock assessments (Ianelli et al. 2018; Thompson 2018).\label{fig:risk}](figs/mod_data.pdf)   


![EBS pollock model evaluation results comparing model 16.1 (which assumes a Ricker stock-recruitment relationship) with that where a prior mean steepness of 0.67 and CV of 15% applied to a Beverton-Holt stock recruit relationship.\label{fig:bholt_ricker}](figs/mod_eval0c.pdf)   


![EBS pollock model evaluation results of recruitment comparing last year's model with this year.\label{fig:mod_eval0b}](figs/mod_eval0a.pdf)   


![EBS pollock model fit to the BTS biomass data (density dependence corrected estimates), 1982--2018.\label{fig:mod_bts_biom}](figs/mod_eval0b.pdf)   


![EBS pollock model evaluation results comparing model 16.1 (which assumes a Ricker stock-recruitment relationship) with that where a prior mean steepness of 0.67 and CV of 15% applied to a Beverton-Holt stock recruit relationship.\label{fig:bholt_ricker}](figs/bholt_ricker.pdf)   


![Model results of predicted and observed AVO index. Error bars represent assumed 95\% confidence bounds of the input series.\label{fig:mod_avo_fit}](figs/mod_cpue_fit.pdf)   


![Model estimates of bottom-trawl survey selectivity, 1982--2018.\label{fig:mod_bts_sel}](figs/mod_avo_fit.pdf)   


![EBS pollock model fit to the ATS biomass data, 1994--2018; green points to the right of vertical grey line are a preliminary treatment of applying a VAST model to the acoustic trawl survey data.\label{fig:mod_ats_biom}](figs/mod_bts_biom.pdf)   


![EBS pollock model fits to observed mean age for the Acoustic trawl survey (top)\label{fig:mod_mean_age}](figs/mod_ats_biom.pdf)   


![Selectivity at age estimates for the EBS pollock fishery.\label{fig:mod_fsh_sel}](figs/mod_mean_age.pdf)   


![Model fit (dots) to the EBS pollock fishery proportion-at-age data (columns; 1964--2017). The 2017 data are new to this year's assessment. Colors coincide with cohorts progressing through time.\label{fig:mod_fsh_age}](figs/mod_fsh_sel.pdf)   


![EBS pollock model fits to the Japanese fishery CPUE.\label{fig:mod_cpue_fit}](figs/mod_fsh_age.pdf)   


![Model fit (dots) to the bottom trawl survey proportion-at-age composition data (columns) for EBS pollock. Colors correspond to cohorts over time. Data new to this assessment are from 2018.\label{fig:mod_bts_age}](figs/mod_bts_sel.pdf)   


![Estimates of AT survey numbers (lower panel) and selectivity-at-age (with mean value equal to 1.0) over time (upper panel) for EBS pollock age 2 and older.\label{fig:mod_ats_ones}](figs/mod_bts_age.pdf)   


![Estimated spawning exploitation rate (defined as the percent removal of egg production in a given spawning year).\label{fig:mod_ser}](figs/mod_ats_age.pdf)   


![Integrated marginal posterior density (based on MCMC results) for the 2018 EBS pollock female spawning biomass compared to the point estimate (dashed red line). The mean of the posterior is shown in green (under the dashed line).\label{fig:mcmc_marg}](figs/mcmc_pairs.pdf)   


![EBS pollock fishery body mass (given length) anomaly (standardized by overall mean body mass at each length) by month based on some over 700 thousand fish measurements from 1991--2018.\label{fig:fsh_lw_month}](figs/mcmc_marg.pdf)   


![Estimated instantaneous age-specific fishing mortality rates for EBS pollock.\label{fig:mod_F}](figs/mod_ser.pdf)   


![Comparison of the current assessment results with past assessments of begin-year EBS age-3+ pollock biomass.\label{fig:mod_hist}](figs/mod_F.pdf)   


![Estimated spawning biomass relative to annually estimated $F_{MSY}$ values and fishing mortality rates for EBS pollock. Most recent two years are shaded in yellow\label{fig:mod_phase}](figs/mod_hist.pdf)   


![Recruitment estimates (age-1 recruits) for EBS pollock for all years since 1964 (1963--2017 year classes) for Model 16.1. Error bars reflect 90\% credible intervals based on model estimates of uncertainty.\label{fig:mod_rec}](figs/mod_phase.pdf)   


![Stock-recruitment estimates (shaded represnts structural uncertainty) and age-1 EBS pollock estimates labeled by year-classes\label{fig:mod_srr}](figs/mod_rec.pdf)   


![EBS pollock productivity as measured by logged recruits per spawning biomass, log(R\/S), as a function of spawning biomass with a linear fit (bottom) and over time, 1964--2018 (top).\label{fig:mod_rs}](figs/mod_srr.pdf)   


![NA\label{fig:bts_biom}](figs/mod_rs.pdf)   


![Projected EBS Tier 3 pollock yield (top) and female spawning biomass (bottom) relative to the long-term expected values under $F_{35\%}$ and $F_{40\%}$ (horizontal lines).  $B_{40\%}$  is computed from average recruitment from 1978--2017. Future harvest rates follow the guidelines specified under Tier 3 Scenario 1.\label{fig:tier3_proj}](figs/mod_retro.pdf)   


![Projected fishing mortality and spawning biomass relative to 2018 values under constant catch of 1.35 million t, 2019--2023.\label{fig:proj_const_catch}](figs/tier3_proj.pdf)   


![Pairwise plot of selected EBS pollock parameters and output from 3 million MCMC iterations thinned such that 5 thousand draws were saved as an approximation to the multivariate posterior distribution. Note that the figures on the diagonal represent the marginal posterior distributions. Key: lnR0 is the parameter that scales the stock-recruit relationship, B_Bmsy is estimated $B_{2017}/B_{MSY}$, DynB0 is the ratio of spawning biomass estimated for in 2018 over the value estimated that would occur if there had been no fishing, B18 is the spawning biomass in 2018, and B_Bmean is $B_{2018}/\bar{B}$.\label{fig:mcmc_pairs}](figs/future_F.pdf)   


![EBS pollock fishery body mass (given length) anomaly (standardized by overall mean body mass at each length) by year and season/area strata, 1991--2018.\label{fig:fsh_lw_str_yr_box}](figs/diversity.pdf)   

\clearpage


# EBS Pollock Model Description

## Dynamics

This assessment is based on a statistical age-structured model with the catch equation and population
dynamics model as described in Fournier and Archibald (1982) and elsewhere
(e.g., Hilborn and Walters 1992, Schnute and Richards 1995, McAllister and Ianelli
1997). The catch in numbers at age in year $t (C_{t,a})$ and total catch biomass $(Y_t)$
can be described as:

\begin{align}
    C_{t,a}     &= \frac{F_{t,a}}{Z_{t,a}} \left(1 - e^{-Z_{t,a}}\right) N_{t,a}, &1 \le t \le T, 1 \le a \le A \\
    N_{t+1,a+1} &= N_{t,a-1} e^{-Z_{t,a-1}}                                       &1 \le t \le T, 1 \le a < A   \\
    N_{t+1,A}   &= N_{t,A-1} e^{-Z_{t,A-1}} + N_{t,A} e^{-Z_{t,A}} ,              &1 \le t \le T                \\
    Z_{t,a}     &= F_{t,a} + M_{t,a}                                                                            \\
    C_{t,.}     &= \sum_{a=1}^A{C_{t,a}}                                                                        \\
    p_{t,a}     &= \frac{C_{t,a} } {C_{t,.} }                                                                   \\
    Y_{t}       &= \sum_{a=1}^A{w_{t,a}C_{t,a}}                                                                 \\
\end{align}

where
\begin{tabular}{ll}
$T$       & is the number of years, \\
$A$       & is the number of age classes in the population, \\
$N_{t,a}$ & is the number of fish age $a$ in year $t$, \\
$C_{t,a}$ & is the catch of age class $a$ in year $t$, \\
$p_{t,a}$ & is the proportion of the total catch in year $t$, that is in age class $a$, \\
$C_{t}$   & is the total catch in year $t$, \\
$w_{a}$   & is the mean body weight (kg) of fish in age class $a$, \\
$Y_{t}$   & is the total yield biomass in year $t$, \\
$F_{t,a}$ & is the instantaneous fishing mortality for age class $a$, in year $t$, \\
$M_{t,a}$ & is the instantaneous natural mortality in year $t$ for age class $a$, and \\
$Z_{t,a}$ & is the instantaneous total mortality for age class $a$, in year $t$. 
\end{tabular}

Fishing mortality ($F_{t,a}$) is specified as being semi-separable and non-parametric in form
with restrictions on the variability following Butterworth et al. (2003):

\begin{align}
    F_{t,a}     &= s_{t,a} \, \mu^f e^{\epsilon_t}, &\epsilon_t   \sim \mathcal{N}(0,\,\sigma_E^{2}) \\
    s_{t+1,a}   &= s_{t,a} \, \mu^f e^{\gamma_t},   &\gamma_t     \sim \mathcal{N}(0,\,\sigma_s^{2}) 
\end{align}

where $s_{t,a}$ is the selectivity for age class $a$ in year $t$, and $\mu^f$
is the median fishing mortality rate over time.

If the selectivities ($s_{t,a}$) are constant over time then fishing mortality
rate decomposes into an age component and a year component.  A curvature
penalty on the selectivity coefficients using the squared second-differences
to provide smoothness between ages.

Bottom-trawl survey selectivity was set to be asymptotic yet retain the
properties desired for the characteristics of this gear. Namely, that the
function should allow flexibility in selecting age 1 pollock over time. The
functional form of this selectivity was:

\begin{align}
    s_{t,a}     &= \left[ 1+e^{-\alpha_ta-\beta_t} \right]^{-1} , & a>1 \\
    s_{t,a}     &= \mu_se^{-\delta^\mu_t},                        & a=1 \\
    \alpha_{t}  &= \bar \alpha e^{\delta^\alpha_t},                     \\
    \beta_{t}  &= \bar \beta e^{\delta^\beta_t},                        
\end{align}

where the parameters of the selectivity function follow a random
walk process as in Dorn et al. (2000):

\begin{align}
    \delta_t^\mu  -  \delta_{t+1}^\mu     &\sim \mathcal{N}(0,\,\sigma_{\delta^\mu}^{2}) \\
    \alpha_t^\mu  -  \alpha_{t+1}^\mu     &\sim \mathcal{N}(0,\,\sigma_{\alpha^\mu}^{2}) \\
    \beta_t^\mu  -  \beta_{t+1}^\mu     &\sim \mathcal{N}(0,\,\sigma_{\beta^\mu}^{2}) 
\end{align}

The parameters to be estimated in this part of the model are thus for t=1982,
1983, 2016. The variance terms for these process error parameters were
specified to be 0.04.

In 2008 the AT survey selectivity approach was modified. As an option, the age
one pollock observed in this trawl can be treated as an index and are not
considered part of the age composition (which then ranges from age 2-15). This
was done to improve some interaction with the flexible selectivity smoother
that is used for this gear and was compared. Additionally, the annual
specification of input observation variance terms was allowed for the AT data.


A diagnostic approach to evaluate input variance specifications (via sample
size under multinomial assumptions) was added in this assessment. This method
uses residuals from mean ages together with the concept that the sample
variance of mean age (from a given annual data set) varies inversely with
input sample size. It can be shown that for a given set of input proportions
at age (up to the maximum age $A$)  and sample size $N_t$ for year $t$, an adjustment
factor $\nu$ for input sample size can be computed when compared with the
assessment model predicted proportions at age ($\hat p_{ta}$) and model predicted mean age
($\hat{\bar{a_t}}$):
\begin{align}
\nu   &= \text{var}\left( r^a_t \sqrt{\frac{N_t}{\kappa_t} }\right)^{-1} \\
r^a_t &= \bar a_t - \hat{\bar{a_t}}                                      \\
\kappa_t &= \left[ \sum_a^A {\bar a_t - \hat{\bar{a_t}}} \right]^{0.5}
\end{align}

where $r^a_t$ is the residual of mean age and
\begin{align}
\hat{\bar{a_t}} &= \sum_a^A{a \hat p_{ta}}\, \\
{\bar a_t}      &= \sum_a^A{a p_{ta}}\, 
\end{align}

For this assessment, we use the above relationship as a diagnostic for
evaluating input sample sizes by comparing model predicted mean ages with
observed mean ages and the implied 95% confidence bands. This method provided
support for modifying the frequency of allowing selectivity changes.
 
## Recruitment

In these analyses, recruitment ($R_t$) represents numbers of age-1 individuals
modeled as a stochastic  function of spawning stock biomass. 
\begin{align}
        R_t = f\left(B_{t-1} \right)
\end{align}
with mature spawning biomass during year $t$ was defined as:
\begin{align}
  B_t = \sum_{a=1}^A{ w_{t,a}\phi_aN_{t,a}} 
\end{align}

and, $\phi_a$ is the proportion of mature females at age is as shown in the sub-section
titled Natural mortality and maturity at age under "Parameters estimated
independently" above.

A reparameterized form for the stock-recruitment relationship following
Francis (1992) was used. For the optional Beverton-Holt form (the Ricker form
presented in Eq. 12 was adopted for this assessment) we have:
\begin{align}
R_t &= \frac{B_{t-1}e^{\varepsilon_t} }{\alpha+\beta B_{t-1} }
\end{align}

where 
\begin{tabular}{ll}
$R_t$       & is recruitment at age 1 in year $t$, \\
$B_t$       & is the biomass of mature spawning females in year $t$, \\
$\varepsilon_t$ & is  the recruitment anomaly for year $t$, ($\varepsilon_t   \sim \mathcal{N}(0,\,\sigma_R^{2}$ ) \\
$\alpha,\,\beta$    & are stock recruitment parameters. 
\end{tabular}

Values for the stock-recruitment function parameters  and  are calculated from
the values of  (the number of 0-year-olds in the absence of exploitation and
recruitment variability) and the steepness of the stock-recruit relationship
($h$). The steepness is the fraction of R0 to be expected (in the absence of
recruitment variability) when the mature biomass is reduced to 20% of its
pristine level (Francis 1992), so that:

\begin{align}
 \alpha &= \tilde B_0 \frac{1-h}{4h} \\
 \beta &= \frac{5h-1}{4hR_0 } 
\end{align}

where $\tilde B_0$ is the total egg production (or proxy, e.g., female
spawning biomass) in the absence of exploitation (and recruitment
variability) expressed as a fraction of $R_0$.

Some interpretation and further explanation follows. For steepness equal 0.2,
then recruits are a linear function of spawning biomass (implying no surplus
production). For steepness equal to 1.0, then recruitment is constant for all
levels of spawning stock size. A value of $h = 0.9$ implies that at 20% of the
unfished spawning stock size will result in an expected value of 90% unfished
recruitment level. Steepness of 0.7 is a commonly assumed default value for
the Beverton-Holt form (e.g., Kimura 1988). The prior distribution for
steepness used a beta distribution as in Ianelli et al. (2016). 
The prior on steepness was specified to be a symmetric form of the
Beta distribution with $\alpha = \beta = 14.93$ implying a prior mean of 0.5 and CV of
12% (implying that there is about a 14% chance that the steepness is greater
than 0.6). This conservative prior is consistent with previous years’
application and serves to constrain the stock-recruitment curve from favoring
steep slopes (uninformative priors result in $F_{MSY}$ values near an $F_{SPR}$ of about
$F_{18\%}$ a value considerably higher than the default proxy of $F_{35\%}$). The
residual pattern for the post-1977 recruits used in fitting the curve with a
more diffuse prior resulted in all estimated recruits being below the curve
for stock sizes less than $B_{MSY}$ (except for the 1978 year class). We believe
this to be driven primarily by the apparent negative-slope for recruits
relative to stock sizes above $B_{MSY}$ and as such, provides a potentially
unrealistic estimate of productivity at low stock sizes. This prior was
elicited from the rationale that residuals should be reasonably balanced
throughout the range of spawning stock sizes. Whereas this is somewhat
circular (i.e., using data for prior elicitation), the point here is that
residual patterns (typically ignored in these types of models) were 
qualitatively considered. 

In model 16.1, "Bholt", a Beverton Holt stock recruitment form was implemented
using the prior value of 0.67 for steepness and a CV of 0.17. This resulted in 
beta distribution parameters (for the prior) at $\alpha = 6.339$ and  
$\beta = 4.293$.

The value of $\sigma_R$ was set at 1.0 to
accommodate additional uncertainty in factors affecting recruitment
variability.

To have the critical value for the stock-recruitment function (steepness, _h_)
on the same scale for the Ricker model, we begin with the parameterization of
Kimura (1990):
\begin{align}
R_t &= \frac{B_{t-1}e^{\alpha \left(1-B_{t-1} \frac{R_0}{\psi_0} \right)}}{\psi_0}
\end{align}

It can be shown that the Ricker parameter a maps to steepness as:
\begin{align}
h &= \frac{e^\alpha}{e^\alpha+4}
\end{align}

so that the prior used on _h_ can be implemented in both the Ricker and
Beverton-Holt stock-recruitment forms. Here the term $\psi_0$ represents the equilibrium
unfished spawning biomass per-recruit.

## Diagnostics

In 2006 a replay feature was added where the time series of recruitment
estimates from a particular model is used to compute the subsequent abundance
expectation had no fishing occurred. These recruitments are adjusted from the
original estimates by the ratio of the expected recruitment given spawning
biomass (with and without fishing) and the estimated stock-recruitment curve.
I.e., the recruitment under no fishing is modified as:
$$R_t' = \hat{R}_t\frac{f(B_{t-1}')}{f(B_{t-1})}$$
where $R_t$ is the original recruitment estimate in year $t$ with $B_{t-1}'$ and $B_{t-1}$ representing
the stock-recruitment function given spawning biomass under no fishing and
under the estimated fishing intensity, respectively.

The assessment model code allows retrospective analyses (e.g., Parma 1993, and
Ianelli and Fournier 1998). This was designed to assist in specifying how
spawning biomass patterns (and uncertainty) have changed due to new data. The
retrospective approach simply uses the current model to evaluate how it may
change over time with the addition of new data based on the evolution of data
collected over the past several years.

## Parameter estimation

The objective function was simply the sum of the negative log-likelihood
function and logs of the prior distributions. To fit large numbers of
parameters in nonlinear models it is useful to be able to estimate certain
parameters in different stages. The ability to estimate stages is also
important in using robust likelihood functions since it is often undesirable
to use robust objective functions when models are far from a solution.
Consequently, in the early stages of estimation we use the following log-
likelihood function for the survey and fishery catch at age data (in numbers):

\begin{align}
nll(i) &= n \sum_{t,a}{ p_{ta} \ln \hat p_{ta} } \\
p_{ta} &= \frac{O_{ta}}{\sum_a{O_{ta}}} \hspace{20pt} 
\hat p_{ta} = \frac{\hat C_{ta}}{\sum_a{\hat C_{ta}}} \\
\mathbf{C} &= \mathbf{CE}  \\
\mathbf{E}  &=  \begin{array}{llll} 
b_{1,1} & b_{1,2} & \dots & b_{1,15} \\
b_{2,1} & b_{2,2} &       & b_{2,15} \\
\vdots &         & \ddots &  \vdots \\
b_{15,1} & b_{15,2} & \dots      & b_{15,15} 
\end{array}  
\end{align}

where $A$, and $T$, represent the number of age classes and years, respectively, n
is the sample size, and  represent the observed and predicted numbers at age
in the catch. The elements bi,j represent ageing mis-classification
proportions are based on independent agreement rates between otolith age
readers. For the models presented this year, the option for including aging
errors was re-evaluated.

Sample size values were revised and are shown in the main document. Strictly
speaking, the amount of data collected for this fishery indicates higher
values might be warranted. However, the standard multinomial sampling process
is not robust to violations of assumptions (Fournier et al. 1990).
Consequently, as the model fit approached a solution, we invoke a robust
likelihood function which fit proportions at age as:

\begin{align}
\prod_{a=1}^A\prod_{t=1}^T \left[\left( \exp{\left(-\frac{\left(p_{ta}-\hat p_{ta}\right)^2}{2\left(\eta_{ta}+0.1/A\right)\tau_t^2} \right)
}+0.01 \right) \times  \frac{1}{ {\sqrt{2\pi \left ( \eta_{ta}+0.1/A \right) \tau_t}} } \right]
\end{align}

Taking the logarithm we obtain the log-likelihood function for the age composition data:

\begin{align}
nll(i) = -0.5\sum_{a=1}^A\sum_{t=1}^T{
{\ln{2\pi \left( \eta_{ta}+0.1/A \right) 
-\sum_t^T A\ln\tau_t}} } 
+\sum_{a=1}^A\sum_{t=1}^T{\ln\left\{
\exp{\left(-\frac{\left(p_{ta}-\hat p_{ta}\right)^2}{\left(2\eta_{ta}+0.1/A\right)\tau_t^2} \right)
+ 0.01 } 
\right\}}
\end{align}

where 
\begin{align}
\eta_{ta} &=  p_{ta}(1-p_{ta})\\ 
\text{and} \\
\tau_t^2 &=  1/n_t 
\end{align}
which gives the variance for  $p_{ta}$
\begin{align}
(\eta_{ta}+0.1/A)\tau_t^2
\end{align}

Completing the estimation in this fashion reduces the model sensitivity to
data that would otherwise be considered outliers.

Within the model, predicted survey abundance accounted for within-year
mortality since surveys occur during the middle of the year. As in previous
years, we assumed that removals by the survey were insignificant (i.e., the
mortality of pollock caused by the survey was considered insignificant).
Consequently, a set of analogous catchability and selectivity terms were
estimated for fitting the survey observations as:

\begin{align}
\hat N_{ta}^s &= e^{-0.5Z_{ta}}N_{ta}q_t^ss_{ta}^S
\end{align}

where the superscript s indexes the type of survey (AT or BTS). For the option
to use the survey predictions in biomass terms instead of just abundance, the
above was modified to include observed survey biomass weights-at-age:

\begin{align}
\hat N_{ta}^s &= e^{-0.5Z_{ta}}w_{ta}N_{ta}q_t^ss_{ta}^S
\end{align}

For the AVO index, the values for selectivity were assumed to be the same as
for the AT survey and the mean weights at age over time was also assumed to be
equal to the values estimated for the AT survey.

For these analyses we chose to keep survey catchabilities constant over time
(though they are estimated separately for the AVO index and for the AT and
bottom trawl surveys). The contribution to the negative log-likelihood
function (ignoring constants) from the surveys is given by either the
lognormal distribution:

\begin{align}
nll(i) &= \sum_t{\frac{\ln(u_t^s/\hat N_t^s)^2}{2\sigma_{s,t}^2}}
\end{align}
where $u_t^s$ is the total (numerical abundance or optionally biomass) estimate with variance $\sigma_{s,t}$ from survey $s$ in year $t$ or optionally, the normal distribution can be selected:
\begin{align}
nll(i) &= \sum_t{\frac{(u_t^s - \hat N_t^s)^2}{2\sigma_{s,t}^2}}. \\
\end{align}


The AT survey and AVO index is modeled using a lognormal distribution whereas
for the BTS survey, a normal distribution was applied.     

For model configurations in which the BTS data are corrected for estimated
efficiency, a multivariate lognormal distribution was used. For the negative-
log likelihood component this was modeled as
\begin{equation}
nll_i = 0.5\mathbf{X}\Sigma^{-1}\mathbf{X}^{'}
\end{equation}

where is a vector of observed minus model predicted values for this index and
$\Sigma$ is the estimated covariance matrix provided from the method provided in
Kotwicki et al. 2014.

The contribution to the negative log-likelihood function for the observed total catch biomass 
($C_b^{obs}, \hat{C_b}$) by the fishery is given by
\begin{equation}
nll_i = 0.5\sum_t\frac{\ln(C_b^{obs}/\hat C_b)^2}{2\sigma_{C_b,t}^2}
\end{equation}

where $\sigma_{C_b,t}$ is pre-specified (set to 0.05) reflecting the accuracy of the
overall observed catch in biomass. Similarly, the contribution of prior
distributions (in negative log-density) to the log-likelihood function include
$\lambda_\varepsilon \sum_t\varepsilon_t^2 +\lambda_\gamma \sum_{ta}\gamma^2 +  \lambda_\delta \sum_t\delta_t^2$
where the size of the ’s represent prior assumptions about the variances of
these random variables. Most of these parameters are associated with year-to-
year and age specific deviations in selectivity coefficients. For a
presentation of this type of Bayesian approach to modeling errors-in-
variables, the reader is referred to Schnute (1994). To facilitate estimating
such a large number of parameters, automatic differentiation software extended
from Greiwank and Corliss (1991) and developed into C++ class libraries was
used. This software provided the derivative calculations needed for finding
the posterior mode via a quasi-Newton function minimization routine (e.g.,
Press et al. 1992). The model implementation language (ADModel Builder) gave
simple and rapid access to these routines and provided the ability estimate
the variance-covariance matrix for all dependent and independent parameters of
interest.

## Uncertainty in mean body mass
The approach we use to solve for $F_{MSY}$ and related quantities (e.g., $B_{MSY}$ $MSY$)
within a general integrated model context was shown in Ianelli et al. (2001).
In 2007 this was modified to include uncertainty in weight-at-age as an
explicit part of the uncertainty for $F_{MSY}$ calculations. This involved
estimating a vector of parameters ($w_{ta}^{future}$) on current (2017) and future mean weights
for each age $i$,  $i$= (1, 2,…,15), given actual observed mean and variances in
weight-at-age over the period 1991-2017. The values of based on available data
and (if this option is selected) estimates the parameters subject to the
natural constraint:
    $$w_{ta}^{future} \sim \mathcal{N}(\bar{w_{a}},\,\sigma_{w_a}^{2})$$ 
Note that this converges to the mean values over the time series of data (no
other likelihood component within the model is affected by future mean
weights-at-age) while retaining the natural uncertainty that can propagate
through estimates of $F_{MSY}$ uncertainty. This latter point is essentially a
requirement of the Tier 1 categorization.

Subsequently, this method was refined to account for current-year survey data and both 
cohort and year effects.  The model for this is:
\begin{align}
\hat{w}_{ta} &= \bar w_a e^\upsilon_t & a=1, \, t \ge 1964 \\
\hat{w}_{ta} &= \hat{w}_{t-1,a-1} + \Delta_a e^\psi_t & a > 1, \, t > 1964 \\
\Delta_a     &= \bar w_{a+1} - \bar w_a & a<A  \\
\bar w_a     &= \alpha \left\{L_1+ \left(L_2-L_1\right)\left(\frac{1-K^{a-1}}{1-K^{A-1}}\right)\right\}^3  \\
\end{align}
where the fixed effects parameters are $L_1, L_2, K,$ and $\alpha$ while the random effects parameters 
are $\upsilon_t$ and $\psi_t$. 

## Tier 1 projections

Tier 1 projections were calculated two ways. First, for 2017 and 2018 ABC and
$OFL$ levels, the harmonic mean $F_{MSY}$ value was computed and the analogous
harvest rate ($\bar{u_{HM}}$) applied to the estimated geometric mean fishable biomass at
$B_{MSY}$ :
\begin{align}
ABC_t &= B_{GM,t}^f \hat{u}_{HM}\zeta_t \\
B_{GM,t}^f &= e^{\ln{\hat{B}_t^f}-0.5\sigma_{B^f}^2} \\
u_{HM,t}^f &= e^{\ln{\hat{u}_{MSY,t}}-0.5\sigma_{u_{MSY}}^2} \\
\zeta_{t} &= \frac{B_t/B_{MSY}-0.05}{1-0.05} & B_t < B_{MSY} \\
\zeta_{t} &= 1.0 & B_t \ge  B_{MSY} 
\end{align}
where $\hat{B}_t^f$ is the point estimate of the fishable biomass defined (for
a given year): $\sum_a{N_as_{ta}w_{ta}}$ with $N_{ta}$, $s_{ta}$, and $w_{ta}$ the estimated population numbers
(begin year), selectivity and weights-at-age, respectively. $B_{MSY}$ and $B_{t}$ are
the point estimates spawning biomass levels at equilibrium $F_{MSY}$ and in year $t$
(at time of spawning). For these projections, catch must be specified (or
solved for if in the current year when $B_t$ < $B_{MSY}$). For longer term projections
a form of operating model (as has been presented for the evaluation of $B_{20\%}$)
with feedback (via future catch specifications) using the control rule and
assessment model would be required.



#```{r child = 'App.Rmd'}
#```
<!--
 #\tableofcontents

 #\listoftables

 #\listoffigures


-->
