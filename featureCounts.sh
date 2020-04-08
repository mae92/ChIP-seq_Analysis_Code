#!/bin/bash
# see http://core.sam.pitt.edu/node/5678
#SBATCH -N 1
#SBATCH -t 3-00:00:00   # 3 days
#SBATCH --c 8 # Request 8 cores.
#SBATCH --mem=2048g
#SBATCH --job-name=ChIPseq


module getdefault

GTF=/bgfs/karndt/Annotations/featureCounts/combined.gtf

FEATURES=/bgfs/karndt/Annotations/featureCounts/features_list


mkdir /bgfs/karndt/mae_chipseq_re_analysis_093019/featureCounts



cd /bgfs/karndt/mae_chipseq_re_analysis_093019/sc_bam


for bam in `ls *.bam | sed 's/.bam//g' | sort -u`
do

	for feature in `cat "$FEATURES"`
	do
	
		featureCounts "$bam".bam -a "$GTF" -B -p -f -t "$feature" -s 1 -o /bgfs/karndt/mae_chipseq_re_analysis_093019/featureCounts/"$bam"_"$feature"_counts.txt
		
	done
	
done