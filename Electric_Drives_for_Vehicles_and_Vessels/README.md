# Electric Drive Systems for Vehicles and Vessels

**Course:** EEN140 Electric Drive Systems for Vehicles and Vessels, Chalmers University of Technology (2025)
**Division:** Electric Power Engineering
**Tools:** Frequency converter test bench, LabVIEW data acquisition, MATLAB / Simulink

---

## Overview
This course follows on from *Electric Machines for Vehicles and Vessels* (EEN135). It moves from the machines themselves to the **power electronics and control** that drive them. In the labs I ran an induction machine from a real **PWM frequency converter**, then designed **field-oriented control (FOC)** for both a **PMSM** and an **induction machine** in MATLAB/Simulink. That included current controllers, speed controllers and a flux observer. These are the control structures used in electric vehicle and marine propulsion drives.

| Lab | Topic | Type |
|-----|-------|------|
| 1 | Induction machine fed from a PWM frequency converter | 🔧 Hands-on (drive test rig) |
| 2 | Field-oriented control of a PMSM drive | 💻 MATLAB/Simulink |
| 3 | Field-oriented control of an induction machine drive | 💻 MATLAB/Simulink |

All labs were done in pairs. For Labs 2 and 3, we derived the controllers by hand first and then implemented and verified them in Simulink. A supervisor approved each lab after we explained the results.

---

## Lab 1 – Induction Machine and Frequency Converter Operation 🔧
**Aim:** see how a variable-frequency drive works and how it controls the speed of an induction machine, and how the motor behaves at different supply frequencies.

**Test rig:** a 4 kW induction machine fed from a **transistor (PWM) frequency converter**, loaded by a 4.5 kW **DC machine running as a generator**. The DC machine was controlled through a thyristor converter and armature resistors.

**What I did:**
- Wired the drive, induction machine, DC load machine, and voltage, current and speed measurements. The machine neutral was kept isolated from the grid neutral, which matters with converter feeding.
- **PWM analysis:** studied how the inverter builds a sinusoidal fundamental from fixed-amplitude ±550 V pulses by varying pulse width. Also how frequency and fundamental amplitude change without changing the switching frequency, and where **current ripple** comes from.
- **Measuring non-sinusoidal quantities:** compared the **total RMS** and the **fundamental RMS** of PWM voltages, and learned which one to use for losses, magnetisation or motor behaviour.
- **V/f speed control:** ran the loaded motor from 10 to 65 Hz. I measured speed, torque and fundamental voltage, drew the load characteristic and the voltage-frequency curve, and saw **field weakening** above 50 Hz.
- **Torque-speed curves at 40 Hz and 70 Hz:** varied the load at both frequencies. At 70 Hz I saw the drive's **current limit (~10 A)** automatically lower the frequency under heavy load.
- **Closed-loop speed control:** held 1500 rpm while the load changed, and studied how speed dips and recovers through frequency adjustment. This is the limit of scalar control, and the reason field-oriented control is needed.
- **Soft start with the converter:** recorded a ramped start and compared its **much lower starting current** with the direct-on-line start from EEN135. I also studied the **harmonic-rich grid current** from the diode rectifier and DC-link capacitor.

## Lab 2 – PMSM Drive with Field-Oriented Control 💻
**Aim:** design and simulate a complete field-oriented PMSM drive (4 kW, 1500 rpm, salient: L<sub>sd</sub> ≠ L<sub>sq</sub>).

**What I did:**
- **Maximum torque per ampere (MTPA):** derived the current angle β that maximises torque per ampere for the salient PMSM (≈ **113°** at rated current). I also derived the inverse expression that gives the current magnitude needed for a torque reference, and explained why negative d-current is used to add **reluctance torque**.
- **Current controller design** (closed-loop bandwidth α<sub>c</sub> = 1000 rad/s) in the rotor-oriented dq frame, with:
  - back-EMF **feed-forward**
  - dq **decoupling**
  - **active damping**
  - **voltage limitation** (440 V line-to-line converter limit) with **anti-windup**

  The resulting gains are K<sub>p,d</sub> ≈ 34.5 V/A and K<sub>p,q</sub> ≈ 85.5 V/A.
- **Speed controller** (bandwidth α<sub>ω</sub> = 20 rad/s) with active damping, a rated-current limiter and back-calculation anti-windup.
- **Implemented and verified the controllers in Simulink** against a "true" machine model, using separate estimated and actual parameters:
  - torque reference steps and load torque steps
  - a current-angle step to 130°, showing how **negative d-current weakens the field**, lowers the stator voltage and allows a **higher speed**
  - the effect of hitting the **voltage limit**
- Showed that speed control **removes the undamped speed oscillations** of the grid-connected PMSM from EEN135.

## Lab 3 – Induction Machine Drive with Field-Oriented Control 💻
**Aim:** design and simulate a rotor-flux-oriented induction machine drive, including flux estimation and robustness to parameter errors.

**What I did:**
- Converted the machine's **T-model parameters to the inverse-Γ model** used for control.
- **Rotor-flux-oriented current controller** (α<sub>c</sub> = 1000 rad/s) with flux and torque references, back-EMF feed-forward, decoupling, active damping, voltage limiting and anti-windup. Built the controller block diagram in Simulink.
- **Current-model flux observer** in indirect field orientation (IFO), estimating rotor flux magnitude and angle so the drive doesn't need the machine's internal states.
- **Speed controller** (α<sub>ω</sub> = 20 rad/s) with a current-magnitude limiter that gives priority to the flux-producing d-current.
- **Systematic investigations in simulation:**
  - **PI controller analysis:** which stator-equation terms the proportional part, the integral part and the feed-forward terms each handle.
  - **Voltage saturation:** controller behaviour **with and without anti-windup** when the converter reaches its voltage limit.
  - **Feed-forward, active damping and decoupling:** removed each one in turn to show its effect on the current step responses.
  - **Parameter sensitivity:** errors in L̂<sub>σ</sub> (0.1× and 10×), and in L̂<sub>M</sub> and R̂<sub>R</sub> (0.9×) for the flux observer. Compared the estimation errors with theory and assessed their effect on torque and flux.
  - **Speed control:** step to 1435 rpm, then a 14.6 Nm load step, with and without the rated-current limit (9.1 A RMS).

---

## Repository Structure
```
Electric-Drives-for-Vehicles-and-Vessels/
├── README.md
├── Lab2-PMSM-Drive-Simulation/
│   ├── PMSM_drive_main_code.m      Parameters, MTPA angle, current & speed controller gains, test inputs
│   ├── PMSM_drive_Simulink.slx     FOC PMSM drive: current controller, speed controller, converter, PMSM model
│   └── Post_ProcessPMSM_drive.m    Plots currents, voltages, torque and speed
└── Lab3-IM-Drive-Simulation/
    ├── IM_drive_main_code.m        Parameters (T → inverse-Γ), controller gains, flux observer, test inputs
    ├── IM_drive_Simulink.slx       FOC IM drive: current controller, flux observer, speed controller, IM model
    └── Post_ProcessIM_drive.m      Plots currents, voltages, flux, torque and speed
```
Lab 1 was done on the physical drive test bench, so it has no code files. The lab instructions belong to the course and aren't included.

## How to Run
- **Lab 2:** run `PMSM_drive_main_code.m`. Use the **Manual Switch** in the Simulink model to choose between the external torque reference (current-control test) and the speed controller.
- **Lab 3:** run `IM_drive_main_code.m`. In the main file you can switch anti-windup (`AntiW`), the voltage limits (`Umax`, `VconvLim`), the current limit (`Israted`) and the parameter-error multipliers (for example `LMhat = LM*0.9`). Set the multipliers to `1` for ideal parameters.

## Key Skills
`Field-oriented control (FOC)` · `PMSM & induction machine drives` · `MTPA` · `PI current & speed controller design` · `Active damping, decoupling & anti-windup` · `Flux observers (IFO)` · `Field weakening` · `PWM inverters` · `V/f control` · `Parameter sensitivity analysis` · `MATLAB/Simulink` · `LabVIEW data acquisition`
