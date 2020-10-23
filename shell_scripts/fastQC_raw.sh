#!/bin/bash

# Written by: tyak9569
# Date: 20200903
# Purpose: fastQC script for tyak9569

#SBATCH --partition=shas     # Summit partition
#SBATCH --qos=normal                 # Summit qos
#SBATCH --time=002:00:00           # Max wall time in HHH:MM:SS
#SBATCH --ntasks 24           # Number of tasks per job
#SBATCH --nodes=1             # Number of nodes per job
#SBATCH --job-name=fastQC       # Job submission name
#SBATCH --output=o.fastQC.%j.out   # Output file name with Job ID

# purge all existing modules
module purge

# load the module needed to run the software container, and set up temporary directories
module load singularity/3.3.0
export SINGULARITY_TMPDIR=/scratch/summit/$USER
export SINGULARITY_CACHEDIR=/scratch/summit/$USER

# Create directories

mkdir -p /scratch/summit/$USER/hex_acid
mkdir -p /scratch/summit/$USER/hex_acid/fastqc
mkdir -p /scratch/summit/$USER/hex_acid/fastqc/raw
mkdir -p /scratch/summit/$USER/hex_acid/fastqc/raw/lane1
mkdir -p /scratch/summit/$USER/hex_acid/fastqc/raw/lane2

# run FastQC for each file

FILES1=/projects/lowryc/hex_acid/raw_data/lane1/*.fastq
for f in $FILES1
do
  	singularity run /projects/lowryc/software/containers/rnaseq.sif fastqc -t 24 -o /scratch/summit/$USER/hex_acid/fastqc/raw/lane1/ -d /scratch/summit/$USER/hex_acid/fastqc/raw/lane1/ $f
done

FILES1=/projects/lowryc/hex_acid/raw_data/lane2/*.fastq
for f in $FILES1
do
  	singularity run /projects/lowryc/software/containers/rnaseq.sif fastqc -t 24 -o /scratch/summit/$USER/hex_acid/fastqc/raw/lane2/ -d /scratch/summit/$USER/hex_acid/fastqc/raw/lane2/ $f
done