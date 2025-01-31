library(readr)
library(dplyr)
library(nflverse)
library(googlesheets4)

# df_headshot_url <- nflplotR:::load_headshots()

df_player_gsis <- nflreadr::load_rosters(seasons = 1920:nflreadr::most_recent_season()) 

df_player_gsis_filtered <- df_player_gsis %>% 
  dplyr::filter(season >= 2008)

readr::write_excel_csv(x = df_player_gsis, file = "./dat/player-rosters_1920-2024.csv")



# ss <- googlesheets4::gs4_create("nflreadr-data", sheets = list(`player-rosters_2000-2024` = df_player_gsis))
# googlesheets4::gs4_browse(ss)
