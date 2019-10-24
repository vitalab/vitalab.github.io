---
layout: review
title: "Cross-scanner and cross-protocol diffusion MRI data harmonisation: A benchmark database and evaluation of algorithms"
tags: medical MRI brain white-matter
author: "Philippe Poulin"
cite:
    authors: "Tax, C.M., Grussu, F., Kaden, E., Ning, L., Rudrapatna, U., Evans, J., St-Jean, S., Leemans, A., Koppers, S., Merhof, D. and Ghosh, A."
    title:   "Cross-scanner and cross-protocol diffusion MRI data harmonisation: A benchmark database and evaluation of algorithms"
    venue:   "Neuroimage 2019"
pdf: "https://www.sciencedirect.com/science/article/pii/S1053811919300837"
---

## Summary

This paper is the result of the "Diffusion MRI Harmonisation Challenge", organized at the MICCAI 2017 CDMRI workshop.
It presents a benchmark of 5 dMRI harmonisation algorithms, using a dataset of 14 participants scanned on 3 systems of different gradient strengths (40, 80 and 300 mT/m).
In addition to the standard protocol, a state-of-the-art protocol was used with 2 of the 3 systems.

## Dataset

> ![](/article/images/cross-scanner-protocol-harmonization/figure1.jpg)

- 14 subjects split into trainset (9), validset (1) and testset (4)

- Standard protocol : 30 gradient directions, 2.4mm iso
- State-of-the-art protocol : 60 gradient directions, 1.5/1.2mm iso


## Experiments

1. Map the 40 mT/m **standard** signal to the 80 and 300 mT/m **standard** signals
2. Map the 40 mT/m **standard** signal to the 80 and 300 mT/m **state-of-the-art** signals

The predicted signal is fitted with DTI to extract FA and MD maps.
RISH features for order 0 and 2 are also computed.


> ![](/article/images/cross-scanner-protocol-harmonization/figure2.jpg)


## Benchmarked methods

> ![](/article/images/cross-scanner-protocol-harmonization/table3.jpg)

SHNet:
> ![](/article/images/cross-scanner-protocol-harmonization/table4.jpg)

SHResNet:
> ![](/article/images/cross-scanner-protocol-harmonization/figure3.jpg)

SphericalNet:
> ![](/article/images/cross-scanner-protocol-harmonization/table5.jpg)

FCSNet:
> ![](/article/images/cross-scanner-protocol-harmonization/figure4.jpg)

SDL:
> ![](/article/images/cross-scanner-protocol-harmonization/figure5.jpg)

Reference method : simple trilinear interpolation in the spatial domain, and spherical harmonics interpolation (order 6 for ST and 8 for SA) in the angular domain.

## Results


> ![](/article/images/cross-scanner-protocol-harmonization/figure6.jpg)


> ![](/article/images/cross-scanner-protocol-harmonization/figure7.jpg)

> ![](/article/images/cross-scanner-protocol-harmonization/figure8.jpg)