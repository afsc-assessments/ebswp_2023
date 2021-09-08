
#root_dir = "C:/Users/James.Thorson/Desktop/Work files/AFSC/2021-05 -- Dropping parts of EBS/"
root_dir = "/Users/jim/_mymods/ebswp/doc/vast/2021/"
coldpool_dir = "/Users/jim/_mymods/ebswp/doc/vast/2021/"
#coldpool_dir = "C:/Users/James.Thorson/Desktop/Work files/Collaborations/2019 -- SAFE pollock and cod/Cold pool data/"

#Date = Sys.Date()
Date = "2021-05-25"

date_dir = paste0(root_dir,Date,"/")

library(VAST)
library(FishData)

species_set = c( "Gadus chalcogrammus", "Gadus macrocephalus", "Limanda aspera", "Chionoecetes opilio" )
design_set = c("All", "No_east", "No_west", "No_north", "No_south")
years_to_keep = c(1982, 1985, 1988, 1999, 2010, 2017, 2018, 2019)

#####################
# Run models
#####################

pI = sI = 1
for( pI in seq_along(species_set) ){
for( sI in seq_along(design_set) ){

  # directory
  run_dir = paste0(date_dir,species_set[pI],"/",design_set[sI],"/")
    dir.create(run_dir, recursive=TRUE)

  # Download
  Data = download_catch_rates(survey="Eastern_Bering_Sea", localdir=root_dir, species_set = species_set[pI] )

  #
  CP = read.csv( paste0(coldpool_dir,"cpa_areas2019.csv") )
  covariate_data = data.frame( "Year"=CP[,"YEAR"], "Lat"=mean(Data[,'Lat']), "Lon"=mean(Data[,'Long']), "CPE"=(CP[,'AREA_SUM_KM2_LTE2']-mean(CP[,'AREA_SUM_KM2_LTE2']))/sd(CP[,'AREA_SUM_KM2_LTE2']) )

  # Drop data
  plot( x=Data[,'Long'], y=Data[,'Lat'] )
  if( design_set[sI]=="All" ) Keep = 1:nrow(Data)
  if( design_set[sI]=="No_east" ){
    Keep = which( (Data[,'Year']%in%years_to_keep) | Data[,'Long']<(-165) )
  }
  if( design_set[sI]=="No_west" ){
    Keep = which( (Data[,'Year']%in%years_to_keep) | Data[,'Long']>(-174) )
  }
  if( design_set[sI]=="No_north" ){
    Keep = which( (Data[,'Year']%in%years_to_keep) | Data[,'Lat']<(59) )
  }
  if( design_set[sI]=="No_south" ){
    Keep = which( (Data[,'Year']%in%years_to_keep) | Data[,'Lat']>(57) )
  }
  Data = Data[Keep,]

  # Make settings
  settings = make_settings( n_x = 100,
    Region = "eastern_bering_sea",
    purpose = "index2",
    ObsModel = c(2,4) )
  settings$RhoConfig[c("Epsilon1","Epsilon2")] = 4

  # Run model
  if( !("Report.RData" %in% list.files(run_dir)) ){
    fit = fit_model( settings = settings,
      Lat_i = Data[,'Lat'],
      Lon_i = Data[,'Long'],
      t_i = Data[,'Year'],
      #b_i = as_units( Data[,'Wt'], "kg"),
      #a_i = as_units( Data[,'AreaSwept_ha']/100, "km^2"),
      working_dir = run_dir,
      covariate_data = covariate_data,
      X1_formula = ~ CPE,
      X2_formula = ~ CPE,
      X1config_cp = array(2,dim=c(1,1)),
      X2config_cp = array(2,dim=c(1,1)),
      test_fit = FALSE,
      lower = -Inf,
      upper = Inf )

    # Plot results
    plot( fit,
      working_dir = run_dir,
      n_samples = 0,
      check_residuals = FALSE )

    # Save
    Report = fit$Report
    save( Report, file=paste0(run_dir,"Report.RData") )
  }
}}

#####################
# Load and plot
#####################

year_set = 1982:2019
Index_pstz = array(NA, dim=c(length(species_set),length(design_set),length(year_set),2) )
width = qnorm(0.975)

pI = sI = 1
ThorsonUtilities::save_fig( file=paste0(date_dir,"Comparison"), width=8, height=8 )
  par( mfrow=c(4,4), mar=c(2,2,0,0), mgp=c(2,0.5,0), tck=-0.02, oma=c(0,3,3,0) )
  for( pI in seq_along(species_set) ){
    for( sI in seq_along(design_set) ){
      run_dir = paste0(date_dir,species_set[pI],"/",design_set[sI],"/")
      if( "Index.csv" %in% list.files(run_dir) ){
        Index = read.csv( paste0(run_dir,"Index.csv") )
        Index_pstz[pI,sI,,] = as.matrix(Index[,c("Estimate","SD_mt")])
      }
    }
    for( sI in 2:length(design_set) ){
      # Add to plot
      if( !all(is.na(Index_pstz[pI,sI,,])) ){
        plot_timeseries( x=year_set, y=Index_pstz[pI,1,,1], y_sd=width*Index_pstz[pI,1,,2],
          fn=plot, bounds_type="shading", bounds_args=list(col=rgb(0,0,0,0.2)), type="l", lwd=2, ylim=c(0,max(Index_pstz[pI,,,1]+width*Index_pstz[pI,,,2],na.rm=TRUE)) )
        plot_timeseries( x=year_set, y=Index_pstz[pI,sI,,1], y_sd=width*Index_pstz[pI,sI,,2],
          fn=lines, bounds_type="shading", bounds_args=list(col=rgb(1,0,0,0.2)), type="l", lwd=2, col="red" )
        if(sI==2) mtext(side=2, text=paste0(strsplit(species_set[pI]," ")[[1]],collapse="\n"), line=2)
        if(pI==1) mtext(side=3, text=design_set[sI], line=0)
        if(sI==2 & pI==1) legend("bottomleft", bty="n", fill=c("black","red"), legend=c("All data","Reduced data") )
        if(sI==2 & pI==1) legend("topleft", bty="n", legend=c("Shading: 95% CI") )
      }else{
        plot.new()# x=year_set, y=year_set, type="n", ylim=c(0,1) )
        legend("center", legend="Not converged",bty="n")
      }
    }
  }
dev.off()

ThorsonUtilities::save_fig( file=paste0(date_dir,"Design"), width=4, height=6 )
  par( mfrow=c(3,2), mar=c(2,2,1,0), mgp=c(2,0.5,0), tck=-0.02, oma=c(0,3,3,0) )
  for( sI in seq_along(design_set) ){
    # Download
    Data0 = download_catch_rates(survey="Eastern_Bering_Sea", localdir=root_dir, species_set = species_set[pI] )

    # Drop data
    if( design_set[sI]=="All" ) Keep = 1:nrow(Data0)
    if( design_set[sI]=="No_east" ){
      Keep = which( (Data0[,'Year']%in%years_to_keep) | Data0[,'Long']<(-165) )
    }
    if( design_set[sI]=="No_west" ){
      Keep = which( (Data0[,'Year']%in%years_to_keep) | Data0[,'Long']>(-174) )
    }
    if( design_set[sI]=="No_north" ){
      Keep = which( (Data0[,'Year']%in%years_to_keep) | Data0[,'Lat']<(59) )
    }
    if( design_set[sI]=="No_south" ){
      Keep = which( (Data0[,'Year']%in%years_to_keep) | Data0[,'Lat']>(57) )
    }
    Data = Data0[Keep,]
    Data = subset( Data, Year==2016 )
    plot( x=Data[,'Long'], y=Data[,'Lat'], main=design_set[sI], xlim=range(Data0[,'Long']), ylim=range(Data0[,'Lat']) )
  }
dev.off()