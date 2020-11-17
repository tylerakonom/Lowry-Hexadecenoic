module purge
ml singularity/3.6.4
indirectory=/scratch/summit/tyak9569/hex_acid/aligned/sorted/

for pathandfilename in `ls ${indirectory}*.sort.bam`; do
name=`basename $pathandfilename .sort.bam`
singularity run --bind /scratch/summit /projects/lowryc/software/containers/rnaseq.sif samtools flagstat /scratch/summit/tyak9569/hex_acid/aligned/sorted/${name}.sort.bam -O tsv
done