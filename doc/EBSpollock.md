---
title: "Chapter 1: Assessment of the Walleye Pollock Stock \\ in the Eastern Bering Sea"
date: "20:09 October 24, 2020"
output:
  html_document:
    df_print: paged
  pdf_document:
    toc: true
    highlight: zenburn
    fig_caption: yes
    includes:
    keep_tex: yes
fontsize: 11pt
header-includes:
geometry: margin=1in
fontfamily: mathpazo
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
  7600 Sand Point Way NE., Seattle, WA 98115-6349 \\ October 24, 2020 \\ 
	\end{centering}
----


```
## Error in read_csv("../doc/data/fig_captions.csv"): could not find function "read_csv"
```


#  Executive summary

This chapter covers the Eastern Bering Sea (EBS) region—the Aleutian Islands
region (Chapter 1A) and the Bogoslof Island area (Chapter 1B) are presented
separately.

### Summary of changes in assessment inputs

Relative to last year’s BSAI SAFE report, the
following substantive changes have been made in the EBS pollock stock
assessment. Notably, a number of surveys were cancelled including the
 2019 NMFS bottom-trawl survey (BTS),
   the 2019 NMFS acoustic-trawl survey (ATS), and 
   th 2019 opportunistic acoustic data from vessels (AVO).  

#### Changes in the data
   2.  Observer data for catch-at-age and average weight-at-age from
   the 2018 fishery were finalized and included. 

   2.  Total catch as reported by NMFS Alaska Regional office was updated and included through 2019.
   
   2.  In summer 2019, the AFSC coordinated a survey conducted by three sailing drones (SD) using acoustics.

### Changes in the assessment methods

There were some minor changes to data used for the assessment model this year. 
We continued to refine treatment of survey data via spatial-temporal models
for  creating an alternative index including the broader region of the
northern Bering Sea, mainly by improving the documentation. 

## Summary of EBS pollock results
The following table applies for Model 16.2, the model used for last year's assessment
advice. An alternative table is provided for this same model but ignores the new Saildrone acoustic data collected in 2020.
as in past years,  the ABC recommendation reflects the Tier 3 estimate.

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
Projected total (age  3+) biomass (t) & 9,110,000 t & 8,156,000 t & 8,580,000 t & 7,990,000 t \\
Projected female  spawning  biomass (t) & 3,107,000 t & 2,725,000 t & 2,781,000  t & 2,476,000  t \\  
$B_0$ & 5,866,000 t & 5,866,000 t & 5,748,000  t & 5,748,000  t \\          
$B_{msy}$ & 2,280,000 t & 2,280,000 t & 2,147,000  t & 2,147,000  t \\          
$F_{OFL}$ & 0.645 & 0.645 & 0.528  & 0.528  \\                  
$maxF_{ABC}$  & 0.510 & 0.51  & 0.442  & 0.442  \\                  
$F_{ABC}$ & 0.356 & 0.375 & 0.253 & 0.262 \\                  
$OFL$ & 3,913,000 t & 3,082,000 t & 4,273,000  t & 3,458,000  t \\          
$maxABC$  & 3,096,000 t & 2,437,000 t & 3,578,000 t & 2,895,000 t \\      
$ABC$ & 2,163,000 t & 1,792,000 t & 2,045,000 t & 1,716,000  t \\        
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

The SSC recommended that a detailed review of the support for retaining the EBS Pollock assessment in Tier 1 
versus reclassifying it as Tier 3 be pursued in the 2020 assessment. 
    _We added a trade-off table between the applications of these two approaches._

The SSC had a number of recommendations for additional research supporting this assessment:  
  *   The SSC encourages further investigation of the apparent shift between a clear 2012 year-class to mixed 2012-2013 year classes in the data, suggestive of potentially variable ageing bias.   
    - _The 2019 fishery age data shows XXX relative proportion of these two year classes in the data..._ 
  *   Noting the work in deriving an external estimate of temporal variability in catchability for the bottom trawl survey (relative to the acoustic survey) due to vertical availability, the SSC noted that
catchability would logically also vary for the acoustic survey. 
The SSC encourages further work to develop the simultaneous modelling of these two surveys, accounting for vertical and distributional
shifts (including into the NBS). When sufficiently explored, the SSC looks forward to assessment model configurations that explore the 
use of a time-series from this method.  
  - _Work on this topic has stalled since survey model efforts focus on methods to incorporate the new Sail Drone acoustic data._

  *   The SSC supports ongoing genetic studies to determine the relationship between pollock in the NBS and EBS, as well as other surrounding regions (AI, GOA).  
  - _A post doctoral research has been assigned to undertake this work but progress has been limited due to lab access_
  *   The SSC supports the continued use of a formal decision table to illustrate risks of alternative harvest strategies.  
  - _This is again included in this year's assessment report_

  *   The SSC supports the GPT’s recommendation to revisit the treatment of all variance parameters in the next assessment,
particularly those that are set at fixed values (e.g., the value of 0.2 for the acoustic survey).
  - _This planned activity is only partially underway._

  * 	The SSC also looks forward to estimates of movement and abundance along the U.S.-Russia EEZ boundary based
on echosounders fixed to moorings in this area. 
     - _The moored sounders have been recovered in September 2020 but the data have yet to be processed_


xxxxThe Plan Team noted that if the survey index is going to include the NBS, then inclusion of
the NBS in compositional data should also be explored (although this should
not make much of a difference since the size compositions in the EBS and NBS
are sufficiently similar)

   -  _A model run with VAST processed age composition data was included and compared
with the survey standard estimates._        

Conduct a sensitivity test of the VAST index, with environmental covariates, 
by omitting one or two years of NBS data at a time.

   -  _Thanks to the work of Thorson 2019 we were able to evaluate an index that included
the extent of the cold pool as a covariate. Comparisons of index fitting out of sample
as suggested has been done for several of the publications using VAST_     

Regarding the apparent shift in year class dominance between 2012 and
2013, the possibility of a shift in mean length at age should be explored, as
should the possible influence of ageing error 

   -  _Age determination experts re-examined subsets of these data and 
    age estimates seems to be consistent and correct._        

Full treatment of both the existing model and models with alternative
treatments of the data should continue to be provided, along with maxABC
values under Tier 3 for all models.

   -  _Summary tables for alternative treatments of data including Tier 3 are provided._     
     

Re-examine the geographic subset of data currently used to develop the AVO
index, specifically to see if including Bristol Bay data improves the
correlation 

   - _Due to staffing issues, including the government shutdown, this was given low
   priority over other work._     

Explore “A” season trends in mean weight at length with a GAM or
similar technique, to determine if the trends are either predominantly
environmental or predominantly fishery-driven, Regarding $\sigma_R$, explore
alternative fixed values or estimation methods.

   - _Trends in mean weight given length are again presented. The extent that fishery 
    affects this pattern was shown to be related to timing. Further work is needed to 
    establish a mean baseline (in time and space) to try to sort out environmental 
    effects hypotheses. Values of $\sigma_R$ were explored in previous years, no further
    work was done on this in 2019._      


_We included an expanded evaluation of fishery performance this year. Specifically, we 
examined the spatial pattern of the fishery and developed a statistic of dispersion
of individual tows_

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
northern part of the shelf region between the 100 and 200 m isobaths
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
million t in 2009 to nearly 1.5 million t during 2003--2006 (Table
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
conditions, can comprise over 4\% of the catch in weight. The summer, or
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
2019 A-season fishery spatial pattern had relatively high concentrations of
fishing on the shelf north of Unimak Island and extended along the 200m depth
contour (Fig. \ref{fig:catch_distn_a}).  The 2019 A-season catch rates was very
high improving even on the good conditions observed in other recent A 
seasons (Fig. \ref{fig:aseas_cpue}). Beginning in 2017, due to  a regulatory
change, up to 45\% of the TAC could be taken in the A-season (previously only
40\% of the TAC could be taken). This conservation measure was made to allow
greater flexibility to avoid Chinook salmon in the B-season. To date, it
appears that the pollock fleet as a whole took advantage of  this added
flexibility (Fig. \ref{fig:prop_a_season}). While an important product from the
winter fishery is  the sale of pollock roe, production during the B-season is 
consistently about 10\% of the annual production (Fig. \ref{fig:roe}). 


The fishing in summer-fall 2019 was quite different than recent years
with fishing much more broadly distributed and concentrated along the 
shelf break. Catches in the northwestern
continued to increase relative 2017 and 2918 (Fig. \ref{fig:catch_distn_b}).   
The 2019 summer and fall (B-season) catch per hour fished was lower than the 
last few years (Fig. \ref{fig:bseas_cpue}).  Since 1979 the catch of EBS pollock has
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

As noted above, the 2019 B-season suggested that the fishery was dispersed and
experienced relatively low catch rates compared to recent years. Also, an approach
to computing fleet dispersion (the relative distance or spread of the fishery in space) 
was developed and indicated that while the A-season was the most intensely concentrated 
for the fleet during this season (since 2000), the B-season indicated the most dispersed
fishing activity over the same period (Fig \ref{fig:fleet_dispersal}).


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

From 1995--1999 84,100 km$^2$, or 22\% of the Steller sea lion critical
habitat was closed to the pollock fishery. Most of this closure consisted of
the 10 and 20 nm radius all-trawl fishery exclusion zones around sea lion
rookeries (48,920 km$^2$, or 13\% of critical habitat). The remainder was
largely management area 518 (35,180 km$^2$, or 9\% of critical habitat) that
was closed pursuant to an international agreement to protect spawning stocks
of central Bering Sea pollock. In 1999, an additional 83,080 km$^2$ (21%) of
critical habitat in the Aleutian Islands was closed to pollock fishing along
with 43,170 km$^2$  (11%) around sea lion haulouts in the GOA and Eastern
Bering Sea. In 1998, over 22,000 t of pollock were caught in the Aleutian
Island region, with over 17,000 t taken within critical habitat region.
Between 1999 and 2004 a directed fishery for pollock was prohibited in this
region. Subsequently, 210,350 km$^2$  (54%) of critical habitat was closed to
the pollock fishery. In 2000 the remaining phased-in reductions in the
proportions of seasonal TAC that could be caught within the BSAI Steller sea
lion Conservation Area (SCA) were implemented.

On the EBS shelf, an estimate (based on observer at-sea data) of the
proportion of pollock caught in the SCA has averaged about 44% annually.
During the A-season, the average is also about 44%. Nonetheless, the
proportion of pollock caught within the SCA varies considerably, presumably
due to temperature regimes and the relative population age structure.  The
annual proportion of catch within the SCA varies and has ranged from an annual
low of 11% in 2010 to high of 60% in 1998--the 2019 annual value was 58% but
and quite high again in the A-season (68\%; Table \ref{tab:catch_sca}).  The higher
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

XXXXXXXX
There were two directed pollock fishing closures:
b. Coordinates
Name	Description and effective date
Summer Herring Savings Area 1	That part of the Bering Sea subarea that is south of 57° N lat and between 162° and 164° W long from 1200 hours, A.l.t., June 15 through 1200 hours, A.l.t. July 1 of a fishing year.
Summer Herring Savings Area 2	That part of the Bering Sea subarea that is south of 56°30′′ N lat and between 164° and 167° W long from 1200 hours, A.l.t., July 1 through 1200 hours, A.l.t. August 15 of a fishing year.
Winter Herring Savings Area	That part of the Bering Sea subarea that is between 58° and 60° N lat and between 172° and 175° W long from 1200 hours, A.l.t. September 1 of the current fishing year through 1200 hours, A.l.t. March 1 of the succeeding fishing year.

Also, the Summer Herring Savings Area 2 was open in 2020, but the Summer Herring Savings Area 1 was closed (doesn't impact the fishery that much) and the Winter Herring Savings Area is closed from September 1, 2020 to March 1, 2021. The pollock exceeded the herring PSC limit late in the A season. For the B season the CV fleet has been working to avoid salmon, herring, and sablefish. Also to some extent squid.

Voluntary closures by the CV fleet for directed fishing for pollock.
2nd closure for trawl CVs for herring.
Closing an area in the horseshoe to pollock fishing for 5 days beginning tomorrow morning, September 3rd, at 8:00 am ADT.  The closure applies to all pollock fishing east of 166° 00' West Longitude, south of 54° 32" North Latitude, and inside of 80 fathoms.  The closure will end at 8:00 am ADT on Tuesday, September 8th.   This closure is intended to minimize herring bycatch in the horseshoe.    

1st closure for trawl CVs for herring.
To AFA Catcher Vessels:

Herring bycatch in the horseshoe this past week has reached a level that requires the fleet to take action to reduce their herring bycatch.  I propose that the CV fleet initiate a “voluntary” stand down on pollock fishing in the horseshoe area for 10 days starting at midnight on Tuesday, July 21st.    The voluntary closure would end at first light on the morning of Saturday, August 1st.  The closure area I am proposing would be to prohibit all pollock fishing south of 54° 50” north and east of 166° 00’ west.


## Economic conditions as of 2019

Alaska pollock is the dominant species in terms of catch in the Bering Sea \&
Aleutian Island (BSAI) region. In 2019 pollock accounted for 73\% of the
BSAI's FMP groundfish harvest and 92\% of the total pollock harvest in Alaska.
Retained catch of pollock increased 2.2\% to 1.41 million t in 2019 (Table \ref{tab:bsaiplck_exv}). BSAI
pollock first-wholesale value was \$1.55 billion 2019, which was 12\% increase
from 2018 and above the 2010--2014 average of \$1.26 billion (Table \ref{tab:bsaiplck_wsl}). The higher revenues
in recent years is the combined effect of strong catch and production levels and
a steady increase in the average first-wholesale price since 2016. The
increases in the average  first-wholesale price of pollock products in 2016 and 2017
were largely due to increases the price of surimi products while the price increase
in 2018 was largely due to an increase in the price of fillets. Price increases in 2019 
were the combined effect of price increases in both fillets and surimi.

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
U.S.-China trade war. However, Chinese tariffs on U.S. products could
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
shore-based sector increased 1\% to 710 kt. The value of these
deliveries (shore-based ex-vessel value) totaled \$259.8 million in 2019,
which was up 10\% from the ex-vessel value in 2018 driven mostly by a 7\%
increase in the ex-vessel price which is above the 2010-2014 average
(Table \ref{tab:bsaiplck_exv}). The first-wholesale value of pollock products was
\$920 million for the at-sea sector and \$630 million for the shore-based
sector (Table \ref{tab:bsaiplck_wsl}). The higher revenue in recent years is
combined effect of increased catch levels and price increases of pollock
products of fillet and surimi products. The
average price of pollock products in 2019 increased 9\% for the at-sea sector to
$1.38 and
increased 5\% for the shore-based sector to $1.12. Surimi pricesincreased 8\% 
and fillet prices increased 11\% in 2019. Roe prices decreased 26\%, however, 
production increased 36\% to the highest level observed over the last decade.

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
roughly \$0.21 per pound between 2010--2014 and has increased to an average of
\$0.27 per pound between 2015--2019.\footnote{The at-sea price
premium is the difference between the average price of first-wholesale
products at-sea and the average price of first-wholesale products shore-
based.}

### Pollock fillets

A variety of different fillets are produced from pollock, with pin-bone-out
(PBO) and deep-skin fillets typically accounting for approximately 70\% and
30\% of production in the BSAI, respectively. Deep-skin fillet's share of fillet
production was 33\% in 2019. Total fillet production increased 11.5\%
to 187 kt in 2019, and since 2010 has increased with aggregate production and
catch and was higher than the 2010--2014 average (Table
\ref{tab:bsaiplck_wsl}). The average price of fillet products in the BSAI
increased 11\% to \$1.52 per pound and is below the inflation adjusted average
price of fillets in 2010--2014 of \$1.69 per pound (2019 dollars).  Media
reports indicate that fillet prices tended to be
strong throughout much of 2019. Pollock fillets sourced from Russia
are the direct competitor to Alaska sourced pollock fillets.
Fillets were a relatively small portion of Russian primary production
however, they are increasing their fillet production capacity. Much of the
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
share of U.S. returning imports.} The U.S. industry has tried to maintain value by
increasing domestic marketing for fillet based product and creating product
types that are better suited to the American palette, in addition to increased
utilization of by-products. Reductions in global pollock supplies in 2020 reported by the
Groundfish Forum may upward pressure on pollock fillet prices.

### Surimi seafood

Surimi production in 2019 was 192.2 kt, which was down 2.2\%
and was above the 2010--2014 average. Prices have generally increased since 2013
and resumed their upward progress in 2019 increasing 8\% to \$1.37 (Table
\ref{tab:bsaiplck_wsl}). Because surimi and fillets are both made from pollock
meat, activity in the fillet market can influence the decision of processors
to produce surimi as smaller average size of fish can incentivize surimi
production, particularly if it yields a higher value than fillets. Additionally,
strong demand for surimi has put upward pressure on prices.

### Pollock roe

Roe is a high priced product that is the focus of the A season catch destined
primarily for Asian markets. Roe production in the BSAI tapered off in the
late--2000s and since has generally fluctuated at under or near 20 kt annually.
Roe production incrased to 28 kt in 2019
Production averaged 27 kt in 2005--2007 and was 20.6 kt in 2018, which was up
12\% from 2017 (Fig. \ref{fig:roe}). Prices peaked in the mid-2000s and have
followed a decreasing trend over the last decade which continued until 2015,
after which prices increased to \$2.89 per pound in 2018.
The Yen to U.S. Dollar exchange rate can influence prices and weakened against 
the Yen in 2019. The average roe price in the BSAI was down 26\% in
2019 to \$2.15 per pound, but value rose 1\% with the increase in
production to \$132.2 million (Table \ref{tab:bsaiplck_wsl}).

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
The oil production index incrased 15\% in 2019 and was at levels not seen 
since before 2015.



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
the BTS biomass estimates ranged from 2.28 to 8.39 million t 
(Table \ref{tab:bts_biom}; Fig. \ref{fig:bts_biom}). In the mid-1980s and early
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
"cold pool" (i.e., a defined area where water near bottom was less 
than zero degrees. In 2019, the mean bottom temperature was the warmest during
the period the survey has occurred (since 1982;  Fig. \ref{fig:bts_temp}).  

Beginning in 1987 NMFS expanded the standard survey area farther to the
northwest. The pollock biomass levels found in the two northern strata 
in 2019 was 9\%--considerably more than the 4.3% average for the four previous
survey years and the long-term average of 5\% (Table \ref{tab:bts_biom}). 
In some years (e.g.,
1997 and 1998) some stations had high catches of pollock in that region and
this resulted in high estimates of sampling uncertainty (CVs of 95\% and 65\%
for 1997 and 1998 respectively). This region is contiguous with the Russian
border and the NBS region, and measures to increase consideration of those regions
relative to exploited pollock stock continues.

The 2019 bottom-trawl survey biomass estimate (design-based, area swept) 
was 5.48 million t, above the average for this survey (4.7 million t). 
This is a substantial increase over the 3.11 million t estimated from
the 2018 estimates. Both years were unusual in
that there was a near-complete lack of cold water on the bottom 
throughout the survey area (Fig. \ref{fig:bts_temp_cpue}). 
Pollock appeared to be distributed more broadly over the shelf
 in 2019, different than in 2017 and 2018 where fish were more concentrated
  (Fig. \ref{fig:bts_3d}).  

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

The 2019 survey age compositions were developed from age-structures collected
during the survey (June-July) and processed at the AFSC labs within a few
weeks after the survey was completed. The level of sampling for lengths and
ages in the BTS is shown in (Table \ref{tab:bts_n}). The estimated numbers-at-
age from the BTS for strata (1--9 except for 1982--84 and 1986, when only strata
1--6 were surveyed) are presented in Table \ref{tab:bts_age} 
(based on the method in Kotwicki et al. 2014). Mean body mass at ages from the survey are
shown in (Table \ref{tab:wt_bts}) and the different alternative time series
of BTS survey indices is shown in Table \ref{tab:bts_abund}.

The bottom trawl survey has extended to the north in 2010, 2017, 2018 (limited
to 49 stations) and again this year. Given that the pollock abundance
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

Relative estimation errors for the total biomass were derived from a one-
dimensional (1D) geostatistical method, and accounts for observed spatial
structure for sampling along transects (Table \ref{tab:ats_biom}; Petitgas
1993, Walline 2007, Williamson and Traynor 1996). As in previous assessments,
the other sources of error (e.g., target strength, trawl selectivity) were
accounted for by inflating the annual error estimates to have an overall
average CV of 25\% for application within the assessment model. In 2018 we
estimated the 2018 EBS acoustic-trawl survey population numbers-at-age based
primarily on the BT survey age samples with supplemental samples from the AT
survey. In 2019 those data were updated using only the 2018 ATS age samples 
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
Honkalehto et al. (2011). We updated the data through 2019 and after
a gradual decline since 2015, the biomass was about the same as from 2018
(Table \ref{tab:avo}).

#  Analytic approach
##  General model structure
A statistical age-structured assessment model conceptually outlined in
Fournier and Archibald (1982) and like Methot’s (1990) stock synthesis model
was applied over the period 1964--2019. A technical description is 
presented in the Model Details section attached. The analysis was first 
introduced in the 1996 SAFE
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
BTS CPUE data _including stations from the NBS_ was expanded using
the VAST methods detailed in Thorson (2018).
This application included a spatio-temporal treatment of the age
composition data; differences were relatively minor compared to the
standard design-based expansion of ages (Fig. \ref{fig:vastage}).

A second data treatment also included the application of VAST
in which the cold pool extent (CPE) was modeled as a covariate 
(Thorson 2019b). Comparisons of this effect were relatively minor 
(e.g., Fig. \ref{fig:vast_idx}).

A third treatment included a preliminary evaluation of spatio-temporal
smoothing from the ATS data (index value differences shown in Table
 \ref{tab:bts_abund}).


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
and time-varying natural mortality are presented. As in past years the
estimates indicate higher values than used here.  In last year's evaluation of
natural mortality it was noted that the  survey age compositions favored lower
values of M while the fishery age  composition favored higher values.  This is
consistent with the patterns seen in the  BTS survey data as they show
increased abundances of “fully selected” cohorts. Hence, given the model
specification (asymptotic selectivity for the BTS age composition data), lower
natural mortality rates would be consistent with those data. Given these
trade-offs, structural model assumptions were held to be the same as previous
years for consistency (i.e., the mortality schedule presented above).

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
(Table \ref{tab:wtage}). The changes in weight-at-age in the fishery can be
substantial, especially for the apparent abundant year-classes (e.g., the 3--6
year-olds from 2015--2018 representing the 2012 year class; Fig.
\ref{fig:fsh_wtage_comb}).  To examine this more closely, we split the
bootstrap results into area-season strata and were able to get an overall
picture of the pattern by strata (Fig. \ref{fig:fsh_wtage_strata}) and
Fig. \ref{fig:fsh_wtage_strata_yr}).  

Extensive fishery observer data were available for examining patterns in
length-weight condition  (standardized for length over all years and areas,
1991--2018). The process for these data were:
 
   1. extract all data where non-zero measurements of pollock length and weight 
	 were available between the lengths of 35 and 60 cm for the EBS region

   2. compute the mean value of body mass (weight) for each cm length bin over all areas and time

   3. divide each weight measurement by that mean cm-specific value (the "standardization" step)

   4. plot these standardized values by different areas, years, months etc. to evaluate condition 
	 differences (pooling over ages is effective as there were no size-specific biases apparent)


In the first instance, the overarching seasonal pattern in body mass relative
to the mean shows that as the winter progresses prior to peak spawning,
pollock are generally skinnier than average whereas in July, the median is
about average (Fig. \ref{fig:fsh_lw_month}). As the summer/fall progresses,
fish were at their heaviest given length (Fig. \ref{fig:fsh_lw_month}). This
is also apparent when the data are aggregated by A- and B-seasons (and by east
and west of 170$^\circ$W; referred to as SE and NW respectively) when plotted
over time (Fig. \ref{fig:fsh_lw_str_yr_box}.
Last year we highlighted a concern of relatively poor condition (skinniness)
of  the A-season. However, as can be seen in Fig. \ref{fig:fsh_lw_str_yr_box},
the 2019 weight given length for A-season fish improved.


## Parameters estimated within the assessment model
For the selected model, 952 parameters were estimated conditioned on data and
model assumptions. Initial age composition, subsequent recruitment, and stock-
recruitment parameters account for 79 parameters. This includes vectors
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
components of fishing mortality result in  56 
parameters and the age-time
selectivity schedule forms a 10x56 matrix of 560 
parameters bringing the total
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
 estimates of sampling error, as represented in Fig. \ref{fig:bts_biom} along with the 
 covariance matrices (for the density-dependent and VAST index series); for the AT index
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
   in fishery mean weights-at-age estimated based on available data from 1991-2018 from the fishery (and 1982-2019 for the bottom-trawl survey
   data) and externally estimated variance terms as described in 
   Appendix 1A of Ianelli et al. (2016).    

Work evaluating temperature and predation-dependent effects on the stock-
recruitment estimates continues (Spencer et al. 2016). This approach modified
the estimation of the stock-recruitment relationship by including the effect
of temperature and predation mortality. A relationship between recruitment
residuals and temperature was noted (similar to that found in Mueter et al.,
2011) and lower pollock recruitment during warmer conditions might be
expected. Similar results relating summer temperature conditions to subsequent
pollock recruitment for recent years were also found by Yasumiishi et al.
(2015). 

# Results
## Model evaluation
A sequential sensitivity of available new data showed that adding the 2018
fishery  catch-at-age data and the 2019 catch biomass information was
relatively uninformative  with respect to spawning biomass estimates (Fig.
\ref{fig:mod_data}).  As the bottom trawl survey data was added to the
model, the biomass estimate dropped lower (Fig. \ref{fig:mod_data}).  We
evaluated a number of different assessment configurations and present the
following:

  0. Last year's model ("Model 16.1") without any data update (only for comparison purposes)

  1. The same as last year but with all data time series updated through the most recently available information       

 2. With Model 16.1 we evaluated the variability of the effective
  catchability of the bottom trawl survey for ages 3-8, the age range over
  which selectivity is allowed to vary. This pattern (and extent of
  variability) was compared with new independent analysis specifically dealing
  with the spatio-temporal patterns in 3 dimensions. 
    - This work provides new evidence on the extent of variability in
    effective catchability for the different survey gears used for assessing pollock.

  3. The same as last year but with the survey time series  including an alternative 
   treatment of the NBS indicative biomass (application of the VAST model for the bottom trawl  
   survey index). This step included the revised VAST derived age 
   compositions (Fig. \ref{fig:vastage}). 
      - The rationale for considering this is the likelihood that pollock in the NBS are related and 
		contribute to the EBS fishery     

  4. As with 3 but based Thorson's (2019) evaluation of including the cold pool extent
     as a covariate in creating an index.

  4. As with option 3 above including a preliminary treatment of using a 
  spatio-temporal model on just the acoustic-trawl survey data.
 

The reference model (Model 16.1) differed from models with different data
treatments. The recruitment and spawning biomass estimates were generally higher compared
to last year, and higher with the new data treatments, (Fig. \ref{fig:mod_eval0a}).
The recent recruitment pattern (at age 1) shows an increase in  the 2014 value
(representing the 2013 year-class) and a decline in the 2013 estimate (the
2012 year-class; Fig. \ref{fig:mod_eval0b}). Diagnostics of model fits between the
set evaluated are given in Table \ref{tab:mod_fits} and 
comparisons of management quantities are given in Table \ref{tab:mgt_quants}).

The BTS and ATS sample from distinct overlapping subsets of the water column:
the BT covers from bottom to midwater, and AT from midwater to surface.  The
proportion of fish available to each gear type depends on their vertical
distribution, which varies in space and time. In the current and past
assessments, this uncertainty counted as a type of process error (but with
somewhat subjective approach to specifying the degree of variability allowed).
A new method under development (Monnahan et al. in prep) that explicitly
models the vertical distribution of fish in discrete,  spatially-correlated
depth strata. This model accounts for vertically-overlapping gears and is
informed by both acoustic and bottom trawl data sets simultaneously.  These
capabilities were added to the spatio-temporal standardization software VAST
(Thorson 2019) which provides a convenient analysis platform and allows
inclusion of temporal smoothing and environmental covariates, among other
features.  Spatial patterns of pollock density for some selected years are
shown in Fig. \ref{fig:cole1} and the relative availability to the gear types
is shown in Fig. \ref{fig:cole2}). As the results become available, a model
configuration using the combined index will be meshed as a direct alternative
survey data  series fitting (e.g., by explicitly modeling survey
availability). 

This new study prompted an evaluation of the degree to which BTS selectivity 
(and effectively, catchability/availability) is allowed to vary over time. As
before, the two parameters governing the ascending slope and age at 50\% 
selected were modeled as 
random walk processes with a penalty (or prior constraint)
specified to balance fitting composition and trend data from
all sources reasonably. 
Profiling on the selectivity change constraint showed that, as parameterized 
via logistic parameters, a relatively high process error variance term (low penalty) 
still indicated that the model was not overfitting  different data components 
(e.g., the standard deviation of the normalized residuals (SDNR)
scores are near 1.0 and
not below (which would indicate over-fitting; Table \ref{tab:mod_prof_fits}.). 
This provided some objective justification for this specification and is illustrated
with the availability study (\ref{fig:q_sens}.). The impact of the 
assumption to allow effective catchability to vary appears to be conservative, with
more constraining selectivity changes resulting in higher spawning stock 
biomass estimates (Fig. \ref{fig:q_sens}.). 

The fit to the early Japanese fishery CPUE data (Low and Ikeda 1980) was
consistent with the estimated population trends for this period (Fig.
\ref{fig:mod_cpue_fit}).   The model fits the fishery- independent index from
the 2006--2019 AVO data well indicating a downward trend since 2015 but stabilizing
compared to 2018 values (Fig. \ref{fig:mod_avo_fit}). 
The fits to the bottom-trawl survey biomass (the
density-dependent corrected series) were reasonable (Fig.
\ref{fig:mod_bts_biom}). Similarly, the fits to the  acoustic-trawl survey
biomass series was consistent with the specified observation uncertainty (Fig.
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
pollock biomass index indicate that the model predicts fewer
pollock than observed in the 2014 and 2015 survey but slightly more than
observed in the since then (Fig. \ref{fig:mod_bts_biom}). The
pattern of bottom trawl survey age composition data in recent years shows a
decline in the abundance of older pollock since 2011. The 2006 year-class
observations are below model expectations in 2012 and 2013, partly due to the
fact that in 2010 the survey estimates are greater than the model predictions
(Fig. \ref{fig:mod_bts_age}). The model predicted much higher proportions of
age 6 (2012 year class) than observed in the 2018 survey data whereas the
expectations of 5-year old pollock was much lower than observations (both
surveys indicated that the 2013 year class was more abundant than the 2012
year-class).

The fit to the ATS biomass index 
survey generally falls within the confidence bounds of the survey sampling
distributions (here assumed to have an average CV of 25\%) with a reasonable
pattern of residuals (Fig. \ref{fig:mod_ats_biom}). The AT age compositions
consistently track large year classes through the population and the model
fits these patterns reasonably well (Fig. \ref{fig:mod_ats_age}).

As in past assessments, an evaluation of the multivariate posterior
distribution  was performed by running a chain of 3 million Monte-Carlo Markov
chain (MCMC) simulations and saving every 600th iteration (final posterior
draws totaled 5,000). A pairwise comparison for some key parameters could be
evaluated (along with their marginal distributions;  Fig.
\ref{fig:mcmc_pairs}). To compare the point estimates (highest posterior
density) with the mean of the posterior marginal distribution, overplotting
the former on the latter for the 2019 spawning biomass estimate were similar
(Fig. \ref{fig:mcmc_marg}). 


## Time series results
The time series of begin-year biomass estimates (ages 3 and older) suggests
that the abundance of Eastern Bering Sea pollock remained at a high level from
1982--88, with estimates ranging from 8 to 11 million t (Table \ref{tab:biom_3plus}). 
Historically, biomass levels increased from 1979 to
the mid-1980s due to the strong 1978 and relatively strong 1982 and 1984 year
classes recruiting to the fishable population. The stock is characterized by
peaks in the mid-1980s, the mid-1990s and again appears to be increasing to
new highs over 13 million t in 2016 following the low in 2008 of 
4.68 million t. The estimate for 
2019 is trending downward and at 
9.33 million t.
with 2020 estimated at round(M$age3plus1)/1000,2)` million t.

The level of fishing relative to biomass estimates show that the spawning
exploitation rate (SER, defined as the percent removal of egg production in
each spawning year) has been mostly below 20\% since 1980 (Fig. \ref{fig:mod_ser}).
During 2006 and 2007 the rate averaged more than 20\% and the average fishing
mortality for ages 3--8 increased during the period of stock decline. The
estimate for 2009 through 2019 was below 20\% due to the reductions in TACs
relative to the maximum permissible ABC values and increases in the spawning
biomass. The average F (ages 3--8) increased in 2011 to above 0.25 when the TAC
increased but has dropped since then and in 2019 is estimated at about 17\%.
Age specific fishing mortality rates reflect these patterns and show some
increases in the oldest ages from 2011--2013 but also indicate a decline in
recent years (Fig. \ref{fig:mod_F}). Last year's  estimates of age 3+ pollock
biomass were similar to the estimates (Fig. \ref{fig:mod_hist},
Table \ref{tab:biom_3plus}).

Estimated numbers-at-age are presented in (Table \ref{tab:est_n}) and
estimated catch-at-age values are presented in (Table \ref{tab:est_catage}).
Estimated summary biomass (age 3+), female spawning biomass, and age-1
recruitment are given in  (Table \ref{tab:biom_ssb_rec}).
To compare these estimates with mean values, and to show the relative
age composition of the population, Fig. \ref{fig:N_comp} shows the 
diminishing impact of the strong 2012 and 2013 year-classes in 2019 and 2020.
Applying the weights-at-age estimates and accumulating over ages shows that 
by 2020, the biomass will be below-average (Fig. \ref{fig:cum_N_wt}) and spawning
biomass will trend downwards (Fig. \ref{fig:cum_N_wt}).

To evaluate past management and assessment performance it can be useful to
examine estimated fishing mortality relative to reference values. For EBS
pollock, we computed the reference fishing mortality from Tier 1 (unadjusted)
and recalculated the historical values for $F_{MSY}$ (since selectivity has
changed over time). Since 1977 the current estimates of fishing mortality
suggest that during the early period, harvest rates were above $F_{MSY}$ until
about 1980. Since that time, the levels of fishing mortality have averaged
about 35\% of the $F_{MSY}$  level (Fig. \ref{fig:mod_phase}). 
Projections of spawning stock biomass given the 2020 estimate of
fishing mortality rate given catches equal to the 2019 values shows a 
decline through 2021 and then an increase after; albeit with 
considerable uncertainty due to uncertainty in recruitment 
(Fig. \ref{fig:proj_ssb}). 

## Recruitment
Model estimates indicate that the 2008, 2012, and 2013 year classes are 
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
1999) results in a fair amount of variability in both spawning biomass and
recruitment (Fig. \ref{fig:mod_retro}) Although the variability is high, the
average bias appears to be low with Mohns $\rho$ equal to 0.059
 for the 10 year retrospective and 0.104 if extended  back 20-years.

# Harvest recommendations
## Status summary

The estimate of $B_{MSY}$ is 2,147 kt (with a CV of 
25\%)  which is less than the projected 
2020 spawning biomass of 2,800 kt;  (Table
\ref{tab:res_summ}).  For 2019, the Tier 1 levels of yield are 
3,578,000 t from a fishable biomass estimated at around 8,088 kt
(Table \ref{tab:tier1_proj}; about 130\%  of the
$B_{MSY}$ level). A diagnostic (see section below on model details) on the impact 
of fishing shows that the 2019 spawning stock size is about 
60\%  of the predicted value had no fishing occurred
 since 1978 (Table \ref{tab:res_summ}). This compares with the 52\% 
of $B_{100}$\% (based on the SPR expansion using mean recruitment from 1978--2016) 
and 150\%
of $B_{MSY}$ (based on the estimated stock-recruitment curve). The latter two
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
maximum permissible ABC. The fishing mortality rate used to set ABC
($F_{ABC}$) may be less than this maximum permissible level, but not greater.
Estimates of reference points related to maximum sustainable yield (MSY) are
currently available. However, their reliability is questionable. We therefore
present both reference points for pollock in the BSAI to retain the option for
classification in either Tier 1 or Tier 3 of Amendment 56. These Tiers require
reference point estimates for biomass level determinations. Consistent with
other groundfish stocks, the following values are based on recruitment
estimates from post-1976 spawning events:

\begin{table}[ht]
\begin{tabular}{lr}
$B_{MSY}$    &=	2,147 kt female spawning biomass    \\
$B_{0}$      &=	5,748 kt female spawning biomass    \\
$B_{100\%}$  &=	6,165 kt female spawning biomass   \\
$B_{40\%}$   &=	2,466 kt female spawning biomass    \\
$B_{35\%}$   &=	2,158 kt female spawning biomass    \\
\end{tabular}
\end{table}

## Specification of OFL and Maximum Permissible ABC

Assuming the stock-recruit relationship the 2020 spawning biomass is
estimated to be 2,781,000 t (at the time of spawning, assuming the stock is
fished at about recent catch levels). This is above the $B_{MSY}$ value of 
2,147,000 t. Under Amendment 56, this stock has qualified under Tier 1 and
the harmonic mean value is considered a risk-averse policy since reliable
estimates of $F_{MSY}$ and its pdf are available (Thompson 1996). The
exploitation- rate type value that corresponds to the $F_{MSY}$ level was
applied to the fishable biomass for computing ABC levels. For a future year,
the fishable biomass is defined as the sum over ages of predicted begin-year
numbers multiplied by age specific fishery selectivity (normalized to the
value at age 6) and mean body mass. The uncertainty in the average
weights-at-age projected for the fishery and “future selectivity” has been
demonstrated to affect the buffer between ABC and OFL (computed as 1-ABC/OFL)
for Tier 1 maximum permissible ABC (Ianelli et al. 2015). The uncertainty in
future mean weights-at-age had a relatively large impact as did the
selectivity estimation.

Since the 2020 female spawning biomass is estimated to be above the $B_{MSY}$ level
(2,147 kt) and the $B_{40\%}$ value (2,466 kt) in 2020 and if the 2019 catch
is as specified above, then the OFL and maximum permissible ABC values by the
different Tiers would be:

\begin{table}[ht]
\centering
\begin{tabular}{lrlr}
  \hline
Tier & Year & MaxABC & OFL \\ 
  \hline
1a & 2020 & 3,578,000 & 4,273,000 \\ 
  1a & 2021 & 2,895,000 & 3,458,000 \\ 
   \hline
3a & 2020 & 2,045,000 & 2,539,000 \\ 
  3a & 2021 & 1,716,000 & 2,098,000 \\ 
   \hline
\end{tabular}
\end{table}

## Standard Harvest Scenarios and Projection Methodology
A standard set of projections is required for each stock managed under Tiers
1, 2, or 3 of Amendment 56 to the FMP. This set of projections encompasses
seven harvest scenarios designed to satisfy the requirements of Amendment 56,
the National Environmental Policy Act, and the Magnuson-Stevens Fishery
Conservation and Management Act (MSFCMA). While EBS pollock is generally
considered to fall within Tier 1, the standard projection model requires
knowledge of future uncertainty in $F_{MSY}$ . Since this would require a
number of additional assumptions that presume future knowledge about
stock-recruit uncertainty, the projections in this subsection are based on
Tier 3.

For each scenario, the projections begin with the vector of 2019 numbers
at age estimated in the assessment. This vector is then projected forward to
the beginning of 2020 using the schedules of natural mortality and
selectivity described in the assessment and the best available estimate of
total (year- end) catch assumed for 2019. In each subsequent year, the
fishing mortality rate is prescribed on the basis of the spawning biomass in
that year and the respective harvest scenario. Annual recruits are simulated
from an inverse Gaussian distribution whose parameters consist of maximum
likelihood estimates determined from the estimated age-1 recruits. Spawning
biomass is computed in each year based on the time of peak spawning and the
maturity and weight schedules described in the assessment. Total catch is
assumed to equal the catch associated with the respective harvest scenario in
all years. This projection scheme is run 1,000 times to obtain distributions
of possible future stock sizes and catches under alternative fishing mortality
rate scenarios.

Five of the seven standard scenarios will be used in an Environmental
Assessment prepared in conjunction with the final SAFE. These five scenarios,
which are designed to provide a range of harvest alternatives that are likely
to bracket the final TAC for 2020, are as follows (“$maxFABC$” refers to
the maximum permissible value of FABC under Amendment 56):

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
2019 (Tables 35 through \ref{tab:tier3_SSB} for Model 16.1 and for 16.2--the 
configuration that uses the NBS VAST data set). Under the
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
above, and stay above the overfished level.

## ABC Recommendation 
ABC levels are affected by estimates of $F_{MSY}$ which
depends principally on the estimated stock-recruitment steepness parameter,
demographic schedules such as selectivity-at-age, maturity, and growth. The
current stock size (both spawning and fishable) is estimated to be  at
above-average levels and projections indicate declines.  Updated data and
analysis result in an estimate of 2019 spawning biomass (3,220
kt) which is about  150\% of $B_{MSY}$ 
(2,147 kt).  This follows a period of increases from
2008--2017 and is expected. The extent that the stock will decline
further depends  on recruitment, which is always uncertain.
Some issues to consider in  the medium-term are that

1.  The conditions in summer 2019 were exceptional with another near absence
of a "cold pool", very warm conditions on the inner part of the EBS shelf, and
being a third consecutive  year with significant abundances found outside of
the standard survey area.

2.  Recruitment since the 2013 year class is below average and this
is expected to reduce spawning biomass below $B_{MSY}$ by 2021. 

3.  The BTS data continue to show low abundances of pollock aged 10 and older
(Table \ref{tab:bts_age}). Historically there had been good representation of
older fish in data from this survey. 

5.  The multispecies model suggests that the $B_{MSY}$ level is around 2.9
million t instead of the  2.1 million t estimated in the
current assessment (noting that the total natural mortality is higher in the
multispecies model).

9.  Pollock are an important prey species for other species in the ecosystem and apparent changes in the 
    distribution may shift their availability as prey. 

11. Given the same estimated aggregate fishing effort in 2019, the 
estimated stock trend is downwards except at low catch levels. Furthermore, 
the ability to catch roughly the same amount as in 2019 
through to 2022 will require more effort (effectively) and will result
in further declines in spawning biomass.

### Should the ABC be reduced below the maximum permissible ABC? 

The SSC in its September 2018 minutes recommended that assessment authors and
Plan Teams use the risk matrix table below when determining whether to
recommend an ABC lower than the maximum permissible. 

\pagebreak

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
a  considerable redistribution into the northern part of the Bering Sea. 
Recruitment in the near term could be below average yet projections
assume average recruitment (with uncertainty).
Additional age-specific aspects of the spawning population indicates that the
stock has recovered somewhat from  a low diversity of ages (for both the
population and the mean age of the spawning stock weighted by spawning output
Fig. \ref{fig:age_diversity}). **We therefore rated the population-dynamic
concern as level 2, a substantially increased concern.**

*Environmental/Ecosystem considerations* The winter of 2018/2019 began with
near-average accumulation of sea ice in the Bering Sea  during December and
January, but warm moist winds from the southwest persisted throughout
February and reduced sea ice extent to low levels (only 2018 was lower). 
Winter sea ice patterns and the resulting extent of the cold pool in summer were similar between
2018 and 2019 (Thoman in 2019 EBS ESR) due to these unusual wind patterns. 
Ecosystem  indicators from 2018 may provide insights into 2019 conditions for
pollock. In 2018, warm  water temperatures and higher salinity north of St.
Lawrence Island may have  contributed to the northward movement of pollock
into the northern Bering Sea (see Eisner et al. in 2019 EBS ESR). With warm
conditions persisting through  winter 2018/2019, pollock
may have remained in the northern Bering Sea or moved along the shelf
(north or south) early in the spring/summer of 2019. The 2018 year class 
apparently experienced favorable conditions between a cooler summer as age-0s (2018)
followed by a  warmer spring as age-1s in 2019 (see Yasumiishi in 2019 EBS ESR). 

The 2018 year class was sampled using surface trawls in the southern and
northern Bering Sea  as age-0 in late summer 2018. Summer of 2018 was warm
(above-average thermal conditions) and age-0 fish had low energy density
across the shelf (see Siddon et al. and   Sewall et al. 2019 EBS ESR). The
mean size of the 2018 year class was average but their  biomass index was
below average (Whitehouse in 2019 EBS ESR). However, anomalous winds from  the
southwest during February 2019 may have bolstered productivity over the shelf,
 sustained metabolic demands, and subsidized overwinter survival of the 2018
year class of  pollock. 
 
 The 2019 condition of juvenile (age-1) and adult pollock based on
 length-weight residuals was assessed in the southern and northern survey
 regions. Over the southern shelf, age-1 pollock have had positive
 length-weight residuals for the past 4 years while adult  pollock had
 negative residuals in 2017-2018, but switched to positive residuals in 2019. 
 The negative values are driven by fish sampled in the inner domain where
 unprecedentedly  warm temperatures may have tested metabolic limits. Over the
 northern shelf, age-1 pollock  had positive residuals (although less positive
 than 2018) while adult pollock continued  negative residuals for the past 3
 years (see Laman in 2019 EBS ESR). Over the southern  shelf, abundance
 increased 53% while biomass increased 75%, indicating movement of adult  fish
 back over the southern shelf. In the northern Bering Sea, abundance increased
 59%, but  biomass decreased 11%, indicating successful recruitment of younger
 age classes of pollock  over the northern shelf. 

*Prey:* Small copepods form the prey base for larval to early juvenile pollock
during spring.  Late juvenile pollock feed on a variety of planktonic
crustaceans, including calanoid  copepods and euphausiids (principally
_Thysanoessa inermis_ and _T. raschii_). Pollock diets  become more piscivorous
with age and cannibalism is commonly observed.

The number of small copepods available to juvenile pollock across the shelf
during spring  2019 was high compared to historical abundances and increased
from spring to fall, indicating  good foraging conditions for larval and
juvenile pollock early in the year. However, the  abundance of large
(typically more lipid-rich) copepods was low overall (lower than in 2018). 
Although direct measurements of euphausiid abundances for both 2018 and 2019
indicate low  abundances, age-0 fish diets from 2018 contained over 50%
euphausiids, suggesting euphausiids  may provide an alternative, lipid-rich
prey source when large copepods are not as abundant.   Indirect information on
prey resources for pollock is discussed below under ‘Competitors’.

*Predators:* Pollock are cannibalistic and rates of cannibalism might be
expected to increase as the biomass of older, larger fish increases concurrent
with increases  in juvenile abundance. With the lack of a cold pool over the
southern shelf or thermal  barrier between the southern and northern shelves,
spatial overlap and the potential for  cannibalism are increased.  Warmer
waters also increase the metabolic demand and potentially increase foraging
rates; the CEATTLE multispecies model indicates an increase in demand of
individual predators, although total mortality is reduced relative to high
levels in 2016 due to declines in abundance of older conspecifics and adult
cod.   Other predators of pollock include northern fur seals. At this  time
there are no indicators that suggest these populations are increasing in the
eastern  Bering Sea (although note that the Bogoslof Island population of
northern fur seals is  increasing while the Pribilof Islands populations are
decreasing; see C. Kuhn ‘Noteworthy’ in  the 2019 EBS ESR). Fur seal
consumption of adult pollock generally increases in years when  juvenile
pollock are less abundant (Kuhn).


*Competitors:* While historical recruitment trends between Pacific cod and
walleye pollock have mirrored each other, suggesting the species respond
similarly to  environmental conditions, the timeseries appear to decouple
after approximately 2010 and may  indicate broad-scale transitions in the
southeastern Bering Sea ecosystem (e.g., from  pelagic- to benthic-dominated
production;  Fig \ref{fig:poll_cod}). The mechanisms driving early life  history survival
versus recruitment success of Pacific cod and walleye pollock may differ 
based on pelagic versus benthic habitat associations (e.g., prey
availability). The  decoupling of abundance timeseries after 2010 suggests a
shift (or greater disparity) between  drivers of survival in these two
populations.

A widespread die-off event of short-tailed shearwaters began in the SEBS in
June 2019 and extended into the NBS and Chukchi Sea in August. These events may
reflect 2018 conditions as shearwaters feed in the Bering Sea in summer before
migrating to the southern hemisphere for breeding during the winter. Most
sampled birds showed signs of emaciation; shearwaters are planktivorous birds
and feed on euphausiids.  

The following are notes on ecosystem aspects that may affect the survival 
of recruits from the 2018 and 2019 year classes.

*2018 year class:*     

  - The 2018 year class experienced favorable conditions between a cooler summer as age-0s (2018) followed by a warmer spring as age-1s (2019);     

  - The 2018 year class of age-0 fish had low energy density across the shelf, average mean size, and below average biomass index;      

  - Anomalous winds from the southwest during February 2019 may have bolstered productivity over the shelf, sustained metabolic demands, and subsidized overwinter survival of the 2018 year class;     

  - The 2019 Shearwater die-off events could reflect feeding conditions (i.e., euphausiids) in the EBS in 2018.

*2019 year class:*     

  - Second winter of low sea ice extent in the eastern Bering Sea (only 2018 was lower);     

  - A small cold pool occurred in 2019 and may have impacted pollock movement and distribution;     

  - 2019 condition (length-weight residuals) of age-1 pollock was positive over the entire shelf; adult pollock condition was positive in the south, but negative in the north;     

  - Over the southern shelf, abundance increased 53% while biomass increased 75%, indicating movement of adult fish to the region;     

  - Over the northern shelf, abundance increased 59%, but biomass decreased 11\%, indicating successful recruitment of younger age classes;      

  - Small copepod abundance was high, indicating good foraging conditions for larval  and juvenile pollock early in the year;      

  - Large copepod abundance was low overall;     

  - Low abundances of euphausiids were observed in 2018 (MACE acoustic survey) and 2019 (RPA RZA), but age-0 fish diets from 2018 contained over 50% euphausiids;     

  - Lack of cold pool over the southern shelf and thermal barrier between the southern and northern shelves suggests spatial overlap and the potential for cannibalism are increased;     

  - the 2019 year class may experience higher rates of cannibalism due to adult biomass returning over the shelf (75% increase in 2019) and the apparent strong 2018 year class;

  - Fur seal consumption of adult pollock increases in years when juvenile pollock are less abundant;     

  - The decoupling of abundance timeseries for Pacific cod and walleye pollock after 2010 suggests a shift in drivers of survival in these two populations. Mechanistic understanding of recruitment drivers is less well-known than for pollock.     

**We therefore rated the Ecosystem concern as Level 2, substantially increased concern.**
Some indicators showing adverse signals relevant to the stock but the pattern was inconsistent across indicators.

*Fishery performance* As noted above, the 2019 B-season suggested that the
fishery was dispersed and experienced relatively low catch rates compared to
recent years. Also, an approach to computing fleet dispersion (the relative
distance or spread of the fishery in space)  was developed and indicated that
while the A-season was the most intensely concentrated  for the fleet during
this season (since 2000), the B-season indicated the most dispersed fishing
activity over the same period (Fig \ref{fig:fleet_dispersal}).

The pollock fishery was challenged to simultaneously avoid a number of PSC
species.  Chinook salmon (a top priority) encounters were relatively high and
some sectors exceeded  their performance standard (which was lowered due to a
2018 index of Chinook salmon abundance  from three key western Alaska rivers
rivers falling below a specified threshold thus requiring 
lower cap limits in 2019). The encounter rates were 
high this year probably because the returning salmon were
high (in fact, in 2019 the 3-river index was well above the threshold that
triggers a lower performance standard). Chum salmon encounter rates were high
as well during some periods of summer 2019 and the fleet moved to avoid them.
Finally, a high abundance of sablefish and low region-specific OFL set for the
EBS put them on PSC status and the fleet took active avoidance measures for
the entire B-season.

Given the combination of pollock being broadly distributed into the EBS shelf region during the
summer (based on survey data), and the fact that the pollock fleet were more widely dispersed
than seen in recent decades indicates that **fishery performance could be scored a 2, 
substantially increased concerns.**

These results are summarized as:
\begin{table}[h]
\begin{tabular}{L{1.125in}L{1.125in}L{1.125in}L{1.125in}L{1.125in} }
\hline
 \multicolumn{4}{c}{Considerations}  & \\
Assessment-related & Population dynamics & Environmental or ecosystem
&Fisheries& Score (max of individual) \\
\hline
Level 1: No concern               & Level 2: Substantially increased concerns &
Level 2: Substantially increased concerns & Level 2: Substantially increased concerns  & 
Level 2: Substantially increased concerns \\
\hline
\end{tabular}
\end{table}

The overall score is level 2, the maximum of the individual scores, suggests
that setting an ABC below the maximum permissible is warranted. The SSC
recommended against using a table that showed example alternatives to select
buffers based on that risk level. Thompson (unpublished Sept 2018 plan team
document) tabulated the magnitude of buffers applied by the Plan Teams for the
period 2003--2017, and found that the mode of the buffers recommended was
10--20\%. Using this as a guideline, a buffer of 15\% would give an ABC as
$0.85 \times \text{ABC}_{max}$ = 
3,041 
kt). In the past,
the SSC has considered factors similar to those presented above  and selected
an ABC based on Tier 3 estimates. We recommend this added precaution 
again this year, (i.e., ABC = 2,045 kt)  which implies a
buffer of  43\%.   The SSC requested
"an explicit set of concerns that explain the ABC adjustment." In response, we
direct attention to the decision table \ref{tab:dec_table}) and the fact that the biological basis 
for the continued stock productivity has most to do with the OY constraint
which has  effectively maintained fishery production at around 1.3 million t
since 1990. Demonstrations that would allow fishing to near $F_{MSY}$ catch
quantities would show that catch  variability would be extremely high (and
unrealistic give current capacity and OY limits for combined BSAI groundfish;
Ianelli 2005). Furthermore, the frequency of being at much lower spawning
stock sizes would be much higher, and would likely be riskier and fishing
effort would need to be much higher. While the biological basis for ABC
setting is founded in  sound conservation of spawning biomass, the history of
the current fishery productivity should inform desirable biomass. In only 5
of the 38 years since 1981 has the stock been below the $B_{MSY}$ level (13%
of the years). The mean spawning biomass over this period has  averaged about
30% higher than the estimated $B_{MSY}$. In terms of an actual "management
target", Punt et al. (2013) developed some robust estimators for $B_{MEY}$
(Maximum Economic Yield) noting that a typical target would be 1.2$\times
B_{MSY}$. In this case that would make the female spawning biomass target at
2.576 million t. It therefore  seems worth considering
making an explicit harvest control rule that achieves the  productivity and
ecosystem stability given the catches and biomass estimates 
observed over  the past 30 years. 

Recognizing that the actual catch will be constrained by other factors (the 2
million t BSAI groundfish catch limit and bycatch avoidance measures), 
applying the maximum permissible Tier 1a ABC seems clearly risky. Such high
catches would result in unprecedented variability and removals from the stock
(and require considerably more capacity and effort). Less variability in catch
 would also result in less spawning stock variability (and reduce risks to the
fishery should another period of poor recruitments occur).  To more fully
evaluate these considerations performance indicators as modified from Ianelli
et al. (2012) were developed to evaluate some near-term risks given 
alternative 2020 catch values.  These indicators and rationale for
including them are summarized in Table \ref{tab:dec_tab_rationale}).   Model
16.1 results for these indicators are provided in  Table \ref{tab:dec_table}.
Each column of this table uses a fixed 2020 catch and assumes the same
effort  for the four additional projection years (2021--2024).
 Given this specification , there is a low probability that any of the catches
  shown in the first row would exceed the $F_{MSY}$ level.  Also, in the near
term it appears unlikely that the spawning stock will be below $B_{MSY}$ (rows
3 and 4).  Relative to the historical mean spawning biomass, by 2020 it
is more likely than not that the spawning biomass will be lower than the
historical mean (fifth row). The range of catches examined have relatively
small or no impact on  the age diversity indicators. However, for catch to
equal the 2019 value, more fishing effort will likely be required and there is
a good chance that the proportion of the stock less than age 6 will be
greater than the historical average. In terms of catch advice, the results presented in 
the decision table indicates that catches above 1.0 million t will very likely result in 
2021 spawning stock estimates being below the long term mean (but above $B_{MSY}$).
  
# Additional ecosystem considerations

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
Zeppelin and Ream 2006). Currently, a multi-agency project is investigating 
diet properties and forage related issues for northern fur seals (See
https://tinyurl.com/y3vcg54e).

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
target species is small relative to the magnitude of the fishery  (Table
\ref{tab:nontargbycatch}). Jellyfish represent the largest component of the
bycatch of non-target species and had averaged around 5--6 kt per year but
more than doubled in 2014 but has dropped in 2015 and been about average since
then. The data on non-target species shows a high degree of inter-annual
variability, which reflects the spatial variability of the fishery and high
observation error. This variability may reduce the ability to detect
significant trends for bycatch species.

The catch of other target species in the pollock fishery (defined as any trawl
 set where the catch represents more than 80\% of the catch) represents less
than 1% of the total pollock catch. Incidental catch of Pacific cod has varied
but in the past three years it is about half of the 2011 and 2012 levels
(Table \ref{tab:fmpbycatch}).  There has been a marked in increase in the
incidental catch of Pacific ocean perch, sablefish, and Atka mackerel and a
decrease in flatfish species. Proportionately, the incidental catch decreased
since the overall levels of pollock catch have increased since 2008. In fact,
the bycatch of pollock in other target fisheries is more than double the
bycatch of target species in the pollock fishery (Table
\ref{tab:pollbycatch}).

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

  -  Continue to investigate using spatial processes for estimation purposes (e.g.,
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

 - Expand genetic sample collections for pollock (and process available samples) and apply high resolution genetic tools for stock structure analyses.

# Acknowledgments
We thank the survey staff who always collect samples diligently, especially
this year when extra effort was required to process data due to unforeseen
problems with vessel operations.  The AFSC age-and-growth department is
thanked for their continued excellence in promptly processing the samples used
in this assessment.  Finally, thanks to the many colleagues who provided edits
and suggestions to improve this document.


\clearpage
# References {#references}

\setlength{\parindent}{-0.2in}
\setlength{\leftskip}{0.2in}
\setlength{\parskip}{3pt}
\noindent

Alaska Fisheries Science Center (AFSC). 2016. Wholesale market profiles for Alaska groundfish and crab fisheries. 134 p. Alaska Fish. Sci. Cent., NOAA, Natl. Mar. Fish. Serv., 7600 San Point Way NE, Seattle WA 98115. 

Aydin, K. Y., et al.2002. A comparison of the Eastern Bering and western Bering Sea shelf and slope ecosystems through the use of mass-balance food web models. U.S. Department of Commerce, Seattle, WA. (NOAA Technical Memorandum NMFS-AFSC-130) 78p. 

Bacheler, N.M., L. Ciannelli, K.M. Bailey, and J.T. Duffy-Anderson. 2010. Spatial and temporal patterns of walleye pollock (_Theragra chalcogramma_) spawning in the eastern Bering Sea inferred from egg and larval distributions. Fish. Oceanogr. 19:2. 107-120. 

Bailey, K.M., T.J. Quinn, P. Bentzen, and W.S. Grant. 1999. Population structure and dynamics of walleye pollock, _Theragra chalcogramma_. Advances in Mar. Biol. 37:179-255. 

Bailey, K. M. 2000. Shifting control of recruitment of walleye pollock _Theragra chalcogramma_ after a major climatic and ecosystem change. Mar. Ecol. Prog. Ser., 198, 215–224. [link](http://doi.org/10.3354/meps198215)

Barbeaux, S. J., S. Gaichas, J. N. Ianelli, and M. W. Dorn. 2005. Evaluation of biological sampling protocols for at-sea groundfish observers in Alaska. Alaska Fisheries Research Bulletin 11(2):82-101.

Barbeaux, S.J., Horne, J., Ianelli, J. 2014. A novel approach for estimating location and scale specific fishing exploitation rate of eastern Bering Sea walleye pollock (_Theragra chalcogramma_). Fish. Res. 153 p. 69 – 82. 

Brodeur, R.D.; Wilson, M.T.; Ciannelli, L.; Doyle, M. and Napp, J.M. (2002). Interannual and regional variability in distribution and ecology of juvenile pollock and their prey in frontal structures of the Bering Sea. Deep-Sea Research II. 49: 6051-6067.

Butterworth, D.S., J.N. Ianelli, and R. Hilborn. 2003. A statistical model for stock assessment of southern bluefin tuna with temporal changes in selectivity. Afr. J. mar. Sci. 25: 331-361.

Buckley, T.W., Greig, A., Boldt, J.L., 2009. Describing summer pelagic habitat over the continental shelf in the eastern Bering Sea, 1982–2006. United States Depart- ment of Commerce, NOAA Technical Memorandum. NMFS-AFSC-196. pp. 49.

Buckley, T. W., Ortiz, I., Kotwicki, S., & Aydin, K. (2015). Summer diet composition of walleye pollock and predator-prey relationships with copepods and euphausiids in the eastern Bering Sea, 1987-2011. Deep-Sea Research Part II: Topical Studies in Oceanography, 134, 302–311. [link](http://doi.org/10.1016/j.dsr2.2015.10.009).

Canino, M.F., P.T. O’Reilly, L. Hauser, and P. Bentzen. 2005. Genetic differentiation in walleye pollock (_Theragra chalcogramma_) in response to selection at the pantophysin (Pan I) locus. Can. J. Fish. Aquat. Sci. 62:2519-2529.

Ciannelli, L., B.W. Robson, R.C. Francis, K. Aydin, and R.D. Brodeur 2004a. Boundaries of open marine ecosystems: an application to the Pribilof Archipelago, southeast Bering Sea. Ecological Applications, Volume 14, No. 3. pp. 942-953.

Ciannelli, L.; Brodeur, R.D., and Napp, J.M. 2004b. Foraging impact on zooplankton by age-0 walleye pollock (_Theragra chalcogramma_) around a front in the southeast Bering Sea. Marine Biology. 144: 515-525.

Clark, W.G. 1999. Effects of an erroneous natural mortality rate on a simple age-structured model. Can. J. Fish. Aquat. Sci. 56:1721-1731.

Cooper, D. W., Duffy-Anderson, J. T., Norcross, B. L., Holladay, B. A., \& Stabeno, P. J. (2014). Nursery areas of juvenile northern rock sole (_Lepidopsetta polyxystra_) in the eastern Bering Sea in relation to hydrography and thermal regimes. ICES Journal of Marine Science, 71(7), 1683–1695. doi:10.1093/icesjms/fst210

Cotter, A.J.R., L. Burt, C.G.M Paxton, C. Fernandez, S.T. Buckland, and  J.X Pan. 2004. Are stock assessment methods too complicated?  Fish and Fisheries, 5:235-254.

Cotter, A. J. R., Mesnil, B., and Piet, G. J. 2007. Estimating stock parameters from trawl cpue-at-age series using year-class curves. – ICES Journal of Marine Science, 64: 234–247.

Coyle, K. O., Eisner, L. B., Mueter, F. J., Pinchuk, A. I., Janout, M. A., Cieciel, K. D., … Andrews, A. G. (2011). Climate change in the southeastern Bering Sea: impacts on pollock stocks and implications for the oscillating control hypothesis. Fisheries Oceanography, 20(2), 139–156. doi:10.1111/j.1365-2419.2011.00574.x

De Robertis, A., and K. Williams. 2008. Weight-length relationships in fisheries studies: the standard allometric model should be applied with caution. Trans. Am. Fish. Soc. 137:707-719. 

De Robertis, A., McKelvey, D.R., and Ressler, P.H. 2010. Development and application of empirical multi-frequency methods for backscatter classification in the North Pacific. Can. J. Fish. Aquat. Sci. 67: 1459-1474.

De Robertis, A., Taylor, K., Wilson, C., and Farley, E. 2017. Abundance and Distribution of Arctic cod (Boreogadus saida) and other Pelagic Fishes over the U.S. Continental Shelf of the Northern Bering and Chukchi Seas Deep-Sea Research II, 135: 51-65.

Dorn, M.W. 1992. Detecting environmental covariates of Pacific whiting Merluccius productus growth using a growth-increment regression model. Fish. Bull. 90:260-275.

Duffy-Anderson, J. T., Barbeaux, S. J., Farley, E., Heintz, R., Horne, J. K., Parker-Stetter, S. L., … Smart, T. I. (2016). The critical first year of life of walleye pollock (Gadus chalcogrammus) in the eastern Bering Sea: Implications for recruitment and future research. Deep-Sea Research Part II: Topical Studies in Oceanography, 134, 283–301. [link](http://doi.org/10.1016/j.dsr2.2015.02.001).

Eisner, L., J. Gann, K. Cieciel. 2019. “Variations in Temperature and Salinity During Late Summer/ Early Fall 2002-2018 in the Eastern Bering Sea - BASIS.” In Siddon, E., and Zador, S., 2019. Ecosystem Status Report 2019: Eastern Bering Sea, Stock Assessment and Fishery Evaluation Report, North Pacific Fishery Management Council, 605 W 4th Ave, Suite 306, Anchorage, AK 99501.  

Fissel, B., M. Dalton, R. Felthoven, B. Garber-Yonts, A. Haynie, A. Himes-Cornell, S. Kasperski, J. Lee, D. Lew,  and C. Seung. 2014. Stock assessment and fishery evaluation report for the Groundfish fisheries of the Gulf of Alaska and Bering Sea/Aleutian Islands area: Economic status of the groundfish fisheries off Alaska, 2013.

Fournier, D.A. and C.P. Archibald. 1982. A general theory for analyzing catch-at-age data. Can. J. Fish. Aquat. Sci. 39:1195-1207.

Fournier, D.A., J.R. Sibert, J. Majkowski, and J. Hampton. 1990. MULTIFAN a likelihood-based method for estimating growth parameters and age composition from multiple length frequency samples with an application to southern bluefin tuna (Thunnus maccoyii). Can. J. Fish. Aquat. Sci. 47:301-317.

Francis, R.I.C.C., and Shotton, R. 1997. Risk in fisheries management: a review. Can. J. Fish. Aquat. Sci.54: 1699–1715.

Francis, R.I.C.C. 1992. Use of risk analysis to assess fishery management strategies:  a case study using orange roughy (Hoplostethus atlanticus) on the Chatham Rise, New Zealand. Can. J. Fish. Aquat. Sci. 49: 922-930.

Francis, R I C C 2011. Data weighting in statistical fisheries stock assessment models. Can. Journ. Fish. Aquat. Sci. 1138: 1124-1138. 
 
Gann, J. C., Eisner, L. B., Porter, S., Watson, J. T., Cieciel, K. D., Mordy, C. W., Farley, E. V. (2015). Possible mechanism linking ocean conditions to low body weight and poor recruitment of age-0 walleye pollock (_Gadus chalcogrammus_) in the southeast Bering Sea during 2007. Deep Sea Research Part II: Topical Studies in Oceanography, 134, 1–13. [link](http://doi.org/10.1016/j.dsr2.2015.07.010).

Gislason, H., Daan, N., Rice, J. C., \& Pope, J. G. (2010). Size, growth, temperature and the natural mortality of marine fish. Fish and Fisheries, 11(2), 149–158. doi:10.1111/j.1467-2979.2009.00350.

Grant, W. S., Spies, I., and Canino, M. F. 2010. Shifting-balance stock structure in North Pacific walleye pollock (_Gadus chalcogrammus_). – ICES Journal of Marine Science, 67:1686-1696.

Greiwank, A., and G.F. Corliss (eds.) 1991. Automatic differentiation of algorithms: theory, implementation and application. Proceedings of the SIAM Workshop on the Automatic Differentiation of Algorithms, held Jan. 6-8, Breckenridge, CO. Soc. Indust. And Applied Mathematics, Philadelphia.

Guenneugues, P., & Ianelli, J. (2013). Surimi Resources and Market. In Surimi and Surimi Seafood, Third Edition (pp. 25–54). CRC Press. [link](http://doi.org/10.1201/b16009-4).

Haynie, A. C. (2014). Changing usage and value in the Western Alaska Community Development Quota (CDQ) program. Fisheries Science, 80(2), 181–191. [link](http://doi.org/10.1007/s12562-014-0723-0 ).

Heintz, R. a., Siddon, E. C., Farley, E. V., & Napp, J. M. (2013). Correlation between recruitment and fall condition of age-0 pollock (_Theragra chalcogramma_) from the eastern Bering Sea under varying climate conditions. Deep Sea Research Part II: Topical Studies in Oceanography, 94, 150–156. [link](http://doi.org/10.1016/j.dsr2.2013.04.006).

Hinckley, S. 1987. The reproductive biology of walleye pollock, _Theragra chalcogramma_, in the Bering Sea, with reference to spawning stock structure. Fish. Bull. 85:481-498.

Hollowed, A. B., J. N. Ianelli, and P. A. Livingston. 2000. Including predation mortality in stock assessments: A case study involving Gulf of Alaska walleye pollock. ICES Journal of Marine Science, 57, pp. 279-293.

Hollowed, A. B., Aydin, K. Y., Essington, T. E., Ianelli, J. N., Megrey, B. a, Punt, A. E., \& Smith, A. D. M. (2011). Experience with quantitative ecosystem assessment tools in the northeast Pacific. Fish and Fisheries, 12(2), 189–208. doi:10.1111/j.1467-2979.2011.00413.

Hollowed, A. B., Barbeaux, S. J., Cokelet, E. D., Farley, E., Kotwicki, S., Ressler, P. H., … Wilson, C. D. 2012. Effects of climate variations on pelagic ocean habitats and their role in structuring forage fish distributions in the Bering Sea. Deep Sea Research Part II: Topical Studies in Oceanography, 65-70, 230–250. doi:10.1016/j.dsr2.2012.02.008

Honkalehto, T., Ressler, P.H., Towler, R.H., Wilson, C.D., 2011. Using acoustic data from fishing vessels to estimate walleye pollock (_Theragra chalcogramma_) abundance in the eastern Bering Sea. 2011. Can. J. Fish. Aquat. Sci. 68: 1231–1242

Honkalehto, T., D. McKelvey, and N. Williamson. 2005. Results of the echo integration-trawl survey of walleye pollock (_Theragra chalcogramma_) on the U.S. and Russian Bering Sea shelf in June and July 2004. AFSC Processed Rep. 2005-02, 43 p. 

Honkalehto, T, A. McCarthy, P. Ressler, K. Williams, and D. Jones. 2012. Results of the Acoustic-Trawl Survey of Walleye Pollock (_Theragra chalcogramma_) on the U.S. and Russian Bering Sea Shelf in June - August 2010. AFSC Processed Rep. 2012-01, 57 p. Alaska Fish. Sci. Cent., NOAA, Natl. Mar. Fish. Serv., 7600 Sand Point Way NE, Seattle WA 98115. 

Honkalehto, T., A. McCarthy, P. Ressler, and D. Jones, 2013. Results of the acoustic-trawl survey of walleye pollock (_Theragra chalcogramma_) on the U.S., and Russian Bering Sea shelf in June–August 2012 (DY1207). AFSC Processed Rep. 2013-02, 60 p. Alaska Fish. Sci. Cent. NOAA, Natl. Mar. Fish. Serv., 7600 Sand Point Way NE, Seattle WA 98115. [Available](http://www.afsc.noaa.gov/Publications/ProcRpt/PR2013-02.pdf)

Honkalehto, T, P. H. Ressler, S. C. Stienessen, Z. Berkowitz, R. H. Towler, a. L. Mccarthy, and R. R. Lauth. 2014. Acoustic Vessel-of-Opportunity (AVO) index for midwater Bering Sea walleye pollock, 2012-2013. AFSC Processed Rep. 2014-04, 19 p. Alaska Fish. Sci. Cent., NOAA, Natl. Mar. Fish. Serv., 7600 Sand Point Way NE, Seattle WA 98115. [Available](http://www.afsc.noaa.gov/Publications/ProcRpt/PR2013-02.pdf)

Honkalehto, T,  and A. McCarthy.  2015. Results of the Acoustic-Trawl Survey of Walleye Pollock (_Gaddus chalcogrammus_) on the U.S. and Russian Bering Sea Shelf in June - August 2014. AFSC Processed Rep. 2015-07, 62 p. Alaska Fish. Sci. Cent., NOAA, Natl. Mar. Fish. Serv., 7600 Sand Point Way NE, Seattle WA 98115. [Available](http://www.afsc.noaa.gov/Publications/ProcRpt/ PR2015-07.pdf)

Hulson, P.-J.F., Miller, S.E., Ianelli, J.N., and Quinn, T.J., II. 2011. Including mark–recapture data into a spatial age-structured model: walleye pollock (_Theragra chalcogramma_) in the eastern Bering Sea. Can. J. Fish. Aquat. Sci. 68(9): 1625–1634. doi:10.1139/f2011-060.

Hulson, P. F., Quinn, T. J., Hanselman, D. H., Ianelli, J. N. (2013). Spatial modeling of Bering Sea walleye pollock with integrated age-structured assessment models in a changing environment. Canadian Journal of Fisheries \& Aquatic Sciences, 70(9), 1402-1416. doi:10.1139/cjfas-2013-0020.

Hunt Jr., G.L., Coyle, K.O., Eisner, L.B., Farley, E.V., Heintz, R.A., Mueter, F., Napp, J.M., Overland, J.E., Ressler, P.H., Salo, S., Stabeno, P.J., 2011. Climate impacts on eastern Bering Sea foodwebs: a synthesis of new data and an assessment of the Oscillating Control Hypothesis. ICES J. Mar. Sci. 68 (6), 1230–1243. [link](http://dx.doi. org/10.1093/icesjms/fsr036).

Ianelli, J.N. 2005. Assessment and Fisheries Management of Eastern Bering Sea Walleye Pollock: is Sustainability Luck Bulletin of Marine Science, Volume 76, Number 2, April 2005 , pp. 321-336(16)

Ianelli, J.N. and D.A. Fournier. 1998. Alternative age-structured analyses of the NRC simulated stock assessment data. In Restrepo, V.R. [ed.]. Analyses of simulated data sets in support of the NRC study on stock assessment methods. NOAA Tech. Memo. NMFS-F/SPO-30. 96 p.

Ianelli, J.N., L. Fritz, T. Honkalehto, N. Williamson and G. Walters 1998. Bering Sea-Aleutian Islands Walleye Pollock Assessment for 1999. In: Stock assessment and fishery evaluation report for the groundfish resources of the Bering Sea/Aleutian Islands regions. North Pac. Fish. Mgmt. Council, Anchorage, AK, section 1:1-79.

Ianelli, J.N., S. Barbeaux, T. Honkalehto, N. Williamson and G. Walters. 2003. Bering Sea-Aleutian Islands Walleye Pollock Assessment for 2003. In: Stock assessment and fishery evaluation report for the groundfish resources of the Bering Sea/Aleutian Islands regions. North Pac. Fish. Mgmt. Council, Anchorage, AK, section 1:1-101.

Ianelli, J.N., S. Barbeaux, T. Honkalehto, S. Kotwicki, K. Aydin and N. Williamson. 2011. Assessment of the walleye pollock stock in the Eastern Bering Sea. In Stock assessment and fishery evaluation report for the groundfish resources of the Bering Sea/Aleutian Islands regions. North Pac. Fish. Mgmt. Council, Anchorage, AK, section 1:58-157.

Ianelli, J.N., T. Honkalehto, S. Barbeaux, S. Kotwicki, K. Aydin, and N. Williamson, 2013. Assessment of the walleye pollock stock in the Eastern Bering Sea, pp. 51-156. In Stock assessment and fishery evaluation report for the groundfish resources of the Bering Sea/Aleutian Islands regions for 2014. North Pacific Fishery Management Council, Anchorage, AK. [Available](http://www.afsc.noaa.gov/REFM/docs/2013/EBSpollock.pdf)

Ianelli, J.N., T. Honkalehto, S. Barbeaux, S. Kotwicki, B. Fissel, and K. Holsman, 2016. Assessment of the walleye pollock stock in the Eastern Bering Sea, pp. 51-156. In Stock assessment and fishery evaluation report for the groundfish resources of the Bering Sea/Aleutian Islands regions for 2017. North Pacific Fishery Management Council, Anchorage, AK. [Available](http://www.afsc.noaa.gov/REFM/docs/2016/EBSpollock.pdf)

Ianelli, J.N., A.B. Hollowed, A.C. Haynie, F.J. Mueter, and N.A. Bond. 2011. Evaluating management strategies for eastern Bering Sea walleye pollock (_Theragra chalcogramma_) in a changing environment. ICES Journal of Marine Science, doi:10.1093/icesjms/fsr010.

Ianelli, J.N. and D.L. Stram. 2014. Estimating impacts of the pollock fishery bycatch on western Alaska Chinook salmon. ICES Journal of Marine Science. doi:10.1093/icesjms/fsu173

Jensen, A. 1996. Beverton and Holt life history invariants result from optimal trade-off of reproduction and survival. Canadian Journal of Fisheries and Aquatic Sciences 53, 820–822.

Johnson, K. F., Monnahan, C. C., McGilliard, C. R., Vert-pre, K. A., Anderson, S. C., Cunningham, C. J., … Punt, A. E. (2015). Time-varying natural mortality in fisheries stock assessment models: identifying a default approach. ICES Journal of Marine Science, 72(1), 137–150. [link](http://doi.org/10.1093/icesjms/fsu055).

Jurado-Molina J., P. A. Livingston and J. N. Ianelli. 2005. Incorporating predation interactions to a statistical catch-at-age model for a predator-prey system in the eastern Bering Sea. Canadian Journal of Fisheries and Aquatic Sciences. 62(8): 1865-1873.

Kastelle, C. R., and Kimura, D. K. 2006. Age validation of walleye pollock (_Theragra chalcogramma_) from the Gulf of Alaska using the disequilibrium of Pb-210 and Ra-226. e ICES Journal of Marine Science, 63: 1520e1529.

Kimura, D.K. 1989. Variability in estimating catch-in-numbers-at-age and its impact on cohort analysis. In R.J. Beamish and G.A. McFarlane (eds.), Effects on ocean variability on recruitment and an evaluation of parameters used in stock assessment models. Can. Spec. Publ. Fish. Aq. Sci. 108:57-66.

Kimura, D.K., J.J. Lyons, S.E. MacLellan, and B.J. Goetz. 1992. Effects of year-class strength on age determination. Aust. J. Mar. Freshwater Res. 43:1221-8.

Kimura, D.K., C.R. Kastelle , B.J. Goetz, C.M. Gburski, and A.V. Buslov. 2006. Corroborating ages of walleye pollock (_Theragra chalcogramma_), Australian J. of Marine and Freshwater Research 57:323-332.

Kotenev, B.N. and A.I. Glubokov. 2007. Walleye pollock _Theregra chalcogramma_ from the Navarin Region and adjacent waters of the Bering Sea: ecology, biology, and stock structure. Moscow VNIRO publishing. 180p. 

Kotwicki, S., T.W. Buckley, T. Honkalehto, and G. Walters. 2004. Comparison of walleye pollock data collected on the Eastern Bering Sea shelf by bottom trawl and echo integration trawl surveys. (poster presentation available at: ftp://ftp.afsc.noaa.gov/posters/pKotwicki01 pollock.pdf).

Kotwicki, S., T.W. Buckley, T. Honkalehto, and G. Walters. 2005. Variation in the distribution of walleye pollock (_Theragra chalcogramma_) with temperature and implications for seasonal migration. Fish. Bull 103:574–587. 

Kotwicki, S., A. DeRobertis, P. vonSzalay, and R. Towler. 2009. The effect of light intensity on the availability of walleye pollock (_Theragra chalcogramma_) to bottom trawl and acoustic surveys. Can. J. Fisheries and Aquatic Science. 66(6): 983–994.

Kotwicki, S. and Lauth R.R. 2013. Detecting temporal trends and environmentally-driven changes in the spatial distribution of groundfishes and crabs on the eastern Bering Sea shelf. Deep-Sea Research Part II: Topical Studies in Oceanography. 94:231-243.

Kotwicki, S., Ianelli, J. N., \& Punt, A. E. 2014. Correcting density-dependent effects in abundance estimates from bottom-trawl surveys. ICES Journal of Marine Science, 71(5), 1107–1116.

Kuhn, C., J. Sterling, E. McHuron. 2019. "Contrasting Trends in Northern Fur Seal Foraging E ort Between St. Paul and Bogoslof Islands: 2019 Preliminary Results." In Siddon, E., and Zador, S., 2019. Ecosystem Status Report 2019: Eastern Bering Sea, Stock Assessment and Fishery Evaluation Report, North Pacific Fishery Management Council, 605 W 4th Ave, Suite 306, Anchorage, AK 99501.

Laman, N. 2019. "Eastern and Northern Bering Sea Groundsh Condition." In Siddon, E., and Zador, S., 2019. Ecosystem Status Report 2019: Eastern Bering Sea, Stock Assessment and Fishery Evaluation Report, North Pacific Fishery Management Council, 605 W 4th Ave, Suite 306, Anchorage, AK 99501.

Lang, G.M., Livingston, P.A., Dodd, K.A., 2005. Groundfish food habits and predation on commercially important prey species in the eastern Bering Sea from 1997 through 2001. U.S. Dep. Commer., NOAA Tech. Memo. NMFS-AFSC-158, 230p. [URL](http://www.afsc.noaa.gov/Publications/AFSC-TM/NOAA-TM-AFSC-158.pdf)

Lang, G.M., R.D. Brodeur, J.M. Napp, and R. Schabetsberger. (2000). Variation in groundfish predation on juvenile walleye pollock relative to hydrographic structure near the Pribilof Islands, Alaska. ICES Journal of Marine Science. 57:265-271.

Lauffenberger, N., De Robertis, A., and Kotwicki, S. 2017. Combining bottom trawls and acoustics in a diverse semipelagic environment:  What is the contribution of walleye pollock (Gadus chalcogrammus) to near-bottom acoustic backscatter? Can J. Fish. Aquat. Sci., 74: 256-264.

Lauth, R.R., J.N. Ianelli, and W.W. Wakefield. 2004. Estimating the size selectivity and catching efficiency of a survey bottom trawl for thornyheads, Sebastolobus spp. using a towed video camera sled. Fisheries Research. 70:39-48.

Lehodey, P., I. Senina, and R. Murtugudde. 2008. A spatial ecosystem and populations dynamics model (SEAPODYM) – Modeling of tuna and tuna-like populations. Progress in Oceanography 78: 304–318.

Livingston, P. A., and Methot, R. D. (1998). Incorporation of predation into a population assessment model of Eastern Bering Sea walleye pollock. In Fishery Stock Assessment Models. NOAA Technical Report 126, NMFS F/NWC-54, Alaska Sea Grant Program, 304 Eielson Building, University of Alaska Fairbanks, Fairbanks, AK 99775. pp. 663-678.

Livingston, P.A. (1991). Walleye pollock. Pages 9-30 in: P.A. Livingston (ed.). Groundfish food habits and predation on commercially important prey species in the eastern Bering Sea, 1984-1986. U.S. Dep. Commer., NOAA Tech. Memo. NMFS-F/NWC-207, 240 p.

Lorenzen, K. 1996. The relationship between body weight and natural mortality in juvenile and adult fish: a comparison of natural ecosystems and aquaculture. J. Fish. Biol. 49:627-647.

Lorenzen, K. 2000. Allometry  of  natural mortality  as  a  basis  for  assessing  optimal release  size  in  fish-stocking programmes. Canadian  Journal  of Fisheries  and Aquatic Sciences 57, 2374-2381. 

Low, L.L., and Ikeda. 1980. Average density index of walleye pollock in the Bering Sea. NOAA Tech. Memo. SFRF743.

Mace, P., L. Botsford, J. Collie, W. Gabriel, P. Goodyear J. Powers, V. Restrepo, A. Rosenberg, M. Sissenwine, G. Thompson, J. Witzig. 1996. Scientific review of definitions of overfishing in U.S. Fishery Management Plans. NOAA Tech. Memo. NMFS-F/SPO-21. 20 p.

MacLennan, D. N., Fernandes, P. G., and Dalen, J. 2002. A consistent approach to definitions and symbols in fisheries acoustics. ICES J. Mar Sci, 59: 365-369.

Martell, S., \& Stewart, I. (2013). Towards defining good practices for modeling time-varying selectivity. Fisheries Research, 1–12. [URL]([link](http://doi.org/10.1016/j.fishres.2013.11.001)

Martinson, E.C., H.H. Stokes and D.L. Scarnecchia. 2012. Use of juvenile salmon growth and temperature change indices to predict groundfish post age-0 yr class strengths in the Gulf of Alaska and eastern Bering Sea. Fisheries Oceanography 21:307-319.

McAllister, M.K. and Ianelli, J.N. 1997. Bayesian stock assessment using catch-age data and the sampling-importance resampling algorithm. Can. J. Fish. Aquat. Sci. 54:284-300.

Merritt, M.F. and T.J. Quinn II. 2000. Using perceptions of data accuracy and empirical weighting of information: assessment of a recreational fish population. Canadian Journal of Fisheries and Aquatic Sciences. 57: 1459-1469. 

Methot, R.D. 1990. Synthesis model: an adaptable framework for analysis of diverse stock assessment data. In Proceedings of the symposium on applications of stock assessment techniques to Gadids. L. Low [ed.]. Int. North Pac. Fish. Comm. Bull. 50: 259-277.

Miller, T.J. 2005. Estimation of catch parameters from a fishery observer program with multiple objectives. PhD Dissertation. Univ. of Washington. 419p. 

Mohn, R. 1999. The retrospective problem in sequential population analysis: An investigation using cod fishery and simulated data. Ices J. Mar Sci. 56, 473-488.

Moss, J.H., E.V. Farley, Jr., A.M. Feldmann, and J.N. Ianelli. 2009. Spatial distribution, energetic status, and food habits of eastern Bering Sea age-0 walleye pollock. Transactions of the American Fisheries Society.

Mueter, F. J., and M. Litzow. 2008. Sea ice retreat alters the biogeography of the Bering Sea continental shelf. Ecological Applications 18:309–320.

Mueter, F. J., C. Ladd, M. C. Palmer, and B. L. Norcross. 2006. Bottom-up and top-down controls of walleye pollock (_Theragra chalcogramma_) on the Eastern Bering Sea shelf. Progress in Oceanography 68:152-183. 

Mueter, F. J., N.A. Bond, J.N. Ianelli, and A.B. Hollowed. 2011. Expected declines in recruitment of walleye pollock (_Theragra chalcogramma_) in the eastern Bering Sea under future climate change. ICES Journal of Marine Science. 

O’Reilly, P.T., M.F. Canino, K.M. Bailey and P. Bentzen. 2004. Inverse relationship between FST and microsatellite polymorphism in the marine fish, walleye pollock (_Theragra chalcogramma_): implications for resolving weak population structure. Molecular Ecology (2004) 13, 1799–1814

Parma, A.M. 1993. Retrospective catch-at-age analysis of Pacfic halibut: implications on assessment of harvesting policies. In  Proceedings of the International Symposium on Management Strategies of Exploited Fish Populations. Alaska Sea Grant Rep. No. 93-02. Univ. Alaska Fairbanks.

Petitgas, P. 1993. Geostatistics for fish stock assessments: a review and an acoustic application. ICES J. Mar. Sci. 50: 285-298.

Petrik, C. M., Duffy-Anderson, J. T., Mueter, F., Hedstrom, K., & Curchitser, E. N. 2014. Biophysical transport model suggests climate variability determines distribution of Walleye Pollock early life stages in the eastern Bering Sea through effects on spawning. Progress in Oceanography, 138, 459–474. [link](http://doi.org/10.1016/j.pocean.2014.06.004).

Powers, J. E. 2014. Age-specific natural mortality rates in stock assessments: size-based vs. density-dependent. ICES Journal of Marine Science, 71(7), 1629–1637.

Press, W.H., S.A. Teukolsky, W.T. Vetterling, B.P. Flannery. 1992. Numerical Recipes in C. Second Ed. Cambridge University Press. 994 p.

Punt, E, Anthony D M Smith, David C Smith, Geoffrey N Tuck, and Neil L Klaer. 2014. Selecting Relative Abundance Proxies for BMSY and BMEY. ICES Journal of Marine Science 71: 469–83. https://doi.org/10.1093/icesjms/fst162.

Punt, A.E., Smith, D.C., KrusicGolub, K. and Robertson, S. 2008. Quantifying age-reading error for use in fisheries stock assessments, with application to species in Australia’s Southern and Eastern Scalefish and Shark Fishery. Can. J. Fish. Aquat. Sci. 65:1991-2005.

Ressler, P.H., De Robertis, A., Warren, J.D., Smith, J.N., and Kotwicki, S. (2012). Using an acoustic index of euphausiid abundance to understand trophic interactions in the Bering Sea ecosystem. Deep-Sea Res. II. 0967-0645,

Restrepo, V.R., G.G. Thompson, P.M Mace, W.L Gabriel, L.L. Low, A.D. MacCall, R.D. Methot, J.E. Powers, B.L. Taylor, P.R. Wade, and J.F. Witzig. 1998. Technical guidance on the use of precautionary approaches to implementing National Standard 1 of the Magnuson-Stevens Fishery Conservation and Management Act. NOAA Tech. Memo. NMFS-F/SPO-31. 54 p.

Schnute, J.T. 1994. A general framework for developing sequential fisheries models. Can. J. Fish. Aquat. Sci. 51:1676-1688.

Schnute, J.T. and Richards, L.J. 1995. The influence of error on population estimates from catch-age models. Can. J. Fish. Aquat. Sci. 52:2063-2077.

Seung, C., \& Ianelli, J. (2016). Regional economic impacts of climate change: a computable general equilibrium analysis for an Alaskan fishery. Natural Resource Modeling, 29(2), 289–333. [link](http://doi.org/10.1111/nrm.12092  ).

Sewall, F., K. Cieciel, T. Jarvis, J. Murphy, H. Schultz, J. Watson. 2019. "Total Energy Trends Among Juvenile Fishes in the Northern Bering Sea." In Siddon, E., and Zador, S., 2019. Ecosystem Status Report 2019: Eastern Bering Sea, Stock Assessment and Fishery Evaluation Report, North Pacific Fishery Management Council, 605 W 4th Ave, Suite 306, Anchorage, AK 99501.

Siddon, E. C., Heintz, R. a., & Mueter, F. J. (2013). Conceptual model of energy allocation in walleye pollock (_Theragra chalcogramma_) from age-0 to age-1 in the southeastern Bering Sea. Deep Sea Research Part II: Topical Studies in Oceanography, 94, 140–149. [link](http://doi.org/10.1016/j.dsr2.2012.12.007).

Siddon, E.C., T. Jarvis, R. Heintz, E. Farley, B. Cormack. 2019. "Condition of Age-0 Walleye Pollock and Pacic Cod." In Siddon, E., and Zador, S., 2019. Ecosystem Status Report 2019: Eastern Bering Sea, Stock Assessment and Fishery Evaluation Report, North Pacific Fishery Management Council, 605 W 4th Ave, Suite 306, Anchorage, AK 99501.  

Smart, T. I., Siddon, E. C., & Duffy-Anderson, J. T. (2013). Vertical distributions of the early life stages of walleye pollock (_Theragra chalcogramma_) in the Southeastern Bering Sea. Deep Sea Research Part II: Topical Studies in Oceanography, 94, 201–210. [link](http://doi.org/10.1016/j.dsr2.2013.03.030).

Smith, G.B. 1981. The biology of walleye pollock. In Hood, D.W. and J.A. Calder, The Eastern Bering Sea Shelf: Oceanography and Resources. Vol. I. U.S. Dep. Comm., NOAA/OMP 527-551. 

Stahl, J. 2004. Maturation of walleye pollock, _Theragra chalcogramma_, in the Eastern Bering Sea in relation to temporal and spatial factors. Masters thesis. School of Fisheries and Ocean Sciences, Univ. Alaska Fairbanks, Juneau. 000p. 

Stahl, J., and G. Kruse. 2008a. Spatial and temporal variability in size at maturity of walleye pollock in the eastern Bering Sea. Transactions of the American Fisheries Society 137:1543–1557.

Stahl, J., and G. Kruse. 2008b. Classification of Ovarian Stages of Walleye Pollock (_Theragra chalcogramma_). In Resiliency of Gadid Stocks to Fishing and Climate Change. Alaska Sea Grant College Program • AK-SG-08-01.

Sterling, J. T. and R. R. Ream 2004. At-sea behavior of juvenile male northern fur seals (Callorhinus ursinus). Canadian Journal of Zoology 82: 1621-1637. 

Stewart, I. J., \& Martell, S. J. D. (2015). Reconciling stock assessment paradigms to better inform fisheries management. ICES Journal of Marine Science: Journal Du Conseil, 72(8), 2187–2196. [link](http://doi.org/10.1093/icesjms/fsv061).

Strong, J. W., \& Criddle, K. R. (2014). A Market Model of Eastern Bering Sea Alaska Pollock: Sensitivity to Fluctuations in Catch and Some Consequences of the American Fisheries Act. North American Journal of Fisheries Management, 34(6), 1078–1094. [link](http://doi.org/10.1080/02755947.2014.944678 ).

Stram, D. L., and Ianelli, J. N. 2014. Evaluating the efficacy of salmon bycatch measures using fishery-dependent data. ICES Journal of Marine Science, 3(2). doi:10.1093/icesjms/fsu168

Szuwalski, C.S, Ianelli, J.N, and Punt, A.E. 2018. Reducing retrospective patterns in stock assessment and impacts on management performance, ICES Journal of Marine Science, Volume 75, Issue 2, 1 March 2018, Pages 596–609, https://doi.org/10.1093/icesjms/fsx159

Swartzman, G.L., A.G. Winter, K.O. Coyle, R.D. Brodeur, T. Buckley, L. Ciannelli, G.L. Hunt, Jr., J. Ianelli, and S.A. Macklin (2005). Relationship of age-0 pollock abundance and distribution around the Pribilof Islands with other shelf regions of the Eastern Bering Sea. Fisheries Research, Vol. 74, pp. 273-287.

Takahashi, Y, and Yamaguchi, H. 1972. Stock of the Alaska pollock in the eastern Bering Sea. Bull. Jpn. Soc. Sci. Fish. 38:418-419.

Thoman, R.L. 2019. “Sea Ice Metrics for the Bering Sea.” In Siddon, E., and Zador, S., 2019. Ecosystem Status Report 2019: Eastern Bering Sea, Stock Assessment and Fishery Evaluation Report, North Pacific Fishery Management Council, 605 W 4th Ave, Suite 306, Anchorage, AK 99501.

Thompson, G.G. 1996. Risk-averse optimal harvesting in a biomass dynamic model. Unpubl. Manuscr., 54 p. Alaska Fisheries Science Center, 7600 Sand Pt. Way NE, Seattle WA, 98115. Distributed as Appendix B to the Environmental Analysis Regulatory Impact Review of Ammendments 44/44 to the Fishery Management Plans for the Groundfish Fisheries of the Bering Sea and Aleutian Islands Area and the Gulf of Alaska. 

Thorson, J. T., \& Taylor, I. G. (2014). A comparison of parametric, semi-parametric, and non-parametric approaches to selectivity in age-structured assessment models. Fisheries Research, 158, 74–83. [link](http://doi.org/10.1016/j.fishres.2013.10.002).

Thorson, J.T., Ianelli, J.N., Larsen, E., Ries, L., Scheuerell, M.D., Szuwalski, C., and Zipkin, E. 2016. Joint dynamic species distribution models: a tool for community ordination and spatiotemporal monitoring. Glob.Ecol. Biogeogr. 25(9): 1144-1158. doi:10.1111/geb.12464. url: http://onlinelibrary.wiley.com/doi/10.1111/geb.12464/abstract

Thorson, J.T., Shelton, A.O., Ward, E.J., Skaug, H.J., 2015. Geostatistical delta-generalized linear mixed models improve precision for estimated abundance indices for West Coast groundfishes. ICES J. Mar. Sci. J.Cons. 72(5), 1297-1310. doi:10.1093/icesjms/fsu243. URL: http://icesjms.oxfordjournals.org/content/72/5/1297

Thorson, J.T., and Kristensen, K. 2016. Implementing a generic method for bias correction in statisticalmodels using random effects, with spatial and population dynamics examples. Fish. Res. 175: 66-74.doi:10.1016/j.fishres.2015.11.016. url: http://www.sciencedirect.com/science/article/pii/S0165783615301399

Thorson, J.T., Rindorf, A., Gao, J., Hanselman, D.H., and Winker, H. 2016. Density-dependent changes in effective area occupied for sea-bottom-associated marine fishes. Proc R Soc B 283(1840): 20161853.doi:10.1098/rspb.2016.1853. URL: http://rspb.royalsocietypublishing.org/content/283/1840/20161853.To see these entries in BibTeX format,  use ‘print(,  bibtex=TRUE)’, ‘toBibtex(.)’,  or set ‘op-tions(citation.bibtex.max=999)’.10

Thorson, J.T. 2018a, _In Press_. Predicting recruitment density dependence and intrinsic growth rate for all fishes worldwide using a data-integrated life-history model. Fish and Fisheries.

Thorson, J..T. 2018b. Guidance for decisions using the Vector Autoregressive Spatio-Temporal (VAST) package in stock, ecosystem, habitat and climate assessments, Fisheries Research, Volume 210, 2019, Pages 143-161, ISSN 0165-7836, https://doi.org/10.1016/j.fishres.2018.10.013.(http://www.sciencedirect.com/science/article/pii/S0165783618302820)

Thorson, James T. 2019. Measuring the Impact of Oceanographic Indices on Species Distribution Shifts : The Spatially Varying Effect of Cold-Pool Extent in the Eastern Bering Sea, 1–14. https://doi.org/10.1002/lno.11238.

von Szalay PG, Somerton DA, Kotwicki S. 2007. Correlating trawl and acoustic data in the Eastern Bering Sea: A first step toward improving biomass estimates of walleye pollock (_Theragra chalcogramma_) and Pacific cod (Gadus macrocephalus)? Fisheries Research 86(1) 77-83. 

Walline, P. D. 2007. Geostatistical simulations of eastern Bering Sea walleye pollock spatial distributions, to estimate sampling precision. ICES J. Mar. Sci. 64:559-569.

Walters, C. J., and J. F. Kitchell. 2001. Cultivation/depensation effects on juvenile survival and recruitment. Can. J. Fish. Aquat. Sci. 58:39-50.

Wespestad, V. G. and J. M. Terry. 1984. Biological and economic yields for Eastern Bering Sea walleye pollock under differing fishing regimes. N. Amer. J. Fish. Manage., 4:204-215.

Wespestad, V. G., J. Ianelli, L. Fritz, T. Honkalehto, G. Walters. 1996. Bering Sea-Aleutian Islands Walleye Pollock Assessment for 1997. In: Stock assessment and fishery evaluation report for the groundfish resources of the Bering Sea/Aleutian Islands regions. North Pac. Fish. Mgmt. Council, Anchorage, AK, section 1:1-73.

Wespestad, V. G., L. W. Fritz, W. J. Ingraham, and B. A. Megrey. 2000. On relationships between cannibalism, climate variability, physical transport, and recruitment success of Bering Sea walleye pollock (_Theragra chalcogramma_). ICES Journal of Marine Science 57:272-278.

Whitehouse, A., G. Lang. 2019."Mean Length of the Fish Community."  In Siddon, E., and Zador, S., 2019. Ecosystem Status Report 2019: Eastern Bering Sea, Stock Assessment and Fishery Evaluation Report, North Pacific Fishery Management Council, 605 W 4th Ave, Suite 306, Anchorage, AK 99501.

Williamson, N., and J. Traynor. 1996. Application of a one-dimensional geostatistical procedure to fisheries acoustic surveys of Alaskan pollock. ICES J. Mar. Sci. 53:423-428.

Winter, A.G., G.L. Swartzman, and L. Ciannelli (2005). Early- to late-summer population growth and prey consumption by age-0 pollock (_Theragra chalcogramma_), in two years of contrasting pollock abundance near the Pribilof Islands, Bering Sea. /Fisheries Oceanography/, Vol. 14, No. 4, pp. 307-320.

Yasumiishi, E. M., K. R. Criddle, N. Hillgruber, F. J. Mueter, and J. H. Helle. 2015. Chum salmon (Oncorhynchus keta) growth and temperature indices as indicators of the year–class strength of age-1 walleye pollock (_Gadus chalcogrammus_) in the eastern Bering Sea. Fish. Oceanogr. 24:242-256.

Yasumiishi, E. 2019. “ Pre- and Post-Winter Temperature Change Index and the Recruitment of Bering Sea Pollock.” In Siddon, E., and Zador, S., 2019. Ecosystem Status Report 2019: Eastern Bering Sea, Stock Assessment and Fishery Evaluation Report, North Pacific Fishery Management Council, 605 W 4th Ave, Suite 306, Anchorage, AK 99501.  

Zeppelin, T. K. and R.R. Ream. 2006. Foraging habitats based on the diet of female northern fur seals (Callorhinus ursinus) on the Pribilof Islands, Alaska. Journal of Zoology 270(4): 565-576.

\setlength{\parindent}{0in}
\setlength{\leftskip}{0in}
\setlength{\parskip}{3pt}
\noindent

\clearpage
# Figures

```
## Error in printfig("catch.pdf", 1): could not find function "printfig"
```

```
## Error in printfig("catch_sex.pdf", 2): could not find function "printfig"
```

```
## Error in printfig("catch_distn_a.png", 3): could not find function "printfig"
```

```
## Error in printfig("cpue_aseason.png", 4): could not find function "printfig"
```

```
## Error in printfig("catchp.png", 5): could not find function "printfig"
```

```
## Error in printfig("roe.pdf", 8): could not find function "printfig"
```

```
## Error in printfig("catch_distn_b.png", 6): could not find function "printfig"
```

```
## Error in printfig("cpue_bseason.png", 7): could not find function "printfig"
```
\clearpage

```
## Error in printfig("fleet_dispersal.png", 9): could not find function "printfig"
```

```
## Error in printfig("catage.png", 10): could not find function "printfig"
```

```
## Error in printfig("bts_biom.pdf", i): could not find function "printfig"
```

```
## Error in printfig("bts_temp.pdf", i): could not find function "printfig"
```

```
## Error in printfig("bts_temp_cpue.pdf", i): could not find function "printfig"
```

```
## Error in printfig("bts_3d.png", i): could not find function "printfig"
```

```
## Error in printfig("bts_age_comp.png", i): could not find function "printfig"
```

```
## Error in printfig("at_age.png", i): could not find function "printfig"
```

```
## Error in printfig("vastage.png", i): could not find function "printfig"
```

```
## Error in printfig("vast_idx.pdf", 57): could not find function "printfig"
```

```
## Error in printfig("fsh_wtage_comb.pdf", 20): could not find function "printfig"
```

```
## Error in printfig("fsh_wtage_strata.pdf", 21): could not find function "printfig"
```

```
## Error in printfig("fsh_wtage_strata_yr.pdf", 22): could not find function "printfig"
```

```
## Error in printfig("fsh_lw_month.png", 23): could not find function "printfig"
```

```
## Error in printfig("fsh_lw_str_yr_box.pdf", 24): could not find function "printfig"
```

```
## Error in printfig("mod_data.pdf", 30): could not find function "printfig"
```

```
## Error in printfig("mod_eval0a.pdf", 31): could not find function "printfig"
```

```
## Error in printfig("mod_eval0b.pdf", 32): could not find function "printfig"
```

```
## Error in printfig("cole1.png", 27): could not find function "printfig"
```

```
## Error in printfig("cole1.png", 27): could not find function "printfig"
```

```
## Error in printfig("cole2.png", 28): could not find function "printfig"
```

```
## Error in printfig("q_sens.pdf", 63): could not find function "printfig"
```

```
## Error in printfig("q_sens_ssb.pdf", 64): could not find function "printfig"
```

```
## Error in printfig("mod_ats_biom.pdf", 34): could not find function "printfig"
```

```
## Error in printfig("mod_cpue_fit.pdf", 38): could not find function "printfig"
```

```
## Error in printfig("mod_avo_fit.pdf", 39): could not find function "printfig"
```

```
## Error in printfig("mod_bts_biom.pdf", 33): could not find function "printfig"
```

```
## Error in printfig("mod_mean_age.pdf", 35): could not find function "printfig"
```

```
## Error in printfig("mod_fsh_sel.pdf", 36): could not find function "printfig"
```

```
## Error in printfig("mod_fsh_age.pdf", 37): could not find function "printfig"
```

```
## Error in printfig("mod_bts_sel.pdf", 40): could not find function "printfig"
```

```
## Error in printfig("mod_bts_age.pdf", 41): could not find function "printfig"
```

```
## Error in printfig("mod_ats_age.pdf", 43): could not find function "printfig"
```

```
## Error in printfig("mcmc_pairs.pdf", 55): could not find function "printfig"
```

```
## Error in printfig("mcmc_marg.pdf", 56): could not find function "printfig"
```

```
## Error in printfig("mod_ser.pdf", 44): could not find function "printfig"
```

```
## Error in printfig("mod_F.pdf", 45): could not find function "printfig"
```

```
## Error in printfig("mod_hist.pdf", 46): could not find function "printfig"
```

```
## Error in printfig("N_comp.png", 59): could not find function "printfig"
```

```
## Error in printfig("cum_N_wt.png", 60): could not find function "printfig"
```

```
## Error in printfig("mod_phase.pdf", 47): could not find function "printfig"
```

```
## Error in printfig("proj_ssb.pdf", 65): could not find function "printfig"
```

```
## Error in printfig("mod_rec.pdf", 48): could not find function "printfig"
```

```
## Error in printfig("mod_srr.pdf", 49): could not find function "printfig"
```

```
## Error in printfig("mod_rs.pdf", 50): could not find function "printfig"
```

```
## Error in printfig("mod_retro.pdf", 52): could not find function "printfig"
```

```
## Error in printfig("tier3_proj.pdf", 53): could not find function "printfig"
```

```
## Error in printfig("age_diversity.pdf", 51): could not find function "printfig"
```

```
## Error in printfig("sel_comp_vast.pdf", 61): could not find function "printfig"
```

```
## Error in printfig("poll_cod_rec.png", 62): could not find function "printfig"
```

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
    s_{t+1,a}   &= s_{t,a} \,       e^{\gamma_t},   &\gamma_t     \sim \mathcal{N}(0,\,\sigma_s^{2}) 
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
    \\
    \alpha_t^\mu  -  \alpha_{t+1}^\mu     &\sim \mathcal{N}(0,\,\sigma_{\alpha^\mu}^{2}) \\
    \beta_t^\mu  -  \beta_{t+1}^\mu     &\sim \mathcal{N}(0,\,\sigma_{\beta^\mu}^{2}) 
\end{align}

The parameters to be estimated in this part of the model are thus for t=1982 through to 2019. 
The variance terms for these process error parameters were specified to be 0.04.

In this assessment, the random-walk deviation penalty was optionally shifted
to the changes in log-selectivity. that is, for the BTS estimates, the process
error was applied to the logistic parameters as above, but the  lognormal
penalty was applied to the resulting selectivities-at-age directly. The extent
of this variability was evaluated in the context of the impact on age-specific
survey catchability/availability and contrasted with an independent estimate of 
pollock availability to the bottom trawl survey. 
\begin{align}
    {ln(s_{t,a})}  -  {ln(s_{t+1,a})}  &\sim \mathcal{N}(0,\,\sigma_{sel}^{2}) \\
\end{align}
In 2008 the AT survey selectivity approach was modified. As an option, the age
one pollock observed in this trawl can be treated as an index and are not
considered part of the age composition (which then ranges from age 2-15). This
was done to improve some interaction with the flexible selectivity smoother
that is used for this gear and was compared. Additionally, the annual
specification of input observation variance terms was allowed for the AT data.


A diagnostic approach to evaluate input variance specifications (via sample
size under multinomial assumptions) was added in the 2018 assessment. This method
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

Based on previous analyses, we used the above relationship as a diagnostic for
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
Kotwicki et al. 2014. For the VAST estimates, the supplied covariance matrix was 
used in the same way.

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
estimating a vector of parameters ($w_{ta}^{future}$) on current (2019) and future mean weights
for each age $i$,  $i$= (1, 2,…,15), given actual observed mean and variances in
weight-at-age over the period 1991-2018. The values of based on available data
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

Tier 1 projections were calculated two ways. First, for 2020 and 2021 ABC and
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




# Appendix on spatio-temporal analysis of NMFS bottom-trawl survey data

## Overview 

This application of `VAST` was configured to model a subset of
NMFS/AFSC bottom trawl survey data.  Specifically, the station-specific CPUE
(kg per hectare) for pollock were compiled from 1982-2019. Further details can
be found at the [GitHub repo](https://github.com/james- thorson/VAST/#description) 
mainpage, wiki, and glossary.  The R help files,
e.g., `?Data_Fn` for explanation of data inputs, or `?Param_Fn` for
explanation of parameters. VAST has involved many publications for developing
individual features (see references section below). What follows is intended
as  a step by step documentation of applying the model to these data.

Settings and configurations are available here (link to come...). 

## Spatio-temporal treatment of survey age composition data 
To date, assessments using spatio-temporal indices have kept 
age-composition data unchanged (i.e., the estimates were based on the
original design-based approach). Here we develop a spatio-temporal approach to
obtain age composition estimates. We found that design-based and model-based
inputs provided stock-assessment parameter estimates consistent with previous
approaches (Fig. \ref{fig:vastage}).


```
## Error in printfig("bts_data_by_yr.png", 59): could not find function "printfig"
```

## Diagnostic plots



### Encounter-probability component
One can check to ensure that observed encounter frequencies for either low or high
probability samples are within the 95% predictive interval for predicted
encounter probability (Figure \ref{fig:encounter}. 
Diagnostics for positive-catch-rate component was evaluated using a standard Q-Q plot. 
Qualitatively, the fits to pollock data are reasonable (Figures \ref{fig:eq1} and \ref{fig:qq2}).

### Pearson residuals
Spatially the residual pattern can be evaluated over time. Results for pollock data shows that consistent positive or negative 
residuals accross or within years is limited for the encounter probability component of the model and 
for the positive catch rate component (Figures \ref{fig:pearson1} and \ref{fig:pearson2}, respectively).




![ Observed encounter rates and predicted probabilities for pollock in the combined survey area. \label{fig:encounter}](figs/Diag--Encounter_prob.png)


![ Plot indicating distribution of quantiles for "positive catch rate" component. \label{fig:eq1}](figs/Q-Q_hist.jpg)

![ Quantile-quantile plot of residuals for "positive catch rate" component. \label{fig:qq2}](figs/Q-Q_plot.jpg)



![Pearson residuals of the encounter probability component for the combined survey area, 1982-2018. \label{fig:pearson1}](figs/maps--encounter_pearson_resid.png)

![Pearson residuals of the positive catch rate component for the combined survey area, 1982-2018. \label{fig:pearson2}](figs/maps--catchrate_pearson_resid.png)


![ Pollock density maps  using the VAST model approach, 1982-2019. \label{fig:density}](figs/Dens.png)


### Densities and biomass estimates 

Relative densities over time suggests that the biomass of pollock can reflect
abundances in the NBS even in years where samples are unavailable (all years
except 2010, 2017--2019; (Figure \ref{fig:density}). Index values and error terms
(based on diagonal of covariance matrix over time) are shown in Figure \ref{fig:vast_idx}



```
## Error in printfig("vast_idx.pdf", 57): could not find function "printfig"
```




\clearpage

# Summary tables for alternative models and/or Tiers

## Tier 3, Model 16.1 
\begin{table}[ht]
\centering
\begin{tabular}{lrr|rr}
  \hline
       & \multicolumn{2}{c|}{As estimated or $\mathit{specified}$ } & \multicolumn{2}{c}{As estimated or $\mathit{recommended}$ }  \\
       & \multicolumn{2}{c|}{$\mathit{last}$ year for:}  & \multicolumn{2}{c}{$\mathit{this}$ year for: }               \\
        Quantity & 2019      &2020   & 2020      &2021 \\ 
  \hline
	M (natural mortality rate, ages 3+)	&	0.3	&	0.3	&	0.3	&	0.3 \\
Tier	&	1a	&	1a	                                       &	3a	&	3a \\
Projected total (age  3+) biomass (t) & 9,110,000 t & 8,156,000 t & 8,580,000 t & 7,990,000 t \\
Projected female  spawning  biomass (t) & 3,107,000 t & 2,725,000 t & 2,781,000  t & 2,476,000  t \\  
$B_0 or B_{100}$         & 5,866,000 t   & 5,866,000 t & 6,165,000  t & 6,165,000  t \\          
$B_{msy}$     & 2,280,000 t   & 2,280,000 t & 2,158,000  t & 2,158,000  t \\          
$F_{OFL}$     & 0.645 & 0.645 & 0.314  & 0.321  \\                  
$maxF_{ABC}$  & 0.510 & 0.51  & 0.253  & 0.262  \\                  
$F_{ABC}$     & 0.356 & 0.375 & 0.253  & 0.262 \\                  
$OFL$         & 3,913,000 t   & 3,082,000 t           & 2,539,000 t & 2,098,000  t \\          
$maxABC$      & 3,096,000 t   & 2,437,000 t           & 2,045,000 t & 1,716,000 t \\      
$ABC$         & 2,163,000 t   & 1,792,000 t           & 2,045,000 t & 1,716,000 t \\     
\hline
Status	                              &	2017	      &	2018	      &		2018             &	2019          \\
\hline
Overfishing	                          &	No	        &	n/a	      &	No	                       &	n/a                 \\
Overfished	                          &	n/a	        &	No	      &	n/a	                       &	No                  \\
Approaching overfished	              &	n/a	        &	No	      &	n/a	                       &	No                  \\
\hline
\end{tabular}
\end{table}

\clearpage


## Tier 1, Model 16.2 (VAST bottom trawl survey data, full time series, include NBS)
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
Projected total (age  3+) biomass (t)   & 9,110,000 t & 8,156,000 t                   & 9,128,000 t & 8,494,000 t \\
Projected female  spawning  biomass (t) & 3,107,000 t & 2,725,000 t                   & 2,991,000  t & 2,674,000  t \\  
$B_0$ & 5,866,000 t                     & 5,866,000 t & 5,777,000  t           & 5,777,000  t \\          
$B_{msy}$ & 2,280,000 t                 & 2,280,000 t & 2,148,000  t         & 2,148,000  t \\          
$F_{OFL}$ & 0.645 & 0.645                             & 0.449  & 0.449  \\                  
$maxF_{ABC}$  & 0.510 & 0.51                          & 0.383    & 0.383  \\                  
$F_{ABC}$ & 0.356 & 0.375                             & 0.225             & 0.235 \\                  
$OFL$ & 3,913,000 t & 3,082,000 t                     & 4,085,000  t             & 3,385,000  t \\          
$maxABC$  & 3,096,000 t & 2,437,000 t                 & 3,485,000 t & 2,888,000 t \\      
$ABC$ & 2,163,000 t & 1,792,000 t                     & 2,043,000 t & 1,767,000  t \\        
\hline
Status	                              &	2017	      &	2018	      &		2018             &	2019          \\
\hline
Overfishing	                          &	No	        &	n/a	      &	No	                       &	n/a                 \\
Overfished	                          &	n/a	        &	No	      &	n/a	                       &	No                  \\
Approaching overfished	              &	n/a	        &	No	      &	n/a	                       &	No                  \\
\hline
\end{tabular}
\end{table}

\clearpage

## Tier 3, Model 16.2 (VAST bottom trawl survey data, full time series, include NBS)
\begin{table}[ht]
\centering
\begin{tabular}{lrr|rr}
  \hline
       & \multicolumn{2}{c|}{As estimated or $\mathit{specified}$ } & \multicolumn{2}{c}{As estimated or $\mathit{recommended}$ }  \\
       & \multicolumn{2}{c|}{$\mathit{last}$ year for:}  & \multicolumn{2}{c}{$\mathit{this}$ year for: }               \\
        Quantity & 2019      &2020   & 2020      &2021 \\ 
  \hline
	M (natural mortality rate, ages 3+)	&	0.3	&	0.3	&	0.3	&	0.3 \\
Tier	&	1a	&	1a	                                       &	3a	&	3a \\
Projected total (age  3+) biomass (t)                 & 9,110,000 t & 8,156,000 t & 9,128,000 t & 8,494,000 t \\
Projected female  spawning  biomass (t)               & 3,107,000 t & 2,725,000 t & 2,991,000  t & 2,674,000  t \\  
$B_0 or B_{100}$         & 5,866,000 t                & 5,866,000 t & 6,256,000  t & 6,256,000  t \\          
$B_{msy}$     & 2,280,000 t   & 2,280,000 t           & 2,190,000  t & 2,190,000  t \\          
$F_{OFL}$     & 0.645         & 0.645                 & 0.277  & 0.29  \\                  
$maxF_{ABC}$  & 0.510         & 0.51                  & 0.225  & 0.235  \\                  
$F_{ABC}$     & 0.356         & 0.375                 & 0.225  & 0.235 \\                  
$OFL$         & 3,913,000 t   & 3,082,000 t           & 2,523,000  t & 2,188,000  t \\          
$maxABC$      & 3,096,000 t   & 2,437,000 t           & 2,043,000 t & 1,767,000 t \\      
$ABC$         & 2,163,000 t   & 1,792,000 t           & 2,043,000 t & 1,767,000 t \\     
\hline
Status	                              &	2017	      &	2018	      &		2018             &	2019          \\
\hline
Overfishing	                          &	No	        &	n/a	      &	No	                       &	n/a                 \\
Overfished	                          &	n/a	        &	No	      &	n/a	                       &	No                  \\
Approaching overfished	              &	n/a	        &	No	      &	n/a	                       &	No                  \\
\hline
\end{tabular}
\end{table}
 \tableofcontents

 \listoftables

 \listoffigures

