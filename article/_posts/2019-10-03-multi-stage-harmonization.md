---
layout: review
title: "Multi-stage prediction networks for data harmonization"
tags: CNN medical multi-task-learning
author: "Philippe Poulin"
cite:
    authors: "Stefano B Blumberg, Marco Palombo, Can Son Khoo, Chantal MW Tax, Ryutaro Tanno, Daniel C Alexander"
    title:   "Multi-stage prediction networks for data harmonization"
    venue:   "arXiv2019"
pdf: "https://arxiv.org/pdf/1907.11629.pdf"
---


# Highlights

- Deep learning for dMRI harmonization, leveraging limited datasets using multi-task learning (multiple independent networks are merged to accomplish a final task).

# Method

- **Task**: Predict multiple high quality targets (modern platforms) from a single low-quality input (out-of-date platform)

- Standard methods
	- Registration to a common template
	- Align mean and variance from each platform (voxelwise/regionally/whole image)
- Deep learning methods
	- CNN-RISH (Rotation-Invariant Spherical Harmonics)
	- DIQT (Deeper Image Quality Transfer)
	- SHResNet

All existing deep learning methods use a single CNN to accomplish a single task (mapping the source to a single target platform).
Traveling heads datasets (one subject scanned on multiple scanners) are very limited, which is problematic for deep learning.

**Solution** 
- Use multi-task learning to train multiple networks on independent tasks, then use the last layers as input to a new network adated for the specific task.
- The final prediction is a linear combination of the task-specific predictions.


## Model figure

![](/article/images/multi-stage-harmonization/figure1.jpg)



# Experiments

## Data

- MUSHAC dataset
	- 10 healthy subjects scanned on 3 different scanners
	- GE 3T ("out-of-date" platform), Siemens Prisma 3T, Siemens Connectom 3T
	- Standard (st) protocol: 2.4mm, 30 directions; SotA (sa) protocol: 1.2mm, 60 directions
- Model input: SH coefficients after deconvolution, 6th order (28 coefficients), processed as patches of 11^3 voxels
- Target: Patches of 11^3 (harmonization) or 11^9 (harmonization + super-resolution)



![](/article/images/multi-stage-harmonization/figure2.jpg)

## Results


![](/article/images/multi-stage-harmonization/table1.jpg)

![](/article/images/multi-stage-harmonization/figure3.jpg)


# Comments

- MSP reuses many pretrained models, and adds many new sub-networks, so it has much more parameters than any single model, which might give it an advantage over others.
- The final MSP layer is still task-specific.
- No subjects were specifically left out for the test set.
- They seem to choose the task-specific models based on the test set evaluation, which may indicate data contamination.