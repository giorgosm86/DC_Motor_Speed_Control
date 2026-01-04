J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;

s = tf('s');
P_motor = K / ((J*s + b)*(L*s + R) + K^2);

figure

% Case 1: Low Kp
C1 = pid(20, 0, 0);
T1 = feedback(C1 * P_motor, 1);

step(T1)
title('Low Kp (Slow response)')
grid on

% Case 2: Higher Kp
C2 = pid(100, 0, 0);
T2 = feedback(C2 * P_motor, 1);

step(T2)
title('Higher Kp (Faster response,overshoot)')
grid on

% Case 3: Add Ki
C3 = pid(100, 200, 0);
T3 = feedback(C3 * P_motor, 1);
%%

step(T3)
title('Kp + Ki (Zero steady-state error)')
grid on
figure
C4 = pid(100, 200, 10);
T4 = feedback(C4 * P_motor, 1);
step(T4)
grid on
title('Full PID: Faster + Less Overshoot')