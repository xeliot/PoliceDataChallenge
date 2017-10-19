#BarChart of all crimes in Seattle
library(ggplot2)
all_groups <- droplevels(Seattle911Response$Event.Clearance.Group)
counts <- table(all_groups)
par(mar=c(9, 4, 4, 2)+0.1)
barplot(counts, main="Barchart of Seattle Crime Type", xlab="", ylab="Frequency", las=2, cex.axis=0.5, cex.names=0.5)