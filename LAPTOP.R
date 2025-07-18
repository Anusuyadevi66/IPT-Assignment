library(robotstxt)
library(rvest)
library(stringr)
library(dplyr)
url<-("https://www.flipkart.com/search?q=laptop&otracker=search&otracker1=search&marketplace=FLIPKART&as-show=on&as=off")
path=paths_allowed(url)
web=read_html(url)
View(web)
names<-web%>%html_nodes(".KzDlHZ")%>%html_text()
View(names)
processor<-web%>%html_nodes(".J\\+igdf:nth-child(1)")%>%html_text()
View(processor)
ram<-web%>%html_nodes(".J\\+igdf:nth-child(2)")%>%html_text()
View(ram)
display<-web%>%html_nodes(".J\\+igdf:nth-child(5)")%>%html_text()
View(display)
price<-web%>%html_nodes("._4b5DiR")%>%html_text()
View(price)
laptop_details=data.frame(names,price,ram,display,processor)
View(laptop_details)
write.csv(laptop_details,"flipkart_laptop.csv")
read.csv("flipkart_laptop.csv")
data=read.csv("flipkart_laptop.csv")
View(data)
