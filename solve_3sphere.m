function [output] = solve_3sphere(c1,c2,c3,r1,r2,r3)
x = [c1(1),c2(1),c3(1)];
y = [c1(2),c2(2),c3(2)];
z = [c1(3),c2(3),c3(3)];
r = [r1,r2,r3];

A = zeros(1,3);
for i = 1:3
    A(i) = r(i)^2 - x(i)^2 - y(i)^2 - z(i)^2;
end

X = zeros(1,3);
Y = zeros(1,3);
Z = zeros(1,3);
for i = 1:3
    X(i) = x(i) - x(1);  
    Y(i) = y(i) - y(1);  
    Z(i) = z(i) - z(1);  
end

AA = zeros(1,3);
for i = 1:3
    AA(i) = -(A(i) - A(1))/2;
end

D = X(2) * Y(3)-Y(2) * X(3);

B0 = (AA(2) * Y(3) - AA(3) * Y(2)) / D;
B1 = (Y(2) * Z(3) - Y(3) * Z(2)) / D;
C0 = (AA(3) * X(2) - AA(2) * X(3)) / D;
C1 = (X(3) * Z(2) - X(2) * Z(3)) / D;

E = B1^2 + C1^2 + 1;
F = B1 * (B0 - x(1)) + C1 * (C0 - y(1)) - z(1);
G = (B0 - x(1))^2 + (C0 - y(1))^2 + z(1)^2 - r(1)^2;

out_z1 = (-F + (F^2 - E * G)^(1/2)) / E;
out_z2 = (-F - (F^2 - E * G)^(1/2)) / E;

output = [B0 + B1 * out_z1,C0 + C1 * out_z1,out_z1;
          B0 + B1 * out_z2,C0 + C1 * out_z2,out_z2];
end

