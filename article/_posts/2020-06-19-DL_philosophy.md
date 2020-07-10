---
layout: review
title: "Deep Learning: A philosophical introduction"
tags: deep-learning
author: "Marco Armenta"
cite:
    authors: "Cameron Buckner"
    title:   "Deep Learning: A philosophical introduction"
    venue:   "Philosophy Compass"
pdf: "https://onlinelibrary.wiley.com/doi/full/10.1111/phc3.12625"
---

# Introduction

This paper focuses on the, yet not answered satisfactorily, why question in deep learning:

* **Why do CNNs work so good?**

A why question and its answer (the explanation) in science should satisfy the following:

* The why question should be recognized by some good (accepted) members of the scientific community.
* The explanation should be satisfying to those same members of the scientific community so that they do not immediately feel the need to ask a further why question (the explanation has come to an end, for now).
* The explanation should recover all (or most) of the phenomena with the complete precision that was found in the previous explanation.
* The explanation should contribute something new to the scientific theory and bring new questions that would not have been asked, or new predictions that would not have been made under the old explanation.

# Current Interpretations and Explanations

The following are three popular explanations for CNNs distinctive successes. Though sometimes they are offered as competitors, it is not clear that they are in conflict and may illuminate complementary aspects of the same underlying phenomenon.

* **Hierarchical feature composition**: CNNs work like visual processing has been thought to work in the mammalian ventral stream, by hierarchically composing more complex feature representations from simpler and less abstract ones. This is only a good **story**, but experts have vindicated the role of hierarchical feature composition by highlighting the increasing recoverability of more abstract features as one moves up the ventral stream hierarchy (i.e., feature space visualization).

* **Systematic transformations of input to adjust for nuisance variation**: Sparse connectivity and regularization impose the assumption that the recognition of generalizable features should not depend on too many long-distance relations among features or subtle contextual details. During training, CNNs simply ignore hypotheses that violate these assumptions; but when the solution to a problem satisfies them, CNNs can find the solution more efficiently than more traditional neural networks. Thus, **perhaps** CNNs work so well because a wide class of classification and decision problems satisfy these assumptions. How far the utility of these assumptions extends into territory traditionally ascribed to "higher" cognition remains an open question. 

* **Number of linear regions**: Another intuition pretending to explain the success of CNNs is the number of linear regions they can map in a problem's input space, relative to networks that do not possess their characteristic features. The ability to draw more distinct linear regions is advantageous because it allows neural networks to impose more complex boundaries between categories which are difficult to discriminate from one another because of many low-level perceptual similarities. This **is not a complete answer** to our why question because it still leaves room for further why questions, like why do CNNs learn these linear regions?

![](/article/images/Philosophy_DL/feature_space.jpg)

![](/article/images/Philosophy_DL/folding_ex.jpg)

# Open Problems

Most commentators agree that current deep learning methods fall short of implementing general intelligence, and it remains an open question as to whether some modification of current deep learning methods will be able to do so.

* **CNNs and nativism/empiricism**: Nativism is a concept in psychology and philosophy which asserts certain concepts are "native" or in the brain at birth (given a priori). Empiricism is a theory that states that knowledge comes only or primarily from sensory experience. Philosophers think of cognition as ranging over four variables: algorithms, representational formats, innate knowledge and experience. A truly empiricist system should begin with nothing for representational format and innate knowledge, and only a very minimal amount of algorithms, deriving everything else from experience. Therefore, AlphaGo, AlphaStar etc. provide philosophical insight into empiricism.

* **Do CNNs learn the way that humans do?**: First, CNNs require far more data to learn than humans. Second, the phenomenon of adversarial examples demonstrates that what is learned by CNNs differs substantially from what is learned by humans (however, https://www.youtube.com/watch?v=y2004Xaz2HU). Even more, two factors are often neglected in counting the number of examples that humans should be scored as having been exposed to in learning: (a) that many different vantage points of the same object could provide additional training exemplars for cortical learning and (b) that offline memory consolidation during sleep and daydreaming can replay the same training session many thousands of times in nonconscious repetitions. As it stands, adversarial examples and their implications remain mysterious.

* **What kind of explanation do CNNs provide?**: We still don't know what kind of answer CNNs provide to explain human perceptual similarity judgements. The usual argument is due to their supposed structural similarity to brains. CNNs are constructed at a high level of abstraction from the perceptual cortex, which could lead one to doubt that they succeed at providing mechanistic explanations for even perceptual processing. There is also a significant debate as to whether backprop learning is biologically plausible. 

# Conclusions

* Experts have argued that the usual explanations as to why CNNs work so good are not complete answers.
* While the definitions of the algorithms and the applications are important, paradigm mechanistic explanations often involve mathematical formalism.
* If CNNs are to provide more than a "how possibly" story concerning the human cortex's ability to implement these forms of processing, we must identify some structural or causal correspondences that show this is how they actually do it.
