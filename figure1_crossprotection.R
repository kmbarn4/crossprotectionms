#figure 1 boxplot code for cross protection ms

mydata <- read.csv("/Users/kmbarnett/Documents/2020_fall/cross protection/data/kmb_load_data_for_stats copy.csv")
head(mydata)

library("ggplot2")

#infection intensity figure
mydata <- read.csv("/Users/kmbarnett/Documents/2020_fall/cross protection/data/kmb_load_data_for_stats copy.csv")
g <- ggplot(mydata, aes(Live.Bd, final.bd.load))
g + geom_boxplot(varwidth=T, aes(fill=factor(Vaccine), colour=factor(Vaccine))) +
  theme(axis.text.x = element_text(angle=90, vjust=0.6, face = "bold")
        , axis.text.y = element_text(angle=90, vjust=0.6,face = "bold")) +
  scale_y_continuous(trans='log10', breaks=c(1, 10, 100, 1000, 10000, 100000))+
  labs(x="Live Bd Strain",y="Log10 Transformed Bd zoospore load") + scale_colour_manual(values = c("black", "black", "black"))+
  scale_fill_manual(values = c("#f7f7f7", "#7fbf7b", "#af8dc3")) + theme_classic()
