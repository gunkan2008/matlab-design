%%befordising
num = [0.00001685];
den = [1 0.00685 0.00002209];
Go = tf(num,den)
% ตรวจสอบ %OS , Ts ก่อนออกเเบบ
Gclose = feedback(Go,1);
step(Gclose)
%% After design
K = 6.22;
Gonew = K*tf([0.00001685],[1 0.00685 0.00002209]);
bode(Gonew)

Alpha = 0.553
T =  0.565
Kc = 11.247
Q = Alpha*T

%%
Gc = Kc*tf([1 1/T],[1 1/Q])
Go = tf([450],[5 650 280 0])
Go_after = Gc*Go;
Gclose_after = feedback(Go_after,1);

f1 = figure;
bode(Go_after)

f2 = figure;
step(Gclose_after)
