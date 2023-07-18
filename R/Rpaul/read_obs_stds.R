# read in the observed values of the variances of stds
srv_cov <- read.table('cov.txt', header=T)  # covariance matrix for survey biomass
eit_bio_sd <- read.table('eit_bio_sd.txt', header=T)
eac_fsh_sam <- read.table('eac_fsh_sam.txt', header=T)
eac_bts_sam <- read.table('eac_bts_sam.txt', header=T)
eac_eit_sam <- read.table('eac_eit_sam.txt', header=T)
cpue_std <- read.table('cpue_std.txt', header=T)
avo_std <- read.table('avo_std.txt', header=T)
fsh_wt_std <- read.table('fsh_wt_std.txt', header=T)
srv_wt_std <- read.table('srv_wt_std.txt', header=T)