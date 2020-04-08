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

#set working directory
cd "$dir"/analysis

# cp /bgfs/karndt/Annotations/BED_files/plus1nuc_CDS_CPS.sorted.bed plus1nuc_CDS_CPS.sorted.bed
# cp /bgfs/karndt/Annotations/BED_files/plus1nuc_CDS_CPS_plus_500bp_ds.sorted.bed plus1nuc_CDS_CPS_plus_500bp_ds.sorted.bed
# cp /bgfs/karndt/Annotations/BED_files/convergent.sorted.bed convergent.sorted.bed
# cp /bgfs/karndt/Annotations/BED_files/divergent.sorted.bed divergent.sorted.bed
# cp /bgfs/karndt/Annotations/BED_files/tandem.sorted.bed tandem.sorted.bed
# cp /bgfs/karndt/Annotations/BED_files/mRNA.sorted.bed mRNA.sorted.bed
# cp /bgfs/karndt/Annotations/BED_files/CUT.sorted.bed CUT.sorted.bed
# cp /bgfs/karndt/Annotations/BED_files/SUT.sorted.bed SUT.sorted.bed
# cp /bgfs/karndt/Annotations/BED_files/XUT.sorted.bed XUT.sorted.bed
# cp /bgfs/karndt/Annotations/BED_files/NUT.sorted.bed NUT.sorted.bed
# cp /bgfs/karndt/Annotations/BED_files/SRAT.sorted.bed SRAT.sorted.bed
# cp /bgfs/karndt/Annotations/BED_files/snoRNA.sorted.bed snoRNA.sorted.bed
# 
# 
# 
# #compute matrices
# 
# 
# for ano_file in `ls *.sorted.bed`; do
# 	name=`echo "$ano_file" | awk -F "." '{print $1}'`
# 
# computeMatrix reference-point \
# --referencePoint "TSS" -b 500 -a 5000 \
# -S Rpb3_mutant_log2diff.bw \
# Spt5_mutant_log2diff.bw \
# Spt6_mutant_log2diff.bw \
# HSV_Paf1_mutant_log2diff.bw \
# IgG_mutant_log2diff.bw \
# Input_mutant_log2diff.bw \
# -R "$name".sorted.bed \
# --binSize 25 \
# --missingDataAsZero \
# --sortUsing region_length \
# --averageTypeBins mean \
# --nanAfterEnd \
# --numberOfProcessors "max" \
# -out "$name"_mutant_experiment_matrix.gz
# 
# 
# computeMatrix reference-point \
# --referencePoint "TSS" -b 500 -a 5000 \
# -S Rpb3_depletion_log2diff.bw \
# Spt5_depletion_log2diff.bw \
# Spt6_depletion_log2diff.bw \
# HSV_Paf1_depletion_log2diff.bw \
# IgG_depletion_log2diff.bw \
# Input_depletion_log2diff.bw \
# -R "$name".sorted.bed \
# --binSize 25 \
# --missingDataAsZero \
# --sortUsing region_length \
# --averageTypeBins mean \
# --nanAfterEnd \
# --numberOfProcessors "max" \
# -out "$name"_depletion_experiment_matrix.gz
# 
# 
# computeMatrix reference-point \
# --referencePoint "TSS" -b 500 -a 5000 \
# -S WT_Rpb3.bw \
# WT_Spt5.bw \
# WT_Spt6.bw \
# WT_HSV_Paf1.bw \
# WT_IgG.bw \
# WT_Input.bw \
# -R "$name".sorted.bed \
# --binSize 25 \
# --missingDataAsZero \
# --sortUsing region_length \
# --averageTypeBins mean \
# --nanAfterEnd \
# --numberOfProcessors "max" \
# -out "$name"_WT_matrix.gz
# 
# 
# computeMatrix reference-point \
# --referencePoint "TSS" -b 500 -a 5000 \
# -S Spt6_AID_DMSO_Rpb3.bw \
# Spt6_AID_DMSO_Spt5.bw \
# Spt6_AID_DMSO_Spt6.bw \
# Spt6_AID_DMSO_HSV_Paf1.bw \
# Spt6_AID_DMSO_IgG.bw \
# Spt6_AID_DMSO_Input.bw \
# -R "$name".sorted.bed \
# --binSize 25 \
# --missingDataAsZero \
# --sortUsing region_length \
# --averageTypeBins mean \
# --nanAfterEnd \
# --numberOfProcessors "max" \
# -out "$name"_DMSO_matrix.gz
# 
# 
# done




for ano_file in `ls *.sorted.bed`; do
	name=`echo "$ano_file" | awk -F "." '{print $1}'`
	file_length=`wc -l "$ano_file" | awk '{print $1}'`
	heatmap_height=`expr "$file_length" / 100`
	
plotHeatmap -m "$name"_mutant_experiment_matrix.gz \
-out "$name"_mutant_experiment.png \
--dpi 300 \
--sortUsing region_length \
--missingDataColor 1 \
--sortRegions ascend \
--colorMap 'seismic' 'seismic' 'seismic' 'seismic' 'seismic' 'seismic' \
--zMin -3 -3 -3 -3 -3 -3 \
--zMax 3 3 3 3 3 3 \
--whatToShow 'plot, heatmap and colorbar' \
--heatmapHeight "$heatmap_height" \
--heatmapWidth 10


plotHeatmap -m "$name"_depletion_experiment_matrix.gz \
-out "$name"_depletion_experiment.png \
--dpi 300 \
--sortUsing region_length \
--missingDataColor 1 \
--sortRegions ascend \
--colorMap 'seismic' 'seismic' 'seismic' 'seismic' 'seismic' 'seismic' \
--zMin -3 -3 -3 -3 -3 -3 \
--zMax 3 3 3 3 3 3 \
--whatToShow 'plot, heatmap and colorbar' \
--heatmapHeight "$heatmap_height" \
--heatmapWidth 10


plotHeatmap -m "$name"_WT_matrix.gz \
-out "$name"_WT.png \
--dpi 300 \
--sortUsing region_length \
--missingDataColor 1 \
--sortRegions ascend \
--colorMap 'Greys' 'Greys' 'Greys' 'Greys' 'Greys' 'Greys' \
--zMin 0 0 0 0 0 0 \
--zMax 15 15 15 15 15 15 \
--whatToShow 'plot, heatmap and colorbar' \
--heatmapHeight "$heatmap_height" \
--heatmapWidth 10


plotHeatmap -m "$name"_DMSO_matrix.gz \
-out "$name"_DMSO.png \
--dpi 300 \
--sortUsing region_length \
--missingDataColor 1 \
--sortRegions ascend \
--colorMap 'Greys' 'Greys' 'Greys' 'Greys' 'Greys' 'Greys' \
--zMin 0 0 0 0 0 0 \
--zMax 15 15 15 15 15 15 \
--whatToShow 'plot, heatmap and colorbar' \
--heatmapHeight "$heatmap_height" \
--heatmapWidth 10


done








