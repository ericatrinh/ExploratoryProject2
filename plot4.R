plot4 <- function(){
    summary <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    coal <- SCC[ grep("Coal",SCC$Short.Name), ]
    combustion <- summary[ summary$SCC %in% coal$SCC, ]
    emission <- tapply(combustion$Emissions, combustion$year, FUN = sum)
    png("plot4.png")
    plot(years, emission, type = "b", main= "Total Coal Combustion Emission in the US from 1999-2008", xlab = "Year", ylab = "Total Emission from Coal Combustion(tons)" )    
    dev.off()
}
