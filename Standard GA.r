library(googleAnalyticsR)
library(googleAuthR)

ga_auth(new_user = F)

view_id = 53461765
start_date <- ""            #"YYYY-MM-DD"
end_date <- ""              #"YYYY-MM-DD"

mf1 <- met_filter(metric =,
                            operator = ,
                            comparisonValue = ,
                            not = 
                            )

mf2 <- met_filter(metric =,
                            operator = ,
                            comparisonValue =, 
                            not = 
                            )

df1 <- dim_filter(dimension = ,
                            operator = ,
                            expressions = ,
                            not = F
                            )

df1 <- dim_filter(dimension = ,
                            operator = ,
                            expressions = ,
                            not = F
                            )

my_met_filter_clause <- filter_clause_ga4(list(mf1,mf2),
                                          operator = "AND")

my_dim_filter_clause <- filter_clause_ga4(list(df1,df2),
                                          operator = "AND")

ga_data <- google_analytics(viewId = view_id,
                            date_range = c(start_date, end_date),
                            metrics = c(""),
                            dimensions = c(""),
                            met_filters = my_met_filter_clause,
                            dim_filters = my_dim_filter_clause,
                            anti_sample = T
                            )

head(ga_data)