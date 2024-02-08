library(tidyverse)
#Replace the CSV file location with your respective file location, see attached csv file
hiv <- read.csv("/Users/easyyou2/Downloads/HIVprev.csv",stringsAsFactors = FALSE) 
hiv <- select(hiv,Country, year, prevalence)
head(hiv)
tail(hiv)
summary(hiv)

# Create a new subset from the original HIV file, comprised of countries that had HIV prevalence 
#greater than 10% in one or more of the years monitored

cc <- c("Botswana","Central African Republic","Congo",
"Kenya","Lesotho","Malawi", "Namibia","South Africa","Swaziland","Uganda","Zambia","Zimbabwe")
hihiv <- filter(hiv,Country %in% cc)


#Use Colors to separate the different datasets, then add an average line for both of the sets

ggplot(hiv,aes(x=year,y=prevalence)) + 
  geom_line(aes(group=Country),data=hihiv,alpha = .3,color="red")+
  geom_line(aes(group=Country),alpha = .3,color="grey")+ 
  geom_smooth(color='black')+
  geom_smooth(data = hihiv,color='red')



