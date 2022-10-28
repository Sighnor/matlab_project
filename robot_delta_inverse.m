function [theta] = robot_delta_inverse(x,y,z)

R=200;
r=45;
L=350;
l=800;
alpha = [0/6*pi,4/6*pi,-4/6*pi];
a=R-r;
b=x^2+y^2+z^2+(R-r)^2+L^2-l^2;
c=[x*cos(alpha(1))+y*sin(alpha(1))
    x*cos(alpha(2))+y*sin(alpha(2))
    x*cos(alpha(3))+y*sin(alpha(3))];
A=[(b-2*a*c(1))/(2*L)-(a-c(1))
    (b-2*a*c(2))/(2*L)-(a-c(2))
    (b-2*a*c(3))/(2*L)-(a-c(3))];
B=[2*z
   2*z
   2*z];
C=[(b-2*a*c(1))/(2*L)+(a-c(1))
    (b-2*a*c(2))/(2*L)+(a-c(2))
    (b-2*a*c(3))/(2*L)+(a-c(3))];
theta=[2*atan((-B(1)-sqrt(B(1)^2-4*A(1)*C(1)))/(2*A(1)))*180/pi,2*atan((-B(2)-sqrt(B(2)^2-4*A(2)*C(2)))/(2*A(2)))*180/pi,2*atan((-B(3)-sqrt(B(3)^2-4*A(3)*C(3)))/(2*A(3)))*180/pi];

end