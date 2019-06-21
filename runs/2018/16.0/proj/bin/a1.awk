#Alternative SpNo Spp Yr  ABC OFL Catch SSB F Tot_biom SPR_Implied Ntot SexRatio
#1 1 Final_2009_model 2010 78.3095 93.3994 74 114.436 0.390578 521.827 0.416187 0.503464 0.5
NR>1{
  {i= $1" "$2" "$3" "$4}
  {   c[i]++  }
  { abc[i]+=$5}
  { ofl[i]+=$6}
  { cat[i]+=$7}
  { ssb[i]+=$8}
  {   f[i]+=$9}
  {totb[i]+=$10}
  { spr[i]+=$11}
}
END {
{print "Alt Stock Year ABC OFL Catch SSB F Total_Biom SPR_Implied"}
for (i in abc) {
  print i, abc[i]/c[i], ofl[i]/c[i], cat[i]/c[i], ssb[i]/c[i], f[i]/c[i], 
  totb[i]/c[i], spr[i]/c[i] }
}
