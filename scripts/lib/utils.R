read <- function(path, range) {
  
  infer_spec <- names(readxl::read_excel(path, n_max = 1, .name_repair = janitor::make_clean_names))
  
  expected_cols <- c(
    "paciente",
    "sexo",
    "idade",
    "municipio_de_residencia",
    "data_do_obito",
    "comorbidade")
  
  stopifnot(all(infer_spec == expected_cols))
  
  cols_spec <- c(
    PACIENTE = "text",
    SEXO = "text",
    IDADE = "numeric",
    MUNICIPIO_RESIDENCIA = "text",
    DATA_OBITO = "date", 
    COMORBIDADE = "text"
  )
  
  dt_raw <- readxl::read_excel(path, col_types = cols_spec)
  
  names(dt_raw) <- names(cols_spec)
  
  dt_raw
}

recode <- function(x) {
  
  return <- x %>% 
    mutate(DATA_OBITO = lubridate::as_date(DATA_OBITO))
  
  return
  
}

check_upload <- function(file, url) {
  file_hash <- digest::digest(file, file = TRUE)
  
  tmp <- tempfile()
  download.file(url, tmp)
  url_hash <- digest::digest(tmp, file = TRUE)
  unlink(tmp)  
  
  file_hash == url_hash
}
