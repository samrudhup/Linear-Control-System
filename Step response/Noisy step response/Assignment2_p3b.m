load NoisyStepResponse(b)
vi=input(:,1);
vo=output(:,1);
vi(1)=0;
tv=time(:,1);

[ti,ia,ic] = uniquetol(tv, 4.8E-7);                             % Get Unique Times
vi = vi(ia);                                                    % Corresponding Input Voltages
vo = vo(ia);                                                    % Corresponding Output Voltages
Ts = mean(diff(ti));                                            % Sampling Interval (sec)

dataobj=iddata(vo,vi,Ts);
tfobj=tfest(dataobj,2,1);
TF=tf(tfobj)
[z,p,k]=zpkdata(TF,'v')

figure(1)
plot(ti,vi,ti,vo)
hold on 
t=-10:Ts:30;
step(TF,t,'b.');

