plot2 <- function(){
    summary <- readRDS("summarySCC_PM25.rds")
    years <- c( 1999, 2002, 2005, 2008)
    baltimore <- summary[ summary$fips == "24510",]
    emission <- tapply(baltimore$Emissions, baltimore$year, FUN = sum)
    png("plot2.png")
    plot(years, emission, type = "b", main= "Total PM2.5 Emissions in Baltimore from 1999-2008", xlab = "Year", ylab = "Total PM2.5 Emission (tons)" )    
    dev.off()
}