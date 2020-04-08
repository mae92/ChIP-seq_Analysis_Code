#!/bin/bash
# see http://core.sam.pitt.edu/node/5678
#SBATCH -N 1
#SBATCH -t 3-00:00:00   # 3 days
#SBATCH --c 8 # Request 8 cores.
#SBATCH --mem=128g
#SBATCH --job-name=ChIPseq

module load deeptools/3.3.0

#set working directory path
dir=/bgfs/karndt/mae_chipseq_re_analysis_093019

mkdir "$dir"/analysis_decile

#set working directory
cd "$dir"/analysis_decile

cp /bgfs/karndt/Annotations/BED_files/plus1nuc_CDS_CPS.sorted.bed plus1nuc_CDS_CPS.sorted.bed
cp /bgfs/karndt/Annotations/BED_files/plus1nuc_CDS_CPS_plus_500bp_ds.sorted.bed plus1nuc_CDS_CPS_plus_500bp_ds.sorted.bed

file_length=`wc -l plus1nuc_CDS_CPS.sorted.bed  | awk '{print $1}'`
heatmap_height=`expr "$file_length" / 100`


computeMatrix scale-regions \
-S "$dir"/analysis/WT_Rpb3.bw \
-R plus1nuc_CDS_CPS.sorted.bed \
--binSize 25 \
--missingDataAsZero \
--averageTypeBins "mean" \
--numberOfProcessors "max" \
-out plus1nuc_CDS_CPS_Rpb3_Only_WT_matrix_10_clusters.gz


plotHeatmap -m plus1nuc_CDS_CPS_Rpb3_Only_WT_matrix_10_clusters.gz \
-out plus1nuc_CDS_CPS_Rpb3_Only_WT_matrix_10_clusters.png \
--dpi 300 \
--sortUsing "mean" \
--missingDataColor 1 \
--sortRegions "descend" \
--colorMap "Greys" \
--zMin 0 \
--zMax 15 \
--whatToShow 'plot, heatmap and colorbar' \
--heatmapHeight "$heatmap_height" \
--outFileSortedRegions plus1nuc_CDS_CPS_sorted_decending.bed \
--heatmapWidth 10



number_per_decile=`expr "$file_length" / 10`

grep "^#" plus1nuc_CDS_CPS_sorted_decending.bed > header.txt

grep -v "^#" plus1nuc_CDS_CPS_sorted_decending.bed > body.txt


rm decile_*.bed


head -n "$number_per_decile" body.txt \
| awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10 "\t" $11 "\t" $12 "\t" "cluster_0"}' > decile_0.bed

head -n `expr "$number_per_decile" \* 2` body.txt \
| tail -n "$number_per_decile" \
| awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10 "\t" $11 "\t" $12 "\t" "cluster_1"}' > decile_1.bed

head -n `expr "$number_per_decile" \* 3` body.txt \
| tail -n "$number_per_decile" \
| awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10 "\t" $11 "\t" $12 "\t" "cluster_2"}' > decile_2.bed

head -n `expr "$number_per_decile" \* 4` body.txt \
| tail -n "$number_per_decile" \
| awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10 "\t" $11 "\t" $12 "\t" "cluster_3"}' > decile_3.bed

head -n `expr "$number_per_decile" \* 5` body.txt \
| tail -n "$number_per_decile" \
| awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10 "\t" $11 "\t" $12 "\t" "cluster_4"}' > decile_4.bed

head -n `expr "$number_per_decile" \* 6` body.txt \
| tail -n "$number_per_decile" \
| awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10 "\t" $11 "\t" $12 "\t" "cluster_5"}' > decile_5.bed

head -n `expr "$number_per_decile" \* 7` body.txt \
| tail -n "$number_per_decile" \
| awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10 "\t" $11 "\t" $12 "\t" "cluster_6"}' > decile_6.bed

head -n `expr "$number_per_decile" \* 8` body.txt \
| tail -n "$number_per_decile" \
| awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10 "\t" $11 "\t" $12 "\t" "cluster_7"}' > decile_7.bed

head -n `expr "$number_per_decile" \* 9` body.txt \
| tail -n "$number_per_decile" \
| awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10 "\t" $11 "\t" $12 "\t" "cluster_8"}' > decile_8.bed

head -n `expr "$number_per_decile" \* 10` body.txt \
| tail -n "$number_per_decile" \
| awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10 "\t" $11 "\t" $12 "\t" "cluster_9"}' > decile_9.bed




cat header.txt decile_*.bed > plus1nuc_CDS_CPS_deciles_all.bed



computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 5000 \
-S "$dir"/analysis/WT_Rpb3.bw \
-R plus1nuc_CDS_CPS_deciles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--nanAfterEnd \
--numberOfProcessors "max" \
-out plus1nuc_CDS_CPS_deciles_all_matrix.gz

plotHeatmap -m plus1nuc_CDS_CPS_deciles_all_matrix.gz \
-out plus1nuc_CDS_CPS_deciles_all_Rpb3_Only_WT.png \
--dpi 300 \
--sortUsing region_length \
--missingDataColor 1 \
--sortRegions ascend \
--colorMap "Greys" \
--zMin 0 0 0 0 0 0 \
--zMax 15 15 15 15 15 15 \
--whatToShow 'plot, heatmap and colorbar' \
--heatmapHeight "$heatmap_height" \
--heatmapWidth 10




computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 5000 \
-S "$dir"/analysis/WT_Rpb3.bw \
-R plus1nuc_CDS_CPS_deciles_all.bed \
--binSize 25 \
--sortUsing region_length \
--averageTypeBins mean \
--nanAfterEnd \
--numberOfProcessors "max" \
-out plus1nuc_CDS_CPS_deciles_all_with_downstream_region_matrix.gz

plotHeatmap -m plus1nuc_CDS_CPS_deciles_all_with_downstream_region__matrix.gz \
-out plus1nuc_CDS_CPS_deciles_all_with_downstream_region.png \
--dpi 300 \
--sortUsing region_length \
--missingDataColor 1 \
--sortRegions ascend \
--colorMap "Greys" \
--zMin 0 0 0 0 0 0 \
--zMax 15 15 15 15 15 15 \
--whatToShow 'plot, heatmap and colorbar' \
--heatmapHeight "$heatmap_height" \
--heatmapWidth 10







computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 5000 \
-S "$dir"/analysis/Rpb3_mutant_log2diff.bw \
"$dir"/analysis/Spt5_mutant_log2diff.bw \
"$dir"/analysis/Spt6_mutant_log2diff.bw \
"$dir"/analysis/HSV_Paf1_mutant_log2diff.bw \
"$dir"/analysis/IgG_mutant_log2diff.bw \
"$dir"/analysis/Input_mutant_log2diff.bw \
-R plus1nuc_CDS_CPS_deciles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--nanAfterEnd \
--numberOfProcessors "max" \
-out plus1nuc_CDS_CPS_deciles_all_mutant_experiment_matrix.gz


computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 5000 \
-S "$dir"/analysis/Rpb3_depletion_log2diff.bw \
"$dir"/analysis/Spt5_depletion_log2diff.bw \
"$dir"/analysis/Spt6_depletion_log2diff.bw \
"$dir"/analysis/HSV_Paf1_depletion_log2diff.bw \
"$dir"/analysis/IgG_depletion_log2diff.bw \
"$dir"/analysis/Input_depletion_log2diff.bw \
-R plus1nuc_CDS_CPS_deciles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--nanAfterEnd \
--numberOfProcessors "max" \
-out plus1nuc_CDS_CPS_deciles_all_depletion_experiment_matrix.gz


computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 5000 \
-S "$dir"/analysis/WT_Rpb3.bw \
"$dir"/analysis/WT_Spt5.bw \
"$dir"/analysis/WT_Spt6.bw \
"$dir"/analysis/WT_HSV_Paf1.bw \
"$dir"/analysis/WT_IgG.bw \
"$dir"/analysis/WT_Input.bw \
-R plus1nuc_CDS_CPS_deciles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--nanAfterEnd \
--numberOfProcessors "max" \
-out plus1nuc_CDS_CPS_deciles_all_WT_matrix.gz


computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 5000 \
-S "$dir"/analysis/Spt6_AID_DMSO_Rpb3.bw \
"$dir"/analysis/Spt6_AID_DMSO_Spt5.bw \
"$dir"/analysis/Spt6_AID_DMSO_Spt6.bw \
"$dir"/analysis/Spt6_AID_DMSO_HSV_Paf1.bw \
"$dir"/analysis/Spt6_AID_DMSO_IgG.bw \
"$dir"/analysis/Spt6_AID_DMSO_Input.bw \
-R plus1nuc_CDS_CPS_deciles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--nanAfterEnd \
--numberOfProcessors "max" \
-out plus1nuc_CDS_CPS_deciles_all_DMSO_matrix.gz



plotHeatmap -m plus1nuc_CDS_CPS_deciles_all_mutant_experiment_matrix.gz \
-out plus1nuc_CDS_CPS_deciles_all_mutant_experiment.png \
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


plotHeatmap -m plus1nuc_CDS_CPS_deciles_all_depletion_experiment_matrix.gz \
-out plus1nuc_CDS_CPS_deciles_all_depletion_experiment.png \
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


plotHeatmap -m plus1nuc_CDS_CPS_deciles_all_WT_matrix.gz \
-out plus1nuc_CDS_CPS_deciles_all_WT.png \
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


plotHeatmap -m plus1nuc_CDS_CPS_deciles_all_DMSO_matrix.gz \
-out plus1nuc_CDS_CPS_deciles_all_DMSO.png \
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









computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 5000 \
-S "$dir"/analysis/Rpb3_mutant_log2diff.bw \
"$dir"/analysis/Spt5_mutant_log2diff.bw \
"$dir"/analysis/Spt6_mutant_log2diff.bw \
"$dir"/analysis/HSV_Paf1_mutant_log2diff.bw \
"$dir"/analysis/IgG_mutant_log2diff.bw \
"$dir"/analysis/Input_mutant_log2diff.bw \
-R plus1nuc_CDS_CPS_deciles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out plus1nuc_CDS_CPS_deciles_all_with_downstream_region_mutant_experiment_matrix.gz


computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 5000 \
-S "$dir"/analysis/Rpb3_depletion_log2diff.bw \
"$dir"/analysis/Spt5_depletion_log2diff.bw \
"$dir"/analysis/Spt6_depletion_log2diff.bw \
"$dir"/analysis/HSV_Paf1_depletion_log2diff.bw \
"$dir"/analysis/IgG_depletion_log2diff.bw \
"$dir"/analysis/Input_depletion_log2diff.bw \
-R plus1nuc_CDS_CPS_deciles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out plus1nuc_CDS_CPS_deciles_all_with_downstream_region_depletion_experiment_matrix.gz


computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 5000 \
-S "$dir"/analysis/WT_Rpb3.bw \
"$dir"/analysis/WT_Spt5.bw \
"$dir"/analysis/WT_Spt6.bw \
"$dir"/analysis/WT_HSV_Paf1.bw \
"$dir"/analysis/WT_IgG.bw \
"$dir"/analysis/WT_Input.bw \
-R plus1nuc_CDS_CPS_deciles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out plus1nuc_CDS_CPS_deciles_all_with_downstream_region_WT_matrix.gz


computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 5000 \
-S "$dir"/analysis/Spt6_AID_DMSO_Rpb3.bw \
"$dir"/analysis/Spt6_AID_DMSO_Spt5.bw \
"$dir"/analysis/Spt6_AID_DMSO_Spt6.bw \
"$dir"/analysis/Spt6_AID_DMSO_HSV_Paf1.bw \
"$dir"/analysis/Spt6_AID_DMSO_IgG.bw \
"$dir"/analysis/Spt6_AID_DMSO_Input.bw \
-R plus1nuc_CDS_CPS_deciles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out plus1nuc_CDS_CPS_deciles_all_with_downstream_region_DMSO_matrix.gz



plotHeatmap -m plus1nuc_CDS_CPS_deciles_all_with_downstream_region_mutant_experiment_matrix.gz \
-out plus1nuc_CDS_CPS_deciles_all_with_downstream_region_mutant_experiment.png \
--dpi 300 \
--sortUsing region_length \
--missingDataColor 1 \
--sortRegions ascend \
--colorMap 'seismic' 'seismic' 'seismic' 'seismic' 'seismic' 'seismic' \
--zMin -2 -2 -2 -2 -2 -2 \
--zMax 2 2 2 2 2 2 \
--whatToShow 'plot, heatmap and colorbar' \
--heatmapHeight "$heatmap_height" \
--heatmapWidth 10


plotHeatmap -m plus1nuc_CDS_CPS_deciles_all_with_downstream_region_depletion_experiment_matrix.gz \
-out plus1nuc_CDS_CPS_deciles_all_with_downstream_region_depletion_experiment.png \
--dpi 300 \
--sortUsing region_length \
--missingDataColor 1 \
--sortRegions ascend \
--colorMap 'seismic' 'seismic' 'seismic' 'seismic' 'seismic' 'seismic' \
--zMin -2 -2 -2 -2 -2 -2 \
--zMax 2 2 2 2 2 2 \
--whatToShow 'plot, heatmap and colorbar' \
--heatmapHeight "$heatmap_height" \
--heatmapWidth 10


plotHeatmap -m plus1nuc_CDS_CPS_deciles_all_with_downstream_region_WT_matrix.gz \
-out plus1nuc_CDS_CPS_deciles_all_with_downstream_region_WT.png \
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


plotHeatmap -m plus1nuc_CDS_CPS_deciles_all_with_downstream_region_DMSO_matrix.gz \
-out plus1nuc_CDS_CPS_deciles_all_with_downstream_region_DMSO.png \
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


Profiles

plotProfile -m plus1nuc_CDS_CPS_deciles_all_with_downstream_region_mutant_experiment_matrix.gz \
-out for_legend.png \
--dpi 300 \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 8 \
--yMax 30 \
--yMin 0 \
--legendLocation "upper-right" \
--plotFileFormat "png" \
--colors "#000000" "#001F33" "#003D66" "#005C99" "#007ACC" "#0099FF" "#33ADFF" "#66C2FF" "#99D6FF" "#CCEBFF"


plotProfile -m plus1nuc_CDS_CPS_deciles_all_with_downstream_region_mutant_experiment_matrix.gz \
-out grey_profiles_plus1nuc_CDS_CPS_deciles_all_with_downstream_region_mutant_experiment.png \
--dpi 300 \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 8 \
--yMax 1 \
--yMin -2 \
--legendLocation "none" \
--plotFileFormat "png" \
--colors "#000000" "#001F33" "#003D66" "#005C99" "#007ACC" "#0099FF" "#33ADFF" "#66C2FF" "#99D6FF" "#CCEBFF"


plotProfile -m plus1nuc_CDS_CPS_deciles_all_with_downstream_region_depletion_experiment_matrix.gz \
-out grey_profiles_plus1nuc_CDS_CPS_deciles_all_with_downstream_region_depletion_experiment.png \
--dpi 300 \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 8 \
--yMax 1 \
--yMin -2 \
--legendLocation "none" \
--plotFileFormat "png" \
--colors "#000000" "#001F33" "#003D66" "#005C99" "#007ACC" "#0099FF" "#33ADFF" "#66C2FF" "#99D6FF" "#CCEBFF"


plotProfile -m plus1nuc_CDS_CPS_deciles_all_with_downstream_region_WT_matrix.gz \
-out grey_profiles_plus1nuc_CDS_CPS_deciles_all_with_downstream_region_WT.png \
--dpi 300 \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 8 \
--yMax 30 \
--yMin 0 \
--legendLocation "none" \
--plotFileFormat "png" \
--colors "#000000" "#001F33" "#003D66" "#005C99" "#007ACC" "#0099FF" "#33ADFF" "#66C2FF" "#99D6FF" "#CCEBFF"


plotProfile -m plus1nuc_CDS_CPS_deciles_all_with_downstream_region_DMSO_matrix.gz \
-out grey_profiles_plus1nuc_CDS_CPS_deciles_all_with_downstream_region_DMSO.png \
--dpi 300 \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 8 \
--yMax 30 \
--yMin 0 \
--legendLocation "none" \
--plotFileFormat "png" \
--colors "#000000" "#001F33" "#003D66" "#005C99" "#007ACC" "#0099FF" "#33ADFF" "#66C2FF" "#99D6FF" "#CCEBFF"














