#' Title
#'
#' @param pkgs A character array of packages to initialize the project with
#' @param homedir The top-level directory of the project, defaults to the current directory
#'
#' @return
#'
#' @examples
write_packages <- function(pkgs = NULL, homedir = '.'){
  require(yaml)
  if(!is.null(pkgs)){
    pkg_yml <- as.yaml(pkgs)
    write(pkg_yml, file = file.path(homedir, 'lib','pkgs.yml'))
  }
}
