indirectory=/projects/lowryc/hex_acid/raw_data/lane1/

for pathandfilename in `ls ${indirectory}*.fastq`; do
name=`basename $pathandfilename .fastq`
count= wc -l ${pathandfilename}
echo $name
echo $count
done