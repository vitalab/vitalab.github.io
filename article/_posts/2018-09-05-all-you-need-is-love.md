---
layout: review
title: "All You Need is Love: Evading Hate-speech Detection"
tags: deep-learning RNN
author: Frédéric Branchaud-Charron
cite:
    authors: "Tommi Gröndahl, Luca Pajola, Mika Juuti, Mauro Conti, N.Asokan"
    title:   "All You Need is Love: Evading Hate-speech Detection"
    venue:   "Arxiv"
pdf: "https://arxiv.org/pdf/1808.09115v2.pdf"
---

In this work, the authors try to fool hate-speech detection systems.
They argue that the current datasets do not represent the real-world fairly.
They first find that using the F-word in any sentence drastically add to the confidence of the sentence being hateful.

![](/article/images/allyouneedislove/table7.jpg)

By creating a new dataset with the classes **non-hateful** and **hateful**, they find that no network is able to correctly differentiate the two. (T3 is a false positive)

![](/article/images/allyouneedislove/table6.jpg)

From this finding, they designed many attacks and they find that adding words with high impact (love, f-word) is one of the best attack vectors.

![](/article/images/allyouneedislove/table9.jpg)


Other attacks that work well : typos and removing whitespaces, which is fairly common on any social media.
