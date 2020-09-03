#!/bin/bash
#SBATCH -J FastQC
#SBATCH -n 4 #number of cores being used
#SBATCH -N 1 #ensure that all cores are on the same node
#SBATCH -t 1-00:00 #how long we think it will take
#SBATCH --partition=shas

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