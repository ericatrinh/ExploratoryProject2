plot1 <- function(){
    summary <- readRDS("summarySCC_PM25.rds")
    emission <- tapply(summary$Emissions, summary$year, FUN = sum)
    years <- c( 1999, 2002, 2005, 2008)
    png("plot1.png")
    plot(years, emission, type = "b", main= "Total PM2.5 Emissions in US from 1999-2008", xlab = "Year", ylab = "Total PM2.5 Emission (tons)")
    dev.off()
}