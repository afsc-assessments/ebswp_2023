radian
library(tidyverse)
library(ggthemes)
library(ggplot2)
du <- read.csv("pollock_cpue.csv")
du <- read.csv("nrs.csv")
names(du)
fn <- "nrs_BS_"
i=2019
#gmt_coast <- paste0('gmt coast -R180/205/52/66/0/5 -JB194/50/56/64/20  -p183/33 -V -Gtan -Bx10 -By5  -B+t',maptitle )
#=================================
makecpt -Cglobe -Z -V >t.cpt
gmt makecpt -Crelief -Z -V >t2.cpt
end_gmt <-"gmt end  show"
gmt_plt <-"gmt plot tmp3 -Sa.2 -W1.0 -Wred -p -N"
gmt_3d  <-"gmt plot3d tmp2 -JZ10. -V -So0.1 -Gpurple -W -p "
gmt_grdview <- "gmt grdview @earth_relief_02m -R180/205/52/66/0/5 -JB194/55/60/65/20  -Bx10 -By5  -Qi300 -p183/43 -Ct.cpt "
gmt_text <- "gmt text tmptext -F+f32p,Helvetica,brown -p "
for (i in 1982:2019) {
    # get scaling factor for this species
    #tmp1 <- du %>% filter(YEAR==i) %>% transmute(Year=YEAR,lon=LONGITUDE+360,lat=LATITUDE,tha=CPUE_KGHA/1000,col=0.02)
    tmp1 <- du %>% filter(YEAR==i) %>% transmute(Year=YEAR,lon=LONGITUDE+360,lat=LATITUDE,tha=CPUE_KGHA/15000,col=0.03)
    sppyr <- paste0("pdf/",fn,i)
    tmp2 <- tmp1 %>%filter(tha>1.e-6)  %>% transmute(lon=lon,lat=lat,tha=tha, col=0.03)
    tmp3 <- tmp1 %>%filter(tha<1.e-6) %>% transmute(lon=lon,lat=lat,tha=tha, col=0.08)
    tmp1 <- tmp1 %>% transmute(lon=lon,lat=lat,tha=tha, col=0.08)
    cat(file="tmptext",paste(182.8,64,i))
    write.table(tmp1,"tmp1",row.names=FALSE,col.names=FALSE)
    write.table(tmp2,"tmp2",row.names=FALSE,col.names=FALSE)
    write.table(tmp3,"tmp3",row.names=FALSE,col.names=FALSE)
    st_gmt <- paste("gmt begin",sppyr)
    system(st_gmt); system(gmt_grdview) ; system(gmt_3d); system(gmt_plt); system(gmt_text);system(end_gmt)
}



# Fishery data------------------------
dc <- read.csv("inseas.csv",header=FALSE,as.is=TRUE)
head(dc)
names(dc) <-c( "v", "haul", "cruise","mm",  "dd", "yr", "lat","lon", "v_type","dur","fdepth","bdepth","otc","wt","no","chin","chum","date","Time","dlat","dlon","CDQ","area","xx")
dc %>% group_by(yr) %>% summarize(sum(otc))
dc1 <- dc %>% transmute(Year=yr,Season=ifelse(mm<6,"A","B"),lat=lat,lon=lon,Catch=wt/100000) 
head(dc1)

gmt<-NULL
gmt[1] <- "gmt begin cont "
gmt[2] <- "gmt subplot begin 4x2 -Fs4i/4i -C0/0/0/0 -M0/0 -SC  -SR  "
gmt[3] <- paste("gmt subplot set ; ")
gmt[4] <- paste("gmt blockmean tmp1       -R180/205/52/66 -C -r -V -I0.4/.3  >tmp.xyg ;")
gmt[5] <-       "gmt grdview tmp.grd      -R180/205/52/66/0/5 -JM4i -Ctmpcatch.cpt -S1 -Qs "
gmt[9] <-       "gmt pscoast              -R180/205/52/66/0/5 -JM4i  -Gtan -Di -Bx10 -By5 "
gmt[10] <-       "gmt text tmptext -F+f24p,Helvetica,brown ;" 
gmt[11]<-"gmt subplot end "
gmt[12]<- "gmt end show"
gmt[9] <-       ""
gmt[9] <-       "gmt text tmptext -F+f24p,Helvetica,brown ;" 
system(gmt[1])
system(gmt[2])
i=2020

  gmt_3d      <- "gmt plot3d tmp.xyg -JZ10. -V -So0.07 -Gpurple -W -p -N"
  gmt_grdview <- "gmt grdview @earth_relief_02m -R180/205/53/63/0/5 -JB194/55/60/65/20  -Bx10 -By5  -Qi300 -p183/33 -Ct.cpt "
  gmt_text    <- "gmt text tmptext -F+f28p,Helvetica,brown -p "
  st_gmt      <- paste("gmt begin test")
  seas="B"
for (i in 2017:2020){
  for (j in 1:2) {
      seas=c("A","B")[j]
  tmp1 <- dc1 %>% filter(Year==i,Season==seas) %>% transmute(lon=lon+360,lat=lat,Catch=Catch/150,col=0.02)
  write.table(tmp1,"tmp1",row.names=FALSE,col.names=FALSE)
  st_gmt      <- paste0("gmt begin ",seas,"_",i)
  gmt_mn      <- paste("gmt blockmean tmp1       -R180/205/52/66 -Ss -C -r -V -I0.2/.1 >tmp.xyg ;")
  system(gmt_mn)
  cat(file="tmptext",paste(185.8,62.05,i,seas))
  system(st_gmt); system(gmt_mn); system(gmt_grdview) ; system(gmt_3d); system(gmt_text);system(end_gmt)
}
}
system(gmt[11])
system(gmt[12])

i=2019
for (i in 2017:2019) {
  gmt subplot begin 4x1 -Fs7i/4i -R180/205/50/66 -JB194/50/56/61/20 -SCb -SRL -Bewnsstr -Bx10 -By5 
    # get scaling factor for this species
    tmp1 <- du %>% filter(YEAR==i) %>% transmute(Year=YEAR,lon=LONGITUDE+360,lat=LATITUDE,tha=CPUE_KGHA/1000,col=0.02)
    sppyr <- paste0("pdf/",fn,i)
    tmp2 <- tmp1 %>%filter(tha>1.e-6)  %>% transmute(lon=lon,lat=lat,tha=tha, col=0.02)
    tmp3 <- tmp1 %>%filter(tha<1.e-6) %>% transmute(lon=lon,lat=lat,tha=tha, col=0.08)
    tmp1 <- tmp1 %>% transmute(lon=lon,lat=lat,tha=tha, col=0.08)
    cat(file="tmptext",paste(182.8,64,i))
    write.table(tmp1,"tmp1",row.names=FALSE,col.names=FALSE)
    write.table(tmp2,"tmp2",row.names=FALSE,col.names=FALSE)
    write.table(tmp3,"tmp3",row.names=FALSE,col.names=FALSE)
    st_gmt <- paste("gmt begin",sppyr)
    system(st_gmt); system(gmt_grdview) ; system(gmt_3d); system(gmt_plt); system(gmt_text);system(end_gmt)
}

# Pollock CPUE from Survey part....
gmt makecpt -Chot -I -Z -T-2/6/.5  -V > temp.cpt
gmt makecpt -Chot -I -Z -T0/1.0/0.1  -V > tmpcatch.cpt
gmt makecpt -Crainbow -Z -T0/30/10 -V >tmp0.cpt
gmt makecpt -Crainbow -Z -T2/30/10 -V >tmp2.cpt
gmt makecpt -Crainbow -Z -T4/30/10 -V >tmp4.cpt
 #gmt pscoast -R180/205/52/66/0/5 -S130/140/255 -S255 -JM10  -G180/140/130 -I0.4/.2 -Di 
gmt begin cont
 gmt grdview @earth_relief_02m -R180/205/52/66/0/5 -JM3.2/2.1  -Qi100 -Ct.cpt 
 gmt clip survey.dat -R180/205/52/66/0/5 -JM 
 gmt grdview tmp.grd -R180/205/52/66/0/5 -JM -Ctmpcatch.cpt -S1 -Qs 
 gmt grdview @earth_relief_02m -R180/205/52/66/0/5 -JM3.2/2.1  -Y3.2i -Qi100 -Ct.cpt 
gmt end show
    gmt grdview @earth_relief_02m -Qi100 -Ct.cpt 
    gmt grdview tmp.grd -R180/205/52/66/0/5 -JM4i -Ctmpcatch.cpt -S1 -Qs 
####################################
#
# for 8-panel CPUE and temperautre
#
####################################    
radian
gmt<-NULL
gmt[1] <- "gmt begin cont "
gmt[2] <- "gmt subplot begin 4x2 -Fs4i/4i -C0/0/0/0 -M0/0 -SC  -SR  "
gmt[3] <- paste("gmt subplot set ; ")
gmt[4] <- paste("gmt blockmean tmp1       -R180/205/52/66/0/5 -C -r -V -I0.4/.3  >tmp.xyg ;")
gmt[5] <-       "gmt nearneighbor tmp.xyg -R180/205/52/66/0/5 -E0 -I0.4/0.4 -Gtmp.grd -N1 -S2/1.5 ;"
gmt[6] <-       "gmt mask tmp1 -I1        -R180/205/52/66/0/5 -JM4i  ; "
gmt[7] <-       "gmt grdview tmp.grd      -R180/205/52/66/0/5 -JM4i -Ctmpcatch.cpt -S1 -Qs "
gmt[8] <-       "gmt mask -C ; "
gmt[9] <-       "gmt pscoast              -R180/205/52/66/0/5 -JM4i  -Gtan -Di -Bx10 -By5 "
gmt[10] <-       "gmt text tmptext -F+f24p,Helvetica,brown ;" 
gmt[11]<-"gmt subplot end "
gmt[12]<- "gmt end show"
gmt[9] <-       ""
gmt[9] <-       "gmt text tmptext -F+f24p,Helvetica,brown ;" 
system(gmt[1])
system(gmt[2])
  for (i in 2012:2019){
    tmp1 <- du %>% filter(YEAR==i) %>% transmute(lon=LONGITUDE+360,lat=LATITUDE,tha=CPUE_KGHA/1000,col=0.02)
    write.table(tmp1,"tmp1",row.names=FALSE,col.names=FALSE)
    cat(file="tmptext",paste(182.8,64.5,i))
    for (i in 3:10) system(gmt[i])
  }
  system(gmt[11])
  system(gmt[12])

psxy poll_tmp.dat %region% -JM -Sp -W0/0/0/255 -K  %pl% -O >>%postfile%
:: if not exist temp%year%.grd (
blockmean data\temp%year%.csv -C -V -R %inc%  > temp%year%.xyg
  :: surface temp%year%.xyg -R  %inc% -Gtemp%year%.grd -T0.5 -C0.5 
surface temp%year%.xyg -R  %inc% -V -Gtemp%year%.grd -T0.1 
psclip survey.dat -R -JM -O -K -V >>%postfile%
grdcontour temp%year%.grd -R  -JM -Gd2i -Ctmp0.cpt -W04/0/000/200 -V -L-1.0/9 -Af14t -K %pl% -O >> %postfile%
grdcontour temp%year%.grd -R  -JM -Gd2i -Ctmp2.cpt -W04/0/200/0   -V -L-1.0/9 -Af14t -K %pl% -O >> %postfile%
grdcontour temp%year%.grd -R  -JM -Gd2i -Ctmp4.cpt -W04/250/000/0  -V -L-1.0/9 -Af14t -K %pl% -O >> %postfile%
grdcontour temp%year%.grd -R  -JM -Gd2i -Ctmp8.cpt -W04/200/00/0  -V -L-1.0/9 -Af14t -K %pl% -O >> %postfile%
:: grdview    temp%year%.grd -R  -JM -Ctemp.cpt -S -Qs -O -K                            >> %postfile%
:: grdcontour temp%year%.grd %region%  -JM -C1 -W06/0/00/200   -L-0.1/0.1 -N-@+o -K %pl% -O -V >> %postfile%
:: grdcontour temp%year%.grd %region%  -JM -C1 -W06/00/200/0   -L1.9/2.1  -N-@+o -K %pl% -O -V >> %postfile%
:: grdcontour temp%year%.grd %region%  -JM -C1 -W06/200/00/0   -L-1./7.1  -N-@+o -K %pl% -O -V >> %postfile%
:: grdcontour temp%year%.grd -R  -JM -Ctmp4.cpt -W12/200/00/0  -L0/2 -Af14t -N-@+o -K %pl% -O -V >> %postfile%
psclip -C -O -K >>%postfile%
echo off

:: grdcontour temp%year%.grd -R  -L1.9/2.1 -JM -Ctmp.cpt -At -N-@+o -G5c/2.5c -K %pl% -O >> %postfile%
:: grdcontour temp%year%.grd -R  -L1.9/2.1 -JM -Ctmp.cpt -At -N-@+o -G5c/2.5c -K %pl% -O >> %postfile%
:: grdcontour temp%year%.grd -R  -JM2.8 -Ctmp.cpt -A -W1/0 %pl% -K -O>> %postfile%

pscoast -R -JM -G%land% -K -O -Di %pl% >> %postfile%
echo 199.0 61.2 %yrFont% 0 1 0   %year%  |pstext -JM -R -O -G230/230/255 -N %pl% -K >> %postfile% 



#---Fishery stuff----------------------
wed <- read.csv("~/OneDrive/ebswp/data/Fishery/CAS_WED.csv",as.is=TRUE)
tac <- read.csv("~/_mymods/ebswp/doc/data/tac_abc.csv",as.is=TRUE)
tac
library(tidyverse)
library(ggplot2)
library(ggthemes)
names(wed)
unique(wed$Species.Group.Name)
unique(wed$FMP.Subarea)
#wed <- 
wed %>% filter(FMP.Area=="BSAI") %>% group_by(Year) %>% summarize(sum(Weight.Posted..Sum.)) %>% tail()
df <- wed %>% filter(FMP.Area=="BSAI",Species.Group.Name=="Pollock") %>% transmute(Year,ret=Retained.Discarded,wed=WED..mmdd.,
                target=Trip.Target.Name, season=ifelse(wed>610,"B","A"), area=Reporting.Area.Code, 
                mgt=ifelse(area==518,"Bogoslof",ifelse(area>539,"Aleutians",ifelse(area>519,"NW","SE"))), 
                strata=ifelse(season=="A","1",ifelse(area>519,2,ifelse(area<520,3,NA))), Catch=Weight.Posted..Sum.)
tsum <- (df) %>% group_by(ret,mgt,Year) %>% summarize(Catch=sum(Catch)) %>% pivot_wider(names_from=c(mgt,ret),values_from=Catch) 
head(df)
df %>% mutate(strata=ifelse(strata==1,"A-season",ifelse(strata==2,"NW B-season","SE B-season"))) %>% group_by(Year,strata) %>% summarize(Catch=sum(Catch)) %>%
      ggplot(aes(x=Year,y=Catch,fill=strata)) + geom_area() + theme_few()
library(flextable)
tail(tsum)
flextable(tsum)

#make cumulative by month figure
tail(df)
tmp <- df %>% mutate(Month=as.integer(wed/100)) %>%as.data.frame()
str(tmp)
tmp %>% filter(area<539) %>% select(Year,Catch,Month)%>%group_by(Year,Month) %>% mutate(Catch=sum(Catch)) %>% ungroup() %>% group_by(Year) %>% summarize(cumSum=sum(Catch))
head(tmp)
  q
dc <- read.csv("inseas.csv",header=FALSE,as.is=TRUE)
head(dc)
names(dc) <-c( "v", "haul", "cruise","mm",  "dd", "yr", "lat","lon", "v_type","dur","fdepth","bdepth","otc","wt","no","chin","chum","date","Time","dlat","dlon","CDQ","area","xx")
dc %>% group_by(yr) %>% summarize(sum(otc))
dc1 <- dc %>% transmute(Year=yr,Season=ifelse(mm<6,"A","B"),lat=lat,lon=lon,Catch=wt/1000) 
head(dc1)
d/cpt

gmt blockmean -R -V -S -I.5 tmp >tmp.xyg 



#=================================
gmt begin panels pdf
  gmt subplot begin 2x1 -Fs9i/15i -R180/205/52/66 -JB194/45/56/65/20 -SCb -SRL -Bewnsstr -Bx10 -By5 
    gmt subplot set
    gmt grdview @earth_relief_02m -Qi100 -p183/43 -Ct2.cpt 
    gmt plot tmp2 -So0.1 -JZ10 -Gpurple -p -V
    gmt subplot set
    gmt grdview @earth_relief_02m -Qi100 -p183/43 -Ct.cpt 
    gmt plot3d tmp2 -So0.1 -JZ10 -Gpurple -p
  gmt subplot end
gmt end show

gmt begin panels pdf
    gmt grdview @earth_relief_02m -Qi100 -p183/43 -Ct.cpt -R180/205/52/66 -JB194/45/56/65/20 -SCb -SRL -Bewnsstr -Bx10 -By5 
    gmt plot3d tmp2 -So0.1 -JZ10 -Gpurple -p
gmt end show

st_gmt <- paste("gmt begin",sppyr)
gmt_coast <- paste0('gmt coast -R190/228/52/61/0/',maxpt,' -Jb230/50/56/64/1.00 -p200/65 -V -Gtan -Bx10 -Bz10+lCPUE -By3  -B+t',maptitle )
gmt_3d  <-"gmt plot3d tmp2 tmp3 -JZ10. -V -So0.06 -Gpurple -p "
#gmt_plt <-"gmt plot tmp3 -Sa.3 -Gred -p"
end_gmt <-"gmt end show"
gmt   makecpt -Cglobe -Z -V >t.cpt
gmt set MAP_FRAME_TYPE FANCY FORMAT_GEO_MAP ddd:mm:ssF MAP_GRID_CROSS_SIZE_PRIMARY
gmt begin test pdf
  gmt grdview @earth_relief_02m -R180/205/53/65 -JB194/51/56/61/20 -Qi600 -p183/33 -Ct.cpt  -Bx3 -By2 
    gmt plot3d tmp2 -So0.1 -JZ10 -Gpurple -p
gmt end show

gmt grdview hawaii_grav.nc -JB194/51/55/61/10c -Chawaii.cpt -Jz0.05c -Qm -N-100 -p225/30 -Wc -pdf hawaii_grav_image

gmt clear all

gmt begin panels pdf
  gmt subplot begin 4x1 -Fs7i/4i -R180/205/50/66 -JB194/50/56/61/20 -SCb -SRL -Bewnsstr -Bx10 -By5 
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
