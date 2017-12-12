#' Loading project-required packages in R
#'
#' This function reads a file "pkgs.yml" in the `lib` directory of the project
#' and loads them in R, installing them if necessary
#'
#' Non-CRAN packages can be accessed via GitHub by specifying `user/package` format
#' Particular versions of packages can be ensured by specifying `package => version` format
#'
#' @return
#' @export
#'
#' @examples
load_packages <- function(homedir = '.') {
  if(!file.exists(file.path('lib','pkgs.yml'))){
    add_package('ProjTemplate')
  }
  pkgs <- yaml::yaml.load_file(file.path('lib','pkgs.yml'))
  if(any(stringr::str_detect(pkgs, '=>'))){# Version information included
    out = do.call(rbind,stringr::str_split(pkgs,'=>'))
    pkgs <- out[,1]
    versions <- out[,2]
  } else {versions <- NULL}
  for(p in pkgs){
    if(!(p %in% installed.packages()[,1])){
      if(!is.null(versions)){
        devtools::install_version(p, version = out[out[,1]==p,2], repos = 'http://cran.rstudio.com')
      } else{
        if (str_detect(p, '/')){
          devtools::install_github(p)
        } else{
        utils::install.packages(p, repos='http://cran.rstudio.com')
        }
      }
    }
    suppressPackageStartupMessages(library(p, character.only = TRUE))
  }
}
