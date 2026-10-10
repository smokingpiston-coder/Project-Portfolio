# Electric and Hybrid Vehicles – Hybridization of a Porsche Panamera 970

**Course:** TME095 Electric and Hybrid Vehicles, Chalmers University of Technology (Fall 2024)
**Group 15:** Nihar Prakash Mehta, Ramkumar Huleppa Munavalli, Wilhelm Hansson
**Tools:** MATLAB / Simulink, QSS Toolbox

📄 [Project report (PDF)](Porsche_Panamera_Hybridization_Report.pdf)

---

## Overview
Our group was assigned the **Class F luxury segment**. We modelled a **Porsche Panamera 970** with a conventional petrol powertrain, then **hybridised it as both a series hybrid and a parallel hybrid**. All three powertrains were run on a **custom driving cycle** representing typical use of this class of car, and their fuel consumption was compared. Each hybrid has its own **rule-based energy management controller**. For a fair comparison, the battery state of charge (SOC) at the end of the cycle matches the start.

## Results
| Powertrain | Fuel consumption (L/100 km) | Improvement vs conventional |
|------------|-----------------------------|-----------------------------|
| Conventional | 17.57 | – |
| Series hybrid | 11.29 | **−35.7 %** |
| Parallel hybrid | **7.40** | **−57.9 %** |

- The **parallel hybrid** gives the largest saving. The engine drives the wheels directly, so there are fewer energy conversion steps than in the series layout (engine → generator → battery/motor).
- The **series hybrid** saves fuel by running the engine–generator unit only near its best-efficiency point (about 120 kW, ~30 % overall efficiency) and using the battery as much as possible.
- **Performance check:** the conventional model reached 0–100 km/h in **6 s** and 0–160 km/h in **16 s**. The real car's targets are 6.8 s and 14 s.

| Custom driving cycle | Engine operating points: conventional vs parallel hybrid |
|---|---|
| ![Custom driving cycle](images/custom_driving_cycle.png) | ![ICE conventional](images/ICE_map_conventional.png) ![ICE parallel](images/ICE_map_parallel_hybrid.png) |

In the conventional car, most engine operating points fall in high-fuel-consumption regions because power demand is low. In the parallel hybrid, the controller moves them into the efficient region.

## Vehicle and Powertrain Data
| Parameter | Conventional | Series hybrid | Parallel hybrid |
|-----------|--------------|---------------|-----------------|
| Engine (petrol, Otto) | 285 kW | 300 kW | 285 kW |
| Electric motor | – | 300 kW | 16 kW |
| Generator | – | 300 kW | – |
| Transmission | 8-speed automatic | Single-speed (ratio 2) | 8-speed automatic |
| Mass | 2081 kg | 2181 kg | 2181 kg |
| C<sub>D</sub> / frontal area | 0.30 / 2.33 m² | 0.30 / 2.33 m² | 0.30 / 2.33 m² |
| Wheel diameter | 0.62 m | 0.62 m | 0.62 m |

Gear ratios: 5.97 / 3.22 / 2.08 / 1.42 / 1.05 / 0.84 / 0.68 / 0.53, with a final drive of 3.36.

**Battery (Li-ion):**
- 2.5 kWh, made of 43 cells in series × 1 in parallel (3.8 V, 15 Ah cells, 100 A peak).
- About 16.3 kW peak power, limited to 9 kW in the controller.
- 100 kg including cooling, housing and electrical components.

## Energy Management Strategies
**Series hybrid**
- Keeps the SOC between **20 % and 90 %**.
- **Engine off below 9 kW** demand: the battery alone powers the electric motor.
- Above 9 kW, the engine–generator unit supplies the demand, supported by the battery.
- The battery is recharged when the engine can run in its efficient region, or when the SOC reaches 20 %.
- **On–off SOC strategy:** deplete to 20 %, then recharge to 40 %. Regenerative braking charges the battery.

**Parallel hybrid**
- Low demand: electric only, engine off.
- Medium demand: motor on, with the engine covering the rest.
- High demand, in the engine's efficient region: engine only.
- Peak demand: engine and motor together, about 300 kW.
- SOC is kept within 20–90 % with the same on–off strategy, and charge/discharge power is limited to what the battery can handle.

![SOC series hybrid](images/SOC_series_hybrid.png)
*Battery SOC over the driving cycle (series hybrid), showing the on–off charge strategy.*

## Repository Structure
```
Electric-and-Hybrid-Vehicles/
├── Porsche_Panamera_Hybridization_Report.pdf
├── images/                         Key figures from the report
├── Conventional/
│   └── PorschePanamera.slx         Conventional powertrain (QSS)
├── Custom-Driving-Cycle/
│   └── UD_DC_Porschev3.mat         Custom urban + highway driving cycle
├── Series/
│   ├── porsche_panamera_970_series_hybrid.slx   Series hybrid model with battery controller
│   ├── porsche_main_series.m       Runs the model and plots ICE, EM and generator operating points
│   ├── battery.m                   Battery pack sizing (energy, peak power)
│   ├── power_demand_series.m       Finds the optimal ICE operating points for each power demand
│   ├── egu_efficiency.m            Engine–generator unit efficiency
│   ├── torque_request.m            Torque needed for a given power and speed
│   ├── plot_operating_point.m / plot_operating_point_EM.m   Plot the operating points on ICE/EM maps
│   └── User_guide_series.txt
└── Parallel/
    ├── ParallelHybrid.slx          Parallel hybrid model with battery controller
    ├── porsche_main_paralell.m     Runs the model and plots ICE and EM operating points
    ├── Assignment2.m               EM best-efficiency operating points (16 kW motor)
    └── user_instructions.txt
```

## How to Run
Requires MATLAB/Simulink with the **QSS Toolbox**, which provides the component blocks and the `plotICE`/`plotEM`/`plotEG` functions. Add the `Custom-Driving-Cycle` folder to the MATLAB path so the models can load the driving cycle.

- **Conventional:** open and run `Conventional/PorschePanamera.slx`.
- **Series hybrid:** set the initial SOC to **39 %**, then run `Series/porsche_main_series.m`.
- **Parallel hybrid:** set the initial SOC to **28 %**, then run `Parallel/porsche_main_paralell.m`.

## Limitations and Future Work
- Interpolation errors in the QSS maps.
- Battery power is limited to 9 kW (the hardware could deliver 16 kW) to avoid unexpected voltage drops.
- The battery mass (cooling, housing) is estimated, and may be on the high side.
- A dedicated gearbox controller could further optimise the parallel hybrid.

## Key Skills
`Hybrid powertrain modelling` · `Series and parallel HEV architectures` · `Energy management / rule-based control` · `Battery sizing & SOC management` · `Driving cycle design` · `Fuel consumption analysis` · `QSS Toolbox` · `MATLAB/Simulink`
