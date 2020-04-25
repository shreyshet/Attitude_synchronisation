function Dyn = dyn(t,X,par)
% Function for Attitude dynamics
I = par.J;
N = par.N;
Tc = Torque(X,par);
t
for i = 1:N
    Xi = X((i-1)*7+1: 7*i,1);
    qi = Xi(1:4,1);
    wi = Xi(5:7,1);
    q0i = qi(1);
    qvi = qi(2:4);
    qi_dot = [-qvi'*wi/2; (S(qvi)+q0i*eye(3))*wi/2];
    wi_dot = I^(-1)*(-S(wi)*I*wi);
    Dyn(:,i) = [qi_dot; wi_dot];
end
Dyn = reshape(Dyn,[N*7,1]) + Tc;
end