figure; 
L0 = tf([20],[1 2 -10]);
figure(1)
margin(L0)
figure(2)
nyquist(L0);
L = 0.49*L0;
H=feedback(L,1); 
[z,p,k]=zpkdata(H,'v'); 
