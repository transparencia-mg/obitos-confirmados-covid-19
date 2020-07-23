library(magrittr)

source("scripts/lib/utils.R")

input <- "data-raw/OBITOS_CONF_COVID-19_MG.xlsx"
output <- jsonlite::read_json("datapackage.json")$resources[[1]]$path

result <- input %>%
            read() %>% 
            recode()

readr::write_excel_csv2(result, path = output)
