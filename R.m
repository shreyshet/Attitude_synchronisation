function Rq= R(q)
% This function gives the Direction cosine matrix from quarternion q; 
q0 = q(1);
qv = q(2:4);
Rq =  (q0^2 - qv'*qv)*eye(3) + 2*(qv*qv') - 2*q0*S(qv);
end