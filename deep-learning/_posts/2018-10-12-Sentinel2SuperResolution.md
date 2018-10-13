---
 layout: review
 title:  " Super-resolution of Sentinel-2 images: Learning a globally applicable deep neural network"
 tags:   deep-learning, remote-sensing, super-resolution, hyperspectral
 author: Charles Authier
 pdf:  https://arxiv.org/abs/1803.04271v2
 cite:
   authors: "Charis Lanaras, José Bioucas-Dias, Silvano Galliani, Emmanuel Baltsavias, Konrad Schindler"
   title:   "Super-resolution of Sentinel-2 images: Learning a globally applicable deep neural network"
   venue:   "Arxiv, 12 Mar 2018 and ISPRS Journal of Photogrammetry and Remote Sensing, 146 (2018), pp. 305-319"
 ---

A big problem in deep-learning is the lak of data, in remote-sensing not only the data available is very small, they don't necesery have the same resolution. 


A lot of peper show a real use of the hyperspectral in deep-learning, unfortunally, txecpt for small hyperspectral use for land or aerial imaging, the resolution for those hyperspectral sensors are generally wrose than a RGB sensor.


This paper show a super-resolution method to put the hyperspectral band with a larger GSD to the same 10m GSD than the RGB. Those images can be use for better analyse in earth science or in our case for adding more information on the images for better prediction. 


The data use for creating the method came from the constelation of Sentinel-2 (S2), two identical satellites with the same sensors at 180 degree of each other, the sensor give 13 bands with differents information and resolution. 

![](/deep-learning/images/superpixS2/bands.png)


The big avantage from S2 is than they cover the entire earth and all the data are accesible for every one. 


## The Method
Since the resolutions are 10, 20, and 60m, and they want to generalise every band at 10m GSD, they use 2 CNNs: one to upgrade 20 to 10m and the other to upgrade the resolution of 60 to 10m. 
In that case, they don't need annoteted images, but they use the real value for a 20m and 60m resulution for ground thrut and they downsamples the training images to 40 and 360m like follow.

![](/deep-learning/images/superpixS2/downsampling.png)

Like that, they can train the two network to be able to learn to 2x and 6x super-resolution, but at the end they will use those network to predict on 10m GSD with no way to verified.

This super-resolution algorithm optimised for (but conceptually not limited to) S2, with the following characteristics:
* significantly  higher  accuracy  of  all  super-resolved bands
* better preservation of spectral characteristics
* favourable computational speed when run on modern GPUs
* global applicability for S2 data without retraining, according to our (necessarily limited) tests
* generic end-to-end system that can, if desired, be retrained for specific geographical locations and land-covers, simply
by running additional training iterations
* free, publicly available source code and pre-trained network weights, en-
abling out-of-the-box super-resolution of S2 data.

![](/deep-learning/images/superpixS2/train.png)

They optain 2 Network, DSen2 and VDSen2, the difference is the $$d$$ and $$f$$ that will be 6, 128 for the DSen2 and 32, 256 for VDSen2.

## Results

![](/deep-learning/images/superpixS2/2xtable.png)

![](/deep-learning/images/superpixS2/6ximage.png)

![](/deep-learning/images/superpixS2/6xtable.png)

![](/deep-learning/images/superpixS2/6ximage.png)
