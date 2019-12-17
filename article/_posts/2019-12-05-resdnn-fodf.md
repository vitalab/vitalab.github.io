---
layout: review
title: "Deep learning reveals untapped information for local white-matter fiber reconstruction in diffusion-weighted MRI"
tags: CNN medical brain
author: "Philippe Poulin"
cite:
    authors: "Nath, V., Schilling, K.G., Parvathaneni, P., Hansen, C.B., Hainline, A.E., Huo, Y., Blaber, J.A., Lyu, I., Janve, V., Gao, Y. and Stepniewska, I."
    title:   "Deep learning reveals untapped information for local white-matter fiber reconstruction in diffusion-weighted MRI"
    venue:   "MRI2019"
pdf: "https://www.sciencedirect.com/science/article/pii/S0730725X19301717"
---

**Code**: [https://github.com/finalelement/dl_untapped_info_dwmri_histo]

# Highlights
- ResDNN trained to map a raw diffusion MRI signal to a fODF
- Ground truth built from histology
- Outperforms CSD reconstruction on histology measurement


# Method

Input: 45 SH coefficients (order 8) fitted to ex-vivo DW-MRI
Target: Histological fiber ODFs, represented by 45 SH coefficients (order 8)

Model: MLP with a residual block, with architecture: [45-400-45-200-45-200-45]

No validation set was used; cross-validation is used to determine to "optimal" number of iterations for convergence.
Training time is less than 10min and prediction is done in less than 2min.



# Experiments

## Data

- 3 Squirrel monkey brains (2 for training, 1 for testing)
- HCP scan-rescan of 12 subjects

**Ground truth for Squirrel monkey**
- Computed using slice-wise staining and 3D structure tensor analysis using a confocal microscope
- Histology registered to DW-MRI data
- May be considered outdated compared to other methods, e.g. CLARITY
- Total of around 50000 voxels, including rotations as data augmentation


## Baselines

- Q-Ball Imaging
- Q-Ball Imaging with constant solid angle
- Super-resolved CSD at SH order 6 and 8
- Lucy-Richardson CSD
- Diffusion orientation transform
- Diffusion orientation transform revisited


## Results

- Evaluation uses ACC (Angular correlation coefficient), a measure of similarity for SH coefficients, ranging from -1 to 1

**Results on Squirrel monkey**
- ResDNN median: 0.82
- All others: <0.79

**Results on HCP 12 subjects scan-rescan**

- ResDNN: 0.74 +- 0.31
- CSD: 0.61 +- 0.31

# Comments

- The model processes SH coefficients fitted to the _log-space signal_, and uses ReLU activations. These 2 details enforce non-negativity in SH space, as seen in Figure 8.