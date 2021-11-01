clean:
	rm derived_data/*
	rm figures/*
	rm reports/*

derived_data/tidy_sharks.csv: clean_sharks.R utils.R source_data/shark_attacks.csv
	Rscript clean_sharks.R

figures/shark_sex_fatality.png figures/shark_type_fatality.png: figures_sharks.R derived_data/tidy_sharks.csv
	Rscript figures_sharks.R

reports/midterm_report.pdf: shark_report.Rmd figures/shark_sex_fatality.png figures/shark_type_fatality.png
	R -e "rmarkdown::render('shark_report.Rmd', output_format='pdf_document', output_file='reports/midterm_report.pdf')"