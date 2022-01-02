clc;
clear;
A=[0 1;-5 -2];
B=[0; 1];
C=[1 0];
D=zeros(size(C,1),size(B,2));
SS=ss(A,B,C,D);
% time=[0:0.25:10];

Ts = 0.05;%time step
time = [0:Ts:10];%array of time points

x_init=[-4; 5];

U=2*sin(2*time)+5;
junk = find(time>=1); index1sec = junk(1);

u  = zeros(1,length(time));
u(index1sec:end) = 2*sin(2*time(index1sec:end))+5;
x_euler = zeros(2,length(time)+1);%intialize for storage
x_euler(:,1) = x_init;
x_now = x_init;
x_euler(:,1) = x_init;
for t_index = 1:length(time)
    u_now = u(t_index); %read u(t)
x_next = (eye(2)+Ts*A)*x_now + Ts*B*u_now; % Euler approx
x_euler(:,t_index+1) = x_next; %store state
x_now = x_next; %update state
end;
y_euler = C*x_euler(:,1:length(time)); % y = Cx+Du
figure
h=lsim(SS,U,time,x_init);
plot(time,h,'go:')

hold on;

plot(time,y_euler,'bo:');


