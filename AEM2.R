#install.packages("factoextra")

library(tidyverse)
library(readxl)
library(stringi)
library(factoextra)
library(ggrepel)
library(skimr)
library(dplyr)

dados <- read_xlsx("C:/Users/miche/Desktop/Aulas/Insper/AEM2/AEM_Atividade02/produtividade_policial.xlsx")

view(dados)

dados %>% 
  sample_n(10)

dados <- dados %>% 
  rename_with(~ stri_trans_general(.x, "Latin-ASCII") %>% 
                tolower())



#1 Para este exercício, manipule os dados para considerar apenas os dados totais 
#de cada indicador para cada região. 
#Forneça o código que deixa os dados no seguinte formato:

    #Approach **1**
#Transpondo os dados da tabela
dadost <- t(dados)
#Realizando a visualização dos dados
view(dadost)

    #Approach **2**
#Utilizando os dados da aula01 Vamos começar pivotando a tabela para deixa-la mais longa
dados %>% 
  pivot_longer(cols = -)

#utilizando subset para remover algumas colunas desnecessárias na analise
dados2 <- select(dados, -Jan, -Fev, -Mar, -Abr, -Mai, -Jun, -Jul, -Ago, -Set, -Out, -Nov, -Dez)

view(dados2)
#Deixa a tabela mais larga
dados2 %>%
  pivot_wider(# pivota a tabela para deixa-la mais larga
    names_from = type, # os nomes das colunas sao valores de type
    values_from = count) # os valores das novas colunas sao os da coluna count