#install.packages("factoextra")

library(tidyverse)
library(readxl)
library(stringi)
library(factoextra)
library(ggrepel)
library(skimr)
library(dplyr)



dados <- read.csv2("https://raw.githubusercontent.com/mconjaud/PADS_AEM2/main/produtividade_policial.csv")

dados %>% 
  sample_n(10)

dados <- dados %>% 
  rename_with(~ stri_trans_general(.x, "Latin-ASCII") %>% 
                tolower())

#1 Para este exercício, manipule os dados para considerar apenas os dados totais 
#de cada indicador para cada região. 
#Forneça o código que deixa os dados no seguinte formato:

#utilizando subset para remover algumas colunas desnecessárias na analise
dados2 <- select(dados, -jan, -fev, -mar, -abr, -mai, -jun, -jul, -ago, -set, -out, -nov, -dez)

dados2 %>%
  pivot_wider(# pivota a tabela para deixa-la mais larga
    names_from = c(ocorrencia, regiao), # os nomes das colunas sao valores de type
    values_from = total) # os valores das novas colunas sao os da coluna count

view(dados2)


HELIO MICHEL FLAVIO
