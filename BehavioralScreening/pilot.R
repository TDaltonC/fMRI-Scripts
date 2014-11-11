attach(dat)
library(ggplot2)
library(reshape2)

ggplot(Pilot, aes(x=Subj1Score)) + geom_freqpoly()

shapeddat <- melt(Pilot,id.vars='Item', measure.vars=c('Subj1Score','Subj2Score'))

ggplot(shapeddat, aes(x=value, color=variable)) + geom_density(adjust=1/4)

ggplot(shapeddat, aes(x=value, color=variable)) + stat_ecdf()
