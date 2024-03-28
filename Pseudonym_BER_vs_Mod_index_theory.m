close all;
clear all;

% This Algorithm implements the theoretical probability of pseudonym bit
% error at the passive receiver. 
% We compare the probability of error at three modulation indexes.

Eb_No_dB = -20:(1/3):-5; % range of Eb/No for simulation

% number of OFDM samples per pseudonym bit
N = 6000;

% Loops through each Eb/No and computes the probability of pseudonym bit
% error.
for i = 1:length(Eb_No_dB)
    
    M = 4; % We transmit QPSK signals over OFDM Channels
    Es_No = log2(M)*10^(Eb_No_dB(i)/10);
      
    m = 0.1; % Modulation index
    
    % computes the lambda and beta in Eq. (11) in the IEEE_ICC2024
    % Pseudonymetry paper.
    lamda = 1+2*Es_No*(1+m^2)+(1-m^2)^2*Es_No^2;
    beta = 1+Es_No*(1+m^2);
    
    % Calculate the value inside the Q function in Eq. (15)
    k0 = lamda/(beta*(1+((1-m)^2)*Es_No)); % Error in pseudonym bit '0'
    k1 = lamda/(beta*(1+((1+m)^2)*Es_No)); % Error in pseudonym bit '1'

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
semilogy(Eb_No_dB, y1,'k', 'LineWidth',2);
hold on

% m = 0.2
semilogy(Eb_No_dB, y2,'b', 'LineWidth',2);
hold on

% m = 0.3
semilogy(Eb_No_dB, y3,'r', 'LineWidth',2);
hold off

grid
set(gca,'FontSize',14)
set(gca,'ylim',[10^-5, 1])
set(gca,'xlim',[-20, -5])
xlabel('Eb/No [dB] at Passive RX')
ylabel('P[Pseudonym Bit Error at Passive RX]')
legend('10% Modulation','20% Modulation','30% Modulation')
title("Pseudonym BER vs Eb/No at three modulation indexes")


