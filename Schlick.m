function [R_theta] = Schlick(R_0, vector)
my_dot = dot([0;0;1],vector);
R_theta = R_0 + (1 - R_0) * (1 - my_dot)^5;
end

