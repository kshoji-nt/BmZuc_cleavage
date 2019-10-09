################
#0start_+.R
################
#Get runtime arguments
argv <- commandArgs(TRUE)

#Specify file name
in_f <- paste(argv[1],"_piRNA_shojibase.bed",sep="") 
out_f <- paste(argv[1],"_piRNAdist.table",sep="") 
reads1 <- readDNAStringSet("piRNA_shojibase.fas", format="fasta")

#Loading package
library(Biostrings) 

#Loading data
bed <- read.table(in_f)
bed2<- bed[bed[,2] == 0 & bed[,6] == "+"& bed[,3]>19,c(1,3)] #Extract rows starting at 0, with direction +, and length of 20 or more

#Create a table of length distribution for each array
BOX <- matrix(0,length(reads1),26)
NAME <-names(reads1)
rownames(BOX)  <-NAME
colnames(BOX) <- 20:45
sampling <- 20:45
lisc <- tapply(bed2[,2],bed2[,1],table)
sec <- floor(length(reads1)/100*(1:100))
for (i in 1:length(reads1)){
	tmp <- lisc[[names(reads1[i])]]
	BOX[names(reads1[i]),names(tmp)] <- tmp
	if(is.element(i,sec)){
		cat("=")
	}
}

#Export data
write.table(BOX,out_f,sep="\t",quote=F,row.names=T,col.names=T)
