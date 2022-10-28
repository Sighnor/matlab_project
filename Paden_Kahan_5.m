function [theta] = Paden_Kahan_5(p,q,delta,omega)
u = q - p;

a = dot(omega,u);
b = norm(u - omega * a);
c = sqrt(delta^2 - b^2);

theta = [(a + c) / pi * 180;
         (a - c) / pi * 180];
end