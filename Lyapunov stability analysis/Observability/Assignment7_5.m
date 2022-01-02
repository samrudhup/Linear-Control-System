clc;
clear;
A=[0 1;-5 -2];
B=[ 0; 1];
C=rand(1,2);
D=zeros(size(C,1),size(B,2));
SS=ss(A,B,C,D);
t=[0:0.25:5];
x0=[-4 5];
U=2*sin(2*t)+5;
lsim(SS,U,t,x0);


