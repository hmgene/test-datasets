fn(){
	samtools view -bhF0x4 -s 0.01 $1 chr22 > $2
	samtools index $2

};export -f fn
output=data/bams; mkdir -p $output
parallel fn {} $output/{/.}_chr22.bam ::: ../cnv-hichip/bigdata/rh/RH*.bam
