## Running Rsubread for counts:

# $ source /curc/sw/anaconda/default
# $ conda activate r361
# $ R

library(Rsubread)
TMP = "/scratch/summit/tyak9569/hex_acid/rsub/"

files=c(
'/scratch/summit/tyak9569/hex_acid/aligned/sorted/1h_m1_t.sort.bam',
'/scratch/summit/tyak9569/hex_acid/aligned/sorted/1h_m1_u.sort.bam',
'/scratch/summit/tyak9569/hex_acid/aligned/sorted/1h_m2_t.sort.bam',
'/scratch/summit/tyak9569/hex_acid/aligned/sorted/1h_m2_u.sort.bam',
'/scratch/summit/tyak9569/hex_acid/aligned/sorted/1h_m3_t.sort.bam',
'/scratch/summit/tyak9569/hex_acid/aligned/sorted/1h_m3_u.sort.bam',
'/scratch/summit/tyak9569/hex_acid/aligned/sorted/6h_m1_t.sort.bam',
'/scratch/summit/tyak9569/hex_acid/aligned/sorted/6h_m1_u.sort.bam',
'/scratch/summit/tyak9569/hex_acid/aligned/sorted/6h_m2_t.sort.bam',
'/scratch/summit/tyak9569/hex_acid/aligned/sorted/6h_m2_u.sort.bam',
'/scratch/summit/tyak9569/hex_acid/aligned/sorted/6h_m3_t.sort.bam',
'/scratch/summit/tyak9569/hex_acid/aligned/sorted/6h_m3_u.sort.bam')

# Point to gtf

gtf=("/projects/lowryc/genome/mouse/fixedgenes.gtf")

## Output the file:

OUT="/scratch/summit/tyak9569/hex_acid/rsub/"

senseunique=featureCounts(files,
isGTFAnnotationFile = TRUE,
annot.ext = gtf,
GTF.attrType = "gene_id",
allowMultiOverlap = FALSE,
nthreads = 36,
isPairedEnd=TRUE,
strandSpecific = 2)

write.table(x=data.frame(
senseunique$annotation[,c("GeneID","Length")],
senseunique$counts,stringsAsFactors=FALSE),
file=paste(OUT,"S2_Rsubread_sorted_senseunique.txt"),
quote=FALSE,sep="//t",row.names=FALSE) 




antisenseunique=featureCounts(files,
isGTFAnnotationFile = TRUE,
annot.ext = gtf,
GTF.attrType = "gene_id",
allowMultiOverlap = TRUE,
isPairedEnd=TRUE,
nthreads = 18,
strandSpecific = 1)
 
write.table(x=data.frame(
antisenseunique$annotation[,c("GeneID","Length")],
antisenseunique$counts,stringsAsFactors=FALSE),
file=paste(OUT,"Rsubread_sorted//_antisenseunique.txt"),
quote=FALSE,sep="//t",row.names=FALSE)
