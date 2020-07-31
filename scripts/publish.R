source("scripts/lib/utils.R")

output <- jsonlite::read_json("datapackage.json")$resources[[1]]$path

res <- ckanr::resource_update(id = "e5732e33-306f-422c-87b7-257c2e283de1",
                       path = output, 
                       url = "http://dados.mg.gov.br", 
                       key = Sys.getenv("DADOSMG_PROD"))

stopifnot(check_upload(file = output, url = res$url))
