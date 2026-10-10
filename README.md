# Ramkumar Huleppa Munavalli – Automotive & Mobility Engineering Portfolio

**M.Sc. Mobility Engineering · Chalmers University of Technology, Gothenburg, Sweden**

I'm a Mobility Engineering graduate with a passion for how vehicles move, steer and stay efficient. This repository gathers the engineering work from my master's at Chalmers: my thesis, industry-linked projects, and course projects in vehicle dynamics, electrification, control, aerodynamics, structural simulation and CAD.

The common thread in all of it is one way of working: **understand the physics, build the model, then check it against reality**. Reality might be a hand derivation, a lab test rig, a wind tunnel, a driving simulator or data logged on a real truck.

---

## 🚀 Highlights

| | Project | What I did |
|---|---------|-----------|
| 🎓 | **[Master's thesis – R-EPAS for a driving simulator](Master-Thesis)** | Modelled a rack-electric power-assisted steering system and implemented it in **VTI's SIM IV driving simulator**. The work included vehicle testing with IMUs, OBD II and an OXTS RT3000, IMU-based steering-angle estimation, a LuGre friction model, an FMU-ready Simulink vehicle model, and ISO-based validation. |
| 🚛 | **[Dynamic loads of a timber truck](Dynamic-Loads-of-Timber-Truck)** *(with Volvo Trucks)* | Built a 10-DOF truck–trailer–drawbar model to predict the **tyre forces that heavy (BK4, 74 t) vehicles put on bridges**. Validated it against IPG TruckMaker and ran a 30-case load and speed sweep over speed bumps and expansion joints. |
| ⚡ | **[Hybridisation of a Porsche Panamera](Electric-and-Hybrid-Vehicles)** | Designed series and parallel hybrid powertrains with rule-based energy management, which **cut fuel consumption by up to 58 %** on a custom driving cycle. |
| 🔄 | **[Electric drives with field-oriented control](Electric-Drives-for-Vehicles-and-Vessels)** | Designed current and speed controllers (MTPA, decoupling, active damping, anti-windup) and a flux observer for **PMSM and induction machine drives**, plus hands-on PWM converter lab work. |
| 🌬️ | **[Bus aerodynamics in the wind tunnel](Road-Vehicle-Aerodynamics)** | Tested aerodynamic add-ons on a 1:18 bus in the Chalmers L2 wind tunnel. A beluga-inspired nose and boat tail **cut drag by about 40 %**. |
| 📡 | **[Connected fleet – truck ride comfort](Connected-Fleet)** | Logged real-world vibration on a **Volvo FH16** with an IMU in a 3D-printed enclosure I helped design. Compared the data with a 3-DOF model and assessed it against **ISO 2631**. |

---

## 📂 All Projects

### Vehicle dynamics and chassis
| Project | Summary | Tools |
|---------|---------|-------|
| [Vehicle Dynamics](Vehicle-Dynamics) | Three design tasks: longitudinal dynamics and traction control of a dual-motor EV, lateral handling with load transfer and simulator validation, and vertical dynamics / ride comfort to ISO 2631 | MATLAB, Simulink, CASTER simulator |
| [Master's Thesis](Master-Thesis) | R-EPAS steering model for VTI's SIM IV driving simulator | MATLAB/Simulink, FMU, Python, IMUs |
| [Dynamic Loads of Timber Truck](Dynamic-Loads-of-Timber-Truck) | Truck–trailer model for bridge load and dynamic amplification studies | MATLAB/Simulink, IPG TruckMaker |
| [Rigid Body Dynamics](Rigid-Body-Dynamics) | Analytical mechanics checked in Adams: latch, universal joint, 3D robot, ATV vibration modes | MSC Adams |

### Electrification and powertrain
| Project | Summary | Tools |
|---------|---------|-------|
| [Electric and Hybrid Vehicles](Electric-and-Hybrid-Vehicles) | Conventional, series and parallel hybrid Porsche Panamera, with energy management | MATLAB/Simulink, QSS Toolbox |
| [Electric Machines for Vehicles and Vessels](Electric-Machines-for-Vehicles-and-Vessels) | AC and induction machine lab testing, plus induction machine and PMSM dynamic simulation | Lab rigs, LabVIEW, Simulink |
| [Electric Drives for Vehicles and Vessels](Electric-Drives-for-Vehicles-and-Vessels) | PWM converter drive lab, plus FOC of PMSM and induction machine drives | Lab rigs, Simulink |

### Control and mechatronics
| Project | Summary | Tools |
|---------|---------|-------|
| [Systems and Mechatronics for Mobility Engineering](System-Mechatronics) | Cruise control and ACC, active suspension, state feedback, observers and a Kalman filter, and an automated lane change | MATLAB, Simulink |

### Aerodynamics, data and testing
| Project | Summary | Tools |
|---------|---------|-------|
| [Road Vehicle Aerodynamics](Road-Vehicle-Aerodynamics) | Downforce and cornering in the CASTER simulator, plus wind tunnel drag reduction of a bus model | Wind tunnel, CFD, MATLAB |
| [Connected Fleet](Connected-Fleet) | IMU data logging on a Volvo FH16, ride-comfort modelling, and a 3D-printed sensor enclosure | MATLAB/Simulink, Siemens NX, 3D printing |

### Structural simulation and design
| Project | Summary | Tools |
|---------|---------|-------|
| [Finite Element Simulation in Design](Finite-Element-Simulation-in-Design) | Static, contact, buckling, modal and thermo-mechanical FEA, with design optimisation | Ansys Workbench |
| [Advanced Computer Aided Design](Advanced-Computer-Aided-Design) | A full-size wheel excavator: surface modelling, parametric wheels, kinematic assembly, RD&T geometry assurance | CATIA V5, RD&T |

---

## 🛠️ Technical Skills

| Area | Skills |
|------|--------|
| **Vehicle dynamics** | Longitudinal, lateral and vertical dynamics · tyre modelling (Magic Formula) · steering systems · ride comfort (ISO 2631) · load transfer · driving simulators |
| **Electrification** | Hybrid powertrain architectures · energy management · battery sizing · induction machines and PMSMs · field-oriented control · PWM inverters |
| **Control and estimation** | PID and pole placement · state feedback · Luenberger observers · Kalman filters · MTPA · anti-windup · robustness analysis |
| **Modelling and simulation** | MATLAB · Simulink · state-space modelling · QSS Toolbox · IPG TruckMaker · MSC Adams · FMU export |
| **Structural and CAD** | Ansys Workbench (static, contact, buckling, modal, thermal) · CATIA V5 · Siemens NX · RD&T · 3D printing |
| **Testing and data** | Vehicle testing · IMUs, OXTS RT3000, OBD II · LabVIEW · wind tunnel testing · signal processing (filtering, FFT, PSD) · Python |

---

## 📖 How to Navigate This Repository
- **Each folder is one project.** Open it to see a README with the problem, my approach, key results, and the files included.
- Most projects include the **report (PDF)** and the **MATLAB/Simulink, Adams or CAD files** I worked with.
- **Group work** is noted in each README, together with my own contribution.
- For the master's thesis, the test data and models are **not shared because of data privacy**. The report and the project structure are included instead.

---

## 📫 Contact
I'm open to roles in **vehicle dynamics, chassis and steering systems, electrified powertrains, and simulation and testing** in the automotive and commercial vehicle industry.

- **LinkedIn:**  *www.linkedin.com/in/ramkumarmunavalli1994*
- **Email:** *munavalliramkumar@outlook.com*
