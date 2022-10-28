function [theta] = Paden_Kahan_3(p,q,r,delta,omega)
u = p - r;
v = q - r;

my_u = u - omega * dot(omega,u);
my_v = v - omega * dot(omega,v);
my_delta = sqrt(delta^2 - dot(omega,p-q)^2);

theta_0 = atan2(dot(omega,cross(my_u,my_v)),dot(my_u,my_v));
theta_1 = acos((norm(my_u)^2 + norm(my_v)^2 - my_delta^2)/(2 * norm(my_u) * norm(my_v)));

theta = [(theta_0 + theta_1) / pi * 180;
         (theta_0 - theta_1) / pi * 180];
end