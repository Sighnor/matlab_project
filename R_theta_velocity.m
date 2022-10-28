function [output] = R_theta_velocity(theta,velocity)
    my_theta = theta * pi / 180;
    
    output = [eye(3),velocity * my_theta;
              0,0,0,1];
end

