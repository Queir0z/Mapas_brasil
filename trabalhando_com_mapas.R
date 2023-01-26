#### TRABALHANDO COM MAPAS DO BRASIL
library(geobr)
library(sf)
library(magrittr)
library(dplyr)
library(ggplot2)

conj_dados <- list_geobr()
#### Carregando dados
brasil<-read_country(year=2020)
sudeste<-brasil %>% 
  filter(name_region=="Sudeste")
estado<-read_state(code_state="RJ",year=2020)
municipio<-read_municipality(code_muni = 3304904,year=2018) #são gonçalo
micro_reg=read_micro_region(code_micro = "all",year = 2015)
meso_reg<-read_meso_region("all",year=2010)

#### Plotando gráfico

ggplot() + geom_sf(data=meso_reg,fill="#2D3E50",color="#FEBF57",size=0.15,
                   show.legend = F)

#### Exemplo 1 pegando o sudeste
municipio<-read_municipality(code_muni = "all",year=2018) 
municipio<- municipio %>% 
  filter(abbrev_state %in%  c("MG","ES","SP","RJ") )

ggplot() + geom_sf(data=municipio,fill="#2D3E50",color="#FEBF57",size=0.15,
                   show.legend = F)

#### Buscando a região pelo código
micro_reg=read_micro_region(code_micro =33018)
municipio<-read_municipality(code_muni = 33018,year=2018) 
ggplot() + geom_sf(data=micro_reg,fill="#2D3E50",color="#FEBF57",size=0.15,
                   show.legend = F)
#### exemplo 2
meso_reg<-read_meso_region(code_meso =  3306)
meso_reg1<-read_meso_region(code_meso =  3301)

municipio<-read_municipality(code_muni = 33018,year=2018) 

ggplot() + geom_sf(data=meso_reg,fill="#2D3E50",color="#FEBF57",size=0.15,
                   show.legend = F)+
 geom_sf(data=meso_reg1,fill="#6F4E50",color="#FEBF57",size=0.15,
                     show.legend = F)
  
