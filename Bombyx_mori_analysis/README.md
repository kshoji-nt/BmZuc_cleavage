## Overview:  
This directory contains the code required for the analysis of silkworm endogenous piRNAs.  
    
## Contents:  
#### 1.piRNA_loci_definition/  
- **First step of this analysis.**  
Using small RNA sequence data, piRNA loci (piRNA aggregated at the 5 'end) are determined.   
Then 45-nt sequences from the 5' ends and the 100-nt sequences around the 5'ends are extracted from transposon sequences as a reference for following analysis.  
Here, it should be noted that only piRNAs with high expression levels in any of the libraries used to define piRNA loci are focused in following analysis.

####  2.map_to_piRNAloci/  
- **Second step of this analysis.**  
Map the small RNA sequence data to the piRNA loci sequence defined in the first step, and process the data into a manageable form.  
Although the distribution of the piRNA length can be obtained, it should be noted that the piRNA in the vicinity may not be obtained due to sequence restrictions.  
This step requires "0start_+.R" and "ov2.R".

####  3.analysis_for_paper/  
- **Third step of this analysis.**  
The analysis is performed using the piRNA length and quantity distribution table and the nearby piRNA distribution table derived from each piRNA loci obtained in step 2.  
It is not always necessary to perform analysis in this way, so if you go to step 2, you should analyze your data as you like.

####  0start_+.R  
- **This script is part of the second step.**  
From the obtained mapping result, only the read that starts from "0" and the direction is + is extracted.  
The output file is a table of the length and the number of reads derived from each piRNA loci.  
Since this is a part of the second step, save this file with this name and use it in the second step.


####  ov2.R
- **This script is part of the second step.**  
Summarize the situation of piRNA around piRNA loci.  
There are four output files, each with the following meaning:  
BOXSS: Distribution of relative position of 5'end in the same direction as piRNA loci.  
BOXSE: Distribution of relative position of 3'end in the same direction as piRNA loci.  
BOXRS: Distribution of relative position of 5'end opposite to piRNA loci.  
BOXRE: Distribution of relative position of 3'end opposite to piRNA loci.  
In each table, 101 indicates the 5'end position of the piRNA loci itself.  
Since this is a part of the second step, save this file with this name and use it in the second step.

