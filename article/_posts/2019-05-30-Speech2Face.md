---
layout: review
title: "Speech2Face: Learning the Face Behind a Voice"
tags: deep-learning
author: "Antoine Théberge"
cite:
    authors: "Tae-Hyun Oh, Tali Dekel, Changil Kim, Inbar Mosseri, William T. Freeman, Michael Rubinstein, Wojciech Matusik"
    title:   "Speech2Face: Learning the Face Behind a Voice"
    venue:   "CVPR 2019"
pdf: "https://arxiv.org/pdf/1905.09773v1.pdf"
---


# Highlights

- Successfully recognize general physical traits such as gender, age, and ethnicity from a voice clip

# Introduction

"_How much can we infer about a person's looks from the way they speak?_". In this paper, the authors reconstruct a "canonical" (front facing, neutral expression, uniformly lit) face from a 6 seconds voice clip using a voice encoder.

# Methods

![](/article/images/Speech2Face/method.jpeg)

The idea is really simple: You take a pre-trained face synthetiser<sup>[1]</sup> network. You then train a voice encoder to match its last feature vector $$v_s$$ with the face synthesiser $$v_f$$. If the two encoders project in a similar space, the face decoder should decode similar faces.

A natural choice for a loss would be the $$L_1$$ distance between the $$v_s$$ and $$v_f$$. However, the authors found that the training was slow and unstable. They, therefore, used the following loss:

![](/article/images/Speech2Face/loss.jpeg)

where $$f_{dec}$$ is the first layer of the face decoder and $$f_{VGG}$$ the last layer of the face encoder.

## Data

The authors used the AVSpeech dataset and extracted 1 frame and a 6 seconds audio clip from each video clip. If the video clip was shorter than six seconds, they looped it. The audio clip was then turned into a spectrogram and fed to the speech encoder.

# Results

The authors tested both qualitatively and quantitatively their model on the AVSpeech and VoxCeleb dataset.

Qualitative results are available [here](https://speech2face.github.io/supplemental/index.html#fig3)

For quantitative results, the authors used [Face++](https://www.faceplusplus.com/attributes/) to compare features from the original images and the reconstructed faces. The Face++ classifiers return either “male” or “female” for gender, a continuous number for age, and one of the four values, “Asian”, “black”, “India”, or “white”, for ethnicity. The corresponding confusion matrices are available below

![](/article/images/Speech2Face/fig4.jpg)

The authors also extracted craniofacial attributes from the reconstructed F2F and S2F images that resulted in a high correlation between the two.

![](/article/images/Speech2Face/craniofacial.jpg)
![](/article/images/Speech2Face/table.jpg)

They also performed top-5 recognition to determine how much you could retrieve the true speaker from the reconstructed image.

![](/article/images/Speech2Face/top5.jpeg)

Supplementary results are aailable [here](https://speech2face.github.io/supplemental/index.html)

# Conclusions

The authors showed that they can recover physical features from a person's speech fairly well. 

# Remarks

The authors stress throughout the paper, including in an "Ethical Considerations" section that a person's true identity cannot be recovered from this. 

To quote the paper:
> More specifically, if a set of speakers might have vocal-visual traits that are relatively uncommon in the data, then the quality of our reconstructions for such cases may degrade. For example, if a certain language does not appear in the training data, our reconstructions will not capture well the facial attributes that may be correlated with that language. Note that some of the features in our predicted faces may not even be physically connected to speech, for example, hair color or style. However, if many speakers in the training set who speak in a similar way (e.g., in the same language) also share some common visual traits (e.g., common hair color or style), then those visual traits may show up in the predictions.

[A similar paper](https://arxiv.org/pdf/1905.10604.pdf) has also emerged recently from Carnegie Mellon, but in this case, the authors use GANs to generate the images.

The [hacker news thread](https://news.ycombinator.com/item?id=20016177) has some interesting discussions, like different physiological features like overbite, size of vocal tracts, etc. could have been predicted instead. Also, the implications of this paper in the field of sociolinguistics; to understand how the model could predict that a certain speaker has a goatee, for example.

# References
\[1\]: [_Synthesizing Normalized Faces from Facial Identity Features_, Cole et. al, 2017](https://arxiv.org/abs/1701.04851)
