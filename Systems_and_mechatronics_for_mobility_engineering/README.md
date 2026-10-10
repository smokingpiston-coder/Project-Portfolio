# Systems and Mechatronics for Mobility Engineering – Vehicle Control in MATLAB/Simulink

**Course:** Systems and Mechatronics for Mobility Engineering, Chalmers University of Technology (Fall 2024)
**Tools:** MATLAB (Control System Toolbox), Simulink

---

## Overview
Five assignments that build up a **model-based control design workflow** for vehicle systems. The workflow runs from physical modelling and linearisation, through classical and state-space controller design, to state estimation (Luenberger observer and Kalman filter), and ends with an **automated lane-change function** with a discretised observer. Every controller was designed analytically in MATLAB and then verified in a Simulink simulation.

| # | Topic | Vehicle application |
|---|-------|---------------------|
| 1 | Linear systems and feedback control | Cruise control and adaptive cruise control (ACC) |
| 2 | Modelling and analysis | Quarter-car suspension, passive and active |
| 3 | State feedback control | Cruise control with integral action |
| 4 | State estimation | Driveline observer and Kalman filter |
| 5 | Automated driving function | Lane-change controller with an observer |

---

## Assignment 1 – Linear Systems and Feedback Control
**Application:** cruise control and adaptive cruise control.
- Modelled the vehicle's longitudinal dynamics as a first-order system and found its pole (s = −a/m ≈ −0.105).
- Implemented the model in Simulink and checked the open-loop speed response (from 25 m/s to a steady state of 30 m/s).
- Derived the **closed-loop characteristic equation** with a **PI cruise controller**, and designed controllers by **pole placement**: real poles at −0.2 and −0.8, and complex poles at −0.5 ± j√2. I compared their **rise time, overshoot and settling time**.
- Derived the transfer functions from throttle and from disturbance to **relative distance**, and designed a **PID adaptive cruise controller** by pole placement.
- Tuned the ACC in a car-following scenario to find the pole placement that keeps a **15 m gap**, and the limit at which the vehicles **just avoid a collision**.

## Assignment 2 – Modelling and Analysis
**Application:** quarter-car suspension.
- Derived a **tyre model** (road position → wheel position) and identified its **stiffness and damping from step-response data** (c<sub>w</sub> ≈ 2.27 × 10⁵ N/m, d<sub>w</sub> ≈ 1.14 × 10³ Ns/m).
- Built the **quarter-car state-space model** in Simulink and simulated driving over a road bump. I found the peak displacement and settling time.
- Computed the **eigenvalues** (all stable, with one oscillatory complex pair) and interpreted the pole locations.
- Applied a **state transformation** and **added outputs** for chassis acceleration and wheel–road deflection, to assess comfort and road holding.
- **Suspension optimisation:** swept spring and damper coefficients over a **5 cm speed bump** to balance ride comfort and road holding. Best result: c<sub>s</sub> = 10 000 N/m, d<sub>s</sub> = 2 500 Ns/m.
- Extended the model with an **active suspension actuator**, a first-order actuator state, and derived the A, B and H matrices.

## Assignment 3 – State Feedback Control
**Application:** cruise control with a non-linear vehicle model.
- Found the **equilibrium point** at 15 m/s on a flat road and **linearised** the non-linear model into A, B, C and H matrices.
- Checked **reachability** (the reachability matrix has full rank).
- Designed a **state feedback controller** by pole placement (ω<sub>n</sub> = 0.6, ζ = 1/√2) with a **reference gain** for unit steady-state gain.
- **Augmented the model with an integral state** and designed the controller with **Ackermann's formula**, placing the extra pole three times faster.
- Simulated a set-speed step from 15 to 20 m/s, and tested **robustness to a 50 % mass increase**:

| Controller | Rise time | Overshoot | Settling time |
|------------|-----------|-----------|---------------|
| State feedback | 3.58 s | 4.3 % | 11.7 s |
| With integral action | 3.71 s | 1.0 % | 29.7 s |
| With integral action, +50 % mass | 3.72 s | 8.2 % | 31.2 s |

## Assignment 4 – State Estimation
**Application:** a driveline with a flexible driveshaft.
- Analysed **observability** for different measured outputs. The system is observable from **engine speed**, but not from driveshaft torsion or driveshaft torque.
- Designed a **pole-placement observer** (poles at −60) with the method in Theorem 8.2 of the course textbook. Its estimates settle in about **0.23 s**.
- Designed a **Kalman filter** for road-disturbance noise. It settles in about **0.26 s**.
- **Tuned the measurement covariance R<sub>v</sub>** (0.01–100) to match the pole-placement observer's performance, and explained what R<sub>v</sub> means for trusting the model versus the measurement.

## Assignment 5 – Automated Driving Function
**Application:** an automated **lane-change manoeuvre**.
- Implemented a **non-linear single-track vehicle model** in Simulink with lateral position, lateral velocity, heading, yaw rate, and a first-order steering actuator.
- **Linearised** it for straight-line driving and checked **reachability** (rank 5).
- Designed a **state feedback lane-change controller** with poles chosen for a **2 s lane change**: a double pole at −2.95 and a triple pole twice as fast. A reference gain gives unit steady-state gain on lateral position.
- **Observability analysis:** of all five states, **only lateral position** gives an observable system on its own.
- Designed a **pole-placement observer** five times faster than the controller, then **discretised it with the Euler method** and implemented it in Simulink.
- **Robustness study:** added 400 kg (passengers and luggage, with inertia scaled to match) and raised speed to 30 m/s. The closed loop gets **overshoot and a longer settling time**. I also studied the speed at which the closed loop becomes unstable.

---

## Repository Structure
```
System-Mechatronics/
├── README.md
├── Assignment-1-Linear-Systems-and-Feedback-Control/
│   ├── A1_14.m          Pole calculation, PI/PID pole placement, step-response metrics
│   ├── A1_cc.slx        Cruise control model
│   └── A1_acc.slx       Adaptive cruise control model
├── Assignment-2-Modeling-and-Analysis/
│   ├── A2_14.m          Tyre identification, eigenvalues, suspension optimisation sweep
│   └── A2_suspension14.slx   Quarter-car state-space model
├── Assignment-3-State-Feedback-Control/
│   ├── A3_41.m          Linearisation, reachability, pole placement, Ackermann, robustness
│   ├── A3_model_cc.slx          State feedback cruise control
│   ├── A3_model_cc_prob_9.slx   With integral action
│   └── A3_model_cc_41.slx       With integral action, +50 % mass
├── Assignment-4-State-Estimation/
│   ├── A4_41.m          Observability, observer and Kalman filter design
│   ├── A4_model_driveline_6.slx   Pole-placement observer
│   ├── A4_model_driveline_8.slx   Kalman filter
│   └── A4_model_driveline_9.slx   Kalman filter with R_v tuning
└── Assignment-5-Automated-Driving-Function/
    ├── A5_41.m          Linearisation, controller and observer design, discretisation
    ├── A5_model_1.slx   Lane-change controller with discretised observer
    └── A5_model_10.slx  Robustness case (+400 kg, 30 m/s)
```

## How to Run
Open an assignment folder in MATLAB and run its main script (`A#_xx.m`). The script calls the Simulink models in the same folder.

> **Note:** the scripts start by calling course-provided data generators (`A1_datagen` … `A5_datagen`) that create the group-specific parameters. These aren't included here, so the scripts won't run on their own without them. The Simulink models and all the design code can still be opened and read.

## Key Skills
`Control system design` · `Pole placement` · `PI / PID control` · `State-space modelling` · `Linearisation` · `Reachability & observability` · `Ackermann's formula` · `Integral action` · `Luenberger observer` · `Kalman filter` · `Discretisation` · `Cruise control & ACC` · `Active suspension` · `Lane-change control` · `Robustness analysis` · `MATLAB/Simulink`
