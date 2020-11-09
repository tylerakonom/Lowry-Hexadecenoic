# Lowry Hexadecenoic
*RNA-Seq analysis of macrophages treated with 10(Z)-hexadecenoic acid.*


## Background

We are setting out to analyze data previously collected by David Smith for Dr. Lowry. Our analysis will focus on the data derived from macrophages treated for 6 hours with vehicle or 10(Z)-hexadecenoic acid, but all data from the 1 hour time point will be processed as well for eventual comparative analysis.

## Pre-processing

Before proceeding an important note, all data located in the Lowry project directory should be maintained as READ ONLY, and you should not edit file structure or data. All outputs should be directed to **your scratch space**! Your scratch space is located on summit at:

	$ /scratch/summit/$USER/

All files were uploaded to the summit module as part of the research computing program at CU Boulder. Basic tutorials on how to work with the RC computing environment and FAQs are located [**here**](https://curc.readthedocs.io/en/latest/faq.html). All files were uploaded to the lowryc project folder into the directory "hex_acid". The file path is as follows:

	$ /projects/lowryc/hex_acid/raw_data/

Samples were run in two separate lanes on the sequencer, providing technical replicates and greater depth. These files will need to be aligned separately, then the resulting .bam files will need to be merged together.

Finally, [**this**](https://github.com/tylerakonom/Lowry-Hexadecenoic/blob/master/filenames.txt) document explains the naming scheme for each ".fq.gz" file.

All meetings of the Lowry RNA-Seq group were stored in the lowryc projects directory. To access them, use the tutorial located [**here**](https://curc.readthedocs.io/en/latest/compute/data-transfer.html) to set up a globus endpoint on your computer, and access the data stored on summit at:

	$ /projects/lowryc/meetings/

Software will be called from the container located in the summit module at:

	$ /projects/lowryc/software/containers/rnaseq.sif

In order to use the software located in the container, we need to use the container module "singularity". There should be no reason for you to work in the terminal with the container, so all bash scripts will call the software for you.


We are going to require a blank job script to work with RC. An example test job can be found [**here**](https://github.com/tylerakonom/Lowry-Hexadecenoic/blob/master/shell_scripts/testjob.sh). The header of the script will need to be changed to reflect what the expected necessities of the job are. Line 27 will need to be edited to run the command you're out to run. The example script is set up to run the help menu for hisat2.

	$ singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 --help

Everything in this command before "hisat2" is setting up for the command, hisat2 is the command being run, and --help is the argument.

Jobs are run by navigating to the directory containing the script you want to run, and using the following command:

	$ sbatch <name of script>.sh

Once the job is submitted to summit, you can check on the status of the job by using this command:

	$ squeue -u $USER

Finally, the output for the job you submitted will be placed into the folder where your bash script is located. To view that file or any other files and scripts on summit, use this format:

	$ nano <name of file>.out


#### Trimming Reads

Trimming of raw reads was performed using [trimmomatic (v0.39)](http://www.usadellab.org/cms/?page=trimmomatic) (whose manual can be found [**here**](http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf)) and [**trimmomatic.sh**](https://github.com/tylerakonom/Lowry-Hexadecenoic/blob/master/shell_scripts/trimmomatic.sh). All settings were matched to the ones used by David Smith used in his publication.

#### Post Trim Quality Control

[FastQC (v0.11.8)](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) was used for quality control of trimmed reads with [**this**](https://github.com/tylerakonom/Lowry-Hexadecenoic/blob/master/shell_scripts/fastQC_trimmed.sh) script. Completed FastQC html documents can be downloaded [**here**](https://github.com/tylerakonom/Lowry-Hexadecenoic/tree/master/outputs/fastQC)

#### Aligning to the Genome

Trimmed samples were aligned to the NCBI ([GRCm38 mm10](https://www.ncbi.nlm.nih.gov/assembly/GCF_000001635.20/)) mouse genome, and indexes were created using [HISAT2 (v2.1.0)](https://ccb.jhu.edu/software/hisat2/manual.shtml) and [**index_hisat2.sh**](https://github.com/tylerakonom/Lowry-Hexadecenoic/blob/master/shell_scripts/index_hisat2.sh). Indexes were saved at the following directory for future use:

	$ /projects/lowryc/hex_acid/genome/mouse/

Alignment was performed with [**hisat2.sh**](https://github.com/tylerakonom/Lowry-Hexadecenoic/blob/master/shell_scripts/hisat2.sh). Samples were given an rg-id during alignment to differentiate technical replicates once merged at a later step. 

Post align QC will be done with [Preseq](http://smithlabresearch.org/software/preseq/) and [Rseqc](http://rseqc.sourceforge.net/). 

#### Merging Lanes (Technical Replicates)

The technical replicates for each sample (lanes 1 and 2) were merged using [samtools v1.9](https://www.htslib.org/doc/1.9/samtools.html) and [samtools_merge.sh](https://github.com/tylerakonom/Lowry-Hexadecenoic/blob/master/shell_scripts/samtools_merge.sh). Unsorted, merged .bam files were then sorted using [Samtools v1.9](https://www.htslib.org/doc/1.9/samtools.html) and [samtools_sort.sh](https://github.com/tylerakonom/Lowry-Hexadecenoic/blob/master/shell_scripts/samtools_sort.sh). This script was queued in Summit by calling the script and inputting filenames with [run_samtools_sort.sh](https://github.com/tylerakonom/Lowry-Hexadecenoic/blob/master/shell_scripts/run_samtools_sort.sh). This was done in the bash terminal in a "compile" node. To log in to a compile node, this command was used:

	$ ssh scompile

By running the following command, the script "run_samtools_sort.sh" was run, file names were generated automatically and input into the "samtools_sort.sh" script:

	$ bash run_samtools_sort.sh

#### Generating Raw Read Counts

Raw read counts were generated using the [Rsubread (v2.0.1)](https://bioconductor.org/packages/release/bioc/html/Rsubread.html) for [R (v3.6.1)](https://www.r-project.org/) package installed on summit. Reads were annotated with the [NCBI refSeq genome](https://www.ncbi.nlm.nih.gov/refseq/) downloaded from [**here**](https://support.illumina.com/sequencing/sequencing_software/igenome.html). Processing was performed by switching to a compile node with this command:

	$ ssh scompile

R was run by calling and running R in the anaconda environment on summit:

	$ source /curc/sw/anaconda/default
	$ conda activate r361
	$ R

The script [Rsubread.R](https://github.com/tylerakonom/Lowry-Hexadecenoic/blob/master/R_scripts/Rsubread.R) was entered into the R terminal, and the output was stored as a text file for processing and analysis.

From this point on, the processing will be performed on a local machine. The command to copy a file from the summit cluster looks like this:

	$ scp <username>@login.rc.colorado.edu:<path to file you want to transfer> ~<path to folder on the local machine you want to copy to>


## Analyzing Counts
*Turning counts into results.*

Raw read counts were normalized and analyzed for differential expression using [DESeq2(v1.26.0)](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) for R, and [DESEQ2.rmd](https://github.com/tylerakonom/Lowry-Hexadecenoic/blob/master/R_scripts/DESEQ2.Rmd). All outputs were stored under [deseq_outputs](https://github.com/tylerakonom/Lowry-Hexadecenoic/tree/master/deseq_outputs) as .csv files, and "working" excel spreadsheets were created to assist in analysis. This is a work in progress, and will be updated soon!