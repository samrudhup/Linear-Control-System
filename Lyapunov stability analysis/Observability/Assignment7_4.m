n=5;
m=1;
p=2;
A=[-14.5 -59.5 -149.5 -38.5 65
    1 0 0 0 0
    0 1 0 0 0
    0 0 1 0 0 
    0 0 0 1 0];
B=[ 1; 0; 0; 0; 0];
C=[ 0 0 0 100 500];
D=zeros(size(C,1), size(B,2));
OB=obsv(A,C);
rank_OB=rank(OB);
j=sqrt(-1);
cont_poles=[-15 -30 -50 -15+3j -15-3j];
obsv_poles =[-15+0j -7+3j -7-3j -6+0j 5.5+0j];
K2=place(A',C',obsv_poles);
K1=place(A,B,cont_poles);
L=K2';
A_obs = (A-L*C);
B_obs = [L (B - L*D)];
C_obs = eye(n); %why?
D_obs = zeros(size(C_obs,1),size(B_obs,2));

A_cl=[A-(B*K1) (B*K1)
    zeros(size(A)) A-L*C];
B_cl=[B; zeros(size(B))];
C_cl=[C zeros(size(C))];
D_cl=zeros(size(C_cl,1),size(B_cl,2));

x0=[1 1 1 1 1]';
x0_hat=[0 0 0 0 0]';
SYS=ss(A_cl,B_cl,C_cl,D_cl);
figure(1)
step(SYS)
hold on;
% figure(2)
stepinfo(SYS,'SettlingTimeThreshold',0.02)
Ts = 0.1;
t_final = 15;
time = [0:Ts:t_final]';

% sim('observer1')