#This project is from a SuperDataScience course and uses their data. 
library(ggplot2)

#Reading the data
mov <- read.csv(choose.files()) #section6HWdata
head(mov)

#Exploring the data
summary(mov)
str(mov)

#Filter Data
filterGenre <- mov$Genre == "action" | mov$Genre == "adventure" | mov$Genre == "animation"| mov$Genre == "comedy" | mov$Genre == "drama" 
filterStudio <- mov$Studio %in% c("Buena Vista Studios","WB","Fox","Universal","Sony","Paramount Pictures")

movFiltered <- mov[filterGenre & filterStudio,]
head(movFiltered)

#Plots
aesData <- ggplot(data=movFiltered, aes(x=Genre, y=Gross...US))

dataGeo <- aesData + geom_jitter(aes(size=Budget...mill., color=Studio)) +
          geom_boxplot(alpha=0.3)

dataPlot <- dataGeo +
            xlab("Genre") +
            ylab("Gross % US") +
            ggtitle("Domestic Gross % by Genre")

dataPlot <- dataPlot +
            theme(
              axis.title.x = element_text(color="Blue",size=10),
              axis.title.y = element_text(color="Blue", size=10),
              axis.text.x = element_text(size=10),
              axis.text.y = element_text(size=10),
              
              plot.title = element_text(size=20),
              legend.title = element_text(size=10),
              legend.text = element_text(size=10),
              
            )

dataPlot$label$size <- "Budget $M"
dataPlot
