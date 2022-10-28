function [P] = robot_delta(theta1,theta2,theta3)

R = 200;
r = 45;
L = 350;
l = 800;
alpha = [0/6*pi,4/6*pi,-4/6*pi];
theta = [theta1*pi/180,theta2*pi/180,theta3*pi/180];

C1 = [((R - r + L * cos(theta(1))) * cos(alpha(1))),((R - r + L * cos(theta(1))) * sin(alpha(1))),-L * sin(theta(1))];
C2 = [((R - r + L * cos(theta(2))) * cos(alpha(2))),((R - r + L * cos(theta(2))) * sin(alpha(2))),-L * sin(theta(2))];
C3 = [((R - r + L * cos(theta(3))) * cos(alpha(3))),((R - r + L * cos(theta(3))) * sin(alpha(3))),-L * sin(theta(3))];
C1C2 = C2 - C1;
C2C3 = C3 - C2;
C3C1 = C1 - C3;
p = (norm(C1C2) + norm(C2C3) + norm(C3C1)) / 2;
norm_EC = (norm(C1C2) * norm(C2C3) * norm(C3C1)) / (4 * sqrt(p * (p - norm(C1C2)) * (p - norm(C2C3)) * (p - norm(C3C1))));
F = (C1 + C2) / 2;
n_FE = cross(cross(C2C3,C3C1),C1C2) / norm(cross(cross(C2C3,C3C1),C1C2));
norm_FE = sqrt(norm_EC^2 - norm(C1C2)^2 / 4);
E = norm_FE * n_FE + F;
n_EP = -cross(C1C2,C2C3) / norm(cross(C1C2,C2C3));
norm_EP = sqrt(l^2 - norm_EC^2);
P = norm_EP * n_EP + E;

end

