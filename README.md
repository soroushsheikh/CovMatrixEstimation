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


## Results

In this project, the quality of the covariance matrix reconstruction is evaluated using the normalized mean square error (NMSE) as the metric. The following results are obtained:

1. In order to evaluate the performance of the reconstruction process, the normalized mean square error (NMSE) was utilized as the evaluation metric. This metric was plotted over the number of measurements for both low rank matrices and sparse matrices. For low rank matrices, the NMSE was plotted for different ranks of matrices, which allows us to see the accuracy of the reconstruction for different ranks. On the other hand, for sparse matrices, the NMSE was plotted over different sparsity levels, showcasing the robustness of the reconstruction for different levels of sparsity. 

3. The robustness of the reconstruction against noise is also evaluated by plotting the NMSE for different levels of noise introduced. we used the fixed sparsity level of `k=180` and rank `r=5` for this experiment.

4. A table is provided to show the number of measurements obtained using quadratic sampling and the number of samples needed for full reconstruction based on the information theory limitation, with a tolerance level of 0.01. This demonstrates the efficiency of the quadratic sampling method.


## Contact
If you have any questions or issues regarding the code, feel free to reach out to me. I would be happy to help.
