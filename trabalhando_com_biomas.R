#### TRABALHANDO COM MAPAS DO BRASIL
library(geobr)
library(sf)
library(magrittr)
library(dplyr)
library(ggplot2)

conj_dados <- list_geobr()
biomas<-read_biomes(code_biome=4)

biomas1<-biomas %>% 
  filter(code_biome==4)

biomas2<-biomas %>% 
  filter(is.na(code_biome))


ggplot() + geom_sf(data=biomas1,fill="#2D3E50",color="#FEBF57",size=0.15,
                   show.legend = F) + 
  geom_sf(data=biomas2,fill="#6F4E50",color="#FEBF57",size=0.15,
          show.legend = F) + ggtitle("Biomas")
