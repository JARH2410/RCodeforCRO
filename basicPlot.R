if (!require("pacman")) install.packages("pacman")
pacman::p_load(googleAnalyticsR,
               dplyr,
               corrplot,
               tidyverse,
               ggcorrplot,
               ggplot2)

ga_auth(new_user = F)

view_id = 53461765
start_date <- "2019-01-01"
end_date <- "2019-06-30"


ga_data <- google_analytics(viewId = view_id,
                            date_range = c(start_date, end_date),
                            metrics = c("transactions"),
                            dimensions = c("date","sourceMedium"),
                            met_filters = my_met_filter_clause,
                            anti_sample = TRUE)

#ga_data$date <- NULL

head(ga_data)

ggplot(data = ga_data, aes(x = date, y = transactions, colour=sourceMedium)) + geom_point(alpha=0.1) + stat_smooth(method = "glm")