gmt math -T0/360/20 T SIND = sin_point.txt
gmt math -T0/360/2 T SIND = sin_curve.txt
gmt begin
	gmt psbasemap -R0/360/-1.2/1.6 -JX3.5i/1.65i -X0.35i -Y0.25i 	-BWSne+glightgreen -Bxa90g90f30+u'\232' -Bya0.5f0.1g1 --FONT_ANNOT_PRIMARY=9p
gmt end
