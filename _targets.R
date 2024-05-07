library(targets)
library(tarchetypes)

tar_option_set(
  packages = c("tidyverse","gt","readxl",'dplyr'),
  format = "rds"
)

tar_source()

list(
  tar_file(movie_file, "raw-data/movies.xlsx"),
  tar_target(clean_movie,clean_data(movie_file)),
  tar_target(tab_get,get_tab(clean_movie)),
  tar_target(bar_plot,plot_scatter(clean_movie))
)
