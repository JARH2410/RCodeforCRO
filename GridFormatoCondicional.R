if (!require("pacman")) install.packages("pacman")
pacman::p_load(googleAnalyticsR,  # How we actually get the Google Analytics data
               tidyverse,         # Includes dplyr, ggplot2, and others; very key!
               devtools,          # Generally handy
               googleVis,         # Useful for some of the visualizations
               scales)            # Useful for some number formatting in the visualizations

ga_auth(new_user = FALSE)

view_id = 53461765
start_date <- "2019-01-01"
end_date <- "2019-06-30"

my_met_filter <- met_filter(metric ="sessions",
                            operator = "GREATER_THAN",
                            comparisonValue = 1000
)

my_met_filter_clause <- filter_clause_ga4(list(my_met_filter),
                                          operator = "AND")

ga_data <- google_analytics(viewId = view_id,
                            date_range = c(start_date, end_date),
                            metrics = c("sessions"),
                            dimensions = c("medium","deviceCategory"),
                            met_filters = my_met_filter_clause,
                            anti_sample = T
                            )

head(ga_data)

ga_data_pivoted <- ga_data %>% 
  spread(deviceCategory, sessions)

head(ga_data_pivoted)

gg <- ggplot(ga_data, mapping=aes(x = deviceCategory, y = medium)) +
  geom_tile(aes(fill = sessions)) +
  geom_text(aes(label = format(sessions, big.mark = ","))) +
  scale_fill_gradient(low = "white", high = "green") +
  theme_light() +
  theme(panel.grid = element_blank(),
        panel.border = element_blank(),
        axis.ticks = element_blank())

gg
