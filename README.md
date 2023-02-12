# Exact and Stable Covariance Estimation from Quadratic Sampling
This project is based on the paper "Exact and Stable Covariance Estimation from Quadratic Sampling via Convex Programming" by Goldsmith et al. The paper proposes a method for estimating the covariance matrix of a high-dimensional random vector. The method relies on quadratic sampling, which involves taking inner products of random projections of the vector. The authors formulate the covariance estimation problem as a convex optimization problem, and show that their method provides an exact and stable estimate of the covariance matrix, even in the presence of high levels of measurement noise.

The project provides code to implement the method described in the paper, and to simulate the performance of the method in a variety of scenarios. The code includes functions for performing the quadratic sampling, solving the convex optimization problem, and evaluating the accuracy of the resulting covariance estimate. Additionally, the code includes code for generating plots that illustrate the performance of the method, such as the relationship between the number of measurements and the accuracy of the covariance estimate.

The code is written in MATLAB, and is intended for researchers and practitioners who are interested in studying or applying the method described in the paper. The project includes detailed documentation, including an overview of the code, instructions for running the code, and explanations of the key algorithms and methods used in the project.

## Requirements
- MATLAB
- CVX

## Usage
- Clone the repository or download the zip file
- Run the MATLAB codes to replicate the results
- The provided codes are examples to show the implementation of the algorithm. You can use them as a reference to implement the algorithm for your own use case.

## Examples
- Example 1: Reconstructing covariance matrix using the low-rank approximation method
- Example 2: Reconstructing covariance matrix using different noise levels 

## Contact
If you have any questions or issues regarding the code, feel free to reach out to me. I would be happy to help.
