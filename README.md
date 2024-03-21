# Master in AI 

In this repository, I present some of my works related with Artificial Intelligence at University of Lübeck, during my Master in Robotics and Autonomous Systems. I would like to thank all of my teachers and lab teammates.

Courses: **Machine Learning, Computer Vision, Artificial Intelligence, Medical Deep Learning**


## Machine Learning

1. PCA, ICA and Sparse Coding

    Three unsupervised methods are applied: Prinicipal Component Analysis (PCA), Independent Component Analysis (ICA), and Sparse Coding (SC).

    Dataset: MNIST - handwritten images and faces.
2. Manifold Learning 

    Multi-dimensional Scaling and Isomap algorithm are implemented. 
    Dataset: Swiss roll.

3. Statistical Learning Theory 

    K-nearest-neighbor algorithm is implemented for a two-class classification problem on a two-dimensional dataset.

4. Boosting 

    Adaptive boosting algorithm is implemented to combine multiple weak classification models and form one strong classifier for a two-class classification problem on a two-dimensional dataset.

5. Random Forests

    Random forest algorithm is implemented to combine multiple decision trees to one strong classifier for a multi-class classification problem on a two-dimensional dataset.


## Computer Vision 

0. Introduction to Python

    * Basic Python: Basic data types (Containers, Lists, Dictionaries, Sets, Tuples), Functions, Classes
    * Numpy: Arrays, Array indexing, Datatypes, Array math, Broadcasting
    * Matplotlib: Plotting, Subplots, Images
    * IPython: Creating notebooks, Typical workflows

1. Imaging - Histograms

    * Image gradients
    * Compute and display histograms
    * Underexposed, darker, images that have been exposed to too little light
    * Overexposed, brighter, images that have been exposed to too much light
    * Histogram equalization, logarithmic and quadratic functions

2. Image Acquisition, Optics

    * Thin lenses, focal length, focus
    * The influence of the focal length
    * The influence of the aperture
    * Conversion between pixel and camera coordinates, Time-of-flight (ToF) camera

3. Image Center, Edges, Keypoints

    * Finding the image center 
    * Edge detection, show image gradients
    * Canny edge detector
    * Key point detection by using the Structure Tensor J and the Hassian Matrix H

4. Greedy Snake 

    * Use the gradient magnitude as image term
    * Calculate the three energy terms $E_{cont}$, $E_{curv}$, $E_{imag}$
    * Normalize the energy terms over the neighborhood to the intervall $[0, 1]$
    * Estimate the point in the neighborhood, that has minimum energy


## Artificial Intelligence - MATLAB

1. Nearest Neigbor

    * Matlab Introduction
    * Brute Force

2. Linear Programming

3. Perceptron

    * Pattern-by-Pattern Learning
    * Batch Learning

4. Quadratic Programming

    * Optimization and Maximum Margin

5. Duality (no code)

    * Dual Linear Program
    * Equilibrium Theorem
    * Strong Duality Theorem
    * Weak Duality Theorem

6. Lagrange Multipliers

7. Polynomial Kernels

8. Simplified Sequential Minimal Optimization (SMO)

9. Support Vector Regression (SVR)

10. Neural Networks

    * Classification
    * Sigmoid Activation Function
    * Multi-Layer-Perceptron (MLP)


## Medical Deep Learning - PyTorch 

0. Introduction to PyTorch 

    * Tensor basic
    * Tensor playground
    * Autograd
    * CNN
    * ConvBlock
    * Pneumonia classification in x-ray torso
    * Dataset
    * Pytorch data tensor structure
    * Training

1. 3D Semantic Segmentation

    Implementation of a deep 3D-CNN for multi-organ segmentation.
    
    Dataset: Learn2Reg Abdominal CT (20 training and 10 validation scans each manually labelled with 13 organs).

    * Affine transformation
    * 20 training and 10 validation scans each manually labelled with 13 organs
    * Training the FCN for segmentation
    * Segmentation using lite reduced atrous spatial pyramid pooling (LR-ASPP) (missing part)

2. Electrocardiogram (ECG)  Sequence Classification

    Classify (variable-length) ECG recordings of the PhysioNet/CinC Challenge into four rythm classes: normal sinus rhythms (N), atrial fibrillation (AF), other rhythms (O), noise signals (∼).

    * PhysioNet/CinC Challenge

    * Preprocessing

        To use the ecg signals with our neural nets normalize each recording s to have zero mean and unit variance.
    
    * Pre-trained 7 Layer ResNet (featnet) + Linear Classifier
    * 15 Layer ResNet + Linear Classifier
    * 15 Layer ResNet + LSTM + Linear Classifier
    * Transformer

3. Image Registration

    Introduce deep-learning based image registration.

    * Computation of (joint) histograms and mutual information
    * Image Transformation
    * (Discrete) Correlation layer
    * Define feature network architecture
    * Training of MI-based registration
    * Modality Invariant Neighbourhood Descriptor (MIND) (missing part)
    * Learning global + local deformable multimodal registration (missing part)

4. Weakly-Supervised Visualization

    Implement methods that allow to gain insights which parts of an input image to a Deep Neural Network are pivotal for its classification decision.

    * Implement dataset and visualize the given pancreas train & test data
    * Finetune a pretrained ResNet on the given data
    * Implement the Class Activation Mapping (CAM) method
    * Implement the guided backpropagation
    * Implementing the custom ReLU-Layer

5. Model Distillation & Ternary Nets

    Implement methods that allow to compress deep learning models via model distillation and ternary weights. This enables the use of deep learning in medicine due to its real-time ability and implementation on weaker mobile devices.

    Data of Patch Camelyon (tupac16) Challenge is used.

    * Modify a pretrained VGG11_BN network for the given training data
    * Fine tuning
    * Network Pruning through increased Sparsity
    * Ternary weight approximation (missing part)

