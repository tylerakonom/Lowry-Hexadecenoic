cd /scratch/summit/tyak9569/hex_acid/aligned/sorted/
module purge
ml singularity/3.6.4
indirectory=/scratch/summit/tyak9569/hex_acid/aligned/sorted/

for pathandfilename in `ls ${indirectory}*.sort.bam`; do
name=`basename $pathandfilename .sort.bam`
echo "flagstat for ${name}" >> flagstatout.txt
singularity run --bind /scratch/summit /projects/lowryc/software/containers/rnaseq.sif samtools flagstat /scratch/summit/tyak9569/hex_acid/aligned/sorted/${name}.sort.bam >> flagstatout.txt
done