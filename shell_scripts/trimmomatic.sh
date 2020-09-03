#!/bin/bash

# Written by: tyak9569
# Date: 20200828
# Purpose: trimmomatic script for tyak9569

#SBATCH --partition=shas     # Summit partition
#SBATCH --qos=normal                 # Summit qos
#SBATCH --time=002:00:00           # Max wall time in HHH:MM:SS
#SBATCH --ntasks=24           # Number of tasks per job
#SBATCH --nodes=1             # Number of nodes per job
#SBATCH --job-name=trimmomatic       # Job submission name
#SBATCH --output=trimmomatic.%j.out   # Output file name with Job ID
#SBATCH --mail-type=END            # Email user when job finishes
#SBATCH --mail-user=tyak9569@colorado.edu # Email address of user


# purge all existing modules
module purge

# load the module needed to run the software container, and set up temporary directories
module load singularity/3.3.0
export SINGULARITY_TMPDIR=/scratch/summit/$USER
export SINGULARITY_CACHEDIR=/scratch/summit/$USER

mkdir /scratch/summit/tyak9569/hex_acid
mkdir /scratch/summit/tyak9569/hex_acid/trimmedReads

# Run your program
FILES1=/projects/lowryc/hex_acid/*fp*.fq.gz  # Designates the forward, paired-end reads as "f"
for f in $FILES1
do
    f2=${f//fp/rp}}
    f_trimmed=${f//.fq.gz/_trimmed.f.fq.gz}
    f_trimmed=${f_trimmed//\/projects\/lowryc\/hex_acid/\/scratch\/summit\/tyak9569\/hex_acid\/trimmedReads}
    f2_trimmed=${f2//.fq.gz/_trimmed.r.fq.gz}
	f2_trimmed=${f2_trimmed//\/projects\/lowryc\/hex_acid/\/scratch\/summit\/tyak9569\/hex_acid\/trimmedReads}
	singularity run /projects/lowryc/software/containers/rnaseq.sif trimmomatic PE -threads 24 -trimlog trimmed.txt -basein $f_trimmed -baseout ILLUMINACLIP MINLEN:20
done