#' Rescale a Covariance Matrix
#'
#' This function rescales a covariance matrix using either the Cholesky
#' decomposition method or a simple diagonal adjustment.
#'
#' @param Sigma A covariance matrix that needs to be rescaled.
#' @param Scale_factor A numeric value or vector used for scaling.
#' @param DoChol Logical indicating if the Cholesky decomposition method should be used.
#'        If `FALSE`, the simple diagonal adjustment method is used. Default is `FALSE`.
#' @return A rescaled covariance matrix.
#' @export
rescale_cov <- function(Sigma, Scale_factor, DoChol = FALSE) {
  if (DoChol) {
    # Cholesky decomposition
    L <- chol(Sigma)
    # Scale the diagonal elements of the Cholesky factor
    L_scaled <- L %*% diag(sqrt(Scale_factor), ncol(L))
    # Recompute the covariance matrix
    Sigma_scaled <- L_scaled %*% t(L_scaled)
  } else {
    # Simple diagonal adjust to correlation
    c1 <- Sigma
    d1 <- sqrt(diag(c1))
    d2 <- as.vector(d1 * Scale_factor)
    c2 <- cov2cor(c1)
    c3 <- sweep(sweep(c2, 1L, d2, "*"), 2L, d2, "*")
    Sigma_scaled <- c3
  }
  return(Sigma_scaled)
}
