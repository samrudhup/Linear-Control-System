L=tf([202.5 202.5],[1 20 126 340 800]);
figure(1);
bode(L);
figure(2);
nyquist(L);
[Gm,Pm,Wpc,Wgc]=margin(L)