library(tidyverse)
library(hudr)
library(sf)
library(tidycensus)
library(mapview)

#gathering data
#hud api key
eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI2IiwianRpIjoiZDVjNGM3NWQxYzRiNjdlNGZhMjUwM2I3ZjlmYmY4YmFjZDg3NDBhODM2MWY0N2JlYzczOTIxNGNlZjNmOTExMDAzMmE0OTc1YzU1NzQ4Y2QiLCJpYXQiOjE3MDc1MDk4MDUuNjY2Nzc1LCJuYmYiOjE3MDc1MDk4MDUuNjY2Nzc3LCJleHAiOjIwMjMxMjkwMDUuNjYyNTczLCJzdWIiOiI2NTc1NCIsInNjb3BlcyI6W119.BT8tMDeULPRbHRXWid1P1lgi_CG_gbqOWvG1B2ItTgUH22NDmwIDgnREvXJlHfKnZnfwNsf14_cd5MgKuNzWiA


chas_cnty_lst_dt <- get_hud_chas_entityid_list(stateid = "53",
                                               geo_lvl = "county",
                                               hud_key = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI2IiwianRpIjoiZDVjNGM3NWQxYzRiNjdlNGZhMjUwM2I3ZjlmYmY4YmFjZDg3NDBhODM2MWY0N2JlYzczOTIxNGNlZjNmOTExMDAzMmE0OTc1YzU1NzQ4Y2QiLCJpYXQiOjE3MDc1MDk4MDUuNjY2Nzc1LCJuYmYiOjE3MDc1MDk4MDUuNjY2Nzc3LCJleHAiOjIwMjMxMjkwMDUuNjYyNTczLCJzdWIiOiI2NTc1NCIsInNjb3BlcyI6W119.BT8tMDeULPRbHRXWid1P1lgi_CG_gbqOWvG1B2ItTgUH22NDmwIDgnREvXJlHfKnZnfwNsf14_cd5MgKuNzWiA")


# get_hud_fmr_data - get fair market rate data
# usage get_hud_fmr_data(entityid, yr, hud_key = Sys.getenv("HUD_API_KEY"))

state_codes <- get_hud_fmr_liststates(hud_key = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI2IiwianRpIjoiZDVjNGM3NWQxYzRiNjdlNGZhMjUwM2I3ZjlmYmY4YmFjZDg3NDBhODM2MWY0N2JlYzczOTIxNGNlZjNmOTExMDAzMmE0OTc1YzU1NzQ4Y2QiLCJpYXQiOjE3MDc1MDk4MDUuNjY2Nzc1LCJuYmYiOjE3MDc1MDk4MDUuNjY2Nzc3LCJleHAiOjIwMjMxMjkwMDUuNjYyNTczLCJzdWIiOiI2NTc1NCIsInNjb3BlcyI6W119.BT8tMDeULPRbHRXWid1P1lgi_CG_gbqOWvG1B2ItTgUH22NDmwIDgnREvXJlHfKnZnfwNsf14_cd5MgKuNzWiA")

get_hud_fmr_listcounties

get_hud_fmr_listcounties(stateid, hud_key = Sys.getenv("HUD_API_KEY"))

#making a list

state_dt <- get_hud_fmr_statedata(entityid = "MA",
                                       yr = "2021",
                                       hud_key = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI2IiwianRpIjoiZDVjNGM3NWQxYzRiNjdlNGZhMjUwM2I3ZjlmYmY4YmFjZDg3NDBhODM2MWY0N2JlYzczOTIxNGNlZjNmOTExMDAzMmE0OTc1YzU1NzQ4Y2QiLCJpYXQiOjE3MDc1MDk4MDUuNjY2Nzc1LCJuYmYiOjE3MDc1MDk4MDUuNjY2Nzc3LCJleHAiOjIwMjMxMjkwMDUuNjYyNTczLCJzdWIiOiI2NTc1NCIsInNjb3BlcyI6W119.BT8tMDeULPRbHRXWid1P1lgi_CG_gbqOWvG1B2ItTgUH22NDmwIDgnREvXJlHfKnZnfwNsf14_cd5MgKuNzWiA")


fmr_state_dt <- get_hud_fmr_statedata(entityid = state_codes$state_code[1],
                                      yr = "2020",
                                      hud_key = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI2IiwianRpIjoiZDVjNGM3NWQxYzRiNjdlNGZhMjUwM2I3ZjlmYmY4YmFjZDg3NDBhODM2MWY0N2JlYzczOTIxNGNlZjNmOTExMDAzMmE0OTc1YzU1NzQ4Y2QiLCJpYXQiOjE3MDc1MDk4MDUuNjY2Nzc1LCJuYmYiOjE3MDc1MDk4MDUuNjY2Nzc3LCJleHAiOjIwMjMxMjkwMDUuNjYyNTczLCJzdWIiOiI2NTc1NCIsInNjb3BlcyI6W119.BT8tMDeULPRbHRXWid1P1lgi_CG_gbqOWvG1B2ItTgUH22NDmwIDgnREvXJlHfKnZnfwNsf14_cd5MgKuNzWiA")


ma_one_br <- state_dt[["metroareas"]][["one_bedroom"]]

view(ma_one_br)

ma_counties <- state_dt[["counties"]]


#for MA counties = towns
#I now have a databse of 2024 fmrs for massachusetts by town
#now I need to geocode this and get it into map format 



census_api_key("e623b8b3caeaf6ad382196d1dac43e625440e80f", install = TRUE, overwrite = TRUE)
readRenviron("~/.Renviron")
ma_income <- get_acs(geography = "county subdivision", 
              variables = c(medincome = "B19013_001"), 
              state = "MA", 
              year = 2021,
              geometry = TRUE)

ma_income <- ma_income %>% select(-variable, -moe)

mapview(ma_income)

#okay now I have a nice map of median 2021 income by town in MA

#and now I gotta standardize formatting to merge 

ma_income_strsplit <- ma_income %>% separate_wider_delim(NAME, ",", names = c("town_name", "county_name", "state_name"))

ma_counties <- ma_counties %>% select (-metro_name)

#merge
ma_joined <- left_join(ma_income_strsplit, ma_counties, by = 'town_name')

#now I gotta remove the NA's and some more variables

ma_joined_2 <- na.omit(ma_joined)

mapview(ma_joined_2)

ma_joined_2 <- st_as_sf(ma_joined_2)

ma_joined_2 <- ma_joined_2 %>% select( -variable, -moe, county_name.y)

ma_joined_2 <- ma_joined_2 %>% select(-statename, -state_name, -smallarea_status)
ma_joined_2 <- ma_joined_2 %>% select(-statecode, -state_code)
ma_joined_2 <- ma_joined_2 %>% select(-county_name.y, -fips_code)
ma_joined_2 <- ma_joined_2 %>% select(-efficiency, -GEOID)
ma_joined_2 <- ma_joined_2 %>% select(-fmr_percentile)

ma_joined_2 <- ma_joined_2 %>% rename(income = estimate)
ma_joined_2 <- ma_joined_2 %>% rename('one bedroom rent' = one_bedroom)
ma_joined_2 <- ma_joined_2 %>% rename('two bedroom rent' = two_bedroom, 
                                      'three bedroom rent' = three_bedroom,
                                      'four bedroom rent' = four_bedroom,)
  
mapview(ma_joined_2)
mapview(ma_joined_2, zcol =  "income")

mapview(list("estimate", "one_bedroom"),
        layer.name = c("estimate", "one_bedroom"))
