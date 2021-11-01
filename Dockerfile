FROM rocker/verse
RUN R -e "install.packages(\"reticulate\")"
RUN R -e "devtools::install_github(\"vqv/ggbiplot\")"
RUN R -e "install.packages(\"plotly\")"
RUN R -e "install.packages(\"tinytex\")"
RUN R -e "tinytex::install_tinytex()"
