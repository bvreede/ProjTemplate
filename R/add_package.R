#' Add packages to a project
#'
#' @param pkgs A character or array of characters that denote the names of packages to include
#' @param homedir Top level directory of the project, defaults to the current directory
#'
#' @export
#'
#' @examples
#' add_packages(c('tidyverse','broom','stringr'))
add_package <- function(pkgs, homedir = '.'){
  if(file.exists(file.path(homedir,'lib','pkgs.yml'))){
    existing_pkgs <- yaml::yaml.load_file(file.path(homedir,'lib','pkgs.yml'))
    pkgs <- unique(c(pkgs, existing_pkgs))
    write_packages(pkgs, homedir)
  } else {
    write_packages(c('ProjTemplate',pkgs), homedir)
  }
  load_packages()
}
