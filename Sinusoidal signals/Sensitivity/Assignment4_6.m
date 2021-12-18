P=tf(10,[1 2 5]);
C1=1;
C2=100;
Op=1;
L1=series(C1,P);
L2=series(C2,P);
S1=feedback(1,L1)
S2=feedback(1,L2)
% S=1/(1+H);
S_Op=tf(1,1)


bode(S1,S2,S_Op);
legend('S1','S2','S_Op');
