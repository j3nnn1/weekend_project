
rm(list=ls())
library('randomForest')
data = read.table('training.csv', ',',header=T);

#####
set.seed(47)
data = na.omit(data)
rf = randomForest(data[28], data[,27], proximity=TRUE, importance=TRUE)
#####

imp <- importance(rf)
impvar <- rownames(imp)[order(imp[, 1], decreasing=TRUE)]
op <- par(mfrow=c(2, 3))
for (i in seq_along(impvar)) {
    partialPlot(rf, data, impvar[i], xlab=impvar[i],
    main=paste("dependencia parcial en: ", impvar[i]),
    ylim=c(30, 70))
}
par(op)
plot(rf)
