# Dynamic Load of Timber Truck – Truck–Trailer Model for Bridge Load Assessment

**Course:** TME180 Automotive Engineering Project, Chalmers University of Technology (2025)
**Team:** Ramkumar Huleppa Munavalli, Viktor Larsson Rosén, Rohan Kumaar Vasudevan, Boxuan Wu
**Supervisors:** Fredrik Bruzelius (Chalmers), Lennart Cider (Volvo Technology) · **Examiner:** Alexey Vdovin
**In collaboration with:** Volvo Trucks and NTNU
**Tools:** MATLAB / Simulink, IPG TruckMaker

📄 [Full report (PDF)](Dynamic_load_of_timber_truck.pdf)

---

## Background
In 2018, Sweden introduced the **BK4** load class, which allows vehicle combinations of up to **74 tonnes** (previously 64 t). Many bridges have not yet been approved for BK4, often because current assessment methods are conservative. Chalmers, NTNU and Volvo Trucks are researching how heavy vehicles load bridges dynamically, so that bridges can be safely reclassified.

This project is the first step in that research. It develops a **simplified, transparent dynamic model of a timber truck and drawbar trailer**. The model computes the **tyre–road contact forces** that will later be applied as moving loads in a bridge model to study the **Dynamic Amplification Factor (DAF)**.

## Model
- **Half-vehicle vertical–pitch model with 10 degrees of freedom (20 states):**
  - heave and pitch of the truck, trailer and drawbar
  - heave of four lumped unsprung axle groups (truck front/rear, trailer front/rear)
- Linear spring–damper suspension, a linear point-contact tyre model, and a drawbar coupling acting in heave and pitch.
- Equations of motion derived with Newton's laws and assembled into mass, stiffness and damping matrices. The state-space form is ẋ = Ax + Bu.
- **Static equilibrium preload:** the initial state x₀ = C⁻¹F is solved for, so that the simulation starts from the loaded ride height.
- **Road input:** the front axle sees the road profile. The other three axle groups get the same input delayed by their axle spacing divided by the speed (Simulink transport delays).
- **Parameters** come from the Swedish Transport Agency vehicle registry (masses, geometry, axle positions) and TruckMaker data plus expert estimates (suspension and tyres). The full list is in Appendix A of the report.

| Key data (nominal values, report Appendix A) | Truck | Trailer |
|---|---|---|
| Kerb weight + payload in the sweep (full vehicle) | 12 t + 20 t | 11 t + 31 t |
| Suspension stiffness, front / rear (half model) | 200 / 600 kN/m | 500 / 750 kN/m |
| Tyre stiffness, front / rear (half model) | 0.85 / 2.55 MN/m | 1.70 / 2.55 MN/m |
| CoG to front / rear axle group | 4.53 / 0.94 m | 3.97 / 2.99 m |

## Road Excitation Cases
| Case | Profile | Details |
|---|---|---|
| 1 – Speed bump | Half-sine | 0.5 m long, 0.1 m high. The input depends on vehicle speed |
| 2 – Road/bridge expansion joint | Step | 30 mm high, following Eurocode guidance for short spans |

## Simulation Study
- **Validation:** tyre contact forces were compared with IPG TruckMaker using a similar truck and drawbar trailer. The number of peaks and the overall response matched well. Absolute peak forces and settling times differ because TruckMaker uses a non-linear tyre model with a contact patch.
- **Load and speed sweep:** 3 load cases (full, half, empty) × 5 speeds (5–25 m/s) × 2 road cases = **30 simulations**. Each run records the peak contact force, the amplification factor (peak/static force) and the settling time for every axle group.

### Key findings
- **Speed bump:** amplification increases with speed. At 25 m/s the bump becomes a high-frequency excitation with a sharp force peak.
- **Expansion joint:** amplification is almost **independent of speed**, because the step is short and sharp.
- **Load:** the empty vehicle has the **highest amplification factor** but the **lowest absolute peak force**. The fully loaded vehicle has the highest peak force but smoother, more damped oscillations.
- **Low speeds** take the longest to settle.

| Speed bump – truck amplification factor | Expansion joint – truck amplification factor |
|---|---|
| ![Speed bump AF](Modeling/SummaryPlots_Speed%20Bump/Tractor_AF.png) | ![Expansion joint AF](Modeling/SummaryPlots_Expansion%20Joint/Tractor_AF.png) |

## Repository Structure
```
Dynamic-Loads-of-Timber-Truck/
├── Dynamic_load_of_timber_truck.pdf      Project report
└── Modeling/
    ├── PeakForce_and_Amp.m               Main script: builds the model, runs the load/speed sweep, computes peak force, AF and settling time, saves plots
    ├── New_method_with_static_Equilibrium.m   Single-run version with static-equilibrium preload and tyre force plots
    ├── Truck_staticEq_bump.slx           Simulink model – speed bump (with static equilibrium)
    ├── Truck_staticEq_step.slx           Simulink model – expansion joint (with static equilibrium)
    ├── Truck_model_bump.slx / Truck_model_step.slx   Earlier model versions (without preload)
    ├── Rough_work.m / Rough_work_sweep.m Earlier development scripts for the models above
    ├── Parameters.xlsx                   Vehicle data collected for parameterisation
    ├── Test Run, Test_Road.rd5           IPG TruckMaker test run and road used for validation
    ├── TruckMaker/                       TruckMaker bump and step test results
    ├── Figures/                          Tyre forces and deflections for all 30 sweep cases
    ├── SummaryPlots_Speed Bump/          Peak force, AF and settling time vs speed – speed bump
    └── SummaryPlots_Expansion Joint/     Peak force, AF and settling time vs speed – expansion joint
```

## How to Run
1. Open the `Modeling` folder in MATLAB.
2. **Single simulation:** run `New_method_with_static_Equilibrium.m` to set up the parameters and matrices. Then run `Truck_staticEq_bump.slx` or `Truck_staticEq_step.slx` in Simulink, and run the tyre-force section of the script to plot the results.
3. **Full sweep:** open `PeakForce_and_Amp.m` and choose the road case in the `sim(...)` line (`Truck_staticEq_bump.slx` or `Truck_staticEq_step.slx`). As noted at the top of the script, put a breakpoint before the combined-plot section, run the sweep, and then continue to generate the summary plots.

## Future Work
- Apply the contact forces as moving loads in a bridge model (Abaqus) and evaluate the DAF from strain and displacement.
- Run full-scale tests with an instrumented timber truck and bridge, and use the data to tune and validate the model.
- Add realistic road roughness classes and multi-vehicle traffic scenarios.

## Key Skills
`Heavy vehicle dynamics` · `Multi-body vertical/pitch modelling` · `State-space modelling` · `MATLAB/Simulink` · `IPG TruckMaker` · `Parameter sweeps` · `Dynamic amplification factor` · `Vehicle–bridge interaction` · `Industry collaboration (Volvo Trucks)`
