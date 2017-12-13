NAN for input recruitment...
changed run.bat to use setup.dat as environmental model case
awkit.bat

run now changes 3 things: the setup, the srecpar, and the datafile
3rd arg is ac or noac in using srr
copy srecpar%3.dat srecpar.dat
copy setup_%2%3.dat setup.dat
copy data\%1_spcat.dat   spp_catch.dat

