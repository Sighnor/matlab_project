L1 = 491;
L2 = 450;
L3 = 450;
L4 = 84;

input = [-1,0,0,0;
         0,-1,0,0;
         0,0,1,L1+L2+L3+L4;
         0,0,0,1];
     
output =  robot_six(input,L1,L2,L3,0,-70,100,0,70,0);
        
g1 = output * input^-1;

omega1 = [0,0,1].';
omega2 = [0,1,0].';
omega3 = [0,1,0].';
omega4 = [0,0,1].';
omega5 = [0,1,0].';
omega6 = [0,0,1].';

q1 = [0,0,L1].';
q2 = [0,0,L1].';
q3 = [0,0,L1 + L2].';
q4 = [0,0,L1 + L2 + L3].';
q5 = [0,0,L1 + L2 + L3].';
q6 = [0,0,L1 + L2 + L3].';

p = [0,0,L1 + L2 + L3,1].';
q = [0,0,L1,1].';

theta3 = Paden_Kahan_3(p(1:3,:),q(1:3,:),q3,norm(g1 * p - q),omega3);

q = g1 * p;
p = R_theta_omega_q_1(theta3(2),omega3,q3) * p;

theta12 = Paden_Kahan_2(p(1:3,:),q(1:3,:),q1,omega1,omega2);

g2 = (R_theta_omega_q_1(theta12(3),omega1,q1) * R_theta_omega_q_1(theta12(4),omega2,q2) * R_theta_omega_q_1(theta3(2),omega3,q3))^-1 * g1;

p = [0,0,L1 + L2 + L3 + 1,1].';
q = g2 * p;

theta45 = Paden_Kahan_2(p(1:3,:),q(1:3,:),q4,omega4,omega5);

g3 = (R_theta_omega_q_1(theta45(3),omega4,q4) * R_theta_omega_q_1(theta45(4),omega5,q5))^-1 * g2;

p = [1,0,L1+L2+L3,1].';
q = g3 * p;

theta6 = Paden_Kahan_1(p(1:3,:),q(1:3,:),q6,omega6);

[theta12(1),theta12(2),theta3(1),theta45(1),theta45(2),theta6;
 theta12(1),theta12(2),theta3(1),theta45(3),theta45(4),theta6;
 theta12(1),theta12(2),theta3(2),theta45(1),theta45(2),theta6;
 theta12(1),theta12(2),theta3(2),theta45(3),theta45(4),theta6;
 theta12(3),theta12(4),theta3(1),theta45(1),theta45(2),theta6;
 theta12(3),theta12(4),theta3(1),theta45(3),theta45(4),theta6;
 theta12(3),theta12(4),theta3(2),theta45(1),theta45(2),theta6;
 theta12(3),theta12(4),theta3(2),theta45(3),theta45(4),theta6;]

