view_ray = [0; -1; 1];
view_pos = [0; 1; -1];
my_ray   = [0; 1; 0];
z_ray    = my_normalize(-view_ray);
y_ray    = my_normalize(Rodrigues(90,cross(view_ray,my_ray)) * view_ray);
x_ray    = my_normalize(cross(y_ray,z_ray));
inv([x_ray,y_ray,z_ray,[0;0;0];0,0,0,1]) * [eye(3),-view_pos;0,0,0,1]