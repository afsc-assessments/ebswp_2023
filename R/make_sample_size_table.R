make_sample_size_table <- function(){
  
    i_bts=1; i_eit=1
    tab <- data.frame()
    for (i in 1978:thisyr) {
      t <- c(i,0,0,0)
      if(M$Yr[i-1963]==i) {
        t[2] <- M$sam_fsh[i-1963]
      } else 
        t[2] <- 0

      if (i_bts<=length(M$yr_bts))
      {
        if(M$yr_bts[i_bts]==i) 
        {
          t[3] <- M$sam_bts[i_bts]
          print(c(i,i_bts,t[3]))
          i_bts <- i_bts+1
        }
      } 
      else 
        t[3] <- NA
      if(M$yr_eit[i_eit]==i && i_eit<=length(M$yr_eit)) 
      {
        t[4] <- M$sam_eit[i_eit]
        i_eit <- i_eit+1
      } 
      else 
        t[4] <- NA
      tab <- rbind(tab, t)
    }
    names(tab) <- c("Year", "Fishery", "BTS", "ATS")
    cap <- tabcap[23]
    lab <- paste0("tab:",tablab[23])
    tab <- xtable(tab, caption = cap, label=lab, big.mark="," ,digits=0)
    print(tab, caption.placement = "top",digits=0,big.mark=",",include.rownames = FALSE, sanitize.text.function = function(x){x})
}
