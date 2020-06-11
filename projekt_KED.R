library(rvest)
titles <- NULL
years <- NULL
links <- NULL
rateCount <- NULL
rateValue <- NULL

#Specifying the url for desired website to be scraped
for (i in 1:20) {
url <- paste('https://www.filmweb.pl/ranking/film?page=',i,sep='')

#Reading the HTML code from the website
webpage <- read_html(url)

#Using CSS selectors to scrape the rankings section
rank_data_html <- html_nodes(webpage,'.film__link')
#links_html <- webpage %>% # feed `main.page` to the next step
#  html_nodes(".film__link") %>% # get the CSS nodes
#  html_text() # extract the URLs
links_html <- html_nodes(webpage, '.film__link') %>% html_attr('href')
production_year_html <- html_nodes(webpage,'.film__production-year')
rateCount_html <- html_nodes(webpage,'.rate__count')
rateValue_html <- html_nodes(webpage,'.rate__value')

#Converting the ranking data to text
rank_data <- html_text(rank_data_html)
years_data <- html_text(production_year_html)
rateCount_data <- html_text(rateCount_html)
rateValue_data <- html_text(rateValue_html)
titles <- c(titles, rank_data)
years <- c(years, years_data)
links <- c(links, links_html)
rateCount <- c(rateCount, rateCount_data)
rateValue <- c(rateValue, rateValue_data)
}
#for (i in dane$links) {
 # url <- paste('https://www.filmweb.pl',i,sep='')
#  print(url)
#}

dane <- data.frame(titles, years, links, rateCount, rateValue)
write.table(dane, file="filmwebTop500.csv", sep=" ",
            eol="\n", dec=",", row.names=F, col.names=T)
