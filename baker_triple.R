library(readr)
library(dplyr)
library(stringr)
library(nflverse)

df <- nflfastR::load_pbp(2018:2023) %>% 
  nflfastR::decode_player_ids() 

df_baker <- df %>% 
  dplyr::filter(stringr::str_detect(passer_player_name, "Mayfield"), touchdown==1) %>% 
  dplyr::select(play_id:game_date, desc, play_type, touchdown, tidyselect::contains("passer"), tidyselect::contains("receiver"))

df_td_count <- df_baker %>% 
  dplyr::count(receiver_player_name) %>% 
  # dplyr::filter(n >= 10) %>% 
  dplyr::arrange(dplyr::desc(n))
