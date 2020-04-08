#!/bin/bash
# see http://core.sam.pitt.edu/node/5678
#SBATCH -N 1
#SBATCH -t 1-00:00:00   # 1 days
#SBATCH --c 16 # Request 16 cores.
#SBATCH --mem=1024g
#SBATCH --job-name=ChIPseq

module getdefault

#set working directory path
dir=/bgfs/karndt/mae_chipseq_re_analysis_093019/analysis

cd "$dir"


# multiBigwigSummary BED-file \
# --BED plus1nuc_CDS_CPS.sorted.bed \
# --bwfiles \
# Spt6_AID_DMSO_Rpb3.bw \
# Spt6_AID_DMSO_Spt5.bw \
# Spt6_AID_DMSO_Spt6.bw \
# Spt6_AID_DMSO_HSV_Paf1.bw \
# Spt6_AID_IAA_Rpb3.bw \
# Spt6_AID_IAA_Spt5.bw \
# Spt6_AID_IAA_Spt6.bw \
# Spt6_AID_IAA_HSV_Paf1.bw \
# --smartLabels \
# --outFileName BigWigSummary_mRNA_BED_depletion_raw.npz \
# --numberOfProcessors 'max' \
# --outRawCounts BigWigSummary_mRNA_BED_depletion_raw.tsv
# 
# #--blackListFileName blacklist.bed \
# 
# plotCorrelation \
# --corData BigWigSummary_mRNA_BED_depletion_raw.npz \
# --corMethod 'pearson' \
# --whatToPlot 'heatmap' \
# --plotNumbers \
# --removeOutliers \
# --plotHeight 20 \
# --plotWidth 20 \
# --plotFile BigWigSummary_mRNA_BED_depletion_raw_pearson_correlation_heatmap.png
# 
# 
# plotCorrelation \
# --corData BigWigSummary_mRNA_BED_depletion_raw.npz \
# --corMethod 'pearson' \
# --whatToPlot 'scatterplot' \
# --plotNumbers \
# --removeOutliers \
# --plotHeight 40 \
# --plotWidth 40 \
# --xRange 0 15 \
# --yRange 0 15 \
# --plotFile BigWigSummary_mRNA_BED_depletion_raw_pearson_correlation_scatterplot.png
# 
# 
# 
# multiBigwigSummary BED-file \
# --BED plus1nuc_CDS_CPS.sorted.bed \
# --bwfiles \
# WT_Rpb3.bw \
# WT_Spt5.bw \
# WT_Spt6.bw \
# WT_HSV_Paf1.bw \
# spt6_50_Rpb3.bw \
# spt6_50_Spt5.bw \
# spt6_50_Spt6.bw \
# spt6_50_HSV_Paf1.bw \
# --smartLabels \
# --outFileName BigWigSummary_mRNA_BED_mutant_raw.npz \
# --numberOfProcessors 'max' \
# --outRawCounts BigWigSummary_mRNA_BED_mutant_raw.tsv
# 
# # --blackListFileName blacklist.bed \
# 
# plotCorrelation \
# --corData BigWigSummary_mRNA_BED_mutant_raw.npz \
# --corMethod 'pearson' \
# --whatToPlot 'heatmap' \
# --plotNumbers \
# --removeOutliers \
# --plotHeight 20 \
# --plotWidth 20 \
# --plotFile BigWigSummary_mRNA_BED_mutant_raw_pearson_correlation_heatmap.png
# 
# plotCorrelation \
# --corData BigWigSummary_mRNA_BED_mutant_raw.npz \
# --corMethod 'pearson' \
# --whatToPlot 'scatterplot' \
# --plotNumbers \
# --removeOutliers \
# --plotHeight 40 \
# --plotWidth 40 \
# --xRange 0 15 \
# --yRange 0 15 \
# --plotFile BigWigSummary_mRNA_BED_mutant_raw_pearson_correlation_scatterplot.png
# 
# 
# 
# multiBigwigSummary BED-file \
# --BED plus1nuc_CDS_CPS.sorted.bed \
# --bwfiles \
# Rpb3_depletion_log2diff.bw \
# Spt5_depletion_log2diff.bw \
# Spt6_depletion_log2diff.bw \
# HSV_Paf1_depletion_log2diff.bw \
# --smartLabels \
# --outFileName BigWigSummary_mRNA_BED_depletion_log2diff.npz \
# --numberOfProcessors 'max' \
# --outRawCounts BigWigSummary_mRNA_BED_depletion_log2diff.tsv
# 
# # --blackListFileName blacklist.bed \
# 
# plotCorrelation \
# --corData BigWigSummary_mRNA_BED_depletion_log2diff.npz \
# --corMethod 'pearson' \
# --whatToPlot 'heatmap' \
# --plotNumbers \
# --removeOutliers \
# --plotHeight 10 \
# --plotWidth 10 \
# --plotFile BigWigSummary_mRNA_BED_depletion_log2diff_pearson_correlation_heatmap.png
# 
# 
# plotCorrelation \
# --corData BigWigSummary_mRNA_BED_depletion_log2diff.npz \
# --corMethod 'pearson' \
# --whatToPlot 'scatterplot' \
# --plotNumbers \
# --removeOutliers \
# --plotHeight 20 \
# --plotWidth 20 \
# --xRange -2 2 \
# --yRange -2 2 \
# --plotFile BigWigSummary_mRNA_BED_depletion_log2diff_pearson_correlation_scatterplot.png
# 
# 


multiBigwigSummary BED-file \
--BED plus1nuc_CDS_CPS.sorted.bed \
--bwfiles \
Rpb3_mutant_log2diff.bw \
Spt5_mutant_log2diff.bw \
Spt6_mutant_log2diff.bw \
HSV_Paf1_mutant_log2diff.bw \
--smartLabels \
--outFileName BigWigSummary_mRNA_BED_mutant_log2diff.npz \
--numberOfProcessors 'max' \
--outRawCounts BigWigSummary_mRNA_BED_mutant_log2diff.tsv

# --blackListFileName blacklist.bed \

plotCorrelation \
--corData BigWigSummary_mRNA_BED_mutant_log2diff.npz \
--corMethod 'pearson' \
--whatToPlot 'heatmap' \
--plotNumbers \
--removeOutliers \
--plotHeight 10 \
--plotWidth 10 \
--plotFile BigWigSummary_mRNA_BED_mutant_log2diff_pearson_correlation_heatmap.png



plotCorrelation \
--corData BigWigSummary_mRNA_BED_mutant_log2diff.npz \
--corMethod 'pearson' \
--whatToPlot 'scatterplot' \
--plotNumbers \
--removeOutliers \
--plotHeight 20 \
--plotWidth 20 \
--xRange -2 2 \
--yRange -2 2 \
--plotFile BigWigSummary_mRNA_BED_mutant_log2diff_pearson_correlation_scatterplot.png






# Spt6_AID_DMSO_Input.bw \
# Spt6_AID_DMSO_IgG.bw \
# Spt6_AID_DMSO_Rpb3.bw \
# Spt6_AID_DMSO_Spt5.bw \
# Spt6_AID_DMSO_Spt6.bw \
# Spt6_AID_DMSO_HSV_Paf1.bw \
# 
# Spt6_AID_IAA_Input.bw \
# Spt6_AID_IAA_IgG.bw \
# Spt6_AID_IAA_Rpb3.bw \
# Spt6_AID_IAA_Spt5.bw \
# Spt6_AID_IAA_Spt6.bw \
# Spt6_AID_IAA_HSV_Paf1.bw \

# WT_Input.bw \
# WT_IgG.bw \
# WT_Rpb3.bw \
# WT_Spt5.bw \
# WT_Spt6.bw \
# WT_HSV_Paf1.bw \
# 
# spt6_50_Input.bw \
# spt6_50_IgG.bw \
# spt6_50_Rpb3.bw \
# spt6_50_Spt5.bw \
# spt6_50_Spt6.bw \
# spt6_50_HSV_Paf1.bw \

# Input_mutant_log2diff.bw \
# IgG_mutant_log2diff.bw \
# Rpb3_mutant_log2diff.bw \
# Spt5_mutant_log2diff.bw \
# Spt6_mutant_log2diff.bw \
# HSV_Paf1_mutant_log2diff.bw \      

               
