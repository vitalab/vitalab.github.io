---
layout: review
title: "The Elephant in the Room"
tags: deep-learning deep-learning
author: "Antoine Théberge"
cite:
    authors: "Amir Rosenfeld, Richard Zemel and John K. Tsotsos"
    title:   "The Elephant in the Room"
    venue:   "Arxiv"
pdf: "https://arxiv.org/abs/1808.03305"
---

## The idea
Adversarial examples have been suggested as small targeted perturbations imperceptible to the human eye. This paper does the opposite and transplant objects, from the same "dataset", into another image. This has multiple undesirable effects.

## The method 
All the experiments used images from COCO 2017's validation set. Models are from Tensorflow's Object Detection API. Various metrics were used to calculate how much object detectors failed.

The first test was to extract an object (a elephant, wink) from another image and transplant it at various locations in another image (a living room, wink) on which the detector was trained (Faster-RCNN with NASNet backbone). Results:

![](/article/images/the_elephant_in_the_room/litteral-elephant.jpg)
![](/article/images/the_elephant_in_the_room/sandwich.jpg)

---

The second test was to duplicate an object in the same image:

![](/article/images/the_elephant_in_the_room/duplicates.jpg)

---

Anectodically, they also tested Google OCR and it also broke:

![](/article/images/the_elephant_in_the_room/google.jpg)

## The results
![](/article/images/the_elephant_in_the_room/table.jpg)

where 'tau' is the threshold of accepted difference between bounding boxes

## The reasoning
### Partial occlusion
It is widely accepted that partial occlusion is a challenge for object detectors.

### Out of distribution examples
Since the objects are only 'pasted', abrupt edges are created at the object's border. These edges might be out-of-distribution. This experiment might be considered as some kind of an adversarial attack, but with sometimes the opposite effect: The detector is 'blind' to the attack.

### (Lack of) signal preservation
Spatial pooling, very much used in CNNs, actually prevents networks from being shift-invariant, and the authors of <sup>[\[1\]](https://arxiv.org/abs/1805.12177)</sup> also observed that small changes to the object, like scalling, can have a dramatic effect.

### Contextual reasoning
It is possible that network end up doing some contextual reasoning even if it is not explicitely learned, explaining why matching two objects that were never shown together during training (an elephant and a book, for example) might cause catasprophic failures.

### Non-maximal suppression
Assume an object A that is no longer being detected because it is now (partially) occluded by an object T. An object B, which was partially occluded by A and not detected, might now be detected. This chain-reaction could cause non-local effects.

### Feature inference:
![](/article/images/the_elephant_in_the_room/cat.jpg)

It is possible that features outside the object's ROI might influence the object's detection. This could help object detection in cases where the object is partially occluded, but also hinder object detection. Pixels in the ROI which are not the object (like background) could also influence detection. The authors suggest that this is the main cause of problems.

[Article in Quanta Magazine](https://www.quantamagazine.org/machine-learning-confronts-the-elephant-in-the-room-20180920/)
