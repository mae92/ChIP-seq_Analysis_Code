#!/bin/bash
# see http://core.sam.pitt.edu/node/5678
#SBATCH -N 1
#SBATCH -t 3-00:00:00   # 3 days
#SBATCH --c 8 # Request 8 cores.
#SBATCH --mem=2048g
#SBATCH --job-name=ChIPseq

module getdefault

#set working directory path
dir=/bgfs/karndt/mae_chipseq_re_analysis_093019


cd "$dir"
ls


#remove old directories
rm -rf counts
rm -rf bigwig


#make some directories
mkdir counts
mkdir bigwig





#Spike in Normalization
for bam_file in `ls kl_bam/*.sorted.bam | awk -F '[/._]' '{print $3 "_" $4}'`
do

echo "$bam_file"
echo kl_bam/"$bam_file".sorted.bam

#pulls count number from bam file and places into text file
bamtools count -in kl_bam/"$bam_file".sorted.bam \
> counts/"$bam_file"_count.txt
	
# This defines scaling factor
counts=`head counts/"$bam_file"_count.txt | awk -F ' ' '{print $1}'`
echo "counts="$counts
#icpm = inverse of counts/million
icpm=`awk "BEGIN {print (1/($counts/100000))}"`
echo "icpm="$icpm



#makes normalized bigwig with appropriate icpm value

echo "converting" "$bam_file"".sorted.bam into bigwig format"
		
bamCoverage --bam sc_bam/"$bam_file".sorted.bam \
--outFileName bigwig/"$bam_file"_spike_in_normalized.bw \
--outFileFormat bigwig \
--scaleFactor "$icpm" \
--binSize 1 \
--ignoreDuplicates \
--extendReads \
--numberOfProcessors "max"


done


exit
