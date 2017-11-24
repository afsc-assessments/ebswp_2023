 :: ebs_poll_t1_noenv
 :: ebs_poll_t1_wenv
 :: ebs_poll_t1_nocap_wenv
 :: ebs_poll_t1_nocap_noenv
 :: ebs_poll_t1_lowcap_noenv
 :: ebs_poll_t1_lowcap_wenv
call awkit 2 t1_noenv sq
call awkit 2 t1_wenv sq
call awkit 2 t1_noenv  ac

call awkit 2 fa_noenv  fa
call awkit 2 fa_wenv  fa
call awkit 2 yf_noenv  yf
call awkit 2 yf_wenv  yf
call awkit 2 of_noenv  of
call awkit 2 of_wenv  of

call awkit 5 t1_noenv nf
call awkit 5 t1_wenv nf

:: low cap
call awkit 2 t1_lowcap_noenv sq
call awkit 2 t1_lowcap_wenv sq
:: Teresas wtd baseline
call awkit 97 t1_noenv wb
call awkit 97 t1_wenv wb
:: shifting baseline
call awkit 98 t1_noenv sb
call awkit 98 t1_wenv sb
:: No cap (kink==yes)
call awkit 2 t1_nocap_noenv nc
call awkit 2 t1_nocap_wenv nc
:: No cap no kink
call awkit 99 t1_nocap_noenv nk
call awkit 99 t1_nocap_wenv nk
