# converting dane$years
install.packages("tidyverse")
library(tidyverse)
years <- dane_all$years
years
years <- substr(years,2, 5)
years
typeof(years)
dane_all$years <- years
dane_all$years <- as.numeric(dane_all$years)
dane_all$rateValue <- gsub(',','.',dane_all$rateValue)
dane_all$rateValue <- as.numeric(dane_all$rateValue)

rateCount <- dane_all$rateCount
rateCount
rateCount <- gsub(' ','',rateCount)
rateCount
typeof(rateCount)
rateCount <- as.numeric(gsub("([0-9]+).*$", "\\1", rateCount))
rateCount <- as.numeric(rateCount)
rateCount
dane_all$rateCount <- rateCount
dane_all$genre <- as.factor(dane_all$genre)
dane_all$production <- as.factor(dane_all$production)

write.table(dane_all, file="filmwebTop500.csv", sep=" ",
            eol="\n", dec=",", row.names=F, col.names=T)

library(ggplot2)
ggplot(dane_all, aes(x=rateCount, y=rateValue)) + geom_point(color="darkblue")
ggplot(dane_all, aes(x=years, y=rateCount)) + geom_point()
ggplot(dane_all, aes(x=years, y=rateValue)) + geom_point()
ggplot(dane_all,aes(x=production)) + geom_bar()

dramat <- filter(dane_all, grepl("dramat", genre, fixed=TRUE)|grepl("Dramat", genre, fixed=TRUE))
komedia <- filter(dane_all, grepl("komedia", genre, fixed=TRUE)|grepl("Komedia", genre, fixed=TRUE))
scifi <- filter(dane_all, grepl("Sci-Fi", genre, fixed=TRUE)|grepl("sci-Fi", genre, fixed=TRUE))
mean(dramat$rateValue)
mean(komedia$rateValue)
mean(scifi$rateValue)
mean(dramat$rateCount)
mean(komedia$rateCount)
mean(scifi$rateCount)
