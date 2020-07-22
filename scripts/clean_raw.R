library(dplyr)

source("scripts/lib/utils.R")

#======================================================================
# config
path <- "data-raw/OBITOS_CONF_COVID-19_MG.xlsx"
output <- jsonlite::read_json("datapackage.json")$resources[[1]]$path
#======================================================================

obitos_confirmados_cge <- read(path) %>% recode()

obitos_confirmados_cge %>% readr::write_excel_csv2(output)
