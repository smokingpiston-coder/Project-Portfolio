# Road Vehicle Aerodynamics

**Course:** MTF236 Road Vehicle Aerodynamics, Chalmers University of Technology (VT2025)
**Tools:** MATLAB (incl. Symbolic Math Toolbox), CASTER driving simulator, Chalmers L2 wind tunnel, CFD

This folder contains two projects from the course:

| Sub-project | Topic | Folder |
|-------------|-------|--------|
| 🏎️ [Caster Project](#1-caster-project--effect-of-downforce-on-cornering) | Effect of aerodynamic downforce on cornering, tested in a driving simulator | [`Caster-Project/`](Caster-Project) |
| 🚌 [Wind Tunnel Project](#2-wind-tunnel-project--bus-aerodynamics) | Drag reduction of a 1:18 bus model in the wind tunnel | [`Wind-Tunnel-Project/`](Wind-Tunnel-Project) |

---

## 1. Caster Project – Effect of Downforce on Cornering

**Authors:** Ramkumar Huleppa Munavalli, Anirudh Sreeram · February 2025
📄 [Report (PDF)](Caster-Project/MTF236_Caster_Assignment_Report.pdf)

### Overview
We drove a vehicle on a test track in Chalmers' **CASTER driving simulator**, first **without** and then **with an aerodynamic package**. We analysed the logged data and compared it with a point-mass cornering model to show how downforce (−C<sub>L</sub>A) affects cornering speed, lateral acceleration and design trade-offs.

### What was done
- **Driving impressions:**
  - **Without aero**, the steering felt light, but the car was unstable in corners at around 130 km/h.
  - **With aero**, the car was predictable and stable through corners at around 155 km/h, with heavier steering.
- **Data analysis:** smoothed the logged lateral acceleration and speed with a moving-average filter, and picked out steady-state cornering intervals.

| Configuration | Corner | Lateral acc. (m/s²) | Speed (m/s) |
|---------------|--------|---------------------|-------------|
| Without aero | Large | 13.2 | 33.3 |
| Without aero | Small | 13.0 | 32.0 |
| With aero | Large | **18.5** | **40.0** |
| With aero | Small | **16.5** | 33.1 |

- **Point-mass cornering model:** a free-body diagram with downforce on a 103 m radius curve, µ = 1.5 and m = 1300 kg. The model predicts the maximum speed and lateral acceleration:

| Vehicle | Max cornering speed | Lateral acc. |
|---------|---------------------|--------------|
| Lift-neutral (−C<sub>L</sub>A = 0) | 38.9 m/s | 14.7 m/s² |
| With downforce (−C<sub>L</sub>A = 4 m²) | 46.1 m/s | 20.6 m/s² |

  The simulator results with aero fall between these two limits. The theoretical maximum wasn't reached because a driver can't hold a perfectly constant radius and speed.
- **Parameter study:** derived and plotted how **friction coefficient, vehicle mass and cornering speed** vary with −C<sub>L</sub>A. For example, each extra **7 kg** of mass needs **+0.021 m²** of −C<sub>L</sub>A to keep the same cornering performance.
- **Speed against curve radius:** compared a downforce car (−C<sub>L</sub>A = 4 m²) with a lifting car (−C<sub>L</sub>A = −0.4 m²) for radii from 50 to 300 m. The lifting car loses all traction at **73.5 m/s**, when lift equals its weight.

### Files
| File | Description |
|------|-------------|
| `MTF236_Caster_Assignment_Report.pdf` | Report with derivations, plots and the MATLAB code |
| MATLAB script | Data smoothing and plots (Q2), and symbolic solving of the cornering equation for µ, m and V against −C<sub>L</sub>A and radius (Q4–Q6) |
| `DRIVER1_No_Aero.mat`, `DRIVER1_Aero.mat` | Logged CASTER data (lateral acceleration, velocity, time) that the script needs |

---

## 2. Wind Tunnel Project – Bus Aerodynamics

**Group 2:** Elin Maskova, Anirudh Sreeram, Saket Sharad Sapre, Himanshu Upendra Chaudhari, Elliot Jonsson, Linus Fäldt, **Ramkumar Huleppa Munavalli**, Bhushan Sudhakar · March 2025
📄 [Report (PDF)](Wind-Tunnel-Project/MTF236_Wind_Tunnel_Report_Bus_Aerodynamics.pdf)

### Overview
We analysed and reduced the aerodynamic drag of a **1:18 scale bus model** in the **Chalmers L2 closed-circuit wind tunnel**. The test section is 1.25 × 1.8 × 3.0 m and the maximum speed is 63 m/s. The project combined a CFD pre-study, hand-built aerodynamic add-ons, force-balance measurements, smoke and tuft flow visualisation, and a CFD comparison.

### Method
1. **CFD pre-study** of the baseline bus. It showed a flat front with a large stagnation area, a big rear wake, and flow separation around the rear wheels.
2. **Building the add-ons:** a bullet-train nose, a **beluga-whale-inspired nose** (after Arabaci & Pakdemirli, 2023), a boat tail with underbody **diffuser** slats, **vortex generators**, and front **wheel covers** with rear wheel arches.
3. **Reynolds sweep** from 0 to 50 m/s. The drag coefficient settled at **35 m/s**, which was then used for all tests.
4. **Yaw sweeps** at 0°, 2.5°, 5° and 10° for six configurations, to assess crosswind sensitivity.
5. **Flow visualisation** with smoke and tufts, plus a coarse CFD run of the baseline and the best design.

### Results
| Config | Modifications |
|--------|---------------|
| 1 | Bullet nose, boat tail + diffuser, wheel covers, vortex generators |
| 2 | Bullet nose, baseline rear, wheel covers, vortex generators |
| 3 | Beluga nose, baseline rear, wheel covers, vortex generators |
| 4 | Beluga nose, boat tail + diffuser, wheel covers, vortex generators |
| **5** | **Beluga nose + boat tail only** ← best and most practical |
| 6 | Baseline (reference) |

- **Every modification reduced drag** compared with the baseline, which had C<sub>D</sub> ≈ 0.505.
- **Configuration 5** (beluga nose + boat tail) reached **C<sub>D</sub> ≈ 0.30** at 0° yaw, about **40 % lower drag** (roughly 200 drag counts). It stayed nearly constant up to 5° yaw.
  - The rounded nose reduces the frontal stagnation area, and the boat tail shrinks the rear wake.
  - Smoke tests, tufts and CFD all confirmed this.
- Configuration 1 performed similarly, but a bullet nose plus many add-ons is less realistic for a road bus because of weight, cost and looks.
- The hand-made cardboard and tape devices (diffuser and vortex generators) partly added drag because of rough build quality. More precise, 3D-printed parts and a moving-ground test are suggested as future work.

| Drag coefficient against yaw angle | Rear wake: baseline (top) vs boat tail (bottom) |
|---|---|
| ![Drag coefficient yaw sweep](Wind-Tunnel-Project/images/drag_coefficient_yaw_sweep.png) | ![CFD rear wake comparison](Wind-Tunnel-Project/images/rear_wake_CFD_baseline_vs_boat_tail.jpg) |

### My contribution
- Built the **diffuser** and the **extended open-flap rear** models (with Himanshu).
- Set the **yaw angles** for each configuration, attached the **tufts**, ran the **smoke** test, and recorded photos and video.
- Co-wrote the **Methods** section of the report (with Anirudh), covering the experimental setup, CFD and 3D CAD modelling.

### Files
| File | Description |
|------|-------------|
| `MTF236_Wind_Tunnel_Report_Bus_Aerodynamics.pdf` | Full group report |
| `images/` | Key figures from the report |
| MATLAB files | Post-processing of the wind tunnel balance data |

---

## Repository Structure
```
Road-Vehicle-Aerodynamics/
├── README.md
├── Caster-Project/
│   ├── MTF236_Caster_Assignment_Report.pdf
│   └── (MATLAB script and .mat data files)
└── Wind-Tunnel-Project/
    ├── MTF236_Wind_Tunnel_Report_Bus_Aerodynamics.pdf
    ├── images/
    └── (MATLAB files)
```

## Key Skills
`Vehicle aerodynamics` · `Downforce & cornering performance` · `Driving simulator testing (CASTER)` · `Wind tunnel testing` · `Reynolds & yaw sweeps` · `Drag reduction design` · `Flow visualisation (smoke, tufts)` · `CFD` · `MATLAB data analysis` · `Symbolic modelling`
