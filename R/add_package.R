#' Add a package to the packages.R file
#'
#' @return
#' @export
#'
#' @examples
add_package <- function(pkgs, homedir = '.'){
  if(file.exists(file.path(homedir,'lib','pkgs.yml'))){
    existing_pkgs <- yaml::yaml.load_file(file.path(homedir,'lib','pkgs.yml'))
    pkgs <- unique(c(pkgs, existing_pkgs))
    write_packages(pkgs, homedir)
  } else {
    write_packages(pkgs, homedir)
  }
  load_packages()
}
