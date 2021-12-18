L=tf(0.1,[1 2.1 1.2 0.1]);
figure(1);
bode(L)
figure(2);
nyquist(L)
[Gm,Pm,Wpc,Wgc]=margin(L)