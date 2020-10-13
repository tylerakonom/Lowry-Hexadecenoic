#!/bin/bash
#SBATCH -p short
#SBATCH --job-name=trim_0010B3
#SBATCH --mail-type=END
#SBATCH --mail-user=dasm3869@colorado.edu
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --mem=20gb
#SBATCH --time=1:30:00
#SBATCH --output=/Users/dasm3869/trim/run1/out
#SBATCH --error=/Users/dasm3869/trim/run1/error


java -jar /opt/trimmomatic/0.36/trimmomatic-0.36.jar PE -threads 4  \
-trimlog /Users/dasm3869/trim/run1/log/0010B3.trimlog \
/Users/dasm3869/TRANSFER/run1/Demux/Lowry-392-1/0010B3_S10_R1_001.fastq.gz \
/Users/dasm3869/TRANSFER/run1/Demux/Lowry-392-1/0010B3_S10_R2_001.fastq.gz \
/Users/dasm3869/trim/run1/0010B3_fp.fq.gz \
/Users/dasm3869/trim/run1/0010B3_fup.fq.gz \
/Users/dasm3869/trim/run1/0010B3_rp.fq.gz \
/Users/dasm3869/trim/run1/0010B3_rup.fq.gz \
ILLUMINACLIP:/opt/trimmomatic/0.36/adapters/TruSeq3-PE-2.fa:2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:75



