DATA_SECTION
  init_int n_bts;
  init_vector ob_bts(1,n_bts);
  init_matrix cov_in(1,n_bts,1,n_bts);
  matrix inv_bts_cov(1,n_bts,1,n_bts);
  !! inv_bts_cov = inv(cov_in) ;
PARAMETER_SECTION
   init_number mu(1);
	 vector eb_bts(1,n_bts);
	 objective_function_value f
PROCEDURE_SECTION
    dvar_vector srv_tmp(1,n_bts);
		eb_bts = mu;
    srv_tmp = (ob_bts + 1e-8)-(eb_bts + 1e-8);
    f  = .5 * srv_tmp * inv_bts_cov * srv_tmp;

