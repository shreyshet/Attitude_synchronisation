function R = RotMat(ang,i)

switch i
    case 3
         R = [cos(ang) ,sin(ang),0;
              -sin(ang),cos(ang),0;
                   0      ,0    ,1];
    case 1    
        R = [1 ,        0,        0;
             0 , cos(ang), sin(ang);
             0 ,-sin(ang), cos(ang)];
    case 2
        R = [  cos(ang),0,-sin(ang);
                  0    ,1,     0;
               sin(ang),0,cos(ang)];
end 
end