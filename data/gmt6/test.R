R
library(tidyverse)
library(ggthemes)
library(ggplot2)
st_gmt <- paste("gmt begin",sppyr)
gmt_coast <- paste0('gmt coast -R190/228/52/61/0/',maxpt,' -Jb230/50/56/64/1.00 -p200/65 -V -Gtan -Bx10 -Bz10+lCPUE -By3  -B+t',maptitle )
gmt_3d  <-"gmt plot3d tmp2 tmp3 -JZ10. -V -So0.06 -Gpurple -p "
#gmt_plt <-"gmt plot tmp3 -Sa.3 -Gred -p"
end_gmt <-"gmt end show"
gmt   makecpt -Cglobe -Z -V >t.cpt
gmt set MAP_FRAME_TYPE FANCY FORMAT_GEO_MAP ddd:mm:ssF MAP_GRID_CROSS_SIZE_PRIMARY
gmt begin test pdf
  gmt grdview @earth_relief_02m -R180/205/53/65 -JB194/51/56/61/20 -Qi600 -p183/33 -Ct.cpt  -Bx3 -By2 
gmt end show

gmt grdview hawaii_grav.nc -JB194/51/55/61/10c -Chawaii.cpt -Jz0.05c -Qm -N-100 -p225/30 -Wc -pdf hawaii_grav_image

gmt clear all

gmt begin panels pdf
  gmt subplot begin 4x2 -Fs7c/4c -M1p -R180/205/50/61 -Yr2i -JB194/50/56/61/20 -A -SCb -SRL -Bewnsstr -Bx10 -By5 
    gmt subplot set
    gmt grdview @earth_relief_02m -Qi100 -p183/43 -Ct.cpt 
    gmt subplot set
    gmt grdview @earth_relief_02m -Qi100 -p183/43 -Ct.cpt 
    gmt subplot set
    gmt grdview @earth_relief_02m -Qi100 -p183/43 -Ct.cpt 
    gmt subplot set
    gmt grdview @earth_relief_02m -Qi100 -p183/43 -Ct.cpt
    gmt subplot set
    gmt grdview @earth_relief_02m -Qi100 -p183/43 -Ct.cpt
    gmt subplot set
    gmt grdview @earth_relief_02m -Qi100 -p183/43 -Ct.cpt
    gmt subplot set
    gmt grdview @earth_relief_02m -Qi100 -p183/43 -Ct.cpt
    gmt subplot set
    gmt grdview @earth_relief_02m -Qi100 -p183/43 -Ct.cpt
  gmt subplot end
gmt end show
#
:: same as fshon but split gears to CV and CPs
:: Arguments are year begin end and big (1) or small (0) map area
set inseasdat=..\fishery\inseas\inseas%1.csv
set mapwidth=9.5i
set proj=-JB
set fullproj=%proj%194/51/53/56/%mapwidth% 
set region1=184/200/53/59.0
if %4 EQU 1 set fullproj=%proj%190/51/55/61/%mapwidth% 
if %4 EQU 1 set region1=180.0/200./53.0/61.
set region=%region1%/0/1
echo %4 %fullproj%

set yshift=2.0i
set Az=186
set elev=33 
set cptmax=.5
set cptinc=.025
set inc=.10/.05
set inc=.250/0.125
set maplabx=194.5
set maplaby=53.2
set catchscale=7500000
set scale=1000
:: set colwid=0.04i
set colwid=0.04i
if %4 EQU 1 set maplabx=181
if %4 EQU 1 set maplaby=53.5
:: set proj=-JM
:: set fullproj=%proj%%mapwidth% 
set textproj= -E%Az%/%elev% 
set gridname=bottom_topo.grd 
set ticks=5/2WesN
echo %gridname%
:: grdcut etopo.grd -R%region% -V -G%gridname%
:: grdcut c:\programs\gmt4\share\dbase\gridone.grd -R%region% -V -G%gridname%
:: echo %gridname%
:: pause
:: grdcut c:\gmt\share\dbase\gridone.grd -R%region% -V -G%gridname%
:: grdcut c:\gmt\share\dbase\etopo5.grd -R%region% -V -G%gridname%
  makecpt -Cglobe -Z -V >t.cpt

if %4 EQU 1 set textproj=-V
rm -f %root%.ps 
rm -f t.grd

:: Get data for analysis....
::----------------------------------------------------------------------------
awk  -F, "BEGIN{x=%2;y=%3} $6==%year% && ($4*100+$5>=x)&& ($4*100+$5<y)  {print 360+$8,$7,$14/%catchscale%,.02}" %inseasdat% >tmp
awk  -F, "BEGIN{x=%2;y=%3} $6==%year% && ($4*100+$5>=x)&& ($4*100+$5<y)  {print 360+$8,$7,$14/%catchscale%,.02}" %inseasdat% >tmp

blockmean -R%region1% -V -S -I%inc% tmp >%root%.xyg 
:: set region=184/220/50/65/-6100/5300  
echo %fullproj%
psbasemap -B%ticks% -R%region%  %fullproj% -E%Az%/%elev% -V -K   >%root%.ps
:: grdcut c:\gmt\share\dbase\etopo2.grd -R%region% -V -G%gridname%
:: makecpt -Ctopo -T-6100/5300/100 > tmp.cpt
:: grdgradient %gridname% -Gshade.grd -A315 -Ne0.8 -V
:: grdview %gridname% -Qi75  -Ishade.grd -R%region%  -Y%yshift% %fullproj% -E%Az%/%elev% -N-7000/255/255/255 -Ctmp.cpt -V -K -JZ0.5i   >%root%.ps
:: this one:
grdview %gridname% -R%region% %fullproj% -E%Az%/%elev% -B%ticks% -Ct.cpt  -Qs -V -K -O >> %root%.ps
:: awk "{print $1,$2,.1,.1}" ..\..\bottomtemp\data\200500.depth |psxyz -R %proj% -M -E%Az%/%elev% -W3/100/100/100  -K -O >> %root%.ps

:: awk "{print $1,$2,.1}" slch3.txt|psxyz -R %proj% -E%Az%/%elev%  -W4/250/60/255  -K -V -O >> %root%.ps
:: awk "{print $1,$2,.1}" constructs\cvoa.dat|psxyz -R %proj% -E%Az%/%elev%  -W8/0/0/0  -K -V -O >> %root%.ps

:: --plot xyg -----------------------
:: Survey Stars 
:: awk "{print $1,$2,.0,$3*.2}" tmp3 |gmtselect -R%region1% %proj% |psxyz -R%region%  %proj% -JZ1i  -Sa -W0 -E%Az%/%elev%  -G255/255/120  -V -O -K >>%root%.ps
:: Fishery Bars
awk "{print $1,$2,$3,.0}" %root%.xyg |gmtselect -R%region1% %proj% |psxyz -R%region%  %proj% -JZ1i  -B -So%colwid% -W0 -N -E%Az%/%elev%  -G255/085/120  -V -O -K >>%root%.ps

:: Hydro points...
:: awk "{print $1,$2,0,.0}" tmp33 |psxyz -R%region%  %proj% -JZ1i  -Sp -B2/1::WeSnZ -W1 -N -E%Az%/%elev%  -V -O -K >>%root%.ps
:: awk "{print $1,$2,$3/10,.0}" tmp33 |psxyz -R%region%  %proj% -JZ1i  -So.05 -G155/255/255 -B2/1::WeSnZ -W0 -N -E%Az%/%elev%  -V -O -K >>%root%.ps
:: --plot gridded points-----------------------
:: grd2xyz %root%.grd -R |awk "$3*1>0{print $1,$2,$3,.05}" |psxyz -R%region%  -W0 %proj% -N -JZ1i  -B2/1::WeSnZ -So0.04i -E%Az%/%elev%  -G155/255/200  -V -O -K >>%root%.ps

:: --plot actual points-----------------------
:: awk "{print $1,$2,$3,.1}" tmp |gmtselect -R%region1% %proj% |psxyz -R%region%  -N %proj% -JZ1i  -So0.02i -W0 -E%Az%/%elev%  -G255/255/120  -V -O -K >>%root%.ps
:: awk "{print $1,$2,$3,.1}" tmp |psxyz -R%region%  %proj% -JZ1i  -Sa0.05i -E%Az%/%elev%  -G55/255/120  -V -O -K >>%root%.ps
:: Survey points
:: awk "{print $1,$2,$3,.1}" tmp2 |gmtselect -R%region1% %proj% |psxyz -R%region%  -N %proj% -JZ1i  -So0.06i -W0 -E%Az%/%elev%  -G255/255/120  -V -O -K >>%root%.ps

:: psscale -V -D1.2/1.0/2.5/0.1h -L -K -E%Az%/%elev% -O -Ctmp.cpt  -B.25:tons/hectare:  >> %root%.ps
:: echo %maplabx% 53.0 18 0 1 5 Summer bottom trawl survey 20%1 |pstext -JM -R -W  -O  -N  -E%Az%/%elev% >> %root%.ps

echo %4
:: psxyz ttt -R -JM -V -Sa.09 -W0/0/155/0 -E%Az%/%elev% -G0/155/0 -K  -O >>%root%.ps
if %4 equ 0 (
   ::  echo 185 58.5  32 0 1 5 %year% winter pollock fishery |pstext %proj% -R -G0/055/0  -W -Z0 -O  -K %textproj% >> %root%.ps
  echo %maplabx% %maplaby% 24 10 1 5 %stday% - %endday%, %year%  |pstext %proj% -R -G255/255/100  -W  -Z0 -O  -N  %textproj% >> %root%.ps
)else (
  echo %1
  echo %maplabx% %maplaby% 24 0 1 5 %stday% - %endday%, %year%  |pstext %proj% -R -G255/255/170  -W  -Z0 -O  -N  %textproj% >> %root%.ps
)
set outfile = %root%.ps
gsv %outfile%
::----------------------------------------------------------------------------
