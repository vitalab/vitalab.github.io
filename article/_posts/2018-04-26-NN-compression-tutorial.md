---
layout: review
title:  "Survey: Network compression and speedup"
tags:   pruning-acceleration deep-learning CNN survey network-compression network-pruning
author: "Pierre-Marc Jodoin"
pdf: "http://slazebni.cs.illinois.edu/spring17/lec06_compression.pdf"
cite:
  authors: "S. Yao, Y. Xu, D. Calzada"
  title:   "Network compression and speedup"
  venue:   "http://slazebni.cs.illinois.edu/spring17"
---

Nice powerpoint presentation made by three students at the University of Illinois at Urbana-Champaign surveying the some of the most widely implemented methods for compressing and speeding up neural networks. 

The presentation goes through the following approaches

* Matrix Factorization
	* Singular Value Decomposition (SVD)
	* Flattened Convolutions

* Weight Pruning
	* Magnitude-based method
	* Iterative pruning + Retraining
	* Pruning with rehabilitation
	* Hessian-based method

* Quantization method
	* Full Quantization
	* Fixed-point format
	* Code book
	* Quantization with full-precision copy

* Pruning + Quantization + Encoding 

* Design small architecture: SqueezeNet


