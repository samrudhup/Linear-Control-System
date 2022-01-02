TF=tf([10 450 250],[1 1 0])
SYS=ss(TF)
TS=1.25*exp(-3)
SYSD=c2d(SYS,TS,'zoh')
