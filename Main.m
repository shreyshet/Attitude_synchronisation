%% Main File 
% Shreyansh Shethia
% Implementation of Control Law provided by 
% Yu, Yuanjin & Li, Zhenhong & Yang, Zhaohua & Ding, Zhengtao. (2019).
% in "Distributed Back-Stepping Consensus Protocol
% for Attitude Synchronization and Tracking 
% on Undirected Graphs and Unmanned Systems"

% 5 Satellites
% First Satellite is the Leader
clc 
clear
close all


%% Constants
g  = 9.80665 ;  % m/sec2
Iz = 200;      % kg-m2
Ix = 100;      % kg-m2
Iy = 100;      % kg-m2
I = diag([Ix,Iy,Iz]);
A = [0 1 0 0 1; 1 0 1 0 1; 0 1 0 1 0; 0 0 1 0 1; 1 1 0 1 0];


%% Initialization
par.N = 5;
N = par.N;
par.eta  = 100;
par.beta = 500;
par.alpha = 2;
par.J = I;
par.A = A;
w0 = zeros(3,N);%[ 0;0; omega];

for i = 1:N
    temp = (rand(4,1)-.5)*2;%[0;0;0];
    q0(:,i) = temp/norm(temp);
    
end
torque_dir(:,:,1) = [1 0 0; 0 1 0; 0 0 1];
torque_dir(:,:,2) = [1 0 0; 0 1 0; 0 0 1];
torque_dir(:,:,3) = [1 0 0; 0 1 0; 0 0 1];
torque_dir(:,:,4) = [1 0 0; 0 1 0; 0 0 1];
torque_dir(:,:,5) = [1 0 0; 0 1 0; 0 0 1];
par.torquedir = torque_dir;

X0 = [q0;w0];
X0 = reshape(X0,[N*7,1]);
%% Dynamics
tspan = [0, 5];
opt = odeset('RelTol',1e-2,'Stats','On');
% f = @(x) -x;
% X0 = 1;
% [t,x] = ode45(@(t,x) f(x),tspan,X0,opt);
[t,X]= ode45(@(t,X) dyn(t,X,par), tspan, X0,opt);

%%
%{
figure(1)
title('Euler Angles','Interpreter','latex');
hold on
grid minor
ylabel(' $\theta$, in Degrees ','Interpreter','latex'); 
xlabel(' Time in seconds ',  'Interpreter','latex');
% axis equal
plot(t,phi(:,1)*180/pi,'b','LineWidth',1.25);
%}