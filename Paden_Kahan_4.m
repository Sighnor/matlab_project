function [theta] = Paden_Kahan_4(p,q1,q2,r,delta1,delta2,omega1,omega2)
          
q = solve_3sphere(r,q1,q2,norm(p - r),delta1,delta2);

theta = Paden_Kahan_2(p,q(1:1,:).',r,omega1,omega2);
     
end