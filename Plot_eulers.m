close all

% for i = 1:N
%     [y(:,i),p(:,i),r(:,i)] = quat2angle(X(:,7*(i-1) + 1: 7*i-3));
%     w1(:,i) = X(:,7*(i-1) + 5);
%     w2(:,i) = X(:,7*(i-1) + 6);
%     w3(:,i) = X(:,7*(i-1) + 7);
% end
tsmall = t(find(t<1.5));
l = length(tsmall);
%%
figure
sgt = sgtitle('Angular Rate of 5 Agents with time','Interpreter','latex');
sgt.FontSize = 20;
subplot(3,1,1)
hold on
box on
plot(tsmall,w1(1:l,:)*180/pi,'LineWidth',1)
ylabel(' $\omega_1$, in $(^o)$ per sec ','Interpreter','latex'); 
xlabel(' Time in seconds ',  'Interpreter','latex');
legend({'i = 1','i = 2','i = 3','i = 4','i = 5'})
grid minor
box on

subplot(3,1,2)
hold on
plot(tsmall,w2(1:l,:)*180/pi,'LineWidth',1)
ylabel(' $\omega_2$, in $(^o)$ per sec ','Interpreter','latex'); 
xlabel(' Time in seconds ',  'Interpreter','latex');
legend({'i = 1','i = 2','i = 3','i = 4','i = 5'})
grid minor
box on

subplot(3,1,3)
hold on
plot(tsmall,w3(1:l,:)*180/pi,'LineWidth',1)
ylabel('$\omega_3$, in $(^o)$ per sec ','Interpreter','latex'); 
xlabel(' Time in seconds ',  'Interpreter','latex');
legend({'i = 1','i = 2','i = 3','i = 4','i = 5'})
grid minor
box on
%%
figure
sgt = sgtitle('Attitude of 5 Agents with time, represented with Euler angles','Interpreter','latex');
sgt.FontSize = 20;
subplot(3,1,1)
hold on
plot(tsmall,y(1:l,:)*180/pi,'LineWidth',1)
ylabel(' $\psi$, Yaw in Degrees ','Interpreter','latex'); 
xlabel(' Time in seconds ',  'Interpreter','latex');
legend({'i = 1','i = 2','i = 3','i = 4','i = 5'})
grid minor
box on

subplot(3,1,2)
hold on
plot(tsmall,p(1:l,:)*180/pi,'LineWidth',1)
ylabel(' $\theta$, Pitch in Degrees ','Interpreter','latex'); 
xlabel(' Time in seconds ',  'Interpreter','latex');
legend({'i = 1','i = 2','i = 3','i = 4','i = 5'})
grid minor
box on

subplot(3,1,3)
hold on
plot(tsmall,r(1:l,:)*180/pi,'LineWidth',1)
ylabel(' $\phi$, Roll in Degrees ','Interpreter','latex'); 
xlabel(' Time in seconds ',  'Interpreter','latex');
legend({'i = 1','i = 2','i = 3','i = 4','i = 5'})
grid minor
box on