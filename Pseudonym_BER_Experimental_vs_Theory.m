close all;
clear all;

% PURPOSE: Compare theory vs experimental results
% Calculates the theoretical probability of error in Eq.(11) and (15) of
% the paper.
% We use the heuristic approach to determine the threshold

Eb_No_dB = -20:(1/3):-5;

% number of OFDM samples per pseudonym bit
N = 6000;

% m is the modulation index or percent of amplitude modulation on the OFDM signal

for i = 1:length(Eb_No_dB)
    
    M = 4; % for our experiment where we sent QPSK signals over OFDM Channels
    Es_No = log2(M)*10^(Eb_No_dB(i)/10);
      
    m = 0.1; 
    
    % computes the lambda and beta in Eq. (11) in the IEEE_ICC2024
    % Pseudonymetry paper.
    lamda = 1+2*Es_No*(1+m^2)+(1-m^2)^2*Es_No^2;
    beta = 1+Es_No*(1+m^2);
    
    % Calculate the value inside the Q function in Eq. (15)
    k0 = lamda/(beta*(1+((1-m)^2)*Es_No));
    k1 = lamda/(beta*(1+((1+m)^2)*Es_No));

    % Calculate the average pseudonym bit error in Eq. (15)
    y1(i) = 0.5*(qfunc((k0-1)*sqrt(N)) + qfunc((1-k1)*sqrt(N)));


    m = 0.2; 
    lamda = 1+2*Es_No*(1+m^2)+(1-m^2)^2*Es_No^2;
    beta = 1+Es_No*(1+m^2);

    k0 = lamda/(beta*(1+((1-m)^2)*Es_No));
    k1 = lamda/(beta*(1+((1+m)^2)*Es_No));

    y2(i) = 0.5*(qfunc((k0-1)*sqrt(N)) + qfunc((1-k1)*sqrt(N)));

    m = 0.3;
    lamda = 1+2*Es_No*(1+m^2)+(1-m^2)^2*Es_No^2;
    beta = 1+Es_No*(1+m^2);

    k0 = lamda/(beta*(1+((1-m)^2)*Es_No));
    k1 = lamda/(beta*(1+((1+m)^2)*Es_No));

    y3(i) = 0.5*(qfunc((k0-1)*sqrt(N)) + qfunc((1-k1)*sqrt(N)));
end

figure()

% m = 0.1
semilogy(Eb_No_dB, y1,'r', 'LineWidth',1);
hold on

x = [-20,-19,-18,-17,-16,-15,-14,-13,-12, -11, -10, -9, -8];
pb_error = [3.87e-01,3.87e-01,3.60e-01,2.72e-01,2.26e-01,1.91e-01,1.39e-01,7.6e-02,4.4e-02,1.90e-02,4.0e-03,1.22e-03,8e-05];
semilogy(x, pb_error,'r--o', 'LineWidth',1);
hold on

% m = 0.2
semilogy(Eb_No_dB, y2,'b', 'LineWidth',1);
hold on

x = [-20,-19,-18,-17,-16,-15,-14,-13,-12, -11];
pb_error = [2.399e-01,2.255e-01,1.655e-01,1.144e-01,6.872e-02,2.995e-02,1.165e-02,2.204e-03,1.800e-04,2.000e-05];
semilogy(x, pb_error,'b--o', 'LineWidth',1);
hold on

% m = 0.3
semilogy(Eb_No_dB, y3,'k', 'LineWidth',1);
hold on

x = [-20,-19,-18,-17,-16,-15,-14,-13, -12];
pb_error = [1.848e-01, 1.254e-01, 8.689e-02, 4.357e-02, 1.467e-02,4.425e-03, 4.650e-04, 1.500e-05, 0.000];
semilogy(x, pb_error,'k--o', 'LineWidth',1);
hold off

grid
set(gca,'FontSize',14)
set(gca,'ylim',[10^-5, 1])
set(gca,'xlim',[-20, -5])
xlabel('Eb/No [dB] at Passive RX')
ylabel('P[Pseudonym Bit Error at Passive RX]')
legend('10% Theory','10% Exp.','20% Theory','20% Exp.','30% Theory','30% Exp.')
title('Pseudonym BER: Theorey vs Experimental Results')

