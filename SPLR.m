function [estimated_error,reconstructedCovMat] = SPSYM(l,m,n, r, error, noise)
% SPLR: function to estimate the sparse covariance matrix using sparse quadratic sampling
%
% Inputs:
% l: sparsity degree
% m: number of sparse quadratic samples
% n: size of the covariance matrix
% error: tolerance value for optimization
% r: rank of sparse low-rank matrix
%
% Outputs:
% estimated_error: error between the estimated and true covariance matrix
% reconstructedCovMat: the reconstructed covariance matrix

% Set up the mean and standard deviation
mu=0 ;
sigma=1 ;

% Generate random sparse quadratic samples
a = normrnd(mu,sigma,n,m);

% Set up the sparse low-rank matrix
L = normrnd(mu,sigma,l,r);
Sigk=L*L';
Sig=zeros(n,n);
Sig([1:l]',[1:l]')= Sigk;

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

% Perform sparse quadratic sampling
A = zeros(n, n, m);
y = zeros(m, 1);
for k = 1:m
    T = zeros(n, 1);
    T(:, 1) = a(:, k);
    A(:, :, k) = T * T';
    y(k, 1) = T' * Sig * T;
end

% Optimization
cvx_begin
    variable reconstructedCovMat(n,n) semidefinite
    expression T(n,1)
    expression b(n,m)
    minimize(norm(reconstructedCovMat,1))
    subject to
        for k = 1:m
            b = a(:, k);
            A2(k, 1) = b' * reconstructedCovMat * b;
        end
        norm(y - A2, 1) / norm(y, 1) <= error;
cvx_end

% Calculate the error between the estimated and true covariance matrix
estimated_error = norm(reconstructedCovMat - Sig, 'fro') / norm(Sig, 'fro');
end
