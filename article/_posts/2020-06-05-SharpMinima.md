---
layout: review
title: "Sharp Minima can Generalize for Deep Nets"
tags: shape-analysis
author: "Marco Armenta"
cite:
    authors: "Laurent Dinh, Razvan Pascanu, Samy Bengio, Yoshua Bengio"
    title:   "Sharp Minima can Generalize for Deep Nets"
    venue:   "ICML 2017"
pdf: "https://arxiv.org/pdf/1703.04933.pdf"
---


# Highlights

In this paper the authors prove that three notions of flatness for minima of deep networks do not actually measure flatness. They do this by using positive scale invariance of ReLU networks.

* This is a machine learning paper **without experiments** and **only math**.

# Notions of flatness to be debunked

![](/article/images/SharpMinima/def1.jpg)    

![](/article/images/SharpMinima/fig1.jpg)    

![](/article/images/SharpMinima/def2.jpg)    

* There is also a notion of flatness concerning the Hessian, namely the spectral norm and trace of the Hessian. These two have information from the eigenvectors of the Hessian.

## Properties of ReLU

![](/article/images/SharpMinima/relu.jpg)    

![](/article/images/SharpMinima/def5.jpg)    

* **The maps $$T_\alpha$$ produce networks with the same network function**.

## Theorems

![](/article/images/SharpMinima/thm2.jpg)    

![](/article/images/SharpMinima/fig3.jpg)    

![](/article/images/SharpMinima/thm3.jpg)    

![](/article/images/SharpMinima/thm4.jpg)    

![](/article/images/SharpMinima/thm5a.jpg)    

![](/article/images/SharpMinima/thm5b.jpg)    

What they prove now is that the notion

![](/article/images/SharpMinima/max.jpg)    

for sharpness can also be modified with the maps $$T_\alpha$$.

![](/article/images/SharpMinima/e-sh.jpg)    

# Reparametrization

![](/article/images/SharpMinima/repar.jpg)    

# Conclusion

* Previously used definitions of flatness fail to account for the complex geometry of some commonly used deep architectures.
* Positive scale invariance allows one to alter the flatness of a minimum without affecting the network function.

