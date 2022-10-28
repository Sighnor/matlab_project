function [D_h] = GGX(roughness,halfvector)
alpha = roughness^2;
my_dot = dot([0;0;1],halfvector);
D_h = alpha^2 / (pi * (my_dot^2 * (alpha^2 - 1) + 1)^2);
end

