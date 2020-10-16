#!/bin/bash

# Written by: tyak9569
# Pul1_2Pose: Hisat2 script for tyak9569

#SBATCH --partition=shas     # Summit partition
#SBATCH --qos=normal                 # Summit qos
#SBATCH --time=20:00:00           # Max wall time in HHH:MM:SS
#SBATCH --ntasks=24           # Number of tasks per job
#SBATCH --nodes=1             # Number of nodes per job
#SBATCH --job-name=Hisat2      # Job submission name
#SBATCH --output=o.Hisat2.%j.out   # Output file name with Job ID
#SBATCH --mail-type=END            # Email user when job finishes
#SBATCH --mail-user=tyak9569@colorado.edu # Email address of user

##### PLEASE NOTE #####
# This script was written on a Windows machine. Before running on summit, use this command:
# $ dos2unix hisat2.sh

# purge all existing modules
module purge

# load the module needed to run the software container, and set up temporary directories
module load singularity/3.3.0
export SINGULARITY_TMPDIR=/scratch/summit/$USER
export SINGULARITY_CACHEDIR=/scratch/summit/$USER

# Make sratch directories to work out of
mkdir /scratch/summit/$USER/hex_acid
mkdir /scratch/summit/$USER/hex_acid/aligned
mkdir /scratch/summit/$USER/hex_acid/aligned/out
mkdir /scratch/summit/$USER/hex_acid/aligned/lane1
mkdir /scratch/summit/$USER/hex_acid/aligned/lane2

# Run Hisat2 on each file (Lane1 1h)
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m1_t_l1.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/1h_m1_t_l1_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/1h_m1_t_l1_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane1/1h_m1_t_.bam --rg-id 1h_m1_t_l1
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m1_u_l1.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/1h_m1_u_l1_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/1h_m1_u_l1_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane1/1h_m1_u_.bam --rg-id 1h_m1_u_l1
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m2_t_l1.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/1h_m2_t_l1_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/1h_m2_t_l1_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane1/1h_m2_t_.bam --rg-id 1h_m2_t_l1
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m2_u_l1.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/1h_m2_u_l1_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/1h_m2_u_l1_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane1/1h_m2_u_.bam --rg-id 1h_m2_u_l1
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m3_t_l1.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/1h_m3_t_l1_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/1h_m3_t_l1_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane1/1h_m3_t_.bam --rg-id 1h_m3_t_l1
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m3_u_l1.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/1h_m3_u_l1_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/1h_m3_u_l1_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane1/1h_m3_u_.bam --rg-id 1h_m3_u_l1

# Run Hisat2 on each file (Lane1 6h)
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m1_t_l1.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/6h_m1_t_l1_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/6h_m1_t_l1_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane1/6h_m1_t_.bam --rg-id 6h_m1_t_l1
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m1_u_l1.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/6h_m1_u_l1_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/6h_m1_u_l1_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane1/6h_m1_u_.bam --rg-id 6h_m1_u_l1
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m2_t_l1.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/6h_m2_t_l1_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/6h_m2_t_l1_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane1/6h_m2_t_.bam --rg-id 6h_m2_t_l1
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m2_u_l1.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/6h_m2_u_l1_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/6h_m2_u_l1_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane1/6h_m2_u_.bam --rg-id 6h_m2_u_l1
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m3_t_l1.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/6h_m3_t_l1_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/6h_m3_t_l1_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane1/6h_m3_t_.bam --rg-id 6h_m3_t_l1
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m3_u_l1.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/6h_m3_u_l1_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane1/6h_m3_u_l1_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane1/6h_m3_u_.bam --rg-id 6h_m3_u_l1

# Run Hisat2 on each file (Lane2 1h)
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m1_t_l2.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/1h_m1_t_l2_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/1h_m1_t_l2_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane2/1h_m1_t_.bam --rg-id 1h_m1_t_l2
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m1_u_l2.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/1h_m1_u_l2_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/1h_m1_u_l2_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane2/1h_m1_u_.bam --rg-id 1h_m1_u_l2
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m2_t_l2.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/1h_m2_t_l2_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/1h_m2_t_l2_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane2/1h_m2_t_.bam --rg-id 1h_m2_t_l2
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m2_u_l2.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/1h_m2_u_l2_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/1h_m2_u_l2_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane2/1h_m2_u_.bam --rg-id 1h_m2_u_l2
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m3_t_l2.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/1h_m3_t_l2_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/1h_m3_t_l2_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane2/1h_m3_t_.bam --rg-id 1h_m3_t_l2
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m3_u_l2.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/1h_m3_u_l2_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/1h_m3_u_l2_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane2/1h_m3_u_.bam --rg-id 1h_m3_u_l2

# Run Hisat2 on each file (Lane2 6h)
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m1_t_l2.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/6h_m1_t_l2_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/6h_m1_t_l2_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane2/6h_m1_t_.bam --rg-id 6h_m1_t_l2
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m1_u_l2.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/6h_m1_u_l2_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/6h_m1_u_l2_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane2/6h_m1_u_.bam --rg-id 6h_m1_u_l2
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m2_t_l2.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/6h_m2_t_l2_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/6h_m2_t_l2_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane2/6h_m2_t_.bam --rg-id 6h_m2_t_l2
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m2_u_l2.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/6h_m2_u_l2_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/6h_m2_u_l2_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane2/6h_m2_u_.bam --rg-id 6h_m2_u_l2
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m3_t_l2.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/6h_m3_t_l2_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/6h_m3_t_l2_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane2/6h_m3_t_.bam --rg-id 6h_m3_t_l2
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m3_u_l2.txt -x /projects/lowryc/genome/mouse/ -1 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/6h_m3_u_l2_1P.fq.gz -2 /scratch/summit/tyak9569/hex_acid/trimmedReads/lane2/6h_m3_u_l2_2P.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/lane2/6h_m3_u_.bam --rg-id 6h_m3_u_l2