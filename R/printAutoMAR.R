#' Print Method for the autoMAR Class
#' Print the result of autoMAR object
#'
#' @param x [Object | Required] an object of class autoMAR
#'
#' @return Print summary of autoMAR output in console
#' @examples
#' ## Missing at random features
#' marobj <- autoMAR (heart, aucv = 0.9, strataname = NULL, stratasize = NULL, mar_method = "glm")
#'
#' ## print summary in console
#' printautoMAR(marobj)
#' @export printautoMAR


printautoMAR <- function(x) {
  cat("MissingAtRandom result\n\n")
  cat("Call:\n", deparse(x$call), "\n\n")
  cat("Sample size:                                ", x$num_samples, "\n")
  cat("Number of variables:                        ", x$num_variables, "\n")
  cat("Number of missing variables:                ", x$num_miss_variables, "\n", "\n")
  cat("Number of not missing at random variables:  ", x$num_nmar_variables, "\n", "\n")
  cat("List of features are not missing at random:  ", "\n")
  cat("-------------------------------------------", "\n")
  if (!is.null(x$auc.features)) {
    cat(paste0(paste(x$auc.features$Variable, round(x$auc.features$AUC, 2), sep = " : "), "\n"))
  }
}
