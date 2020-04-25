function Input = Torque(X,par)
% Function for Attitude dynamics
A = par.A;
N = par.N;
ni      = par.eta;
bi      = par.beta;
alphai  = par.alpha;
Ji      = par.J;
torque_dir = par.torquedir;
for i = 1:N
    Xi = X((i-1)*7+1: 7*i,1);
    qi = Xi(1:4,1);
    wi = Xi(5:7,1);   
    sumi = zeros(3,1);
    sumi_dot = zeros(3,1);
    for j = 1:N
        Xj = X((j-1)*7+1: 7*j,1);
        qj = Xj(1:4,1);
        wj = Xj(5:7,1);
        qij = qdiff(qi,qj);
        wij = wi - R(qij)*wj;
        qvij_dot = (S(qij(2:4)) + qij(1)*eye(3))*wij/2;
        sumi = sumi + A(i,j)*qij(2:4,:);
        sumi_dot = sumi_dot + A(i,j)*qvij_dot;
    end
    c = alphai*bi./(1+(bi*sumi).^2);
    Ti = -ni*(wi+alphai*atan(bi*sumi)) - sumi ...
        + S(wi)*Ji*wi - Ji*diag(c)*sumi_dot;
    Ti = torque_dir(:,:,i)*Ti;
    Input(:,i) = [zeros(4,1);Ti];
end
Input = reshape(Input,[7*N,1]);
end