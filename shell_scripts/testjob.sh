#!/bin/bash

# Written by: tyak9569
# Date: 20200828
# Purpose: This script submits a job on Summit

#SBATCH --partition=shas     # Summit partition
#SBATCH --qos=normal                 # Summit qos
#SBATCH --time=000:30:00           # Max wall time
#SBATCH --ntasks=24           # Number of tasks per job
#SBATCH --nodes=1             # Number of nodes per job
#SBATCH --job-name=test        # Job submission name
#SBATCH --output=test.%j.out   # Output file name with Job ID
#SBATCH --mail-type=END            # Email user when job finishes
#SBATCH --mail-user=tyak9569@colorado.edu # Email address of user


# purge all existing modules
module purge

# load any modules needed to run your program
module load singularity/3.3.0
export SINGULARITY_TMPDIR=/scratch/summit/$USER
export SINGULARITY_CACHEDIR=/scratch/summit/$USER

# Run your program
singularity exec /projects/lowryc/software/containers/rnaseq2.sif hisat2 --help

