step_phi = 1;
step_theta = 1;
phi = step_phi:step_phi:360;
theta = step_theta:step_theta:90;
num = length(phi) * length(theta);
f = zeros(num,1);
s = zeros(num,1);
g = zeros(num,1);
vector = zeros(num,3);
for i = 1: length(phi)
    my_phi = phi(i) * pi / 180;
    for j = 1: length(theta)
        my_theta = theta(j) * pi / 180;
        coords = (i - 1) * length(theta) + j;
        tempvector = [cos(my_phi) * sin(my_theta);sin(my_phi) * sin(my_theta);cos(my_theta)];
        f(coords) = Schlick(0.5, tempvector);
        s(coords) = GGX(0.5, tempvector);
        g(coords) = Smith(0.8, [0, 0, 1], tempvector);
        vector(coords,:) = g(coords) * tempvector;
    end
end
figure(1)
shp = alphaShape(vector);
plot(shp);
