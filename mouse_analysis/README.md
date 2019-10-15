## Overview:  
This directory contains the code required for the analysis of mouse endogenous piRNAs from public database.  
    
## Contents:  
####  1.piRNA_loci_definition_and_map/  
- **First step of this analysis.**  
Using small RNA sequence data, piRNA loci (piRNA aggregated at the 5 'end) are determined.   
Then 45-nt sequences from the 5' ends and the 100-nt sequences around the 5'ends are extracted from transposon sequences as a reference for following analysis. 
Map the small RNA sequence data to the piRNA loci sequence defined in the first step, and process the data into a manageable form.  
This step requires "0start_+.R". 
Here, it should be noted that only piRNAs with high expression levels in any of the libraries used to define piRNA loci are focused in following analysis.

####  2.analysis_for_paper/  
- **Second step of this analysis.**  
The analysis is performed using the piRNA length and quantity distribution table and the nearby piRNA distribution table derived from each piRNA loci obtained in step 1.  
It is not always necessary to perform analysis in this way, so if you go to step 1, you should analyze your data as you like.

####  0start_+.R  
- **This script is part of the second step.**  
From the obtained mapping result, only the read that starts from "0" and the direction is + is extracted.  
The output file is a table of the length and the number of reads derived from each piRNA loci.  
Since this is a part of the second step, save this file with this name and use it in the second step.

#### datas used for this research's piRNA loci definition
SRR7760309 #PNLDC1 KO Round Spermatids total small RNAs rep2 unoxidized  
SRR7760310 #PNLDC1 KO Round Spermatids total small RNAs rep2 oxidized  
SRR7760317 #WT Primary Spermatocytes total small RNAs rep2 unoxidized  
SRR7760318 #WT Primary Spermatocytes total small RNAs rep2 oxidized  
SRR7760321 #WT Spermatogonia total small RNAs rep2 unoxidized  
SRR7760322 #WT Spermatogonia total small RNAs rep2 oxidized  
SRR7760343 #PNLDC1 KO Primary Spermatocytes total small RNAs rep2 oxidized  
SRR7760344 #PNLDC1 KO Primary Spermatocytes total small RNAs rep2 unoxidized  
SRR7760347 #PNLDC1 KO Secondary Spermatocytes total small RNAs rep2 oxidized  
SRR7760348 #PNLDC1 KO Secondary Spermatocytes total small RNAs rep2 unoxidized  
SRR7760369 #PNLDC1 KO Spermatogonia total small RNAs rep2 unoxidized  
SRR7760370 #PNLDC1 KO Spermatogonia total small RNAs rep2 oxidized  
SRR7760373 #WT Round Spermatids total small RNAs rep2 unoxidized  
SRR7760374 #WT Round Spermatids total small RNAs rep2 oxidized  
SRR7760377 #WT Secondary Spermatocytes total small RNAs rep2 unoxidized  
SRR7760378 #WT Secondary Spermatocytes total small RNAs rep2 oxidized  
