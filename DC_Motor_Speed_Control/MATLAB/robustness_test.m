% Original motor parameters
J1 = 0.01;
b1 = 0.1;

% Increased load & friction (disturbance)
J2 = 0.03;     % heavier load
b2 = 0.3;      % more friction

K = 0.01;
R = 1;
L = 0.5;

s = tf('s');

P1 = K / ((J1*s + b1)*(L*s + R) + K^2);
P2 = K / ((J2*s + b2)*(L*s + R) + K^2);

% Same PID controller
C = pid(100, 200, 10);

T1 = feedback(C * P1, 1);
T2 = feedback(C * P2, 1);

figure
step(T1, T2)
grid on
legend('Original Motor','Heavier Load Motor')
title('Robustness Test: Same Controller, Different Motor')
xlabel('Time (s)')
ylabel('Speed (rad/s)')