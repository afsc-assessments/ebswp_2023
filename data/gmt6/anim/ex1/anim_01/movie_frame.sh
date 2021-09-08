#!/usr/bin/env bash
# Main frame loop script
export GMT_SESSION_NAME=$$
# Include static and frame-specific parameters
source movie_init.sh
source movie_params_$1.sh
mkdir ${MOVIE_NAME}
cd ${MOVIE_NAME}
gmt begin
# 	Set output PNG name and plot conversion parameters
	gmt figure ${MOVIE_NAME} png E${MOVIE_DPU},A+n+r,Mb../movie_background.ps
	gmt set PS_MEDIA 4ix2i DIR_DATA /Users/jim/_mymods/ebswp/gmt6/anim/ex1,/Users/jim/_mymods/ebswp/gmt6/anim/ex1/anim_01
#	Plot smooth blue curve and dark red dots at all angle steps so far
	last=`gmt math -Q ${MOVIE_FRAME} 10 MUL =`
	gmt convert sin_curve.txt -Z0:${last} | gmt psxy -W1p,blue -R0/360/-1.2/1.6 -JX3.5i/1.65i -X0.35i -Y0.25i
	gmt convert sin_point.txt -Z0:${MOVIE_FRAME} | gmt psxy -Sc0.1i -Gdarkred
#	Plot bright red dot at current angle and annotate
	gmt psxy -Sc0.1i -Gred <<< "${MOVIE_COL1} ${MOVIE_COL2}"
	printf "0 1.6 a = %3.3d" ${MOVIE_COL1} | gmt pstext -F+f14p,Helvetica-Bold+jTL -N -Dj0.1i/0.05i
gmt end
# Move PNG file up to parent directory and cd up one level
mv -f ${MOVIE_NAME}.png ..
cd ..
# Remove frame directory and frame parameter file
rm -rf ${MOVIE_NAME}
rm -f movie_params_$1.sh
