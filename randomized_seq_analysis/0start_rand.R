#Get runtime arguments
argv <- commandArgs(TRUE)

#Loading package
suppressMessages(library(Biostrings) )

#Specify file name
in_f <- paste(argv[1],".bed",sep="") #読み込みたいファイル名を指定
out_f <- paste(argv[1],"_piRNAdist.table",sep="") 

#Loading data
reads1 <- readDNAStringSet(argv[2], format="fasta")
bed <- read.table(in_f)
bed2<- bed[bed[,2] == 0 & bed[,6] == "+",c(1,3)] #Extract rows starting at 0, with direction + 
ichi <- factor(bed2[,2],levels=20:45)
namae <- factor(bed2[,1],levels=names(reads1))

#Create a table of length distribution for each sequence
BOX <- matrix(0,length(reads1),26)
NAME <-names(reads1)
rownames(BOX)  <-NAME
colnames(BOX) <- 20:45
sampling <- 20:45
b <- tapply(ichi,namae,table)
gus <- ceiling((1:100)*length(reads1)/100)
for (i in 1:length(reads1)){
	if(length(b[[i]])>0){
		BOX[i,] <- b[[i]]
	}
	if(is.element(i, gus)){
		cat("=") #Display = for every 1/100 progress
	}
}

#Export data
 write.table(BOX,out_f,sep="\t",quote=F,row.names=T,col.names=T)
