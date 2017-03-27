# Load required packages
library(ggplot2)
library(plotly)

# Read in data
fcn <- read.csv(file.choose())  
summary(fcn)
attach(fcn)

# subset data by region
europe = subset(fcn, fcn$Region == "Europe")
sahara = subset(fcn, fcn$Region == "Sub-Saharan Africa")
lac = subset(fcn, fcn$Region == "Latin America & the Caribbean")
westAsia = subset(fcn, fcn$Region == "Western Asia")
SEAsia = subset(fcn, fcn$Region == "Sout-eastern Asia")
CCentralAsia = subset(fcn, fcn$Region == "Causcasus and central Asia")
mideast = subset(fcn, fcn$Region == "Middle East")
northAm = subset(fcn, fcn$Region == "Northern America")
oceania = subset(fcn, fcn$Region == "Oceania")
eastAsia = subset(fcn, fcn$Region == "Eastern Asia")
northAfrica = subset(fcn, fcn$Region == "Northern Africa")
southAsia = subset(fcn, fcn$Region == "Southern Asia")
asia = subset(fcn, fcn$Region == "Asia")

# plot of DFC by period and H_GDP
regionplot = ggplot(data = fcn, aes(x=Year, y=DFC, color = Region,size=H_GDP, label=Country.name)) + geom_point()
ggplotly(regionplot)

# plot of DFC by period and GDP
regionplot2 = ggplot(data = fcn, aes(x=Year, y=DFC, color = Region,size=GDP, label=Country.name)) + geom_point()
ggplotly(regionplot2)
plotly_POST(regionplot2) # if posting to Plotly server


# scatterplot DPC vs DFC through time
q = ggplot(data = fcn, aes(x=H_GDP, y=DPC, color=Year,size=GDP, label=Country.name)) + geom_point()
ggplotly(q)

detach(fcn)
