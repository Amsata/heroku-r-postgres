options(encoding = "UTF-8")

my_packages=c("RPostgreSQL","RPostgres", "httr","shiny","dplyr","tidyr")

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p)
  }
}

invisible(sapply(my_packages, install_if_missing))