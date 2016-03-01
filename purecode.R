if(!require(ggplot2)) { 
  install.packages("ggplot2", repos="http://cran.us.r-project.org")
  require(ggplot2)
}

# first fill some vectors with random numbers
a <- sample(1:20, 10, replace=T)
b <- sample(1:6, 10, replace=T)
c <- sample(1:30, 10, replace=T)
d <- sample(1:10, 10, replace=T)
# as a reminder: this function generates a vector of ten random numbers out of
# the intervall one to 20/6/30/10. If replace is = T or = TRUE this means 
# there can be duplicates of the same number in the sample

# going for the structured data frame
gg_data <- data.frame(year = c(rep((2001:2010), length(nrow))),
                      value = c(a, b, c, d),
                      variable = c(rep("A", length(a)), 
                                   rep("B", length(b)),
                                   rep("C", length(c)), 
                                   rep("D", length(d))
                      )
)


## ggplotting

# stacked barplot
ggplot(data = gg_data, aes(x = year, y = value, fill = variable)) + geom_bar(stat = "identity") +
ggtitle("Values per Year and categorie") + # add a title
xlab("YEAR") + # change axis labels
ylab("VALUES") +
guides(fill=guide_legend(title="CATEGORIES", reverse = T)) + # change legend title and order of shown variables
theme_minimal() + # change theme
scale_x_continuous(breaks=seq(2000,2010,1), # add specific breaks and labels for the x-axis 
                   labels=abs(seq(2000,2010,1))) +
theme(axis.text.x = element_text(angle=40, vjust=0.5)) # change angle of x-labels

# Area Plot
ggplot(data = gg_data, aes(x = year, y = value, fill = variable)) +
  geom_area() +
  ggtitle("Area ggplot") +
  theme(plot.title=element_text(family="Arial", face="bold", size=14)) +
  xlab("YEAR") +
  ylab("VALUES") +
  guides(fill=guide_legend(title="VAR", reverse = T)) +
  theme_grey() +
  scale_x_continuous(breaks=seq(2000,2010,2),
                     labels=abs(seq(2000,2010,2))) +
  theme(axis.text.x = element_text(angle= 90, vjust=0.5)) +
  scale_fill_brewer(palette="Dark2") +
  coord_flip()

# Line Plot
ggplot(data = gg_data, aes(x = year, y = value, colour = variable)) + # colour, not fill!
  geom_line(size = 0.2) +
  geom_point(size = 4) +
  ggtitle("Line ggplot \n with points") + 
  theme(plot.title=element_text(family="Times New", face="bold", size=20)) +
  xlab("X") +
  ylab("Y") +
# what about the y-labelling?  
  scale_y_continuous(breaks=seq(0,30,5),
                     labels=abs(seq(0,30,5))) +
  theme(axis.text.x = element_text(angle = - 45, vjust = -0.5), axis.text.y = element_text(angle = -45, vjust = 0.5)) +
# changing colours manually  
  scale_fill_manual(values = c( "A" = "#6FCCF3", "B" = "#FF8705", "C" = "#E557F5", "D" = "#8BFF92"), drop = F)
