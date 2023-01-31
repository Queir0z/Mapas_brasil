library(sf)
library(geobr)
library(magrittr)
library(dplyr)
library(ggplot2)
library(gganimate)
library(gifski)
library(leaflet)
library(ggrepel)
library(RColorBrewer)
library(colormap)

es<-read_schools()
Senac<-es %>% 
  filter(grepl('SENAC', toupper(name_school)))


# Iserindo legenda

icone<-awesomeIcons()

map<-leaflet(Senac) %>% addTiles()
map %>% addAwesomeMarkers(icon=icone,
                          popup = paste(sep="<br/>","<b><a href='https://www.senac.br/'>", Senac$name_school ,"</a></b>", Senac$abbrev_state,
                                         Senac$address,
                                         Senac$phone_number,
                                         Senac$size), 
                          label = Senac$name_school,
                          clusterOptions = markerClusterOptions()
                          )

################# C´riculo ##########
Senac<-Senac %>% 
  group_by(name_school) %>% 
  mutate(valor=ceiling(runif(1,0,100)))

map<-leaflet(Senac) %>% addTiles()
map %>% addCircles(
                          popup = paste(sep="<br/>","<b><a href='https://www.senac.br/'>", Senac$name_school ,"</a></b>", Senac$abbrev_state,
                                        Senac$address,
                                        Senac$phone_number,
                                        Senac$size), 
                          label = Senac$name_school,
                          stroke = T,fillOpacity = 0.5,
                          radius = Senac$valor*200
)
