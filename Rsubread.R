##Running Rsubread for counts:

library(Rsubread)

files=c(
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1006.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1007.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1008.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1009.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1010.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1016.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1017.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1018.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1019.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1020.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1106.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1107.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1108.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1109.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1110.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1116.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1117.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1118.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1119.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_1120.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2001.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2002.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2003.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2004.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2005.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2011.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2012.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2013.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2014.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2015.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2101.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2102.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2103.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2104.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2105.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2111.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2112.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2113.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2114.bam',
'/scratch/summit/tyak9569/dnFGFR/PrimaryAligned/aligned_primary_2115.bam')

## Point to GTF file:

gtf=("/scratch/summit/tyak9569/dnFGFR/ensembl/genome/Mus_musculus.GRCm38.98.gtf")

##Output the file:

OUT="/scratch/summit/tyak9569/dnFGFR/rsubOut/primary/"

senseunique=featureCounts(files,
isGTFAnnotationFile = TRUE,
annot.ext = gtf,
GTF.attrType = "gene_id",
allowMultiOverlap = FALSE,
nthreads = 18,
isPairedEnd=TRUE,
strandSpecific = 1)

write.table(x=data.frame(
senseunique$annotation[,c("GeneID","Length")],
senseunique$counts,stringsAsFactors=FALSE),
file=paste(OUT,"Rsubread_senseunique.txt"),
quote=FALSE,sep="\t",row.names=FALSE) 

antisenseunique=featureCounts(files,
isGTFAnnotationFile = TRUE,
annot.ext = gtf,
GTF.attrType = "gene_id",
allowMultiOverlap = TRUE,
isPairedEnd=FALSE,
nthreads = 18,
strandSpecific = 2)
 
write.table(x=data.frame(
antisenseunique$annotation[,c("GeneID","Length")],
antisenseunique$counts,stringsAsFactors=FALSE),
file=paste(OUT,"Rsubread_antisenseunique.txt"),
quote=FALSE,sep="\t",row.names=FALSE)
