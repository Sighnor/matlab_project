n        = 1;
f        = 50;
z        = -f:0.001:-n;
z_norm   = zeros(1,length(z));
z_turn   = zeros(1,length(z));
for i = 1:length(z)
z_norm(i)   = (f + n) / (f - n) + 2 * f * n / (f - n) / z(i);
z_turn(i)   = (2 * f * n) / ((f - n) * z_norm(i) - (f + n));
end
figure(1);
plot(z,z_norm);
figure(2);
plot(z,z_turn);