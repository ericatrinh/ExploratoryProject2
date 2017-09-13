plot6 <- function( summary, SCC ){
    summary <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    sub <- summary[ summary$fips == "06037"|summary$fips == "24510", ]
    sub[ sub$fips == "06037",1 ] <- "Los Angeles"
    sub[ sub$fips == "24510",1 ] <- "Baltimore"
    points <- aggregate( Emissions ~ year + fips, sub, FUN = sum )
    png("plot6.png")
    g <- qplot(year,Emissions, data = points, geom = "line", color = points$fips, xlab="Year", ylab= "Total PM2.5 Emission",  main="Total PM2.5 Emission for Baltimore & LA")
    print(g)
    dev.off()
}