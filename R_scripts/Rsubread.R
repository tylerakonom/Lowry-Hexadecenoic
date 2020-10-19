## Running Rsubread for counts:

library(Rsubread)

files=c(
'C://GitHub//Lowry-Hexadecenoic//reads//1h_m1_t.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//1h_m1_u.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//1h_m2_t.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//1h_m2_u.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//1h_m3_t.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//1h_m3_u.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//6h_m1_t.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//6h_m1_u.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//6h_m2_t.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//6h_m2_u.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//6h_m3_t.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//6h_m3_u.bam')

## Point to GTF file:

gtf=("C://GitHub//Lowry-Hexadecenoic//reads//Mus_musculus.GRCm38.101.gtf")

## Output the file:

OUT="C://GitHub//Lowry-Hexadecenoic//"

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
