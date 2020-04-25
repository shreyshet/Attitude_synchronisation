function qij = qdiff(qi,qj)
% qij = qdiff(qi,qj) = qj^-1*qi;
%strictly considering q(2:4) as Vector part and q(1) as scalar 
q0i = qi(1); qvi = qi(2:4);
q0j = qj(1); qvj = qj(2:4);
qij = [qi'*qj;   q0j*qvi - q0i*qvj + S(qvi)*qvj];
end