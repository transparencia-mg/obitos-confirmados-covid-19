library(dplyr)

purrr::walk(list.files("scripts/lib/", full.names = TRUE), source)

#======================================================================
# config
path <- "data-raw/OBITOS_CONF_COVID-19_MG.xlsx"
output <- "data/obitos-confirmados-covid-19.csv"
#======================================================================

obitos_confirmados_cge <- read(path) %>% recode()

obitos_confirmados_cge %>% readr::write_excel_csv2(output)
