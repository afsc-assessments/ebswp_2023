# cp srecpar$3.dat srecpar.dat
# cp setup_$2$3.dat setup.dat
cp -v data/$1_spcat.dat spp_catch.dat
main -nox -nohess
mkdir $1_res
cp -v *.out $1_res/
cp -v main.rep $1_res/report.out
cp -v alt2_proj.rep $1_res/alt2_proj.out
cleanad
