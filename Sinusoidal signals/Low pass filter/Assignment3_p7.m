PD=tf([1 1],1);
bode(PD);
xlim([1 10]);

hold on;

a=90;
LD=tf([a a],[1 a]);
bode(LD);
xlim([1 10]);