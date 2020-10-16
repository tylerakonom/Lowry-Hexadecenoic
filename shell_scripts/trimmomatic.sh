#!/bin/bash

# Written by: tyak9569
# Date: 20200828
# Purpose: trimmomatic script for tyak9569

#SBATCH --partition=shas     # Summit partition
#SBATCH --qos=normal                 # Summit qos
#SBATCH --time=006:00:00           # Max wall time in HHH:MM:SS
#SBATCH --ntasks=24           # Number of tasks per job
#SBATCH --nodes=1             # Number of nodes per job
#SBATCH --job-name=trimmomatic       # Job submission name
#SBATCH --output=/projects/tyak9569/lowry/hex_acid/scripts/out/trimmomatic.%j.out   # Output file name with Job ID
#SBATCH --mail-type=END            # Email user when job finishes
#SBATCH --mail-user=tyak9569@colorado.edu # Email address of user


# purge all existing modules
module purge

# load the module needed to run the software container, and set up temporary directories
module load singularity/3.3.0
export SINGULARITY_TMPDIR=/scratch/summit/$USER
export SINGULARITY_CACHEDIR=/scratch/summit/$USER

mkdir /scratch/summit/$USER/hex_acid
mkdir /scratch/summit/$USER/hex_acid/trimmedReads
mkdir /scratch/summit/$USER/hex_acid/trimmedReads/lane1
mkdir /scratch/summit/$USER/hex_acid/trimmedReads/lane2
mkdir /scratch/summit/$USER/hex_acid/trimmedReads/log

# Lane 1 6 hour reads:
singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/6h_m1_t_l1_.txt \
/projects/lowryc/hex_acid/raw_data/lane1/051915_R1_M1_16H.fastq \
/projects/lowryc/hex_acid/raw_data/lane1/051915_R2_M1_16H.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane1/6h_m1_t_l1_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/6h_m1_u_l1_.txt \
/projects/lowryc/hex_acid/raw_data/lane1/051915_R1_M1_DMEM.fastq \
/projects/lowryc/hex_acid/raw_data/lane1/051915_R2_M1_DMEM.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane1/6h_m1_u_l1_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/6h_m2_t_l1_.txt \
/projects/lowryc/hex_acid/raw_data/lane1/051915_R1_M2_16H.fastq \
/projects/lowryc/hex_acid/raw_data/lane1/051915_R2_M2_16H.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane1/6h_m2_t_l1_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/6h_m2_u_l1_.txt \
/projects/lowryc/hex_acid/raw_data/lane1/051915_R1_M2_DMEM.fastq \
/projects/lowryc/hex_acid/raw_data/lane1/051915_R2_M2_DMEM.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane1/6h_m2_u_l1_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/6h_m3_t_l1_.txt \
/projects/lowryc/hex_acid/raw_data/lane1/051915_R1_M3_16H.fastq \
/projects/lowryc/hex_acid/raw_data/lane1/051915_R2_M3_16H.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane1/6h_m3_t_l1_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/6h_m3_u_l1_.txt \
/projects/lowryc/hex_acid/raw_data/lane1/051915_R1_M3_DMEM.fastq \
/projects/lowryc/hex_acid/raw_data/lane1/051915_R2_M3_DMEM.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane1/6h_m3_u_l1_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

# Lane 1 1 hour reads:
singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/1h_m1_t_l1_.txt \
/projects/lowryc/hex_acid/raw_data/lane1/080515_R1_M1_16H.fastq \
/projects/lowryc/hex_acid/raw_data/lane1/080515_R2_M1_16H.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane1/1h_m1_t_l1_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/1h_m1_u_l1_.txt \
/projects/lowryc/hex_acid/raw_data/lane1/080515_R1_M1_DMEM.fastq \
/projects/lowryc/hex_acid/raw_data/lane1/080515_R2_M1_DMEM.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane1/1h_m1_u_l1_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/1h_m2_t_l1_.txt \
/projects/lowryc/hex_acid/raw_data/lane1/080515_R1_M2_16H.fastq \
/projects/lowryc/hex_acid/raw_data/lane1/080515_R2_M2_16H.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane1/1h_m2_t_l1_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/1h_m2_u_l1_.txt \
/projects/lowryc/hex_acid/raw_data/lane1/080515_R1_M2_DMEM.fastq \
/projects/lowryc/hex_acid/raw_data/lane1/080515_R2_M2_DMEM.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane1/1h_m2_u_l1_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/1h_m3_t_l1_.txt \
/projects/lowryc/hex_acid/raw_data/lane1/080515_R1_M3_16H.fastq \
/projects/lowryc/hex_acid/raw_data/lane1/080515_R2_M3_16H.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane1/1h_m3_t_l1_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/1h_m3_u_l1_.txt \
/projects/lowryc/hex_acid/raw_data/lane1/080515_R1_M3_DMEM.fastq \
/projects/lowryc/hex_acid/raw_data/lane1/080515_R2_M3_DMEM.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane1/1h_m3_u_l1_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

# Lane 2 6 hour reads:
singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/6h_m1_t_l2_.txt \
/projects/lowryc/hex_acid/raw_data/lane2/051915_R1_M1_16H.fastq \
/projects/lowryc/hex_acid/raw_data/lane2/051915_R2_M1_16H.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane2/6h_m1_t_l2_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/6h_m1_u_l2_.txt \
/projects/lowryc/hex_acid/raw_data/lane2/051915_R1_M1_DMEM.fastq \
/projects/lowryc/hex_acid/raw_data/lane2/051915_R2_M1_DMEM.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane2/6h_m1_u_l2_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/6h_m2_t_l2_.txt \
/projects/lowryc/hex_acid/raw_data/lane2/051915_R1_M2_16H.fastq \
/projects/lowryc/hex_acid/raw_data/lane2/051915_R2_M2_16H.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane2/6h_m2_t_l2_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/6h_m2_u_l2_.txt \
/projects/lowryc/hex_acid/raw_data/lane2/051915_R1_M2_DMEM.fastq \
/projects/lowryc/hex_acid/raw_data/lane2/051915_R2_M2_DMEM.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane2/6h_m2_u_l2_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/6h_m3_t_l2_.txt \
/projects/lowryc/hex_acid/raw_data/lane2/051915_R1_M3_16H.fastq \
/projects/lowryc/hex_acid/raw_data/lane2/051915_R2_M3_16H.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane2/6h_m3_t_l2_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/6h_m3_u_l2_.txt \
/projects/lowryc/hex_acid/raw_data/lane2/051915_R1_M3_DMEM.fastq \
/projects/lowryc/hex_acid/raw_data/lane2/051915_R2_M3_DMEM.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane2/6h_m3_u_l2_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

# Lane 2 1 hour reads:
singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/1h_m1_t_l2_.txt \
/projects/lowryc/hex_acid/raw_data/lane2/080515_R1_M1_16H.fastq \
/projects/lowryc/hex_acid/raw_data/lane2/080515_R2_M1_16H.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane2/1h_m1_t_l2_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/1h_m1_u_l2_.txt \
/projects/lowryc/hex_acid/raw_data/lane2/080515_R1_M1_DMEM.fastq \
/projects/lowryc/hex_acid/raw_data/lane2/080515_R2_M1_DMEM.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane2/1h_m1_u_l2_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/1h_m2_t_l2_.txt \
/projects/lowryc/hex_acid/raw_data/lane2/080515_R1_M2_16H.fastq \
/projects/lowryc/hex_acid/raw_data/lane2/080515_R2_M2_16H.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane2/1h_m2_t_l2_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/1h_m2_u_l2_.txt \
/projects/lowryc/hex_acid/raw_data/lane2/080515_R1_M2_DMEM.fastq \
/projects/lowryc/hex_acid/raw_data/lane2/080515_R2_M2_DMEM.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane2/1h_m2_u_l2_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/1h_m3_t_l2_.txt \
/projects/lowryc/hex_acid/raw_data/lane2/080515_R1_M3_16H.fastq \
/projects/lowryc/hex_acid/raw_data/lane2/080515_R2_M3_16H.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane2/1h_m3_t_l2_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75

singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE \
-threads 24 \
-trimlog /scratch/summit/$USER/hex_acid/trimmedReads/log/1h_m3_u_l2_.txt \
/projects/lowryc/hex_acid/raw_data/lane2/080515_R1_M3_DMEM.fastq \
/projects/lowryc/hex_acid/raw_data/lane2/080515_R2_M3_DMEM.fastq \
-baseout /scratch/summit/$USER/hex_acid/trimmedReads/lane2/1h_m3_u_l2_.fq.gz \
ILLUMINACLIP:/projects/lowryc/software/containers/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75