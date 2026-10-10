! CMD Version:2
! Version 2 enables expanded acceptable characters for object names.
! If unspecified, set to 1 or set to an invalid value, Adams View assumes traditional naming requirements.
!
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = mm  &
   angle = deg  &
   force = newton  &
   mass = kg  &
   time = sec
!
defaults units  &
   coordinate_system_type = cartesian  &
   orientation_type = body313
!
!------------------------ Default Attributes for Model ------------------------!
!
!
defaults attributes  &
   inheritance = bottom_up  &
   icon_visibility = on  &
   grid_visibility = off  &
   size_of_icons = 50.0  &
   spacing_for_grid = 1000.0
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = Box_Wedge_prob2
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .Box_Wedge_prob2.steel  &
   adams_id = 1  &
   density = 7.801E-06  &
   youngs_modulus = 2.07E+05  &
   poissons_ratio = 0.29
!
!-------------------------------- Rigid Parts ---------------------------------!
!
! Create parts and their dependent markers and graphics
!
!----------------------------------- ground -----------------------------------!
!
!
! ****** Ground Part ******
!
defaults model  &
   part_name = ground
!
defaults coordinate_system  &
   default_coordinate_system = .Box_Wedge_prob2.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Box_Wedge_prob2.ground.MARKER_4  &
   adams_id = 4  &
   location = 0.0, 0.0, 0.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Box_Wedge_prob2.ground  &
   material_type = .Box_Wedge_prob2.steel
!
! ****** Points for current part ******
!
point create  &
   point_name = .Box_Wedge_prob2.ground.POINT_1  &
   location = 0.0, 0.0, 0.0
!
point create  &
   point_name = .Box_Wedge_prob2.ground.POINT_2  &
   location = 866.025, 0.0, 0.0
!
point create  &
   point_name = .Box_Wedge_prob2.ground.POINT_3  &
   location = 0.0, 500.0, 0.0
!
point create  &
   point_name = .Box_Wedge_prob2.ground.POINT_4  &
   location = 0.0, 500.0, 0.0
!
point create  &
   point_name = .Box_Wedge_prob2.ground.POINT_5  &
   location = 0.0, 550.0, 0.0
!
point attributes  &
   point_name = .Box_Wedge_prob2.ground.POINT_5  &
   visibility = off
!
point create  &
   point_name = .Box_Wedge_prob2.ground.POINT_6  &
   location = 50.0, 550.0, 0.0
!
point attributes  &
   point_name = .Box_Wedge_prob2.ground.POINT_6  &
   visibility = off
!
point create  &
   point_name = .Box_Wedge_prob2.ground.POINT_7  &
   location = 50.0, 500.0, 0.0
!
point attributes  &
   point_name = .Box_Wedge_prob2.ground.POINT_7  &
   visibility = off
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Box_Wedge_prob2.ground  &
   name_visibility = off
!
!----------------------------------- Wedge ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Box_Wedge_prob2.ground
!
part create rigid_body name_and_position  &
   part_name = .Box_Wedge_prob2.Wedge  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Box_Wedge_prob2.Wedge
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Box_Wedge_prob2.Wedge.MARKER_1  &
   adams_id = 1  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Box_Wedge_prob2.Wedge.cm  &
   adams_id = 9  &
   location = 288.8666666667, 166.6666666667, 0.0  &
   orientation = 249.5720978409d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Box_Wedge_prob2.Wedge.MARKER_3  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Box_Wedge_prob2.Wedge.MARKER_8  &
   adams_id = 8  &
   location = 0.0, 500.0, 0.0  &
   orientation = 60.0d, 90.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Box_Wedge_prob2.Wedge  &
   mass = 5.0  &
   center_of_mass_marker = .Box_Wedge_prob2.Wedge.cm  &
   ixx = 9.3831337502E+04  &
   iyy = 7.7947598223E+04  &
   izz = 1.5884020772E+04  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
defaults coordinate_system  &
   default_coordinate_system = .Box_Wedge_prob2.Wedge.MARKER_1
!
geometry create shape extrusion  &
   extrusion_name = .Box_Wedge_prob2.Wedge.EXTRUSION_8  &
   adams_id = 8  &
   reference_marker = .Box_Wedge_prob2.Wedge.MARKER_1  &
   analytical = yes  &
   points_for_profile = 0.0, 0.0, -25.0  &
      , 866.025, 0.0, -25.0  &
      , 0.0, 500.0, -25.0  &
      , 0.0, 0.0, -25.0  &
   length_along_z_axis = 50.0
!
defaults coordinate_system  &
   default_coordinate_system = .Box_Wedge_prob2.Wedge
!
part attributes  &
   part_name = .Box_Wedge_prob2.Wedge  &
   color = RED  &
   name_visibility = off
!
!------------------------------------ Box -------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Box_Wedge_prob2.ground
!
part create rigid_body name_and_position  &
   part_name = .Box_Wedge_prob2.Box  &
   adams_id = 3  &
   location = -243.3012701892, 91.9872981078, 0.0  &
   orientation = 330.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Box_Wedge_prob2.Box
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Box_Wedge_prob2.Box.MARKER_2  &
   adams_id = 2  &
   location = 6.6987298108, 475.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Box_Wedge_prob2.Box.cm  &
   adams_id = 10  &
   location = 28.8397459622, 516.6506350946, 0.0  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Box_Wedge_prob2.Box.MARKER_7  &
   adams_id = 7  &
   location = 6.6987298108, 475.0, 0.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Box_Wedge_prob2.Box  &
   mass = 1.0  &
   center_of_mass_marker = .Box_Wedge_prob2.Box.cm  &
   ixx = 8.126041667  &
   iyy = 4.0646460417  &
   izz = 4.0646460417  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
defaults coordinate_system  &
   default_coordinate_system = .Box_Wedge_prob2.Box.MARKER_2
!
geometry create shape extrusion  &
   extrusion_name = .Box_Wedge_prob2.Box.EXTRUSION_9  &
   adams_id = 9  &
   reference_marker = .Box_Wedge_prob2.Box.MARKER_2  &
   analytical = yes  &
   points_for_profile = 0.0, 0.0, -25.0  &
      , 0.0, 50.0, -25.0  &
      , 50.0, 50.0, -25.0  &
      , 50.0, 0.0, -25.0  &
      , 0.0, 0.0, -25.0  &
   length_along_z_axis = 50.0
!
defaults coordinate_system  &
   default_coordinate_system = .Box_Wedge_prob2.Box
!
part attributes  &
   part_name = .Box_Wedge_prob2.Box  &
   color = GREEN  &
   name_visibility = off
!
!---------------------------------- Contacts ----------------------------------!
!
!
contact create  &
   contact_name = .Box_Wedge_prob2.CONTACT_1  &
   adams_id = 1  &
   type = solid_to_solid  &
   i_geometry_name = .Box_Wedge_prob2.Wedge.EXTRUSION_8  &
   j_geometry_name = .Box_Wedge_prob2.Box.EXTRUSION_9  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1
!
force attributes  &
   force_name = .Box_Wedge_prob2.CONTACT_1  &
   active = off
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint translational  &
   joint_name = .Box_Wedge_prob2.JOINT_1  &
   adams_id = 1  &
   i_marker_name = .Box_Wedge_prob2.Wedge.MARKER_3  &
   j_marker_name = .Box_Wedge_prob2.ground.MARKER_4
!
constraint attributes  &
   constraint_name = .Box_Wedge_prob2.JOINT_1  &
   name_visibility = off
!
constraint create joint translational  &
   joint_name = .Box_Wedge_prob2.JOINT_3  &
   adams_id = 3  &
   i_marker_name = .Box_Wedge_prob2.Box.MARKER_7  &
   j_marker_name = .Box_Wedge_prob2.Wedge.MARKER_8
!
constraint attributes  &
   constraint_name = .Box_Wedge_prob2.JOINT_3  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
force create element_like friction  &
   friction_name = .Box_Wedge_prob2.FRICTION_1  &
   adams_id = 1  &
   joint_name = .Box_Wedge_prob2.JOINT_3  &
   mu_static = 0.44  &
   mu_dynamic = 0.44  &
   reaction_arm = 1.0  &
   initial_overlap = 1000.0  &
   formulation = original  &
   stiction_transition_velocity = 0.1  &
   transition_velocity_coefficient = 1.5  &
   max_stiction_deformation = 1.0E-02  &
   friction_force_preload = 0.0  &
   overlap_delta = constant  &
   effect = all  &
   preload = off  &
   reaction_force = on  &
   torsional_moment = off  &
   bending_moment = off  &
   inactive_during_static = off
!
force attributes  &
   force_name = .Box_Wedge_prob2.FRICTION_1  &
   active = off
!
force create element_like friction  &
   friction_name = .Box_Wedge_prob2.FRICTION_2  &
   adams_id = 2  &
   joint_name = .Box_Wedge_prob2.JOINT_1  &
   mu_static = 0.5  &
   mu_dynamic = 7.53E-02  &
   reaction_arm = 1.0  &
   initial_overlap = 1000.0  &
   formulation = original  &
   stiction_transition_velocity = 1.0E-03  &
   transition_velocity_coefficient = 1.5  &
   max_stiction_deformation = 1.0E-02  &
   friction_force_preload = 0.0  &
   overlap_delta = constant  &
   effect = all  &
   preload = off  &
   reaction_force = on  &
   torsional_moment = off  &
   bending_moment = off  &
   inactive_during_static = off
!
force attributes  &
   force_name = .Box_Wedge_prob2.FRICTION_2  &
   active = off
!
!---------------------------------- Sensors -----------------------------------!
!
!
executive_control create sensor  &
   sensor_name = .Box_Wedge_prob2.SENSOR_1  &
   adams_id = 1  &
   compare = eq  &
   value = 1.0  &
   error = 0.001  &
   codgen = off  &
   halt = on  &
   print = off  &
   restart = off  &
   return = off  &
   yydump = off  &
   function = ""
!
executive_control attributes sensor  &
   sensor_name = .Box_Wedge_prob2.SENSOR_1  &
   active = off
!
executive_control create sensor  &
   sensor_name = .Box_Wedge_prob2.SENSOR_2  &
   adams_id = 2  &
   compare = le  &
   value = 0.0  &
   error = 0.001  &
   codgen = off  &
   halt = off  &
   print = off  &
   restart = off  &
   return = on  &
   yydump = off  &
   function = ""
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .Box_Wedge_prob2.Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=no end_time=2.0 number_of_steps=100 model_name=.Box_Wedge_prob2"
!
!------------------------------ Dynamic Graphics ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Box_Wedge_prob2.ground
!
geometry create shape gcontact  &
   contact_force_name = .Box_Wedge_prob2.GCONTACT_12  &
   adams_id = 12  &
   contact_element_name = .Box_Wedge_prob2.CONTACT_1  &
   force_display = components
!
geometry attributes  &
   geometry_name = .Box_Wedge_prob2.GCONTACT_12  &
   active = off  &
   color = RED
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = -9806.65  &
   z_component_gravity = 0.0
!
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------------- Measures ----------------------------------!
!
!
measure create object  &
   measure_name = .Box_Wedge_prob2.Wedge_MEA_1  &
   from_first = no  &
   object = .Box_Wedge_prob2.Wedge  &
   characteristic = cm_velocity  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Box_Wedge_prob2.Wedge_MEA_1  &
   color = WHITE
!
measure create object  &
   measure_name = .Box_Wedge_prob2.Box_MEA_2  &
   from_first = no  &
   object = .Box_Wedge_prob2.Box  &
   characteristic = cm_velocity  &
   component = mag_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Box_Wedge_prob2.Box_MEA_2  &
   color = WHITE
!
measure create object  &
   measure_name = .Box_Wedge_prob2.Box_MEA_3  &
   from_first = no  &
   object = .Box_Wedge_prob2.Box  &
   characteristic = cm_position  &
   component = mag_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Box_Wedge_prob2.Box_MEA_3  &
   color = WHITE
!
measure create object  &
   measure_name = .Box_Wedge_prob2.Vel_Bx  &
   from_first = no  &
   object = .Box_Wedge_prob2.Box  &
   characteristic = cm_velocity  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Box_Wedge_prob2.Vel_Bx  &
   color = WHITE
!
measure create object  &
   measure_name = .Box_Wedge_prob2.Vel_By  &
   from_first = no  &
   object = .Box_Wedge_prob2.Box  &
   characteristic = cm_velocity  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Box_Wedge_prob2.Vel_By  &
   color = WHITE
!
measure create object  &
   measure_name = .Box_Wedge_prob2.Vel_Wx  &
   from_first = no  &
   object = .Box_Wedge_prob2.Wedge  &
   characteristic = cm_velocity  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Box_Wedge_prob2.Vel_Wx  &
   color = WHITE
!
measure create object  &
   measure_name = .Box_Wedge_prob2.Vel_Wy  &
   from_first = no  &
   object = .Box_Wedge_prob2.Wedge  &
   characteristic = cm_velocity  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Box_Wedge_prob2.Vel_Wy  &
   color = WHITE
!
measure create point  &
   measure_name = .Box_Wedge_prob2.cm_MEA_1  &
   point = .Box_Wedge_prob2.Box.cm  &
   characteristic = translational_displacement  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Box_Wedge_prob2.cm_MEA_1  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .Box_Wedge_prob2.MEA_PT2PT_1  &
   from_point = .Box_Wedge_prob2.Wedge.cm  &
   to_point = .Box_Wedge_prob2.Box.cm  &
   characteristic = translational_velocity  &
   component = mag_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Box_Wedge_prob2.MEA_PT2PT_1  &
   color = WHITE
!
measure create pt2pt  &
   measure_name = .Box_Wedge_prob2.MEA_PT2PT_10  &
   from_point = .Box_Wedge_prob2.Wedge.MARKER_1  &
   to_point = .Box_Wedge_prob2.Box.MARKER_2  &
   characteristic = translational_displacement  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Box_Wedge_prob2.MEA_PT2PT_10  &
   color = WHITE
!
!---------------------------- Function definitions ----------------------------!
!
!
executive_control modify sensor  &
   sensor_name = .Box_Wedge_prob2.SENSOR_1  &
   function = ".Box_Wedge_prob2.cm_MEA_1"
!
executive_control modify sensor  &
   sensor_name = .Box_Wedge_prob2.SENSOR_2  &
   function = ".Box_Wedge_prob2.MEA_PT2PT_10"
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
point modify  &
   point_name = .Box_Wedge_prob2.ground.POINT_4  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Box_Wedge_prob2.ground.POINT_3))
!
marker modify  &
   marker_name = .Box_Wedge_prob2.ground.MARKER_4  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Box_Wedge_prob2.ground.POINT_1))
!
marker modify  &
   marker_name = .Box_Wedge_prob2.Wedge.MARKER_1  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Box_Wedge_prob2.ground.POINT_1))  &
   relative_to = .Box_Wedge_prob2.Wedge
!
defaults coordinate_system  &
   default_coordinate_system = .Box_Wedge_prob2.ground
!
geometry modify shape extrusion  &
   extrusion_name = .Box_Wedge_prob2.Wedge.EXTRUSION_8  &
   length_along_z_axis = (5.0cm)  &
   relative_to = .Box_Wedge_prob2.Wedge
!
defaults coordinate_system  &
   default_coordinate_system = .Box_Wedge_prob2.ground
!
marker modify  &
   marker_name = .Box_Wedge_prob2.Wedge.MARKER_8  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Box_Wedge_prob2.ground.POINT_3))  &
   relative_to = .Box_Wedge_prob2.Wedge
!
defaults coordinate_system  &
   default_coordinate_system = .Box_Wedge_prob2.ground
!
marker modify  &
   marker_name = .Box_Wedge_prob2.Wedge.MARKER_3  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Box_Wedge_prob2.ground.POINT_1))  &
   relative_to = .Box_Wedge_prob2.Wedge
!
defaults coordinate_system  &
   default_coordinate_system = .Box_Wedge_prob2.ground
!
marker modify  &
   marker_name = .Box_Wedge_prob2.Box.MARKER_2  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Box_Wedge_prob2.ground.POINT_3))  &
   relative_to = .Box_Wedge_prob2.Box
!
defaults coordinate_system  &
   default_coordinate_system = .Box_Wedge_prob2.ground
!
geometry modify shape extrusion  &
   extrusion_name = .Box_Wedge_prob2.Box.EXTRUSION_9  &
   length_along_z_axis = (5.0cm)  &
   relative_to = .Box_Wedge_prob2.Box
!
defaults coordinate_system  &
   default_coordinate_system = .Box_Wedge_prob2.ground
!
marker modify  &
   marker_name = .Box_Wedge_prob2.Box.MARKER_7  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Box_Wedge_prob2.ground.POINT_3))  &
   relative_to = .Box_Wedge_prob2.Box
!
defaults coordinate_system  &
   default_coordinate_system = .Box_Wedge_prob2.ground
!
material modify  &
   material_name = .Box_Wedge_prob2.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
model display  &
   model_name = Box_Wedge_prob2
