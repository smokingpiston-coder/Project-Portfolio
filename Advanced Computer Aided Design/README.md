# Advanced Computer Aided Design – Wheel Excavator in CATIA V5

**Course:** PPU080 Advanced Computer Aided Design, Chalmers University of Technology (2025/2026)
**Project:** Group 25
**Tools:** CATIA V5 (Part Design, Generative Shape Design, Assembly Design, rendering), RD&T

🖼️ **Renders:** see the [`Renders/`](Renders) folder

---

## Overview
The project was to design and model a **full-size wheel excavator in CATIA V5**, with the level of detail of a realistic toy excavator. The geometry, styling and details were our own design, within the requirements in the course specification. The project combined:

- **Structured surface modelling** of complex, styled parts: cab, counterweight body and bucket.
- **Solid modelling** of structural and mechanical parts: undercarriage, wheels, boom, arm and hydraulic cylinders.
- **Parametric design:** the rim diameter is driven by one global parameter.
- **Constrained assembly** with correct degrees of freedom and clash-free digging motion.
- **Geometry assurance** of the cab door in RD&T.
- **Realistic rendering** with environment, lighting, shadows, reflections and materials.

All sketches are fully constrained, and all finished parts are solids, including those built with surface modelling. The specification trees are structured so that someone else can easily follow them.

## Excavator Modules

### 🏠 Cab (surface modelling)
- Imported the industrial-design cab shape (Alias) and split it into **separate windows**, a **door with a split line**, and the **cab body**.
- Wireframe and surface geometry are organised in separate geometrical sets.
- **Flanges** are modelled on the surface model all around the door, on both the door and the cab, then turned into **2 mm sheet-metal solids** with Thick Surface.
- Two separately designed **door hinges**, plus a door lock and hinge rod.

### 📐 Geometry Assurance (RD&T)
- Variation analysis of the **door-to-cab relation**. The door is positioned by its hinges using a **3-2-1 positioning system** that makes sense from an assembly point of view.
- **4 gap, 4 flush and 4 parallelism measures** on the two non-hinged relations, with tolerances on all positioning and measure points.
- Two requirements were defined and documented with a master system layout (Volvo flags), a requirement drawing and calculation pages. The RD&T model files are not part of this repository.

### 🧱 Counterweight Body (surface modelling)
- A styled, futuristic body built from several surface types (extrude, sweep, fill, blend, multi-section) and operations (join, split, trim). It is not a single-command shape.
- A separate **100 mm bottom plate**, with interfaces for the boom and cab and a **Ø500 mm pin** that fits into the undercarriage.
- Realistic details: **exhaust pipe**, **footstep**, **engine cover**, plus a **brake light and indicators**.

### 🪟 Rubber Sealing
- A front-window **rubber sealing** with a separate **assembly strip** facing the inside of the cab, and a gap between the cab and the glass.

### 🛞 Undercarriage and Wheels (solid modelling)
- A realistic undercarriage with a **2600 mm wheelbase** and a Ø1000 mm platform interface to the counterweight body.
- **Tyre and rim are separate parts** in one product, with tread on the tyre and a realistic rim.
- The **outer wheel diameter is fixed at 800 mm**. The **rim diameter is parameterised (500–600 mm)** by one global parameter, visible in the tree, that updates both the rim and the tyre.
- The wheel hub and rim have patterned bolt holes, fitted with **ISO 4014 M20×80 bolts and ISO 4034 M20 nuts** from the CATIA standard library.

### 🪣 Bucket (surface modelling)
- Advanced geometry with no sharp corners. It is built from **separate inner and outer surfaces** using the oversized-surface method.
- **Grooves** on the curved outer surface are a separate feature attached with split/trim/join. The side surfaces are joined before the bucket is closed into a solid with Close Surface.
- **Teeth** and **attachment features** are separate bodies, also surface-modelled.

### 🦾 Boom, Arm and Hydraulic Cylinders
- The **boom and arm are hollow rectangular tubes**, with pin interfaces between boom, arm, linkage and bucket.
- **Hydraulic cylinders** (cylinder and piston) are modelled as subassemblies and constrained as **flexible subassemblies**.
- Dedicated **pins** for every joint: plate–boom, plate–cylinder, boom–cylinder, arm–boom, arm–piston, linkage–arm, linkage–piston and bucket.

### 🔧 Final Assembly
- The undercarriage is fixed, and every joint has the correct degrees of freedom. The model reassembles itself on update after an exploded view.
- The wheel bolts reuse the hole pattern, and there are **no interferences anywhere in the digging motion**.

## CAD Files
All CATIA files are in [`CAD-Files/`](CAD-Files). **Open `Excavator_Group25.CATProduct`** to load the complete excavator.

| Module | Files |
|--------|-------|
| **Top-level assembly** | `Excavator_Group25.CATProduct` |
| **Cab** | `Cabin Assembly.CATProduct`, `Cabin_V2`, `Cabin glass`, `Wind Shield Glass`, `Door`, `Door Glass`, `Door lock`, `Door Hinges`, `Door Hinges_2`, `Hinge assy.CATProduct`, `Hinge rod`, `Cabin mounting` |
| **Rubber sealing** | `Rubber Sealing with Assembly Strip`, `Rubber dampings` |
| **Counterweight body** | `Counter Weight_V2`, `Counter Weight_Bottom`, `Engine Cover V2`, `Exhaust Pipe`, `Footstep_V2`, `Bottom plate assy_V2.CATProduct`, `Bottom plate_V2`, `Bottom plate flange` |
| **Lights** | `Brake light`, `Indicator`, `Tail Light Housing`, `Tail LAmp Assembly.CATProduct` |
| **Undercarriage and wheels** | `Under Carriage`, `Wheel Hub`, `RIM`, `Tyre3`, `Tyre_Rim assy.CATProduct`, ISO 4014 bolts and ISO 4034 nuts (incl. mirrored copies) |
| **Digging equipment** | `Boom`, `Arm`, `Linkage`, `Bucket` |
| **Hydraulic cylinders** | `Piston-Cylinder Sub Assembly.CATProduct`, `Piston-Cylinder_AB Sub Assembly.CATProduct`, `Cyclinder`, `Cyclinder_AB`, `Piston`, `Piston_AB` |
| **Pins** | `Pin_Plate-Boom`, `Pin_Plate-Cylinder`, `Pin_Boom-Cylinder`, `Pin_Arm-Boom`, `Pin_Arm-Piston`, `Pin_Linkage-Arm`, `Pin_Linkage-Piston`, `Pin_Bucket` |

Files without an extension in the table are `.CATPart` files.

> **Note:** keep all files in the same folder. CATIA assemblies link to their parts by file name, so moving or renaming individual files breaks the assembly. Use **File → Save Management → Propagate Directory** if you save a copy.

## Repository Structure
```
Advanced-Computer-Aided-Design/
├── README.md
├── Excavator_Model-Files/      CATIA V5 parts and assemblies (open Excavator_Group25.CATProduct)
└── Renders/        Realistic renders of the excavator
```

## Key Skills
`CATIA V5` · `Generative Shape Design (surface modelling)` · `Part Design` · `Assembly Design & kinematic constraints` · `Flexible subassemblies` · `Parametric design` · `Sheet-metal flanges` · `Geometry assurance / RD&T` · `GD&T and tolerancing` · `Standard parts (ISO fasteners)` · `Photorealistic rendering`
