#' Loading project-required packages in R
#'
#' This function reads a file "pkgs.yml" in the `lib` directory of the project
#' and loads them in R, installing them if necessary
#'
#' @return
#' @export
#'
#' @examples
load_packages <- function() {
  if(!file.exists(file.path('lib','pkgs.yml'))){
    stop('No packages to load; use `add_package` to add packages')
  }
  pkgs <- yaml::yaml.load_file(file.path('lib','pkgs.yml'))
  for(p in pkgs){
    if(!(p %in% installed.packages()[,1])){
      utils::install.packages(p, repos='http://cran.rstudio.com')
    }
    suppressPackageStartupMessages(library(p, character.only = TRUE))
  }
}
