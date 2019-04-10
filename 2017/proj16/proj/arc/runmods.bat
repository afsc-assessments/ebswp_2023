call run ebs_poll_t1 noenv
::call run ebs_poll_t1 wenv

call run ebs_poll_t1 noenv noac
call run ebs_poll_t1 noenv ac
:: Dorn rules
call run ebs_poll_fa noenv
call run ebs_poll_fa wenv
:: Younger fish
call run ebs_poll_yf noenv
call run ebs_poll_yf wenv
:: older fish
call run ebs_poll_of noenv
call run ebs_poll_of wenv


call run ebs_poll_t1_nocap noenv
call run ebs_poll_t1_nocap wenv

call run ebs_poll_t1_lowcap noenv
call run ebs_poll_t1_lowcap wenv
