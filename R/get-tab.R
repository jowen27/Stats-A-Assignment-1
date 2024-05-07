get_tab <- function(movie) {
  genre_ratings <- movie %>%
    separate_rows(genres, sep = ",") %>%
    mutate(genres = trimws(genres)) %>%
    filter(!(genres %in% c("Reality-TV","Documentary","Biography","Talk-Show","News"))) %>%
    group_by(genres) %>%
    summarize(average_rating = mean(average_rating, na.rm = TRUE)) %>%
    arrange(desc(average_rating)) %>%
    ungroup()
    # Create a GT table
  gt_table <- genre_ratings %>%
    gt() %>%
    tab_header(
      title = "Average Rating by Genre for Christmas Movies"
    ) %>%
    fmt_number(
      columns = vars(average_rating),
      decimals = 2
    ) %>%
    cols_label(
      genres = "Genre",
      average_rating = "Average Rating"
    )

  return(gt_table)
}

pacman::p_load(tidyverse, targets,readxl,gt)
tar_load(clean_movie)
get_tab(clean_movie)
