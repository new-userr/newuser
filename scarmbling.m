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
    r(1)=m2(i);
end
disp(x)