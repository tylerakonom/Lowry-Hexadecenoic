#!/bin/bash

# Written by: tyak9569
# Purpose: Hisat2 script for tyak9569

#SBATCH --partition=shas     # Summit partition
#SBATCH --qos=normal                 # Summit qos
#SBATCH --time=10:00:00           # Max wall time in HHH:MM:SS
#SBATCH --ntasks=24           # Number of tasks per job
#SBATCH --nodes=1             # Number of nodes per job
#SBATCH --job-name=Hisat2      # Job submission name
#SBATCH --output=o.Hisat2.%j.out   # Output file name with Job ID
#SBATCH --mail-type=END            # Email user when job finishes
#SBATCH --mail-user=tyak9569@colorado.edu # Email address of user

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

# Run Hisat2 on each file (1h)
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m1_t.txt -x /projects/lowryc/hex_acid_working/genome/GRCm38 -1 /projects/lowryc/hex_acid_working/trimmed/1h_m1_t_fp.fq.gz -2 /projects/lowryc/hex_acid_working/trimmed/1h_m1_t_rp.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/1h_m1_t_.bam
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m1_u.txt -x /projects/lowryc/hex_acid_working/genome/GRCm38 -1 /projects/lowryc/hex_acid_working/trimmed/1h_m1_u_fp.fq.gz -2 /projects/lowryc/hex_acid_working/trimmed/1h_m1_u_rp.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/1h_m1_u_.bam
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m2_t.txt -x /projects/lowryc/hex_acid_working/genome/GRCm38 -1 /projects/lowryc/hex_acid_working/trimmed/1h_m2_t_fp.fq.gz -2 /projects/lowryc/hex_acid_working/trimmed/1h_m2_t_rp.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/1h_m2_t_.bam
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m2_u.txt -x /projects/lowryc/hex_acid_working/genome/GRCm38 -1 /projects/lowryc/hex_acid_working/trimmed/1h_m2_u_fp.fq.gz -2 /projects/lowryc/hex_acid_working/trimmed/1h_m2_u_rp.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/1h_m2_u_.bam
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m3_t.txt -x /projects/lowryc/hex_acid_working/genome/GRCm38 -1 /projects/lowryc/hex_acid_working/trimmed/1h_m3_t_fp.fq.gz -2 /projects/lowryc/hex_acid_working/trimmed/1h_m3_t_rp.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/1h_m3_t_.bam
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/1h_m3_u.txt -x /projects/lowryc/hex_acid_working/genome/GRCm38 -1 /projects/lowryc/hex_acid_working/trimmed/1h_m3_u_fp.fq.gz -2 /projects/lowryc/hex_acid_working/trimmed/1h_m3_u_rp.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/1h_m3_u_.bam

# Run Hisat2 on each file (6h)
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m1_t.txt -x /projects/lowryc/hex_acid_working/genome/GRCm38 -1 /projects/lowryc/hex_acid_working/trimmed/6h_m1_t_fp.fq.gz -2 /projects/lowryc/hex_acid_working/trimmed/6h_m1_t_rp.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/6h_m1_t_.bam
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m1_u.txt -x /projects/lowryc/hex_acid_working/genome/GRCm38 -1 /projects/lowryc/hex_acid_working/trimmed/6h_m1_u_fp.fq.gz -2 /projects/lowryc/hex_acid_working/trimmed/6h_m1_u_rp.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/6h_m1_u_.bam
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m2_t.txt -x /projects/lowryc/hex_acid_working/genome/GRCm38 -1 /projects/lowryc/hex_acid_working/trimmed/6h_m2_t_fp.fq.gz -2 /projects/lowryc/hex_acid_working/trimmed/6h_m2_t_rp.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/6h_m2_t_.bam
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m2_u.txt -x /projects/lowryc/hex_acid_working/genome/GRCm38 -1 /projects/lowryc/hex_acid_working/trimmed/6h_m2_u_fp.fq.gz -2 /projects/lowryc/hex_acid_working/trimmed/6h_m2_u_rp.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/6h_m2_u_.bam
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m3_t.txt -x /projects/lowryc/hex_acid_working/genome/GRCm38 -1 /projects/lowryc/hex_acid_working/trimmed/6h_m3_t_fp.fq.gz -2 /projects/lowryc/hex_acid_working/trimmed/6h_m3_t_rp.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/6h_m3_t_.bam
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file /scratch/summit/$USER/hex_acid/out/6h_m3_u.txt -x /projects/lowryc/hex_acid_working/genome/GRCm38 -1 /projects/lowryc/hex_acid_working/trimmed/6h_m3_u_fp.fq.gz -2 /projects/lowryc/hex_acid_working/trimmed/6h_m3_u_rp.fq.gz -S /scratch/summit/$USER/hex_acid/aligned/6h_m3_u_.bam
