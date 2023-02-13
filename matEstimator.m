clear;
clc;

% Setup Arguments

% Dimension of matrix
n = 40;

% number of quadratic samples
m = 39;

% Rank of the matrix
r = 2;

% Constants
l=sqrt(100);
e = 1;
mu = 0;
sigma = 1;

% Generate normal random matrix for quadratic sampling
a = normrnd(mu, sigma, n, m);

% Type of matrix to be generated
%       lr      -- low rank matrix
%       splr    -- sparse and low rank matrix
%       spsym   -- sparse and symmertic matrix
%       toplr   -- toeplitz and low rank matrix
matrixType = 'toplr';

% if you dare to add noise:
noise = false;

% Tolerance for optimization
tolerance = 1e-3;

% Choose matrix type based on input
switch matrixType
    case 'lr' % Low Rank
        [error, matrix] = LR(r, m, n, tolerance, noise);
    case 'splr' % Sparse Low Rank
        [error, matrix] = SPLR(l, m, n, r, tolerance, noise);
    case 'spsym'
        density = 0.05;
        rc = 0.01;
        kind = 1;
        [error, matrix] = SPSYM(m, n, tolerance, noise,density, rc, kind);
    case 'toplr'
        [error, matrix] = TOPLR(r, m, n, tolerance, noise);
    otherwise
        error('Invalid matrix type provided. Please choose from: lr, splr, flip, inverse.');
end

% Display error value
fprintf('Reconstruction error: %f \n', error)