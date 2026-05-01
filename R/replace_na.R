#' @export
replace_na <- function(x){
  if(is.na(x)) x <- "NA"
  return(x)
}
