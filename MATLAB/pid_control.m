J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;

s = tf('s');

P_motor = K / ((J*s + b)*(L*s + R) + K^2);

% PID controller (initial values)
Kp = 100;
Ki = 200;
Kd = 10;

C = pid(Kp, Ki, Kd);

% Closed-loop system
T = feedback(C * P_motor, 1);

% Step response
step(T)
grid on
title('Closed-Loop DC Motor Speed Control')
xlabel('Time')
ylabel('Angular Speed (rad/s)')
figure
step(P_motor, 'r--', T, 'b')
grid on
legend('Open Loop','Closed Loop')
title('Open vs Closed Loop Speed Response')