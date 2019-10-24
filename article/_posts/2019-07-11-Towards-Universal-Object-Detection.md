---
layout: review
title: Towards Universal Object Detection by Domain Attention
tags: deep-learning CNN domain-adaptation detection medical essentials
cite:
    authors: "Xudong Wang, Zhaowei Cai, Dashan Gao, Nuno Vasconcelos"
    title:   "Towards Universal Object Detection by Domain Attention"
    venue:   "CVPR 2019"
pdf: "http://openaccess.thecvf.com/content_CVPR_2019/papers/Wang_Towards_Universal_Object_Detection_by_Domain_Attention_CVPR_2019_paper.pdf"
---

Code available [here](https://github.com/rbgirshick/py-faster-rcnn)

# Introduction

![](/article/images/UODB/benchmark.jpg)

In this paper, they develop a universal object detection system that is capable of working on various image domains, from human faces and traffic signs to medical CT images.

The proposed domain attention modules:
![](/article/images/UODB/propose_module.jpg)

Altogether, UODB(Universal Object Detection Benchmark) covers a wide range of variations in a category, camera view, image style, etc, and thus establishes a good suite for the evaluation of universal/multi-domain object detection.

# Universal Object detection

The detectors of the adaptive multi-domain detector require prior knowledge of the domain of interest.
This is undesirable for autonomous systems, like robots or self-driving cars, where determining the domain is part of the problem to solve.

The design of universal detectors (show in the previous figure c) is the simplest solution to share a single detector by all tasks.
But even for this detector, the output layer has to be task specific, by definition of the detection problem.
They had found that there is also a benefit in using task-specific region proposal network (RPN) layers.
Beyond the universal detector, the fully shared detector is the most efficient of the other detectors considered in this work, as it has no domain-specific parameters.

# Domain-attentive Universal Detector

![](/article/images/UODB/module5.jpg)

They propose a domain adaptation (DA) module illustrated in the figure above.
This has two components, a universal e squeeze-and-excitation (SE) adapter bank, and a domain attention mechanism.
The attention component produces a domain-sensitive set of weights that are used to combine the SE bank projections.
Motivated by the SE module, the domain attention component first applies a global pooling to the input feature map, to remove spatial dimensions, and then a softmax layer (linear layer plus softmax function).

# Results

![](/article/images/UODB/results.jpg)

# Conclusion

In this paper, the authors attack the problem of universal/multi-domain object detection.
They proposed a universal detector that requires no prior domain knowledge, consisting of a single network that is active for all tasks.
The proposed detector achieves domain sensitivity through a novel data-driven domain adaptation module and was shown to outperform multiple universal/multi-domain detectors on a newly established benchmark, and even individual detectors optimized for a single task.
