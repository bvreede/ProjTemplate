#' Reloading utility functions into R
#'
#' This function creates a new environment in R, sources all the R script files
#' in the `lib/R` directory into that environment, and attaches that environment to the
#' current namespace. This is a "poor man" packaging system before a formal package is written
#'
#' This function can be called repeatedly when new utility functions are stored in `lib/R` or
#'
#' @param d The directory where the utility functions reside. Defaults to the "lib/R"
#'   sub-directory of the current directory
#' @return Invisibly attaches an environment to the current workspace, named "fn"
#' @export
#'
reload <- function(d = file.path(getwd(),'lib')){
  add_package('ProjTemplate')
  load_packages()
  if ('fn' %in% search()) detach('fn')
  fn <- new.env()
  for (f in dir(file.path(d,'R'), pattern = '[.R]')) {
    print(paste('Loading',f))
    source(file.path(d,'R',f), local = fn)
  }
  attach(fn)

}
