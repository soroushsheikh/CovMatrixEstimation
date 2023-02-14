# Exact and Stable Covariance Estimation from Quadratic Sampling
This project is an unofficial implementation and analyze of the paper "Exact and Stable Covariance Estimation from Quadratic Sampling via Convex Programming" by Goldsmith et al. The paper proposes a method for estimating the covariance matrix of a high-dimensional random vector. The method relies on quadratic sampling, which involves taking inner products of random projections of the vector. The authors formulate the covariance estimation problem as a convex optimization problem, and show that their method provides an exact and stable estimate of the covariance matrix, even in the presence of high levels of measurement noise.

The project provides code to implement the method described in the paper, and to simulate the performance of the method in a variety of scenarios. The code includes functions for performing the quadratic sampling, solving the convex optimization problem, and evaluating the accuracy of the resulting covariance estimate. Additionally, the code includes code for generating plots that illustrate the performance of the method, such as the relationship between the number of measurements and the accuracy of the covariance estimate.

The method is able to reconstruct a wide variety of covariance matrices including low-rank matrix, sparse and low rank matrix, sparse and symmetric matrix, and Toeplitz and low rank matrix. These types of matrices represent a significant portion of real-world covariance matrices and this project provides a solution for their efficient and accurate reconstruction.

The code is written in MATLAB, and is intended for researchers and practitioners who are interested in studying or applying the method described in the paper. The project includes detailed documentation, including an overview of the code, instructions for running the code, and explanations of the key algorithms and methods used in the project.

## Requirements
- MATLAB
- CVX -- The installation guide can be found in [here](http://cvxr.com/cvx/doc/install.html)

## Usage
- Clone the repository or download the zip file
- Install the requirements 
- Run the matEstimator.m on MATLAB to replicate the results.
- The provided codes are examples to show the implementation of the algorithm. You can use them as a reference to implement the algorithm for your own use case.

## Arguments Explanation


- `n` - Dimension of matrix. 
  An integer value that specifies the number of rows and columns in the matrix.

- `m` - number of quadratic samples. 
  An integer value that specifies the number of samples used for the quadratic sampling.

- `r` - Rank of the matrix. 
  An integer value that specifies the rank of the matrix.

- `l` - Sparsity level. 
  A scalar value that specifies the level of sparsity in the matrix.

- `e` - Constants. 
  A scalar value that is used as a constant in the code.

- `mu` - Mean of the normal random matrix. 
  A scalar value that represents the mean of the normal random matrix.

- `sigma` - Standard deviation of the normal random matrix. 
  A scalar value that represents the standard deviation of the normal random matrix.

- `a` - Normal random matrix. 
  A matrix generated using normrnd with mean `mu` and standard deviation `sigma`.

- `matrixType` - Type of matrix. 
  A string that specifies the type of matrix to be generated. Possible values are:
  * `lr` - Low rank matrix
  * `splr` - Sparse and low rank matrix
  * `spsym` - Sparse and symmetric matrix
  * `toplr` - Toeplitz and low rank matrix

- `noise` - Add noise. 
  A Boolean that specifies whether to add noise to the data.

- `tolerance` - Tolerance for optimization. 
  A scalar value that specifies the tolerance for optimization.
  
  
## Methodology
The methodology for this project involves two main steps:

1. Generation of matrices: 
The first step is to generate the matrices that we want to reconstruct. These matrices can be low-rank matrices, sparse and low rank matrices, sparse and symmetric matrices, or Toeplitz and low rank matrices. The user can specify the type of matrix they want to generate and its parameters such as the rank, sparsity level, mean, and standard deviation of the normal random matrix, etc.

2. Quadratic Sampling and Reconstruction: 
The second step is to take quadratic samples of the generated matrix and use these samples to reconstruct the original matrix. The number of samples taken and the method of reconstruction are crucial to the accuracy of the final result. To obtain quadratic samples, we use a technique called quadratic measurement, which involves multiplying the matrix with random Gaussian vectors and then taking the inner product of the resulting vectors. The inner products are used as the quadratic samples.

3. Optimization:
We then use the quadratic samples to reconstruct the original matrix using an optimization-based method. This involves finding the matrix that minimizes the difference between the original matrix and the reconstructed matrix. The optimization problem is solved using alternating minimization, where the matrix is iteratively updated until the solution converges to within a specified tolerance.


## Results

The accuracy of the reconstruction is evaluated using the normalized mean square error (NMSE), which measures the difference between the original matrix and the reconstructed matrix.

1. NMSE was plotted over the number of measurements for both low rank matrices and sparse matrices. For low rank matrices, the NMSE was plotted for different ranks of matrices, which allows us to see the accuracy of the reconstruction for different ranks. On the other hand, for sparse matrices, the NMSE was plotted over different sparsity levels, showcasing the robustness of the reconstruction for different levels of sparsity. 

![Result figure1](https://github.com/soroushsheikh/CovMatrixEstimation/blob/main/Results/NoNoise.png)

2. The robustness of the reconstruction against noise is also evaluated by plotting the NMSE for different levels of noise introduced. we used the fixed sparsity level of `k=180` and rank `r=5` for this experiment.

![Result figure2](https://github.com/soroushsheikh/CovMatrixEstimation/blob/main/Results/Noise.png)

3. Table is provided to show the number of measurements obtained using quadratic sampling and the minimum number of samples needed for reconstruction based on the information theory limitation, with a tolerance level of 0.01. This demonstrates the efficiency of the quadratic sampling method.

      1. Low-rank matrices

      | Rank of Matrix | Number of Quadratic Samples | Minimum Samples Required (Information Theory) |
      | -------------  | ---------------------------  | --------------------------------------------- |
      | 1              | 50                           | 40                                             |
      | 3              | 185                          | 117                                            |
      | 5              | 255                          | 190                                            |
      | 10             | 415                          | 375                                            |

      2. Sparce matrices

      | Sparsity Level | Number of Quadratic Samples | Minimum Samples Required (Information Theory) |
      | -------------- | ----------------- | ------------------------------------ |
      | 45            | 45                | 105                                   |
      | 135           | 135               | 220                                   |
      | 180           | 180               | 288                                   |
      | 405           | 405               | 490                                   |

      3. Low-rank and Toeplitz matrices.

      |Rank of Matrix | Number of Quadratic Samples | Minimum Samples Required (Information Theory)|
      --- | --- | ---
      |5 | 5 | 15|
      |10 | 10 | 25|
      |15 | 15 | 30|
      |20 | 20 | 35|



  


## Contact
If you have any questions or issues regarding the code, feel free to reach out to me. I would be happy to help.
