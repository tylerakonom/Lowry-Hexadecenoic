#!/bin/bash

# Written by: tyak9569
# Date: 20201016
# Purpose: samtools merge script for tyak9569

#SBATCH --partition=shas     # Summit partition
#SBATCH --qos=normal                 # Summit qos
#SBATCH --time=002:00:00           # Max wall time in HHH:MM:SS
#SBATCH --ntasks=4           # Number of tasks per job
#SBATCH --nodes=1             # Number of nodes per job
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

# Create output directory
mkdir /scratch/$USER/hex_acid/aligned/merged

# Merge files
singularity run /projects/lowryc/software/containers/rnaseq.sif samtools merge /scratch/summit/$USER/hex_acid/aligned/merged/1h_m1_t.bam /scratch/summit/$USER/hex_acid/aligned/lane1/1h_m1_t.bam /scratch/summit/$USER/hex_acid/aligned/lane2/1h_m1_t.bam
singularity run /projects/lowryc/software/containers/rnaseq.sif samtools merge /scratch/summit/$USER/hex_acid/aligned/merged/1h_m1_u.bam /scratch/summit/$USER/hex_acid/aligned/lane1/1h_m1_u.bam /scratch/summit/$USER/hex_acid/aligned/lane2/1h_m1_u.bam

singularity run /projects/lowryc/software/containers/rnaseq.sif samtools merge /scratch/summit/$USER/hex_acid/aligned/merged/1h_m2_t.bam /scratch/summit/$USER/hex_acid/aligned/lane1/1h_m2_t.bam /scratch/summit/$USER/hex_acid/aligned/lane2/1h_m2_t.bam
singularity run /projects/lowryc/software/containers/rnaseq.sif samtools merge /scratch/summit/$USER/hex_acid/aligned/merged/1h_m2_u.bam /scratch/summit/$USER/hex_acid/aligned/lane1/1h_m2_u.bam /scratch/summit/$USER/hex_acid/aligned/lane2/1h_m2_u.bam

singularity run /projects/lowryc/software/containers/rnaseq.sif samtools merge /scratch/summit/$USER/hex_acid/aligned/merged/1h_m3_t.bam /scratch/summit/$USER/hex_acid/aligned/lane1/1h_m3_t.bam /scratch/summit/$USER/hex_acid/aligned/lane2/1h_m3_t.bam
singularity run /projects/lowryc/software/containers/rnaseq.sif samtools merge /scratch/summit/$USER/hex_acid/aligned/merged/1h_m3_u.bam /scratch/summit/$USER/hex_acid/aligned/lane1/1h_m3_u.bam /scratch/summit/$USER/hex_acid/aligned/lane2/1h_m3_u.bam


singularity run /projects/lowryc/software/containers/rnaseq.sif samtools merge /scratch/summit/$USER/hex_acid/aligned/merged/6h_m1_t.bam /scratch/summit/$USER/hex_acid/aligned/lane1/6h_m1_t.bam /scratch/summit/$USER/hex_acid/aligned/lane2/6h_m1_t.bam
singularity run /projects/lowryc/software/containers/rnaseq.sif samtools merge /scratch/summit/$USER/hex_acid/aligned/merged/6h_m1_u.bam /scratch/summit/$USER/hex_acid/aligned/lane1/6h_m1_u.bam /scratch/summit/$USER/hex_acid/aligned/lane2/6h_m1_u.bam

singularity run /projects/lowryc/software/containers/rnaseq.sif samtools merge /scratch/summit/$USER/hex_acid/aligned/merged/6h_m2_t.bam /scratch/summit/$USER/hex_acid/aligned/lane1/6h_m2_t.bam /scratch/summit/$USER/hex_acid/aligned/lane2/6h_m2_t.bam
singularity run /projects/lowryc/software/containers/rnaseq.sif samtools merge /scratch/summit/$USER/hex_acid/aligned/merged/6h_m2_u.bam /scratch/summit/$USER/hex_acid/aligned/lane1/6h_m2_u.bam /scratch/summit/$USER/hex_acid/aligned/lane2/6h_m2_u.bam

singularity run /projects/lowryc/software/containers/rnaseq.sif samtools merge /scratch/summit/$USER/hex_acid/aligned/merged/6h_m3_t.bam /scratch/summit/$USER/hex_acid/aligned/lane1/6h_m3_t.bam /scratch/summit/$USER/hex_acid/aligned/lane2/6h_m3_t.bam
singularity run /projects/lowryc/software/containers/rnaseq.sif samtools merge /scratch/summit/$USER/hex_acid/aligned/merged/6h_m3_u.bam /scratch/summit/$USER/hex_acid/aligned/lane1/6h_m3_u.bam /scratch/summit/$USER/hex_acid/aligned/lane2/6h_m3_u.bam