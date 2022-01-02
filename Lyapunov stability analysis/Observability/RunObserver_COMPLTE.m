% Example of using Simulink to simulate a Luenberger state
% observer. Plant mode and initial conditions are specified.
% You have to design the observer gain, define the state
% space model of the observer, and then run the simulink
% model 'observer'. The code to plot the results is included at
% the end.
% Prabir Barooah

clear all

%% Define system matrices: don't touch this part!

n = 4;
p = 1;
m = 2;

A = [  17.3779  -31.0041    1.3281   -6.5231
   10.5610  -18.9222    0.6169   -4.0142
    5.6433   -9.1235    0.8990   -1.8045
    4.4196   -6.3359    2.8228   -0.5547];
B = rand(n,m);
D = randn(p,m);

C =    [0.1769    0.9574    0.2653    0.9246];
xinit = randn(n,1);


% check observability:
% OB = obsv(A,C);
% rank(OB)

%% this is the part that you have to do!
% -----------------------------------------
% design observer gain L
j=sqrt(-1);
obsv_poles =[-5+2j -5-2j -6+0j -5.2+0j];
K=place(A',C',obsv_poles);
L=K';%choose eigenvalues of A-LC
%compute L by using 'place' command here

% initialize state of the observer
xhat_init = randn(4,1); %or use something else if you prefer

%define system matrices for the observer
A_obs = (A-L*C);
B_obs = [L (B - L*D)];
C_obs = eye(n); %why?
D_obs = zeros(size(C_obs,1),size(B_obs,2));
% -----------------------------------------




%% define plant inputs - right now I am choosing it arbitrarily:
% you are welcome to change this to something else 

Ts = 0.1;
t_final = 15;
time = [0:Ts:t_final]';


u1 = 0.2*sin(2*pi*2*time);
u2 = 0.1*sin(2*pi*7*time)-0.1*sin(2*pi*1*time-pi/5);
u  = cat(2,u1,u2);
u_data = cat(2,time,u);

%% call simulink %%

%comment out one of the following lines depending on the version of
%matlab/simulink you are using
sim('observer'); 
 
 
 
 
 
% uncomment previous line if you want to call
% the simulink model from within this script. Then you don't
% have to go back to the simulink windown and hit the
% 'run' button

%% the simulation is complete


%verify:
xout.signals(1)%observer state?
xout.signals(2)%plant state?

xhat_hist = xout.signals(1).values;
x_hist = xout.signals(2).values;
time_sim = xout.time;

figure

for ii=1:n
    
    subplot(ceil(n/2),2,ii)
    plot(time_sim,x_hist(:,ii),'b');
    hold on;
    plot(time_sim,xhat_hist(:,ii),'r--');
    legend(['x(',num2str(ii),')'],['x-hat (',num2str(ii),')']);    
end

