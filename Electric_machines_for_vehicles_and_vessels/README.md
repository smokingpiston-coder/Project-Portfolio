# Electric Machines for Vehicles and Vessels

**Course:** EEN135 Electric Machines for Vehicles and Vessels, Chalmers University of Technology (2025)
**Division:** Electric Power Engineering
**Tools:** Laboratory power benches, LabVIEW data acquisition, MATLAB / Simulink

---

## Overview
The course combined **hands-on laboratory work on real electrical machines** with **dynamic simulation in MATLAB/Simulink**. The four labs go from the basics of AC power to grid-connected induction machines (IM) and permanent magnet synchronous machines (PMSM), the two machine types that dominate vehicle and marine electric drivetrains.

| Lab | Topic | Type |
|-----|-------|------|
| 1 | Alternating current: power flow and phase compensation | 🔧 Hands-on (lab bench) |
| 2 | Grid-connected induction machine | 🔧 Hands-on (machine test rig) |
| 3 | Induction machine: dynamic and steady-state simulation | 💻 MATLAB/Simulink |
| 4 | PMSM: dynamic simulation in dq coordinates | 💻 MATLAB/Simulink |

All labs were done in pairs. Each lab was approved by a supervisor after we explained our measurements and simulation results.

---

## Lab 1 – Alternating Current (AC) 🔧
**Aim:** study active and reactive power flow, voltage drop, losses and phase compensation in single-phase and three-phase systems.

**What I did:**
- Wired a **single-phase transmission line model** on the lab power panel. It had a 2.2 Ω / 30 mH series line feeding an RL load (43 Ω, 150 mH) from the 230 V grid.
- Connected voltage and current sensors with the correct reference directions, and routed the signals to a **LabVIEW** measurement system.
- Added **parallel capacitor compensation** (0–60 µF) and measured how supply current, load voltage, line losses and reactive power change. This showed which capacitance gives the best power factor.
- Compared voltage and current **phasors with time-domain waveforms**, and decided whether the total impedance was inductive or capacitive.
- Built a **three-phase star-connected RL load** on the 400 V grid and measured phase and line-to-line voltages, phase currents, active/reactive power and power factor as the load resistance changed.
- Checked balanced three-phase theory against the measurements: the √3 ratio and 30° shift between phase and line voltages, the 120° phase displacement, and why the neutral points don't need to be connected.
- Did **hand calculations beforehand** (home assignments) and compared them with the measured values.

## Lab 2 – Grid-Connected Induction Machine 🔧
**Aim:** investigate the induction machine's torque-speed characteristics, the effect of the supply, and starting behaviour.

**Test rig:** a 4 kW induction machine mechanically coupled to a 4.5 kW **DC machine used as a controllable load**. The DC machine was fed by a **thyristor converter** in current or speed control, so it fed the braking power back to the grid.

**What I did:**
- Connected the induction machine (star-connected), the DC load machine, the thyristor converter, cooling and measurement signals. I checked the direction of rotation and swapped phases when needed.
- **Load test:** loaded the motor step by step by controlling the DC machine's armature current in generator mode. I measured stator power, current, speed and torque, built the **torque-speed curve** and calculated **efficiency**. Torque was calculated from the DC machine's quantities, including its losses.
- **Direct-on-line start:** recorded a computer-triggered DOL start followed by a load-torque step. This showed the **high inrush current** and the transient torque. The data was saved for Lab 3.
- **Locked-rotor test:** held the rotor at zero speed with the DC machine in speed control and fed the motor at reduced voltage through an adjustable transformer. These measurements were used to identify the equivalent-circuit parameters.
- **Full torque-speed curve:** measured from no-load speed down to standstill at a reduced 130 V supply, to keep currents and heating low. I derived scaling laws to convert torque and current to the rated 400 V.
- Compared the measured curve with the **nameplate rated point**, and discussed the effect of voltage and temperature on slip.

## Lab 3 – Induction Machine Simulation 💻
**Aim:** simulate the induction machine both dynamically and in steady state, and validate the model against the Lab 2 measurements.

**What I did:**
- **Identified the equivalent-circuit parameters** from my own no-load and locked-rotor measurements:

  | Parameter | Value |
  |-----------|-------|
  | Stator resistance R<sub>s</sub> | 1.33 Ω |
  | Rotor resistance R<sub>r</sub> | 1.33 Ω |
  | Magnetising inductance L<sub>m</sub> | 132 mH |
  | Stator / rotor leakage inductance | 8.06 mH |
  | Iron-loss resistance R<sub>Fe</sub> | 457 Ω |

- Derived the **dynamic αβ (stationary frame) model in state-space form**, with the A and B matrices and the inductance matrix, and checked it against the Simulink implementation.
- Fed the **measured DOL start and load-step data** (`IMStart.txt`) into the model. I analysed 3-phase and αβ voltages and currents, vector rotation, grid frequency, and why total three-phase instantaneous power is constant.
- **Compared simulation with measurement:** starting current and run-up time, stator power, rotor speed under load, rotor current frequency, and dq-frame quantities. I explained the differences through model assumptions such as no saturation and no skin effect.
- Used the **steady-state equivalent circuit with iron losses** to compute torque, current, power and power factor against speed, and compared them with the measured curves from Lab 2. I also assessed the "torque ∝ slip" approximation.

## Lab 4 – PMSM Simulation 💻
**Aim:** simulate a 4 kW, 4-pole permanent magnet synchronous machine dynamically in the rotating dq frame.

**What I did:**
- Derived the **non-linear dq-model of the PMSM** (salient, L<sub>sd</sub> ≠ L<sub>sq</sub>) in state-space form. It includes the magnet torque and reluctance torque, and a speed-dependent load torque T<sub>L</sub> = (B/n<sub>p</sub>)·ω + T<sub>L,extra</sub>.
- **Built the PMSM state-space model in Simulink** myself, with integrators initialised so the simulation starts in steady state, and linked it to the three-phase/dq transformations.
- Simulated the **grid-connected, open-loop PMSM**:
  - **12 Nm load step:** speed, torque and current oscillate and take a long time to settle. I explained this through the load angle δ and the "spring-like" torque T ∝ sin δ with almost no damping.
  - **32 Nm load step:** studied the machine's limit of stable operation, relating the load angle and the transient oscillation to the risk of losing synchronism (pole slip).
- Discussed why a PMSM can't practically run directly on the grid without a converter. Unlike power-system synchronous generators, it has no damper winding and no field control.

---

## Repository Structure
```
Electric-Machines-for-Vehicles-and-Vessels/
├── README.md
├── Lab3-Induction-Machine-Simulation/
│   ├── IM_main_code.m                   Main script: parameters, inductance matrix, runs the Simulink model
│   ├── Pre_Calculations.m               Loads the Lab 2 start measurement and lab data, computes voltage/frequency
│   ├── Post_Pross.m                     Plots dynamic results and the steady-state model vs measurements
│   ├── induction_machine_Simulink.mdl   αβ dynamic induction machine model
│   └── IMStart.txt                      Measured direct-on-line start and load step from Lab 2
└── Lab4-PMSM-Simulation/
    ├── PMSM_main_code.m                 Main script: PMSM parameters, steady-state initial conditions, load step
    ├── PostProssPMSM.m                  Plots currents, voltages, torque and speed
    ├── PMSM_Simulink.slx                dq state-space PMSM model
    └── PMSM_Simulink_R2024a_new.slx     Same model saved for MATLAB R2024a
```
Labs 1 and 2 were done on the physical lab benches, so they have no code files. The lab instructions belong to the course and aren't included.

## How to Run
- **Lab 3:** open the folder in MATLAB and run `IM_main_code.m`. It calls `Pre_Calculations.m`, simulates the model and runs `Post_Pross.m`. `IMStart.txt` must be in the same folder.
- **Lab 4:** run `PMSM_main_code.m`. Set `TL_extra` to `12` or `32` to choose the load step.

## Key Skills
`Induction machines` · `PMSM` · `Equivalent-circuit parameter identification` · `No-load & locked-rotor tests` · `Torque-speed characterisation` · `Space vectors (abc / αβ / dq)` · `State-space modelling` · `MATLAB/Simulink` · `Power & reactive power measurement` · `Phase compensation` · `Three-phase systems` · `LabVIEW data acquisition` · `Electrical lab safety`
