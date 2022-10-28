function [theta] = Paden_Kahan_1(p,q,r,omega)
u = p - r;
v = q - r;

my_u = u - omega * dot(omega,u);
my_v = v - omega * dot(omega,v);

theta = atan2(dot(omega,cross(my_u,my_v)),dot(my_u,my_v)) / pi * 180;
end

