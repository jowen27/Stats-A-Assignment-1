# Function to read and clean the dataset
clean_data <- function(movie_file) {
  # Read the data from the Excel file
  raw_data <- read_excel(movie_file)



  cleaned_data <- raw_data %>%
    na.omit() %>%
    filter(christmas == TRUE) %>%
    select(genres, average_rating)
  return(cleaned_data)
}

pacman::p_load(tidyverse, targets,readxl)
tar_load(movie_file)
clean_data(movie_file)


