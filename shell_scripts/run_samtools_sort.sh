indirectory=/scratch/summit/tyak9569/hex_acid/aligned/merged/

for pathandfilename in `ls ${indirectory}*.bam`; do
name=`basename $pathandfilename .bam`
echo $pathandfilename
echo $name
done