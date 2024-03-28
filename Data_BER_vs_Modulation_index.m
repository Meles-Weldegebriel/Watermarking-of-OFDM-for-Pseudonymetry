close all;
clear all;
% PURSOSE: Study the impact of PAM modulation on the OFDM data detection
% We implement Eq. (17) of the IEEE ICC 2024 paper
% m is the modulation index. It measures how much change we make to the
% original OFDM signal during watermarking.

SNR_dB = 5:(1/3):15;
for i = 1:length(SNR_dB)
    SNR = 10^(SNR_dB(i)/10);
    m = 0;
    Qpsk(i) = (qfunc(sqrt(2*SNR*(1-m)^2))+qfunc(sqrt(2*SNR*(1+m)^2)))/2;
    
    m = 0.1;
    Qpsk1(i) = (qfunc(sqrt(2*SNR*(1-m)^2))+qfunc(sqrt(2*SNR*(1+m)^2)))/2;
    
    m = 0.2;
    Qpsk2(i) = (qfunc(sqrt(2*SNR*(1-m)^2))+qfunc(sqrt(2*SNR*(1+m)^2)))/2;
   
    m = 0.3;
    Qpsk3(i) = (qfunc(sqrt(2*SNR*(1-m)^2))+qfunc(sqrt(2*SNR*(1+m)^2)))/2; 
end

figure(1)
semilogy(SNR_dB, Qpsk3,'g', 'LineWidth',2);
hold on
semilogy(SNR_dB, Qpsk2,'b', 'LineWidth',2);
hold on
semilogy(SNR_dB, Qpsk1,'r', 'LineWidth',2);
hold on
semilogy(SNR_dB, Qpsk,'k', 'LineWidth',2);
hold off

grid
set(gca,'FontSize',14)
set(gca,'ylim',[10^-8, 10^-1])
set(gca,'xlim',[5, 15])
xlabel('Eb/No [dB] at Intended RX')
ylabel('P[Probability of Data Bit Error]')
legend('30% Modulation','20% Modulation','10% Modulation','Unwatermarked OFDM')
title("Impact of watermarking on data demodulation")
