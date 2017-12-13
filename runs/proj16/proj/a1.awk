NR>1{
  {i= $1" "$2" "$3}
  {   c[i]++  }
  { abc[i]+=$4}
  { ofl[i]+=$5}
  { cat[i]+=$6}
  { ssb[i]+=$7}
  {   f[i]+=$8}
  {totb[i]+=$9}
  { spr[i]+=$10}
}
END {
{print "Alt Stock Year ABC OFL Catch SSB F Total_Biom SPR_Implied"}
for (i in abc) {
  print i, abc[i]/c[i], ofl[i]/c[i], cat[i]/c[i], ssb[i]/c[i], f[i]/c[i], 
  totb[i]/c[i], spr[i]/c[i] }
}

