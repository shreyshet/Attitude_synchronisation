function Sx= S(x)
% 
%    Given 3 X 1 vector x
%    This function gives the corss product skew symmetrix matrix; 

Sx =      [  0 , -x(3) ,  x(2);
           x(3),     0 , -x(1);
          -x(2),  x(1) ,     0];
      
end