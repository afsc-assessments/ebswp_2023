#' Explore OSA residuals for multinomial composition data and
#' compare to Pearson
#' @param obs,exp,pearson the observed, expected and Pearson
#'   residual matrices with rows as years and columns as ages (or
#'   lengths)
#' @param index,years vectors giving the index of ages (or length) and years
#' @param index_label character value indicating 'age' or 'length bin' depending on comp type
#' @param stock,survey characters given the stock and survey,
#' used to create filename stock_survey.pdf
#' @param outpath folder name for output, e.g. 'figs'
#' @return returns nothing but creates a PDF file in the working
#' directory
#'
plot_osa_comps <- function(obs, exp, pearson, index, years, index_label, Neff,
                           stock, survey, outpath = '',do_pdf=FALSE){
  stopifnot(all.equal(nrow(obs), nrow(exp), nrow(pearson),
                      length(years)))
  stopifnot(all.equal(ncol(obs), ncol(exp), ncol(pearson), length(index)))
  filename <- paste0(stock,"_",survey,"_", gsub('\\s', '_', index_label), ".pdf")

  if(do_pdf){
    if(is.null(outpath)) {
      pdf(here::here(filename), onefile=TRUE, width=7, height=7)
    } else {
      pdf(here::here(outpath, filename), onefile=TRUE, width=7, height=7)
    }
  }

  on.exit(dev.off())
  ## Neff <- ceiling(Neff)
  o <- round(Neff*obs/rowSums(obs),0); p=exp/rowSums(exp)
  ## default output
  res <- resMulti(t(o), t(p))
  if(!all(is.finite(res))){
    warning("failed to calculate OSA residuals for ", stock)
    return(NULL)
  }
  plot(res)
  ## compare to Pearson side by side
  mat <- t(matrix(res, nrow=nrow(res), ncol=ncol(res)))
  dimnames(mat) <- list(year=years, index=index[-1])
  reslong <- reshape2::melt(mat, value.name='resid')
  g1 <- ggplot(reslong, aes(year, index, size=abs(resid),
                            color=resid>0)) + geom_point() +
    ggtitle(paste0('OSA w/o ', index_label, ' 1')) + ylim(range(index)) +
    ylab(index_label)
  dimnames(pearson) <- list(year=years, index=index)
  pearsonlong <- reshape2::melt(pearson, value.name='resid')
  g2 <- ggplot(pearsonlong, aes(year, index, size=abs(resid),
                                color=resid>0)) + geom_point() +
    ggtitle('Pearson') + ylab(index_label)
  print(cowplot::plot_grid(g1,g2, nrow=2))

  ## ind is age/len bin to drop
  for(ind in 1:length(index)){
    ## assumes first column dropped so put it there
    index2 <- index[-ind]
    o2 <- cbind(o[,ind], o[,-ind])
    p2 <- cbind(p[,ind], p[,-ind])
    res <- resMulti(t(o2), t(p2))
    ## not sure why these fail sometimes?
    if(!all(is.finite(res))) {warning('failed when ind=',ind); break}
    mat <- t(matrix(res, nrow=nrow(res), ncol=ncol(res)))
    dimnames(mat) <- list(year=years, index=index2)
    reslong <- reshape2::melt(mat, value.name='resid')
    g <- ggplot(reslong, aes(year, index, size=abs(resid),
                             color=resid>0)) + geom_point()+
      ggtitle(paste0('OSA w/o ', index_label, ' ', index[ind])) + ylim(range(index)) +
      ylab(index_label)
    print(g)
  }
  message("wrote file ", filename)
}
