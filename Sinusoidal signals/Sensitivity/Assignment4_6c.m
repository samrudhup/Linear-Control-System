P=tf(10,[1 2 5]);
C1=1;
C2=100;
% Op=1;
L1=series(C1,P);
L2=series(C2,P);
% H1=feedback(L1,1)
% H2=feedback(L2,1)
% S=1/(1+H);
figure(1)
bode(L1,L2);
figure(2)
nyquist(L1,L2);
legend('L1','L2');
[G1m,P1m,W1pc,W1gc]=margin(L1)
[G2m,P2m,W2pc,W2gc]=margin(L2)