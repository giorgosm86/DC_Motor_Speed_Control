# DC_Motor_Speed_Control
Simulation-based DC motor speed control project demonstrating PID control, robustness, and anti-windup in Simulink
# DC Motor Speed Control (PID) — MATLAB/Simulink

This project designs and validates a closed-loop speed controller for a DC motor using PID control.
The goal is to reach and maintain a desired speed despite disturbances and model uncertainty.

## What this project demonstrates
- DC motor modeling using a transfer function (plant)
- Open-loop vs closed-loop performance comparison
- PID tuning intuition (Kp, Ki, Kd effects)
- Disturbance rejection (load step disturbance)
- Discrete-time implementation (embedded-style)
- Actuator saturation and anti-windup compensation

## Tools
- MATLAB
- Simulink

## Model
Motor transfer function (speed/voltage):(for DC motor)
P(s)=K/(Js+b)(Ls+R)+K^2


Using:
- J = 0.01, b = 0.1, K = 0.01, R = 1, L = 0.5

## Key Results (see Figures/)
- **Open-loop**: slow and inaccurate tracking
- **Closed-loop (PID)**: fast response and near-zero steady-state error
- **Load disturbance**: speed dips briefly then recovers due to feedback
- **Saturation**: performance limited by actuator constraints
- **Anti-windup**: prevents integrator windup during saturation, improving recovery
## Results

### Open-loop vs Closed-loop Response
![Open vs Closed](FIGURES/open_vs_closed.png)

### Load Disturbance Rejection
![Disturbance Rejection](FIGURES/disturbance_rejection.png)

### Saturation and Anti-windup
![Anti-windup](FIGURES/saturation_antiwindup.png)



## Files
- `MATLAB/` contains scripts for modeling, PID control, tuning, and robustness testing
- `Simulink/` contains the final Simulink model
- `Figures/` contains screenshots of key results

## Future Work (Hardware Extension)
- Implement the discrete PID controller on a microcontroller (Arduino/STM32)
- Use an encoder for speed measurement and PWM for actuation
- Compare simulation and experimental results
