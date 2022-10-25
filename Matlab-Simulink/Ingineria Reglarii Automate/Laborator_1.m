Hf = tf(5,[2 1]);

Hr = 1;
Ho = feedback(Hf*Hr,1);
subplot(4,2,1)
step(Ho);
t = 0:0.01:10;
u = 0:0.01:10;
subplot(4,2,2)
lsim(Ho,u,t);

Hr = 2;
Ho = feedback(Hf*Hr,1);
subplot(4,2,3)
step(Ho);
t = 0:0.01:10;
u = 0:0.01:10;
subplot(4,2,4)
lsim(Ho,u,t);

Hr = 5;
Ho = feedback(Hf*Hr,1);
subplot(4,2,5)
step(Ho);
t = 0:0.01:10;
u = 0:0.01:10;
subplot(4,2,6)
lsim(Ho,u,t);

Hr = tf([2 1],[1 0]);
Ho = feedback(Hf*Hr, 1);
subplot(4,2,7)
step(Ho);
t = 0:0.01:10;
u = 0:0.01:10;
subplot(4,2,8)
lsim(Ho,u,t);