d<-read.table("Table1.txt", header=T)
d1<-d[,c(8,9,10)]
d1<-data.matrix(d1)

pdf("PUE-Graph.pdf", width=7, height=7)
plot(1, type="n", xlim=c(1,1.9), ylim=c(0,22), axes=FALSE,xlab="", ylab="")
abline(v=c(1,1.25,1.5,1.75,2),lty=2, col="gray")
axis(1,at=seq(1,2,by=0.25),labels=seq(1,2,by=0.25),las=0, cex.axis=1.25)
axis(2,at=seq(1,22,by=2),labels=seq(11,1,by=-1),cex.axis=1.3,las=2, tck=0)
title(main=paste("Site Power Usage Effectiveness (PUE)"),cex.main=1.5)
mtext("Site ID", side=2, line=2.5, cex=1.5)
mtext("PUE Range", side=1, line=3, cex=1.5)

for (i in 1:10)
	rect(d1[i,1], (22-(2*i) + 1.5) , d1[i,2], (22-(2*i) + 0.5), col="gray75")

library('calibrate')
abline(h=c(0.8), lty=2, col="gray40")
textxy(1.25,0.2, "Not Measured", cex=1.2)
for (i in 1:10)
	if(d1[i,3] != -1)
		points(d1[i,3]+ 0.01,22-(2*i)+1, pch='*', cex=2)

legend("topright", legend=c("Actual Value"), pch=c(42), col=c("black"),cex=1.3,pt.cex=2.5, box.lwd=2)
box()
dev.off()
