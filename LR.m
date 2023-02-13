function [estimated_error, reconstructedCovMat] = LR(r, m, n, tolerance, noise)
% LR: function to estimate the covariance matrix using quadratic sampling
%
% Inputs:
% r: rank of low-rank matrix
% m: number of quadratic samples
% n: size of the covariance matrix
% tolerance: tolerance value for optimization
%
% Outputs:
% estimated_error: error between the estimated and true covariance matrix
% reconstructedCovMat: the reconstructed covariance matrix

% Set up the low-rank matrix
mu = 0;
sigma = 1;
quadSamples = normrnd(mu, sigma, n, m);
lowRankMat = normrnd(mu, sigma, n, r);
trueCovMat = lowRankMat * lowRankMat';

% Adding noise
if noise
    for k=1:n*m
        if a(k)>0
            a(k)=a(k)+1;
        elseif a(k)<0
            a(k)=a(k)-1;
        end
    end
end

% Perform quadratic sampling
A = zeros(n, n, m);
y = zeros(m, 1);
for k = 1:m
    T = zeros(n, 1);
    T(:, 1) = quadSamples(:, k);
    A(:, :, k) = T * T';
    y(k, 1) = T' * trueCovMat * T;
end

% Optimization
cvx_begin
    variable reconstructedCovMat(n, n) semidefinite
    expression T(n, 1)
    expression b(n, m)
    minimize(trace(reconstructedCovMat))
    subject to
    for k = 1:m
        b = quadSamples(:, k);
        A2(k, 1) = b' * reconstructedCovMat * b;
    end
    norm(y - A2, 1)/norm(y, 1) <= tolerance;
cvx_end

% Calculate the error between the estimated and true covariance matrix
estimated_error = (norm(reconstructedCovMat - trueCovMat, 'fro')/norm(trueCovMat, 'fro'))^2;
end