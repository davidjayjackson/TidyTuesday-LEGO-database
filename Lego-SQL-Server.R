## 2022-09-06

rm(list = ls())
### SQL Server Code

library(DBI)
library(odbc)
library(ggplot2)
library(scales)
library(tidyverse)
library(janitor)
library(readr)

##
rm(list=ls())



## https://db.rstudio.com/databases/microsoft-sql-server/
con <- DBI::dbConnect(odbc::odbc(), 
                      Driver = "SQL Server", 
                      Server = "localhost\\SQLEXPRESS", 
                      Database = "TidyTuesady-Lego", 
                      Trusted_Connection = "True")

color <- read_csv("data/colors.csv.gz")
themes <- read_csv("data/themes.csv.gz")
inventories <- read_csv("data/inventories.csv.gz")
parts <- read_csv("data/parts.csv.gz")
sets <- read_csv("data/sets.csv.gz")


### Upload to SQL DB



dbWriteTable(con, "color",color ,overwrite=TRUE)
dbListFields(con,"color")
dbGetQuery(con,"select count(*) as row_count from color")
# 
dbWriteTable(con, "themes",themes ,overwrite=TRUE)
dbListFields(con,"themes")
dbGetQuery(con,"select count(*) as row_count from themes")
#
dbWriteTable(con, "inventory",inventories ,overwrite=TRUE)
dbListFields(con,"inventory")
dbGetQuery(con,"select count(*) as row_count from inventory")
#
dbWriteTable(con, "parts",parts ,overwrite=TRUE)
dbListFields(con,"parts")
dbGetQuery(con,"select count(*) as row_count from parts")
#
dbWriteTable(con, "sets",sets ,overwrite=TRUE)
dbListFields(con,"sets")
dbGetQuery(con,"select count(*) as row_count from sets")


dbDisconnect(con)





