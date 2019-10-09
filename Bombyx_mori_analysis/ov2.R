#########
#ov2.R
#########
#Get runtime arguments
argv <- commandArgs(TRUE)

#Specify file name
fasname1 <- "piRNA_shojibase5350.fas"
fasname2 <- "piRNA_shojibase.fas"
common <- c("_piRNA_shojibase5350.bed")
tailSS <- "_BOXSS.table"
tailSE <- "_BOXSE.table"
tailRS <- "_BOXRS.table"
tailRE <- "_BOXRE.table"



#Package loading and time display
j <- as.character((argv[1]))
options(digits.secs=3)
format(Sys.time(), "%Y/%m/%d %H:%M:%OS")
suppressMessages(library("Biostrings"))

#Loading data
fas <- readDNAStringSet(fasname1)
fas2 <- readDNAStringSet(fasname2)
data <- read.table(paste(j,common,sep=""))
cat(paste(j,common,sep="")) #Declaring that data has been read

#Summarize the situation of piRNA around piRNA loci
vec <- rep(0,length(fas2))
names(vec) <- names(fas2)
vec[names(table(names(fas)))] <- table(names(fas))
vec2 <- vec[1:length(fas2)]
BOXSS <- matrix(0,length(vec2),202)
rownames(BOXSS) <- names(vec2)
colnames(BOXSS) <- -100:101
BOXSE <- BOXSS
BOXRS <- BOXSS
BOXRE <- BOXSS
data2 <- as.matrix(data[is.element(data[,1],names(vec2)),])
data2p <- data.frame(data2[data2[,6] =="+",])
data2m <- data.frame(data2[data2[,6] =="-",])
OUT1 <- table(data2p[,1:2])
OUT2 <- table(data2p[,c(1,3)])
OUT3 <- table(data2m[,c(1,3)])
OUT4 <- table(data2m[,c(1,2)])
mom1 <- is.element(colnames(BOXSS),as.numeric(as.character(colnames(OUT1)))-100)
mom2 <- is.element(colnames(BOXSS),as.numeric(as.character(colnames(OUT2)))-101)
mom3 <- is.element(colnames(BOXSS),as.numeric(as.character(colnames(OUT3)))-101)
mom4 <- is.element(colnames(BOXSS),as.numeric(as.character(colnames(OUT4)))-100)
BOXSS[rownames(OUT1),mom1] <- sweep(OUT1,1,vec[rownames(OUT1)],"/")
BOXSE[rownames(OUT2),mom2] <- sweep(OUT2,1,vec[rownames(OUT2)],"/")
BOXRS[rownames(OUT3),mom3] <- sweep(OUT3,1,vec[rownames(OUT3)],"/")
BOXRE[rownames(OUT4),mom4] <- sweep(OUT4,1,vec[rownames(OUT4)],"/")

#Export data
write.table(BOXSS,paste0(j,tailSS),sep="\t",quote=F)
write.table(BOXSE,paste0(j,tailSE),sep="\t",quote=F)
write.table(BOXRS,paste0(j,tailRS),sep="\t",quote=F)
write.table(BOXRE,paste0(j,tailRE),sep="\t",quote=F)
