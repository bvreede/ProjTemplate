#' Create a directory structure for a RStudio project
#'
#' This function actually creates the folders and files that go into the template.
#' It will not overwrite existing
#'
#' @param homedir What directory are you creating the template in
#'
#' @return
#' @export
#'
useTemplate <- function(homedir = '.') {
  for(d in c('data','docs','graphs', 'lib','scripts')){
    if(!dir.exists(file.path(homedir,d))){
      dir.create(file.path(homedir,d), recursive = TRUE)
    }
  }
  for(d in c('raw','rda')){
    if(!dir.exists(file.path(homedir,'data',d))){
      dir.create(file.path(homedir, 'data',d))
    }
  }
  for(d in c('R','src','tests')){
    if(!dir.exists(file.path(homedir,'lib',d))){
      dir.create(file.path(homedir, 'lib',d))
    }
  }
  for(f in paste0(c('DataAcquisition','DataMunging','Modeling','Figures', 'Tables'),'.R')){
    if(!file.exists(file.path(homedir, f))){
      file.create(file.path(homedir,f))
    }
  }
}
