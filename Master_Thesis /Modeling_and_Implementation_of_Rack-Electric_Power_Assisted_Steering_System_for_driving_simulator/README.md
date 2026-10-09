# Master Thesis – Modelling and Implementation of Rack-Electric Power Assisted Steering (R-EPAS) for a Driving Simulator

**Chalmers University of Technology** · Department of Mechanical Engineering, Division of Vehicle Engineering and Autonomous Systems
**In collaboration with:** VTI – Swedish National Road and Transport Research Institute, Gothenburg

| | |
|---|---|
| **Authors** | Ramkumar Huleppa Munavalli & Rohan Kumaar Vasudevan |
| **Supervisor** | Smit Saparia (VTI) |
| **Examiner** | Fredrik Bruzelius (Chalmers) |
| **Tools** | MATLAB / Simulink, FMU export, Python, OXTS NAVgraph, OBD AutoDoctor |

📄 **Thesis report:** see the [`Report/`](Report) folder

---

> ### 🔒 Data availability
> The **MATLAB scripts, vehicle test logs, Simulink vehicle model and subsystem files, post-processing scripts and subjective evaluation files are not included** in this repository because of data privacy and confidentiality requirements.
>
> The **repository structure, workflow and report** are shared so that the work procedure and methodology of the thesis can be followed.

---

## Overview
The thesis models a **Rack-Electric Power Assisted Steering (R-EPAS)** system and implements it in VTI's **SIM IV** driving simulator, with the aim of giving drivers realistic steering feel. Key parts of the work:

- **Vehicle testing:** a test driver performed standardised handling manoeuvres while three measurement systems logged the vehicle at the same time.
- **Steering wheel angle estimation with IMUs:** the steering wheel angle was estimated from an IMU mounted on the steering wheel (Muse V3) and a vehicle-body IMU (OXTS RT3000 v4), without a dedicated steering angle sensor.
- **Signal processing:** synchronising the IMU and OBD II logs, translating lateral acceleration to the CoG, and preparing inputs for the vehicle model.
- **Vehicle and steering modelling:** a Simulink vehicle model with battery, brakes, chassis, powertrain, steering, suspension and tyre subsystems, a new steering friction model, and an FMU-export-ready version for the simulator.
- **Validation:** objective validation of yaw rate and lateral acceleration with ISO scores, a static validation of the angle estimation in the simulator, and subjective evaluation by drivers.

## Measurement Systems
| System | Signals | Format |
|--------|---------|--------|
| **OBD II** (logged with OBD AutoDoctor) | Vehicle speed, throttle pedal position | CSV |
| **OXTS RT3000 v4** | Vehicle body motion (accelerations, angular rates, velocities) | NCOM, plus CSV exports of selected signals |
| **Muse V3 IMU** | Steering wheel motion | TXT, converted to CSV with a Python script |

## Repository Structure
```
Master-Thesis/
├── Report/                                   Thesis report  ✅ included
│
├── Vehicle Test logs/                        🔒 not included
│   ├── OBD II/                               Speed and throttle logs per test day (CSV)
│   ├── RT3000 v4/                            Body-motion logs per test day (NCOM + CSV)
│   └── Muse V3/                              Steering wheel IMU logs per test day (TXT)
│
├── Vehicle Model/                            🔒 not included
│   ├── Vehicle model Simulink/               Full vehicle models, Simulink library (Master_Thesis_lib.slx), FMU-export-ready model
│   ├── Vehicle Subsystems Data/              Parameter files: battery, brakes, chassis, powertrain, steering, suspension, vehicle data, tyres
│   └── xPC Simulink file/                    Cabin-control model containing part of the new friction model
│
├── Python scripts/                           🔒 not included
│   └── Muse_V3_txt_to_CSV.py                 Converts Muse V3 TXT logs to CSV and removes NaN values
│
├── Angle estimation & IMU postprocessing & OBD/   🔒 not included
│   ├── MATLAB Script/                        Final angle estimation algorithm (Final_Angle_Est_Script.m)
│   ├── OBD time sync/                        Synchronisation of the IMU and OBD II logs
│   ├── Validation of the estimation process - STATIC case/   Simulator experiment data and validation script
│   ├── LatAcc_to_CoG.m                       Translates lateral acceleration from the steering wheel to the CoG
│   ├── Compiled_plots.m                      Plots all vehicle-model input signals together
│   └── CSV_wo_brake_event.m                  Builds the vehicle-model input file without the brake-event flag
│
├── CSV files generated for vehicle model input/   🔒 not included
├── Model Validation - ISO Scores/            🔒 not included
│   └── Latacc_Yaw_ISO_Comp.m                 ISO scores for yaw rate and lateral acceleration
└── Subjective evaluation/                    🔒 not included
```

## Workflow
1. **Convert IMU logs:** Muse V3 TXT logs are converted to CSV and cleaned of NaN values with `Muse_V3_txt_to_CSV.py`.
2. **Estimate the steering wheel angle:** `Final_Angle_Est_Script.m` fuses the Muse V3 and RT3000 signals. The two IMUs are time-aligned using a harsh braking event at the start of each test, chosen from the acceleration plots.
3. **Correct lateral acceleration:** `LatAcc_to_CoG.m` translates the measured lateral acceleration from the sensor position (steering wheel centre) to the vehicle's centre of gravity.
4. **Synchronise OBD II and IMUs:** `OBD_time_sync.m` aligns the OBD II logs with the IMU signals, again using the harsh braking event (the gradient of longitudinal velocity).
5. **Check the signals:** `Compiled_plots.m` plots all signals together and exports them, including the braking event.
6. **Prepare model inputs:** `CSV_wo_brake_event.m` builds the vehicle-model input file without the brake-event flag. This was needed because the brake pedal signal is not available over OBD II.
7. **Simulate:** run the Simulink vehicle model (`Model_Demo_V3.slx`) with the measured inputs. Results are written to the workspace as `out`.
8. **Validate:** `Latacc_Yaw_ISO_Comp.m` compares simulated and measured yaw rate and lateral acceleration using ISO scores. Subjective driver evaluations complement the objective results.

## Test Programme
All manoeuvres were performed by a test driver, at 3–4 target speeds each, and mostly repeated two or three times.

| No. | Code | Manoeuvre |
|-----|------|-----------|
| 1 | DLC | Double lane change |
| 2 | SiSw | Sine sweep |
| 3 | StDr | Straight-line drive |
| 4 | SS | Step steer |
| 5 | U-T | U-turn |
| 6 | SSC | Steady-state circle |
| 7 | FSR | Steer and release |
| 8 | SLC | Single lane change |
| 9 | Slalom | Slalom |
| 10 | Parking | Parking |

### File naming convention
- **Muse V3:** `DLC S40 i2 11-05-2026 130705.txt` means double lane change, target speed 40 km/h, iteration 2, then the recording date and time.
- **OBD II:** `DLC 1.2.3.csv` means manoeuvre no. 1, speed case 2 (speed cases are numbered in ascending order of speed), iteration 3.
- **Extra labels:**
  - `cc ON`: cruise control was on, so the pedal position is invalid.
  - `NaN`: a sensor log had issues, so the case is not used.
  - `Sym`: a U-turn repeated in the opposite direction.

## Key Skills
`Steering system modelling (R-EPAS)` · `Driving simulator integration` · `IMU-based angle estimation` · `Sensor fusion & signal synchronisation` · `Vehicle testing` · `OBD II diagnostics` · `OXTS RT3000` · `MATLAB/Simulink` · `FMU export` · `Python` · `ISO-based model validation` · `Subjective evaluation`
