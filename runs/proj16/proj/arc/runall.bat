goto here

copy data\WC_spcat.dat spp_catch.dat
copy E_setup.dat setup.dat
call r wC_E
:here

copy F_setup.dat setup.dat
call r wC_F


copy C_setup.dat setup.dat
call r wC_C

copy data\NC_spcat.dat spp_catch.dat
copy F_setup.dat setup.dat
call r NC_F

copy E_setup.dat setup.dat
call r NC_E

copy C_setup.dat setup.dat
call r NC_C

goto end
:end
