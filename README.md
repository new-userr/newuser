**-------Scrambling-----
**

clc 
clear all
close all
m=input('Enter the message bits:');
L=input('Enter the length of shift register:');
r=zeros(1,L);   %Initilization of Shift Register
for i=1:length(m)
    m1(i)=xor(r(3),r(4));
    m2(i)=xor(m(i),m1(i));
     r(4)=r(3);
     r(3)=r(2);
     r(2)=r(1);
     r(1)=m2(i);
end
disp(m2)
r=zeros(1,L);
for i=1:length(m2)
    x1(i)=xor(r(3),r(4));
    x(i)=xor(m2(i),x1(i));
    r(4)=r(3);
    r(3)=r(2);
    r(2)=r(1);
    r(1)=x(i);
end
disp(x)
disp(r)







**------------SNR CALCULATION--------------------**
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




**--------------------------Sampling theorem------------------**
clc;
close all;
clear all;
disp('Verification of Sampling Theorem ');
Fm=input('Enter the modulating frequency Fm=');
A=input('Enter the amplitude A=');
t=0:0.1:10;
x=A*sin(2*3.14*Fm*t);
subplot(2,2,1);
plot(t,x);
title('Modulating Signal');
xlabel('Time');
ylabel('Amplitude');
Fs1=input('Enter the sampling frequency Fs1(Fs>2Fm)=');
n=0:0.2:5;
y1=A*sin(2*3.14*Fm*n/Fs1);
subplot(2,2,2);
stem(n,y1);
title('Fs>2Fm');
xlabel('n');
ylabel('Amplitude');
Fs2=input('Enter the sampling frequency Fs2(Fs=2Fm)==');
n=0:0.2:5;
y2=A*sin(2*3.14*Fm*n/Fs2);
subplot(2,2,3);
stem(n,y2);
title('Fs=2Fm');
xlabel('n');
ylabel('Amplitude');
Fs3=input('Enter the sampling frequency Fs3(Fs<2Fm)==');
n=0:0.2:5;
y3=A*sin(2*3.14*Fm*n/Fs3);
subplot(2,2,4);
stem(n,y3);
title('Fs<2Fm');
xlabel('n');
ylabel('Amplitude');

