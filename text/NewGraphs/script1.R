d<-read.table("Table1.txt", header=T)
d1<-d[,c(5,3)]
d2<-d[,c(6)]
d1<-data.matrix(d1)

pdf("Table1-graph.pdf", width=7, height=7)
barplot(t(d1),width=c(1.25,1.25,0.25), ylim=c(0,36), xlim=c(1,37.5),beside=T,axes=FALSE)
abline(h=seq(0,32,by=4),col="gray",lty=2)
#barplot(t(d1),width=c(1.25,1.25,0.25),ylim=c(0,18), xlim=c(1,37.5),beside=T,axes=FALSE, add=T)
barplot(t(d1), width=c(1.25,1.25,0.25), ylim=c(0,36), xlim=c(1,37.5),beside=T,axes=FALSE,add=T)

box()
axis(1,at=seq(2,37,by=3.5),labels=seq(1,11,by=1),las=0, cex.axis=1.12, tck=0)
axis(2,at=seq(0,36,by=4),labels=seq(0,36,by=4),cex.axis=1.2)
legend("topright", legend=c("Max Load", "Total Load", "Max. Variability"), pch=c(15,15,42), col=c("gray25","gray","black"),cex=1.5,pt.cex=2.5)
title(main=paste("Site Load and Variability"),cex.main=1.5)
mtext("Site ID", side=1, line=3, cex=1.5)
mtext("Power (MW)", side=2, line=2.5, cex=1.5)

library(calibrate)
for (i in 1:length(d2))
#	textxy((1.8 + (i-1) * 3.42),d2[i]-2.5,"*", cex=2.2) 
	points((2.85 + (i-1) * 3.42),d2[i]-0.2, pch='*', cex=2.2,col ="black", bg="black") 

dev.off()
