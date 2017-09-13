plot3 <- function(){
    require(ggplot2)
    summary <- readRDS("summarySCC_PM25.rds")
    baltimore <- summary[ summary$fips == "24510",]
    points <- aggregate( Emissions ~ year + type, baltimore, FUN = sum )
    png("plot3.png")
    g <- qplot(year,Emissions, data = points, geom = "line", color = points$type, xlab="Year", ylab= "Total PM2.5 Emission",  main="Total PM2.5 Emission for Each Source in Baltimore")
    print(g)
    dev.off()
}
    