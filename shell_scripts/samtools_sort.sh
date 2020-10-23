#!/bin/bash

# Written by: tyak9569
# Date: 20201023
# Purpose: samtools sort script for tyak9569

#SBATCH --partition=shas     # Summit partition, this may need to be smem
#SBATCH --qos=normal                 # Summit qos
#SBATCH --time=002:00:00           # Max wall time in HHH:MM:SS
#SBATCH --ntasks=24           # Number of tasks per job  
#SBATCH --nodes=1             # Number of nodes per job
#SBATCH --mem=240gb           # Memory Allocated, hopefully there's enough here
#SBATCH --job-name=samtools      # Job submission name
#SBATCH --output=samtools%j.out   # Output file name with Job ID
#SBATCH --mail-type=END            # Email user when job finishes
#SBATCH --mail-user=tyak9569@colorado.edu # Email address of user


# purge all existing modules
module purge

# load the module needed to run the software container, and set up temporary directories
module load singularity/3.3.0
export SINGULARITY_TMPDIR=/scratch/summit/$USER
export SINGULARITY_CACHEDIR=/scratch/summit/$USER

# Merge files
singularity run /projects/lowryc/software/containers/rnaseq.sif samtools sort -m 10G -o /scratch/summit/$USER/hex_acid/aligned/merged/${filename}.sort.bam -T ${SLURM_JOBID} -@ 24 /scratch/summit/$USER/hex_acid/aligned/merged/${filename}.bam