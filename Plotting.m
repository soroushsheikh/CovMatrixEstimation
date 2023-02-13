clear all;
clc;

% Define the dimension of the matrix
n = 35;

% Define the rank of the matrix
r = 5;

% Define the step size for the number of measurements
step = 30;

% Define the maximum number of measurements
endp = 600;

% Create a vector of measurement numbers
measurement_numbers = 1:step:endp;

% Create a matrix to store the NMSE values
nmse = zeros(4, (endp/step)+1);

% Loop through different noise levels
for hh = [1, 2, 3, 4]
% Calculate the noise level
    e = 10^(-hh);

    % Loop through 15 trials
    for p = 1:15
        for k = 1:step:endp
            % Calculate the NMSE for a given number of measurements
            errmat(1, k) = LR(r, k, n, e, false);
        end

        % Store the NMSE values in the matrix
        for k = 0:(endp/step)-1
            nmse(hh, k+1) = nmse(hh, k+1) + errmat(1, 1+k*step);
        end
    end

    % Average the NMSE values over the trials
    nmse(hh, :) = nmse(hh, :) / p;
end

% Plot the NMSE values
figure;
semilogy(measurement_numbers, nmse(1,:), measurement_numbers, nmse(2,:), 'r', measurement_numbers, nmse(3,:), 'b', measurement_numbers, nmse(4,:), 'k')
title('NMSE Respected to Number of Measurements for Different Noise Levels')
xlabel('Number of Measurements')
ylabel('NMSE')
legend('Noise Level 1', 'Noise Level 3', 'Noise Level 5', 'Noise Level 10')




