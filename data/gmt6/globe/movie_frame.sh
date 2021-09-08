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
	gmt figure ${MOVIE_NAME} png E${MOVIE_DPU},A+n+r
	gmt set PS_MEDIA 6ix6i DIR_DATA /Users/jim/_mymods/ebswp/gmt6,/Users/jim/_mymods/ebswp/gmt6/globe
   gmt pscoast -Rg -JG${MOVIE_FRAME}/20/${MOVIE_WIDTH} -Gmaroon -Sturquoise -P -Bg -X0 -Y0
gmt end
# Move PNG file up to parent directory and cd up one level
mv -f ${MOVIE_NAME}.png ..
cd ..
# Remove frame directory and frame parameter file
rm -rf ${MOVIE_NAME}
rm -f movie_params_$1.sh
