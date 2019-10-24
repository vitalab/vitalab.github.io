---
layout: review
title: "TRAFIC: Fiber Tract Classification Using Deep Learning"
tags: deep-learning tractography
author: "Philippe Poulin"
cite:
    authors: "Lam, P.D.N., Belhomme, G., Ferrall, J., Patterson, B., Styner, M. and Prieto, J.C."
    title:   "TRAFIC: Fiber Tract Classification Using Deep Learning"
    venue:   "SPIE 2018"
pdf: "https://spie.org/Publications/Proceedings/Paper/10.1117/12.2293931"
---

### Code available [here](https://github.com/PrinceNgattaiLam/Trafic)


## Summary

The goal is to be able to classify candidate streamlines, given a few bundle "landmark" points. The paper focuses on the classification of the Arcuate Fasciculus of children under 2 years old. They generate streamline data for multiple subjects using an atlas-based method followed by manual expert segmentation.


### Atlas-based DTI tracking

First, a tensor atlas is computed from all input subjects using the FA maps. 
The atlas-based diffusion tensors are used to generate all the streamlines on the atlas (using an unknown tracking method). 
The streamlines are then segmented into bundles by experts to get the ground truth (GT).

![](/article/images/trafic-tract-classification/figure1.jpg)

For each GT bundle, five landmark points are computed (probably by computing a bundle centroid).
The GT bundles and their landmarks are then transferred back to subject space for training and testing.

Note: All subjects used in this paper were under 2 years old, which is a source of variability given that the brain is still developping.


### Model

Streamlines are first resampled to have the same number of points (50).
For each streamline point, 7 features are computed : curvature, torsion, and distance to all five landmark points.
In the multi-classification case, a clustering approach is used to reduce the number of landmark points from 265 (5 per bundle * 53 bundles), down to 32. Thus, each streamline point has 34 features in this case.

Furthermore, the dataset is not balanced between positive and negative examples (14K positive vs. 400K negative), so they sample balanced minibatches during training.

The model is a two-layer network, using the flattened features for all streamline points as input. The size of the network was not written in the paper however.

8 subjects were used to build the training and validation sets.

Experiments were run for single-bundle (binary) classification, and multi-bundle (54 classes) classification.


### Binary classification

After training, the model is tested on 50 unseen brains of 1-2 years old. 
The authors themselves _classified_ the resuls as "good", "acceptable", "empty" or "fail".
A "good" or "acceptable" resulting bundle means a _success_.

![](/article/images/trafic-tract-classification/figure6.jpg)

![](/article/images/trafic-tract-classification/figure8.jpg)

The high amount of "empty" results for ArcRFT is justified by the fact that it is actually biologically absent in 40% of females and 85% of males.


### Multi-class classification

3 neonatal brains were processed for multi-class segmentation (53 bundles + 1 rejection class).
For this experiment, the whole arcuate fasciculus is studied instead of the frontotemporal sub-bundle.

The model is evaluated by a visual comparison to manually traced fibers.

![](/article/images/trafic-tract-classification/figure10.jpg)
