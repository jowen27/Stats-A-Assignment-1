plot_scatter <- function(data){
  genre_ratings <- data %>%
    separate_rows(genres, sep = ",") %>%
    mutate(genres = trimws(genres)) %>%
    filter(!(genres %in% c("Reality-TV","Documentary","Biography","Talk-Show","News"))) %>%
    group_by(genres) %>%
    summarize(average_rating = mean(average_rating, na.rm = TRUE)) %>%
    arrange(desc(average_rating)) %>%
    ungroup()
  ggplot(genre_ratings, aes(x = reorder(genres, average_rating), y = average_rating)) +
    geom_col(fill = 'steelblue') +
    labs(x = "Genre", y = "Average Rating", title = "Average Rating by Genre for Christmas Movies") +
    theme_minimal() +
    coord_flip()
}

pacman::p_load(tidyverse, targets,readxl,gt)
tar_load(clean_movie)
plot_scatter(clean_movie)
