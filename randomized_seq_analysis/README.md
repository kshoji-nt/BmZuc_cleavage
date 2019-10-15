## Overview:  
This directory contains the code required for the analysis of silkworm randomized piRNAs.  


## Contents:  
#### 1.1.Preparation_for_analysis/  
- **First step of this analysis.**  
Using plasmid sequence data, reference sequence are determined.   
This step requires "randdiv.R". However, it is not necessary if the file division by index is succeeded.

####  2.map_to_piRNAloci/  
- **Second step of this analysis.**  
Map the randomized small RNA sequence data to the reference sequence defined in the first step, and process the data into a manageable form.  
This step requires "0start_rand.R".

####  3.analysis_for_paper/  
- **Third step of this analysis.**  
The analysis is performed using the randomized piRNA length and quantity distribution table obtained in step 2.  

####  randdiv.R 
- **This script is part of the first step.**  
Since the index array could not be read, this script splits the file using a fixed sequence that exists in a fixed place in the sequence.
You don't need to do this as long as you can read the index sequence.

####  0start_rand.R  
- **This script is part of the second step.**  
From the obtained mapping result, only the read that starts from "0" and the direction is + is extracted.  
The output file is a table of the length and the number of reads derived from each randomized reference.  
Since this is a part of the second step, save this file with this name and use it in the second step.


