j=sqrt(-1);
A=[0 1;0 0];
B=[0; 1];
C=eye(2);
D=[0]
P=[-5+2*j -5-2*j];
K=place(A,B,P)
Acl=(A-B*K);
Bcl=zeros(2,1);
Ccl=zeros(1,2);
Dcl=zeros(1,1);
sys=ss(Acl,Bcl,Ccl,Dcl);
t=[0:0.1:100];
u=zeros(length(t),1);
x0=[10,10]';
lsim(sys,u,t)
hold on;
lsim(sys,u,t,x0)