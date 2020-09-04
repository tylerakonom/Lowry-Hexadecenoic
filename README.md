# Lowry Hexadecenoic
*RNA-Seq analysis of macrophages treated with 10(Z)-hexadecenoic acid.*


## Background

We are setting out to analyze data previously collected by David Smith for Dr. Lowry. Our analysis will focus on the data derived from macrophages treated for 6 hours with vehicle or 10(Z)-hexadecenoic acid, but all data from the 1 hour time point will be processed as well for eventual comparative analysis.

## Pre-processing

Before proceeding an important note, all data located in the Lowry project directory should be maintained as READ ONLY, and you should not edit file structure or data. All outputs should be directed to **your scratch space**! Your scratch space is located on summit at:

	$ /scratch/summit/$USER/

All files were uploaded to the summit module as part of the research computing program at CU Boulder. Basic tutorials on how to work with the RC computing environment and FAQs are located [**here**](https://curc.readthedocs.io/en/latest/faq.html). All files were uploaded to the lowryc project folder into the directory "hex_acid". The file path is as follows:

	$ /projects/lowryc/hex_acid/

Finally, [**this**](https://github.com/tylerakonom/Lowry-Hexadecenoic/blob/master/filenames.txt) document was provided by David Smith to make sense of the naming scheme for each ".fq.gz" file.

All meetings of the Lowry RNA-Seq group were stored in the lowryc projects directory. To access them, use the tutorial located [**here**](https://curc.readthedocs.io/en/latest/compute/data-transfer.html) to set up a globus endpoint on your computer, and access the data stored on summit at:

	$ /projects/lowryc/meetings/

Software will be called from the container located in the summit module at:

	$ /projects/lowryc/software/containers/rnaseq.sif

In order to work with the software contained in the container, we need to use the container module singularity. There should be no reason for you to work in the terminal with the container, so all bash scripts will call the software for you.

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

Trimming of raw reads was performed previously by David Smith using [trimmomatic (v0.39)](http://www.usadellab.org/cms/?page=trimmomatic), whose manual can be found [**here**](http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf). 

#### Post Trim Quality Control

[FastQC (v0.11.8)](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) was used for quality control of trimmed reads. Completed FastQC html documents can be downloaded [**here**](https://github.com/tylerakonom/Lowry-Hexadecenoic/tree/master/outputs/fastQC)

#### Aligning to the Genome

Trimmed samples will be aligned to the Ensembl ([GRCm38](ftp://ftp.ensembl.org/pub/release-101/gtf/mus_musculus/)) primary mouse genome using [HISAT2 (v2.1.0)](https://ccb.jhu.edu/software/hisat2/manual.shtml). Post align QC will be done with [Preseq](http://smithlabresearch.org/software/preseq/) and [Rseqc](http://rseqc.sourceforge.net/).

#### Generating Raw Read Counts

Raw read counts will be generated using the [Rsubread (v2.0.1)](https://bioconductor.org/packages/release/bioc/html/Rsubread.html) for [R (v3.6.1)](https://www.r-project.org/) package you will need to install on your summit account. Processing needs to be performed by switching to a compile node with this command:

	$ ssh scompile

R should be called in the anaconda environment on summit:

	$ source /curc/sw/anaconda/default
	$ conda activate r361
	$ R

Running Rsubread can be done with [**this**](https://github.com/tylerakonom/Lowry-Hexadecenoic/blob/master/Rsubread.R) as an example script. The final counts text file will be used for the remainder of the analysis.

From this point on, the processing will be performed on a local machine. The command to copy a file from the summit cluster looks like this:

	$ scp <username>@login.rc.colorado.edu:<path to file you want to transfer> ~<path to folder on the local machine you want to copy to>