clc
clear
load('dataForSineSweepID.mat')
u_inp=inputMat(10,1:end);
y_out=outputMat(10,1:end);
time=(0:0.0112:55.9888);
% u_db=20*log10(u_inp);
% y_db=20*log10(y_out);
plot(time,u_inp, time,y_out);
ylabel('|G|jw|in db');
xlabel('time');

gains=[1.037 1.083 1.169 1.3509 1.98 5.02 1.1128 0.39 0.17 0.085];
gainindB=20.*log10(gains);
T=(2.*pi./ freqVec);
tau=[0.065 0.037 0.045 0.09 0.3 0.41 0.45 0.35 0.26 0.19];
phases=(-pi./(T./2)).*tau.*180./pi;

figure
nexttile
semilogx(freqVec,gainindB,'Bo');
hold on;
semilodx(freqVec,phases,'Bo');

