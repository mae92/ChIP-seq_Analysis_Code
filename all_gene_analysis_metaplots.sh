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

rm -rf "$dir"/analysis_meta
mkdir "$dir"/analysis_meta

#set working directory
cd "$dir"/analysis_meta

cp /bgfs/karndt/Annotations/BED_files/plus1nuc_CDS_CPS.sorted.bed plus1nuc_CDS_CPS.sorted.bed
# cp /bgfs/karndt/Annotations/BED_files/plus1nuc_CDS_CPS_plus_500bp_ds.sorted.bed plus1nuc_CDS_CPS_plus_500bp_ds.sorted.bed

file_length=`wc -l plus1nuc_CDS_CPS.sorted.bed  | awk '{print $1}'`
heatmap_height=`expr "$file_length" / 100`


##DMSO vs IAA

# "$dir"/analysis/Spt6_AID_DMSO_Rpb3.bw \
# "$dir"/analysis/Spt6_AID_DMSO_Spt5.bw \
# "$dir"/analysis/Spt6_AID_DMSO_Spt6.bw \
# "$dir"/analysis/Spt6_AID_DMSO_HSV_Paf1.bw \
# "$dir"/analysis/Spt6_AID_DMSO_IgG.bw \
# "$dir"/analysis/Spt6_AID_DMSO_Input.bw \
# 
# "$dir"/analysis/Spt6_AID_IAA_Rpb3.bw \
# "$dir"/analysis/Spt6_AID_IAA_Spt5.bw \
# "$dir"/analysis/Spt6_AID_IAA_Spt6.bw \
# "$dir"/analysis/Spt6_AID_IAA_HSV_Paf1.bw \
# "$dir"/analysis/Spt6_AID_IAA_IgG.bw \
# "$dir"/analysis/Spt6_AID_IAA_Input.bw \


#Rpb3

computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 1000 \
-S "$dir"/analysis/Spt6_AID_DMSO_Rpb3.bw \
"$dir"/analysis/Spt6_AID_IAA_Rpb3.bw \
"$dir"/analysis/Spt6_AID_DMSO_IgG.bw \
-R "$dir"/analysis_quartile/plus1nuc_CDS_CPS_quartiles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out Rpb3_plus1nuc_CDS_CPS_IAA_vs_DMSO_TSS_matrix.gz

computeMatrix reference-point \
--referencePoint "TES" -b 1000 -a 500 \
-S "$dir"/analysis/Spt6_AID_DMSO_Rpb3.bw \
"$dir"/analysis/Spt6_AID_IAA_Rpb3.bw \
"$dir"/analysis/Spt6_AID_DMSO_IgG.bw \
-R "$dir"/analysis_quartile/plus1nuc_CDS_CPS_quartiles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out Rpb3_plus1nuc_CDS_CPS_IAA_vs_DMSO_TES_matrix.gz


plotProfile -m Rpb3_plus1nuc_CDS_CPS_IAA_vs_DMSO_TSS_matrix.gz \
-out Rpb3_plus1nuc_CDS_CPS_IAA_vs_DMSO_TSS_profile.png \
--dpi 300 \
--plotType=lines \
--perGroup \
--colors black blue grey \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 16 \
--yMax 20 \
--yMin 0 \
--plotFileFormat "png" 

plotProfile -m Rpb3_plus1nuc_CDS_CPS_IAA_vs_DMSO_TES_matrix.gz \
-out Rpb3_plus1nuc_CDS_CPS_IAA_vs_DMSO_TES_profile.png \
--dpi 300 \
--plotType=lines \
--perGroup \
--colors black blue grey \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 16 \
--yMax 20 \
--yMin 0 \
--plotFileFormat "png" 





#Spt5

computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 1000 \
-S "$dir"/analysis/Spt6_AID_DMSO_Spt5.bw \
"$dir"/analysis/Spt6_AID_IAA_Spt5.bw \
"$dir"/analysis/Spt6_AID_DMSO_IgG.bw \
-R "$dir"/analysis_quartile/plus1nuc_CDS_CPS_quartiles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out Spt5_plus1nuc_CDS_CPS_IAA_vs_DMSO_TSS_matrix.gz

computeMatrix reference-point \
--referencePoint "TES" -b 1000 -a 500 \
-S "$dir"/analysis/Spt6_AID_DMSO_Spt5.bw \
"$dir"/analysis/Spt6_AID_IAA_Spt5.bw \
"$dir"/analysis/Spt6_AID_DMSO_IgG.bw \
-R "$dir"/analysis_quartile/plus1nuc_CDS_CPS_quartiles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out Spt5_plus1nuc_CDS_CPS_IAA_vs_DMSO_TES_matrix.gz


plotProfile -m Spt5_plus1nuc_CDS_CPS_IAA_vs_DMSO_TSS_matrix.gz \
-out Spt5_plus1nuc_CDS_CPS_IAA_vs_DMSO_TSS_profile.png \
--dpi 300 \
--plotType=lines \
--perGroup \
--colors black blue grey \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 16 \
--yMax 20 \
--yMin 0 \
--plotFileFormat "png" 

plotProfile -m Spt5_plus1nuc_CDS_CPS_IAA_vs_DMSO_TES_matrix.gz \
-out Spt5_plus1nuc_CDS_CPS_IAA_vs_DMSO_TES_profile.png \
--dpi 300 \
--plotType=lines \
--perGroup \
--colors black blue grey \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 16 \
--yMax 20 \
--yMin 0 \
--plotFileFormat "png" 





#Spt6

computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 1000 \
-S "$dir"/analysis/Spt6_AID_DMSO_Spt6.bw \
"$dir"/analysis/Spt6_AID_IAA_Spt6.bw \
"$dir"/analysis/Spt6_AID_DMSO_IgG.bw \
-R "$dir"/analysis_quartile/plus1nuc_CDS_CPS_quartiles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out Spt6_plus1nuc_CDS_CPS_IAA_vs_DMSO_TSS_matrix.gz

computeMatrix reference-point \
--referencePoint "TES" -b 1000 -a 500 \
-S "$dir"/analysis/Spt6_AID_DMSO_Spt6.bw \
"$dir"/analysis/Spt6_AID_IAA_Spt6.bw \
"$dir"/analysis/Spt6_AID_DMSO_IgG.bw \
-R "$dir"/analysis_quartile/plus1nuc_CDS_CPS_quartiles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out Spt6_plus1nuc_CDS_CPS_IAA_vs_DMSO_TES_matrix.gz


plotProfile -m Spt6_plus1nuc_CDS_CPS_IAA_vs_DMSO_TSS_matrix.gz \
-out Spt6_plus1nuc_CDS_CPS_IAA_vs_DMSO_TSS_profile.png \
--dpi 300 \
--plotType=lines \
--perGroup \
--colors black blue grey \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 16 \
--yMax 20 \
--yMin 0 \
--plotFileFormat "png" 

plotProfile -m Spt6_plus1nuc_CDS_CPS_IAA_vs_DMSO_TES_matrix.gz \
-out Spt6_plus1nuc_CDS_CPS_IAA_vs_DMSO_TES_profile.png \
--dpi 300 \
--plotType=lines \
--perGroup \
--colors black blue grey \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 16 \
--yMax 20 \
--yMin 0 \
--plotFileFormat "png" 





#HSV_Paf1

computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 1000 \
-S "$dir"/analysis/Spt6_AID_DMSO_HSV_Paf1.bw \
"$dir"/analysis/Spt6_AID_IAA_HSV_Paf1.bw \
"$dir"/analysis/Spt6_AID_DMSO_IgG.bw \
-R "$dir"/analysis_quartile/plus1nuc_CDS_CPS_quartiles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out HSV_Paf1_plus1nuc_CDS_CPS_IAA_vs_DMSO_TSS_matrix.gz

computeMatrix reference-point \
--referencePoint "TES" -b 1000 -a 500 \
-S "$dir"/analysis/Spt6_AID_DMSO_HSV_Paf1.bw \
"$dir"/analysis/Spt6_AID_IAA_HSV_Paf1.bw \
"$dir"/analysis/Spt6_AID_DMSO_IgG.bw \
-R "$dir"/analysis_quartile/plus1nuc_CDS_CPS_quartiles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out HSV_Paf1_plus1nuc_CDS_CPS_IAA_vs_DMSO_TES_matrix.gz


plotProfile -m HSV_Paf1_plus1nuc_CDS_CPS_IAA_vs_DMSO_TSS_matrix.gz \
-out HSV_Paf1_plus1nuc_CDS_CPS_IAA_vs_DMSO_TSS_profile.png \
--dpi 300 \
--plotType=lines \
--perGroup \
--colors black blue grey \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 16 \
--yMax 20 \
--yMin 0 \
--plotFileFormat "png" 

plotProfile -m HSV_Paf1_plus1nuc_CDS_CPS_IAA_vs_DMSO_TES_matrix.gz \
-out HSV_Paf1_plus1nuc_CDS_CPS_IAA_vs_DMSO_TES_profile.png \
--dpi 300 \
--plotType=lines \
--perGroup \
--colors black blue grey \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 16 \
--yMax 20 \
--yMin 0 \
--plotFileFormat "png" 






##spt6-50 vs WT

# "$dir"/analysis/WT_Rpb3.bw \
# "$dir"/analysis/WT_Spt5.bw \
# "$dir"/analysis/WT_Spt6.bw \
# "$dir"/analysis/WT_HSV_Paf1.bw \
# "$dir"/analysis/WT_IgG.bw \
# "$dir"/analysis/WT_Input.bw \
# 
# "$dir"/analysis/spt6_50_Rpb3.bw \
# "$dir"/analysis/spt6_50_Spt5.bw \
# "$dir"/analysis/spt6_50_Spt6.bw \
# "$dir"/analysis/spt6_50_HSV_Paf1.bw \
# "$dir"/analysis/spt6_50_IgG.bw \
# "$dir"/analysis/spt6_50_Input.bw \

#Rpb3

computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 1000 \
-S "$dir"/analysis/WT_Rpb3.bw \
"$dir"/analysis/spt6_50_Rpb3.bw \
"$dir"/analysis/WT_IgG.bw \
-R "$dir"/analysis_quartile/plus1nuc_CDS_CPS_quartiles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out Rpb3_plus1nuc_CDS_CPS_spt6_50_vs_WT_TSS_matrix.gz

computeMatrix reference-point \
--referencePoint "TES" -b 1000 -a 500 \
-S "$dir"/analysis/WT_Rpb3.bw \
"$dir"/analysis/spt6_50_Rpb3.bw \
"$dir"/analysis/WT_IgG.bw \
-R "$dir"/analysis_quartile/plus1nuc_CDS_CPS_quartiles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out Rpb3_plus1nuc_CDS_CPS_spt6_50_vs_WT_TES_matrix.gz


plotProfile -m Rpb3_plus1nuc_CDS_CPS_spt6_50_vs_WT_TSS_matrix.gz \
-out Rpb3_plus1nuc_CDS_CPS_spt6_50_vs_WT_TSS_profile.png \
--dpi 300 \
--plotType=lines \
--perGroup \
--colors black blue grey \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 16 \
--yMax 30 \
--yMin 0 \
--plotFileFormat "png" 

plotProfile -m Rpb3_plus1nuc_CDS_CPS_spt6_50_vs_WT_TES_matrix.gz \
-out Rpb3_plus1nuc_CDS_CPS_spt6_50_vs_WT_TES_profile.png \
--dpi 300 \
--plotType=lines \
--perGroup \
--colors black blue grey \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 16 \
--yMax 30 \
--yMin 0 \
--plotFileFormat "png" 




#Spt5

computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 1000 \
-S "$dir"/analysis/WT_Spt5.bw \
"$dir"/analysis/spt6_50_Spt5.bw \
"$dir"/analysis/WT_IgG.bw \
-R "$dir"/analysis_quartile/plus1nuc_CDS_CPS_quartiles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out Spt5_plus1nuc_CDS_CPS_spt6_50_vs_WT_TSS_matrix.gz

computeMatrix reference-point \
--referencePoint "TES" -b 1000 -a 500 \
-S "$dir"/analysis/WT_Spt5.bw \
"$dir"/analysis/spt6_50_Spt5.bw \
"$dir"/analysis/WT_IgG.bw \
-R "$dir"/analysis_quartile/plus1nuc_CDS_CPS_quartiles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out Spt5_plus1nuc_CDS_CPS_spt6_50_vs_WT_TES_matrix.gz


plotProfile -m Spt5_plus1nuc_CDS_CPS_spt6_50_vs_WT_TSS_matrix.gz \
-out Spt5_plus1nuc_CDS_CPS_spt6_50_vs_WT_TSS_profile.png \
--dpi 300 \
--plotType=lines \
--perGroup \
--colors black blue grey \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 16 \
--yMax 30 \
--yMin 0 \
--plotFileFormat "png" 

plotProfile -m Spt5_plus1nuc_CDS_CPS_spt6_50_vs_WT_TES_matrix.gz \
-out Spt5_plus1nuc_CDS_CPS_spt6_50_vs_WT_TES_profile.png \
--dpi 300 \
--plotType=lines \
--perGroup \
--colors black blue grey \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 16 \
--yMax 30 \
--yMin 0 \
--plotFileFormat "png" 




#Spt6

computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 1000 \
-S "$dir"/analysis/WT_Spt6.bw \
"$dir"/analysis/spt6_50_Spt6.bw \
"$dir"/analysis/WT_IgG.bw \
-R "$dir"/analysis_quartile/plus1nuc_CDS_CPS_quartiles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out Spt6_plus1nuc_CDS_CPS_spt6_50_vs_WT_TSS_matrix.gz

computeMatrix reference-point \
--referencePoint "TES" -b 1000 -a 500 \
-S "$dir"/analysis/WT_Spt6.bw \
"$dir"/analysis/spt6_50_Spt6.bw \
"$dir"/analysis/WT_IgG.bw \
-R "$dir"/analysis_quartile/plus1nuc_CDS_CPS_quartiles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out Spt6_plus1nuc_CDS_CPS_spt6_50_vs_WT_TES_matrix.gz


plotProfile -m Spt6_plus1nuc_CDS_CPS_spt6_50_vs_WT_TSS_matrix.gz \
-out Spt6_plus1nuc_CDS_CPS_spt6_50_vs_WT_TSS_profile.png \
--dpi 300 \
--plotType=lines \
--perGroup \
--colors black blue grey \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 16 \
--yMax 30 \
--yMin 0 \
--plotFileFormat "png" 

plotProfile -m Spt6_plus1nuc_CDS_CPS_spt6_50_vs_WT_TES_matrix.gz \
-out Spt6_plus1nuc_CDS_CPS_spt6_50_vs_WT_TES_profile.png \
--dpi 300 \
--plotType=lines \
--perGroup \
--colors black blue grey \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 16 \
--yMax 30 \
--yMin 0 \
--plotFileFormat "png" 




#HSV_Paf1

computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 1000 \
-S "$dir"/analysis/WT_HSV_Paf1.bw \
"$dir"/analysis/spt6_50_HSV_Paf1.bw \
"$dir"/analysis/WT_IgG.bw \
-R "$dir"/analysis_quartile/plus1nuc_CDS_CPS_quartiles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out HSV_Paf1_plus1nuc_CDS_CPS_spt6_50_vs_WT_TSS_matrix.gz

computeMatrix reference-point \
--referencePoint "TES" -b 1000 -a 500 \
-S "$dir"/analysis/WT_HSV_Paf1.bw \
"$dir"/analysis/spt6_50_HSV_Paf1.bw \
"$dir"/analysis/WT_IgG.bw \
-R "$dir"/analysis_quartile/plus1nuc_CDS_CPS_quartiles_all.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--numberOfProcessors "max" \
-out HSV_Paf1_plus1nuc_CDS_CPS_spt6_50_vs_WT_TES_matrix.gz


plotProfile -m HSV_Paf1_plus1nuc_CDS_CPS_spt6_50_vs_WT_TSS_matrix.gz \
-out HSV_Paf1_plus1nuc_CDS_CPS_spt6_50_vs_WT_TSS_profile.png \
--dpi 300 \
--plotType=lines \
--perGroup \
--colors black blue grey \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 16 \
--yMax 30 \
--yMin 0 \
--plotFileFormat "png" 

plotProfile -m HSV_Paf1_plus1nuc_CDS_CPS_spt6_50_vs_WT_TES_matrix.gz \
-out HSV_Paf1_plus1nuc_CDS_CPS_spt6_50_vs_WT_TES_profile.png \
--dpi 300 \
--plotType=lines \
--perGroup \
--colors black blue grey \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 16 \
--yMax 30 \
--yMin 0 \
--plotFileFormat "png" 
















