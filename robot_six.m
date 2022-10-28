function [output] = robot_six(input,L1,L2,L3,a,b,c,d,e,f)

R = R_theta_omega_q_1(a,[0,0,1].',[0,0,L1].') * R_theta_omega_q_1(b,[0,1,0].',[0,0,L1].') * R_theta_omega_q_1(c,[0,1,0].',[0,0,L1+L2].') * R_theta_omega_q_1(d,[0,0,1].',[0,0,L1+L2+L3].') * R_theta_omega_q_1(e,[0,1,0].',[0,0,L1+L2+L3].') * R_theta_omega_q_1(f,[0,0,1].',[0,0,L1+L2+L3].');
     
output = R * input;

end

