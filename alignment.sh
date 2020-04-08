#!/bin/bash
# see http://core.sam.pitt.edu/node/5678
#SBATCH -N 1
#SBATCH -t 6-00:00:00   # 3 day
#SBATCH --c 32 # Request 32 cores.
#SBATCH --mem=2048g
#SBATCH --job-name=ChIPseq

module getdefault

#set index paths
Sc_index=/bgfs/karndt/Indexes/HISAT2_S_cerevisiae/genome_tran
Kl_index=/bgfs/karndt/Indexes/HISAT2_K_lactis/Klac

#set working directory path
dir=/bgfs/karndt/mae_chipseq_re_analysis_093019

cd "$dir"

#remove old directories
rm -rf sc_sam sc_bam sc_alignment_stats kl_sam kl_bam kl_alignment_stats

#make some directories
mkdir sc_sam
mkdir sc_bam
mkdir sc_alignment_stats

mkdir kl_sam
mkdir kl_bam
mkdir kl_alignment_stats

#map FASTQ files using for-loop

cd "$dir"/FASTQ

for file_name in `ls *_R1_001.fastq.gz`
do

fastq_file=`echo $file_name | awk -F '[._-]' '{print $1 "_" $2}'`
echo "Processing" "$fastq_file""_R1_001.fastq.gz" "and" "$fastq_file""_R1_001.fastq.gz"

echo "$fastq_file""_R1_001.fastq.gz"


#map to K.l.
hisat2 \
-p 8 \
-q \
-k 1 \
--no-unal \
--no-mixed \
--no-discordant \
-t \
-x "$Kl_index" \
-1 "$fastq_file"_R1_001.fastq.gz \
-2 "$fastq_file"_R2_001.fastq.gz \
--un-conc-gz "$fastq_file"_unmapped_kl_R%.fastq.gz \
-S "$dir"/kl_sam/"$fastq_file".sam 2> "$dir"/kl_alignment_stats/"$fastq_file"_sc.txt

samtools view -bS -q30 "$dir"/kl_sam/"$fastq_file".sam > \
"$dir"/kl_bam/"$fastq_file".bam
	
samtools sort -T "$dir"/kl_bam/"$fastq_file".sorted \
-o "$dir"/kl_bam/"$fastq_file".sorted.bam \
"$dir"/kl_bam/"$fastq_file".bam
	
samtools index "$dir"/kl_bam/"$fastq_file".sorted.bam

echo "$dir"/FASTQ/"$fastq_file"*.fastq Mapped

rm "$dir"/kl_sam/"$fastq_file".sam
rm "$dir"/kl_bam/"$fastq_file".bam


#map to S.c.
hisat2 \
-p 8 \
-q \
-k 1 \
--no-unal \
--no-mixed \
--no-discordant \
-t \
-x "$Sc_index" \
-1 "$fastq_file"_unmapped_kl_R1.fastq.gz \
-2 "$fastq_file"_unmapped_kl_R2.fastq.gz \
-S "$dir"/sc_sam/"$fastq_file".sam 2> "$dir"/sc_alignment_stats/"$fastq_file"_sc.txt

samtools view -bS -q30 "$dir"/sc_sam/"$fastq_file".sam > \
"$dir"/sc_bam/"$fastq_file".bam
	
samtools sort -T "$dir"/sc_bam/"$fastq_file".sorted \
-o "$dir"/sc_bam/"$fastq_file".sorted.bam \
"$dir"/sc_bam/"$fastq_file".bam
	
samtools index "$dir"/sc_bam/"$fastq_file".sorted.bam

echo "$dir"/FASTQ/"$fastq_file"*.fastq Mapped

rm "$dir"/sc_sam/"$fastq_file".sam
rm "$dir"/sc_bam/"$fastq_file".bam



done

exit



