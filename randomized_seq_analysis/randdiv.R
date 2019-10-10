#Get runtime arguments
argv <- commandArgs(TRUE)

#Specify file name
in_f <- as.character(argv[1])

#Loading package
library(Biostrings)

#Loading data
fas <- readDNAStringSet(in_f, format="fastq")

#Enter the fixed sequence
AD50 <- "ACACGGATCACCAGCCACCATCGAGCAACC"
SD50 <- "TAAGATCCAGTGGCATAAAAAGATAGCGCG"
SS50 <- "AGCTGAAAAGAGGTAACAATGAAAGAAAAT"
AS50 <- "AGCTGTACCTCTTTTTGTCGATTCACAAAG"
S31  <- "AGCTGAAAAGAGGTAACAATGAAAGAAAAT"
ref <- list(SD50,AD50,SS50,AS50,S31)

#Preparing the container for input
AD50set <- rep(AD50,121)
SD50set <- rep(SD50,121)
SS50set <- rep(SS50,121)
AS50set <- rep(AS50,121)
S31set <- rep(S31,121)
set <- list(SD50set,AD50set,SS50set,AS50set,S31set)
ACGT <- c("A","C","G","T","N")

#Create a variation in order to take even one base mutation in the fixed sequence (change destination in ACGTN is 4 ways x 30 bases, 120 variations + original is 121 ways)
for(i in 1:30){
	for(j in 1:5){
		ch <- ACGT[!ACGT == substr(ref[[j]],i,i)]
		for(k in 1:4){
			substr(set[[j]][i*4+k-4],i,i) <- ch[k]
			cat(i*4+k-4)
		}
	}
}

#Extract the read that contains one base mutation sequcence in the expected region and write it out.
checks <- matrix( F,length(fas),5)
checks[,1] <- is.element(substr(fas,1,30),set[[1]])
checks[,2] <- is.element(substr(fas,1,30),set[[2]])
checks[,3] <- is.element(substr(fas,36,65),set[[3]])
checks[,4] <- is.element(substr(fas,36,65),set[[4]])
checks[,5] <- is.element(substr(fas,17,46),set[[5]])

out_f <- paste0(c("SD50","AD50","SS50","AS50","S31"),"_",in_f,".fas")
for(i in 1:5){
writeXStringSet(fas[checks[,i]], file=out_f[i], format="fasta", width=101)#fastaの中身をout_fで指定したファイル名で保存
}
