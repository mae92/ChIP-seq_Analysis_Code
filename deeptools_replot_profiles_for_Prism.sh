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

#Whole Gene

computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 5000 \
-S WT_IgG.bw \
WT_Rpb3.bw \
WT_Spt5.bw \
WT_Spt6.bw \
WT_HSV_Paf1.bw \
spt6_50_IgG.bw \
spt6_50_Rpb3.bw \
spt6_50_Spt5.bw \
spt6_50_Spt6.bw \
spt6_50_HSV_Paf1.bw \
-R /bgfs/karndt/Annotations/BED_files/plus1nuc_CDS_CPS.sorted.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--nanAfterEnd \
--numberOfProcessors "max" \
-out plus1nuc_CDS_CPS_Mutant_matrix.gz


plotProfile -m plus1nuc_CDS_CPS_Mutant_matrix.gz \
-out plus1nuc_CDS_CPS_Mutant.png \
--dpi 300 \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 8 \
--yMax 40 \
--yMin 0 \
--legendLocation "none" \
--plotFileFormat "png" \
--outFileNameData plus1nuc_CDS_CPS_Mutant.tsv \
--colors "#000000" "#001F33" "#003D66" "#005C99" "#007ACC" "#0099FF" "#33ADFF" "#66C2FF" "#99D6FF" "#CCEBFF"




computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 5000 \
-S Spt6_AID_DMSO_IgG.bw \
Spt6_AID_DMSO_Rpb3.bw \
Spt6_AID_DMSO_Spt5.bw \
Spt6_AID_DMSO_Spt6.bw \
Spt6_AID_DMSO_HSV_Paf1.bw \
Spt6_AID_IAA_IgG.bw \
Spt6_AID_IAA_Rpb3.bw \
Spt6_AID_IAA_Spt5.bw \
Spt6_AID_IAA_Spt6.bw \
Spt6_AID_IAA_HSV_Paf1.bw \
-R /bgfs/karndt/Annotations/BED_files/plus1nuc_CDS_CPS.sorted.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--nanAfterEnd \
--numberOfProcessors "max" \
-out plus1nuc_CDS_CPS_AID_matrix.gz


plotProfile -m plus1nuc_CDS_CPS_AID_matrix.gz \
-out plus1nuc_CDS_CPS_AID.png \
--dpi 300 \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 8 \
--yMax 40 \
--yMin 0 \
--legendLocation "none" \
--plotFileFormat "png" \
--outFileNameData plus1nuc_CDS_CPS_AID.tsv \
--colors "#000000" "#001F33" "#003D66" "#005C99" "#007ACC" "#0099FF" "#33ADFF" "#66C2FF" "#99D6FF" "#CCEBFF"


#Upstream ~half
computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 1000 \
-S WT_IgG.bw \
WT_Rpb3.bw \
WT_Spt5.bw \
WT_Spt6.bw \
WT_HSV_Paf1.bw \
spt6_50_IgG.bw \
spt6_50_Rpb3.bw \
spt6_50_Spt5.bw \
spt6_50_Spt6.bw \
spt6_50_HSV_Paf1.bw \
-R /bgfs/karndt/Annotations/BED_files/plus1nuc_CDS_CPS.sorted.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--nanAfterEnd \
--numberOfProcessors "max" \
-out plus1nuc_CDS_CPS_Mutant_matrix.gz


plotProfile -m plus1nuc_CDS_CPS_Mutant_matrix.gz \
-out plus1nuc_CDS_CPS_Mutant.png \
--dpi 300 \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 8 \
--yMax 40 \
--yMin 0 \
--legendLocation "none" \
--plotFileFormat "png" \
--outFileNameData plus1nuc_CDS_CPS_Mutant.tsv \
--colors "#000000" "#001F33" "#003D66" "#005C99" "#007ACC" "#0099FF" "#33ADFF" "#66C2FF" "#99D6FF" "#CCEBFF"




computeMatrix reference-point \
--referencePoint "TSS" -b 500 -a 1000 \
-S Spt6_AID_DMSO_IgG.bw \
Spt6_AID_DMSO_Rpb3.bw \
Spt6_AID_DMSO_Spt5.bw \
Spt6_AID_DMSO_Spt6.bw \
Spt6_AID_DMSO_HSV_Paf1.bw \
Spt6_AID_IAA_IgG.bw \
Spt6_AID_IAA_Rpb3.bw \
Spt6_AID_IAA_Spt5.bw \
Spt6_AID_IAA_Spt6.bw \
Spt6_AID_IAA_HSV_Paf1.bw \
-R /bgfs/karndt/Annotations/BED_files/plus1nuc_CDS_CPS.sorted.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--nanAfterEnd \
--numberOfProcessors "max" \
-out plus1nuc_CDS_CPS_AID_matrix.gz


plotProfile -m plus1nuc_CDS_CPS_AID_matrix.gz \
-out plus1nuc_CDS_CPS_AID.png \
--dpi 300 \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 8 \
--yMax 40 \
--yMin 0 \
--legendLocation "none" \
--plotFileFormat "png" \
--outFileNameData plus1nuc_CDS_CPS_AID.tsv \
--colors "#000000" "#001F33" "#003D66" "#005C99" "#007ACC" "#0099FF" "#33ADFF" "#66C2FF" "#99D6FF" "#CCEBFF"


#Downstream ~half
computeMatrix reference-point \
--referencePoint "TES" -b 1000 -a 500 \
-S WT_IgG.bw \
WT_Rpb3.bw \
WT_Spt5.bw \
WT_Spt6.bw \
WT_HSV_Paf1.bw \
spt6_50_IgG.bw \
spt6_50_Rpb3.bw \
spt6_50_Spt5.bw \
spt6_50_Spt6.bw \
spt6_50_HSV_Paf1.bw \
-R /bgfs/karndt/Annotations/BED_files/plus1nuc_CDS_CPS.sorted.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--nanAfterEnd \
--numberOfProcessors "max" \
-out plus1nuc_CDS_CPS_Mutant_matrix.gz


plotProfile -m plus1nuc_CDS_CPS_Mutant_matrix.gz \
-out plus1nuc_CDS_CPS_Mutant.png \
--dpi 300 \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 8 \
--yMax 40 \
--yMin 0 \
--legendLocation "none" \
--plotFileFormat "png" \
--outFileNameData plus1nuc_CDS_CPS_Mutant.tsv \
--colors "#000000" "#001F33" "#003D66" "#005C99" "#007ACC" "#0099FF" "#33ADFF" "#66C2FF" "#99D6FF" "#CCEBFF"




computeMatrix reference-point \
--referencePoint "TES" -b 1000 -a 500 \
-S Spt6_AID_DMSO_IgG.bw \
Spt6_AID_DMSO_Rpb3.bw \
Spt6_AID_DMSO_Spt5.bw \
Spt6_AID_DMSO_Spt6.bw \
Spt6_AID_DMSO_HSV_Paf1.bw \
Spt6_AID_IAA_IgG.bw \
Spt6_AID_IAA_Rpb3.bw \
Spt6_AID_IAA_Spt5.bw \
Spt6_AID_IAA_Spt6.bw \
Spt6_AID_IAA_HSV_Paf1.bw \
-R /bgfs/karndt/Annotations/BED_files/plus1nuc_CDS_CPS.sorted.bed \
--binSize 25 \
--missingDataAsZero \
--sortUsing region_length \
--averageTypeBins mean \
--nanAfterEnd \
--numberOfProcessors "max" \
-out plus1nuc_CDS_CPS_AID_matrix.gz


plotProfile -m plus1nuc_CDS_CPS_AID_matrix.gz \
-out plus1nuc_CDS_CPS_AID.png \
--dpi 300 \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 8 \
--yMax 40 \
--yMin 0 \
--legendLocation "none" \
--plotFileFormat "png" \
--outFileNameData plus1nuc_CDS_CPS_AID.tsv \
--colors "#000000" "#001F33" "#003D66" "#005C99" "#007ACC" "#0099FF" "#33ADFF" "#66C2FF" "#99D6FF" "#CCEBFF"





