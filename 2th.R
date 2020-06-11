install.packages('rvest')
library(rvest)
genre <- NULL
director <- NULL
production <- NULL
time <- NULL
budget <- NULL
time <- NULL

for (i in dane$links) {
url <- paste('https://www.filmweb.pl',i,sep='')
webpage <- read_html(url)
film_data_html <- html_nodes(webpage,'.filmInfo__info')
film_data <- html_text(film_data_html)
genre <- c(genre, film_data[3])
director <- c(director, film_data[1])
production <- c(production, film_data[4])
print(url)
}

dane_2 <- data.frame(dane, genre, director, production)
for (i in dane$links) {
url <- paste('https://www.filmweb.pl',i,sep='')
webpage <- read_html(url)
time_data_html <- html_nodes(webpage,'.filmCoverSection__filmTime')
time_data <- html_text(time_data_html)
time <- c(time, time_data)
print(url)
}
dane_all <- data.frame(dane, genre, director, production, time)
write.table(dane_all, file="filmwebTop500.csv", sep=" ",
            eol="\n", dec=",", row.names=F, col.names=T)
#url <- paste('https://www.filmweb.pl',dane$links[1],sep='')
#print(url)
#webpage <- read_html(url)
#genre_data_html <- html_nodes(webpage,'.filmInfo__info')
#genre_data <- html_text(genre_data_html)
#genre <- c(genre, genre_data[4])
#print(genre)
