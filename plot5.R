plot5 <- function(){
    summary <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    vehicle <- SCC[ grep("Vehicle",SCC$EI.Sector), ]
    baltimore <- summary[ summary$fips == "24510",]
    baltEm <- baltimore[ baltimore$SCC %in% vehicle$SCC, ]
    emission <- tapply(baltEm$Emissions, baltEm$year, FUN = sum)
    png("plot5.png")
    plot(years, emission, type = "b", main= "Total Motor Vehicle Emission in the Baltimore from 1999-2008", xlab = "Year", ylab = "Total Vehicle Emission from Baltimore (tons)" )    
    dev.off()
}

