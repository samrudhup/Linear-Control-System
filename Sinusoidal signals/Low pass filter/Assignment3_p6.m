[n,d]=butter(2,10,'low','s');
F=tf(n,d);
bode(F)