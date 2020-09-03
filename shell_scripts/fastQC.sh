#!/bin/bash

# Written by: tyak9569
# Date: 20200903
# Purpose: fastQC script for tyak9569

#SBATCH --partition=shas     # Summit partition
#SBATCH --qos=normal                 # Summit qos
#SBATCH --time=002:00:00           # Max wall time in HHH:MM:SS
#SBATCH --ntasks=4           # Number of tasks per job
#SBATCH --nodes=1             # Number of nodes per job
#SBATCH --job-name=fastQC       # Job submission name
#SBATCH --output=o.fastQC.%j.out   # Output file name with Job ID
#SBATCH --mail-type=END            # Email user when job finishes
#SBATCH --mail-user=tyak9569@colorado.edu # Email address of user

# purge all existing modules
module purge

# load the module needed to run the software container, and set up temporary directories
module load singularity/3.3.0
export SINGULARITY_TMPDIR=/scratch/summit/$USER
export SINGULARITY_CACHEDIR=/scratch/summit/$USER

# run FastQC for each file

FILES1=/projects/lowryc/hex_acid/*.fq.gz
for f in $FILES1
do
  	singularity run /projects/lowryc/software/containers/rnaseq.sif fastqc -t 4 -o /scratch/summit/tyak9569/hex_acid/fastqc/raw/ -d /scratch/summit/tyak9569/hex_acid/fastqc/raw $f
done