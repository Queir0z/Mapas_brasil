#### TRABALHANDO COM MAPAS DO BRASIL
library(geobr)
library(sf)
library(magrittr)
library(dplyr)
library(ggplot2)
library(gganimate)
library(gifski)
library(leaflet)

conj_dados <- list_geobr()
#### Carregando dados
rs<-read_municipality(code_muni = "RS",year=2018)
map<-leaflet(rs) %>% addTiles()
# poligonos
map %>% addPolygons()
map %>% addPolygons(weight = 1,
                    opacity = 0.5,
                    color="red",
                    dashArray = "1",
                    fillOpacity = 0
                    )

saude<-read_health_facilities()
bgs<-subset(saude,saude$code_muni==430460)
#Mapa com marcadores
map<-leaflet(bgs) %>% addTiles()
map %>% addMarkers()

ar = read_disaster_risk_area()
arRS<-subset(ar,ar$abbrev_state=="RJ")

map<-leaflet(arRS) %>% addTiles()

map %>% addPolygons()
map %>% addPolygons(weight = 1,
                    opacity = 0.5,
                    color="blue",
                    dashArray = "1",
                    fillOpacity = 0.5
)
