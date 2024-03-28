close all;
clear all;

% PURPOSE: Compare performance of three threshold computation mechanisms. 
% Heuristic
% EM
% Ideal
% Performance measure: probability of pseudonym bit error Vs Eb/No
% Experimental data are imported from Pseudonymetry_RX.ipynb

figure()
% m = 0.1 where m is the modulation index

x = [-20,-19,-18,-17,-16,-15,-14,-13,-12,-11,-10,-9,-8];

% Heauristic approach to Threshold Estimation
pb_error = [3.87e-01,3.87e-01,3.60e-01,2.72e-01,2.26e-01,1.91e-01,1.39e-01,7.6e-02,4.4e-02,1.90e-02,4.0e-03,1.22e-03,8e-05];
semilogy(x, pb_error,'r--d', 'LineWidth',1);
hold on

% Expectation Maximization
pb_error = [4.086e-01,3.916e-01,3.834e-01,2.955e-01,2.608e-01,2.254e-01,1.672e-01,9.7410e-02,5.994e-02,2.566e-02,6.162e-03, 1.901e-03, 3.000e-04];
semilogy(x, pb_error,'r-.p', 'LineWidth',1);
hold on

% Ideal 
pb_error = [4.010e-01, 3.600e-01, 3.243e-01, 2.813e-01, 2.388e-01,1.997e-01, 1.407e-01, 7.819e-02, 4.542e-02, 2.077e-02,4.882e-03, 1.240e-03, 8.000e-05];
semilogy(x, pb_error,'r-', 'LineWidth',1);
hold on

% m = 0.2
x = [-20,-19,-18,-17,-16,-15,-14,-13,-12,-11];

% Heauristic approach to Threshold Estimation
pb_error = [2.399e-01,2.255e-01,1.655e-01,1.144e-01,6.872e-02,2.995e-02,1.165e-02,2.204e-03,1.800e-04,2.000e-05];
semilogy(x, pb_error,'b--d', 'LineWidth',1);
hold on

% Expectation Maximization
pb_error = [2.514e-01, 2.386e-01, 1.950e-01, 1.428e-01, 9.054e-02,3.981e-02,1.563e-02,3.005e-03, 4.600e-04, 0.000];
semilogy(x, pb_error,'b-.p', 'LineWidth',1);
hold on

% Ideal
pb_error = [2.379e-01, 2.321e-01, 1.709e-01, 1.196e-01, 7.030e-02,3.106e-02, 1.243e-02, 5.008e-03, 2.800e-04, 4.000e-05];
semilogy(x, pb_error,'b-', 'LineWidth',1);
hold on

% m = 0.3
x = [-20,-19,-18,-17,-16,-15,-14,-13,-12];

% Heauristic approach to Threshold Estimation
pb_error = [1.848e-01, 1.254e-01, 8.689e-02, 4.357e-02, 1.467e-02,4.425e-03, 4.650e-04, 1.500e-05, 0.000];
semilogy(x, pb_error,'k--d', 'LineWidth',1);
hold on

% Expectation Maximization
pb_error = [2.157e-01, 1.565e-01, 1.129e-01, 5.549e-02, 1.923e-02,6.300e-03, 8.000e-04, 6.000e-05, 0.000];
semilogy(x, pb_error,'k-.p', 'LineWidth',1);
hold on

% Ideal
pb_error = [1.874e-01, 1.296e-01, 8.994e-02, 4.432e-02, 1.578e-02,4.755e-03, 5.400e-04, 1.500e-05, 0.000];
semilogy(x, pb_error,'k-', 'LineWidth',1);
hold off

grid
set(gca,'FontSize',14)
set(gca,'ylim',[10^-4, 1])
set(gca,'xlim',[-20, -5])
xlabel('Eb/No [dB] at Passive RX')
ylabel('P[Pseudonym Bit Error at Passive RX]')
legend('10% Heuristic','10% EM','10% Ideal','20% Heuristic','20% EM','20% Ideal','30% Heuristic','30% EM','30% Ideal')
title('Comparison')


