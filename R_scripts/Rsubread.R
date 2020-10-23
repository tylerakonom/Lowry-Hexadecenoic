## Running Rsubread for counts:

library(Rsubread)

files=c(
'C://GitHub//Lowry-Hexadecenoic//reads//sorted//1h_m1_t.sort.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//sorted//1h_m1_u.sort.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//sorted//1h_m2_t.sort.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//sorted//1h_m2_u.sort.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//sorted//1h_m3_t.sort.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//sorted//1h_m3_u.sort.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//sorted//6h_m1_t.sort.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//sorted//6h_m1_u.sort.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//sorted//6h_m2_t.sort.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//sorted//6h_m2_u.sort.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//sorted//6h_m3_t.sort.bam',
'C://GitHub//Lowry-Hexadecenoic//reads//sorted//6h_m3_u.sort.bam')

## Point to GTF file:

gtf=("C://GitHub//Lowry-Hexadecenoic//reads//Mus_musculus.GRCm38.101.gtf")

## Output the file:

OUT="C://GitHub//Lowry-Hexadecenoic//outputs//Rsubread//"

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
file=paste(OUT,"Rsubread_sorted_senseunique.txt"),
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
file=paste(OUT,"Rsubread_sorted_antisenseunique.txt"),
quote=FALSE,sep="\t",row.names=FALSE)
