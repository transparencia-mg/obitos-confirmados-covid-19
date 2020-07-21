.PHONY: help publish

#====================================================================
# PHONY TARGETS

help: 
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

publish: ## Adiciona commit hash ao datapackage.json e exporta para buid/
	Rscript --verbose scripts/process.R 2> logs/log.Rout

clean: data/obitos-confirmados-covid-19.csv ## Atualiza csv com obitos confirmados e exporta para data/

data/obitos-confirmados-covid-19.csv: scripts/clean_raw.R scripts/lib/utils.R data-raw/OBITOS_CONF_COVID-19_MG.xlsx
	Rscript --verbose $< 2> logs/log.Rout