%PCM system:-A signal of fm=3.5khz,transmission rate=50kbps,Compute the SNR. 
%The input signal has peak to peak value of 4v and rms value of 0.2v.
clc 
clear all
close all
r=50e3;
Vpp=4;
fs=8000;
n=7;         % r=n*fs, n-7 bits
q=128;       %q=2^7
del=0.03125;    %del=Vpp/q
Np=8.138e-5;    %Np=del^2/12
Sp=0.04;        %Signal power=(vrms^2)
SNR=Sp/Np;
SNRdb=10*log10(SNR);
disp("SNR in PCM System is==>");
disp(SNRdb);
%DM system:-A signal of fm=1khz,sampling rate=50khz,Compute the SNR. 
%The input signal has peak to peak value of 1v and banwidth of 5khz.
% Calculate minimum step size to minimize slope overload.
Am=1;
W=5000;
fm=1000;
fs=50e3;
Ts=1/fs;
delta=2*pi*fm*Ts*Am;
Sp=3;
Np=8*pi^2*W*fm^2*Ts^3;
snr=Sp/Np;
snrdb=10*log10(snr);
disp("SNR in DM System is==>");
disp(snrdb);