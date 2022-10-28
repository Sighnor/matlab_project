function [theta] = Paden_Kahan_2(p,q,r,omega1,omega2)
u = p - r;
v = q - r;

my_dot = dot(omega1,omega2);
my_cross = cross(omega1,omega2);

alpha = (my_dot*dot(omega2,u)-dot(omega1,v))/(my_dot^2-1);
beta = (my_dot*dot(omega1,v)-dot(omega2,u))/(my_dot^2-1);
gamma = sqrt((norm(u)^2-alpha^2-beta^2-2*alpha*beta*my_dot)/(norm(my_cross)^2));

z1 = alpha * omega1 + beta * omega2 + gamma * my_cross;
z2 = alpha * omega1 + beta * omega2 - gamma * my_cross;

c_1 = z1 + r;
c_2 = z2 + r;

theta = [Paden_Kahan_1(c_1,q,r,omega1);
         Paden_Kahan_1(p,c_1,r,omega2);
         Paden_Kahan_1(c_2,q,r,omega1);
         Paden_Kahan_1(p,c_2,r,omega2)];
end