! CMD Version:2
! Version 2 enables expanded acceptable characters for object names.
! If unspecified, set to 1 or set to an invalid value, Adams View assumes traditional naming requirements.
!
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = meter  &
   angle = rad  &
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
   size_of_icons = 5.0E-02  &
   spacing_for_grid = 1.0
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = ."Cylinder_horizontal bar"
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = ."Cylinder_horizontal bar".steel  &
   adams_id = 1  &
   density = 7801.0  &
   youngs_modulus = 2.07E+11  &
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
   default_coordinate_system = ."Cylinder_horizontal bar".ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = ."Cylinder_horizontal bar".ground.MARKER_4  &
   adams_id = 4  &
   location = -0.35, -0.1, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = ."Cylinder_horizontal bar".ground.MARKER_6  &
   adams_id = 6  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = ."Cylinder_horizontal bar".ground.MARKER_7  &
   adams_id = 7  &
   location = 7.5E-02, -0.15, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = ."Cylinder_horizontal bar".ground  &
   material_type = ."Cylinder_horizontal bar".steel
!
! ****** Graphics for current part ******
!
geometry create shape block  &
   block_name = ."Cylinder_horizontal bar".ground.Ground  &
   adams_id = 3  &
   corner_marker = ."Cylinder_horizontal bar".ground.MARKER_4  &
   diag_corner_coords = 0.85, -0.1, 0.2
!
part attributes  &
   part_name = ."Cylinder_horizontal bar".ground  &
   name_visibility = off
!
!---------------------------------- Cylinder ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ."Cylinder_horizontal bar".ground
!
part create rigid_body name_and_position  &
   part_name = ."Cylinder_horizontal bar".Cylinder  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = ."Cylinder_horizontal bar".Cylinder
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = ."Cylinder_horizontal bar".Cylinder.MARKER_1  &
   adams_id = 1  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = ."Cylinder_horizontal bar".Cylinder.cm  &
   adams_id = 8  &
   location = 0.0, 0.0, -0.15  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = ."Cylinder_horizontal bar".Cylinder.MARKER_5  &
   adams_id = 5  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = ."Cylinder_horizontal bar".Cylinder.MARKER_10  &
   adams_id = 10  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = ."Cylinder_horizontal bar".Cylinder  &
   mass = 4.0  &
   center_of_mass_marker = ."Cylinder_horizontal bar".Cylinder.cm  &
   ixx = 1.01333E-02  &
   iyy = 1.01333E-02  &
   izz = 2.0E-02  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape cylinder  &
   cylinder_name = ."Cylinder_horizontal bar".Cylinder.CYLINDER_1  &
   adams_id = 1  &
   center_marker = ."Cylinder_horizontal bar".Cylinder.MARKER_1  &
   angle_extent = 6.2831853072  &
   length = 0.3  &
   radius = 0.1  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
part attributes  &
   part_name = ."Cylinder_horizontal bar".Cylinder  &
   color = CYAN  &
   name_visibility = off
!
!------------------------------------ Bar -------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ."Cylinder_horizontal bar".ground
!
part create rigid_body name_and_position  &
   part_name = ."Cylinder_horizontal bar".Bar  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = ."Cylinder_horizontal bar".Bar
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = ."Cylinder_horizontal bar".Bar.MARKER_2  &
   adams_id = 2  &
   location = -0.1, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = ."Cylinder_horizontal bar".Bar.MARKER_3  &
   adams_id = 3  &
   location = 0.3, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = ."Cylinder_horizontal bar".Bar.cm  &
   adams_id = 9  &
   location = 0.1, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = ."Cylinder_horizontal bar".Bar.MARKER_11  &
   adams_id = 11  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = ."Cylinder_horizontal bar".Bar  &
   mass = 2.0  &
   center_of_mass_marker = ."Cylinder_horizontal bar".Bar.cm  &
   ixx = 1.0E-03  &
   iyy = 2.66667E-02  &
   izz = 2.66667E-02  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = ."Cylinder_horizontal bar".Bar.LINK_2  &
   i_marker = ."Cylinder_horizontal bar".Bar.MARKER_2  &
   j_marker = ."Cylinder_horizontal bar".Bar.MARKER_3  &
   width = 3.0E-02  &
   depth = 1.5E-02
!
part attributes  &
   part_name = ."Cylinder_horizontal bar".Bar  &
   color = MAGENTA  &
   name_visibility = off
!
!---------------------------------- Contacts ----------------------------------!
!
!
contact create  &
   contact_name = ."Cylinder_horizontal bar".CONTACT_1  &
   adams_id = 1  &
   type = solid_to_solid  &
   i_geometry_name = ."Cylinder_horizontal bar".Cylinder.CYLINDER_1  &
   j_geometry_name = ."Cylinder_horizontal bar".ground.Ground  &
   stiffness = 1.0E+08  &
   damping = 1.0E+04  &
   exponent = 2.2  &
   dmax = 1.0E-04  &
   coulomb_friction = on  &
   mu_static = 1.0  &
   mu_dynamic = 1.0  &
   stiction_transition_velocity = 1.0E-05  &
   friction_transition_velocity = 1.0E-05
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint planar  &
   joint_name = ."Cylinder_horizontal bar".JOINT_1  &
   adams_id = 1  &
   i_marker_name = ."Cylinder_horizontal bar".Cylinder.MARKER_5  &
   j_marker_name = ."Cylinder_horizontal bar".ground.MARKER_6
!
constraint attributes  &
   constraint_name = ."Cylinder_horizontal bar".JOINT_1  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = ."Cylinder_horizontal bar".JOINT_2  &
   adams_id = 2  &
   i_marker_name = ."Cylinder_horizontal bar".Cylinder.MARKER_10  &
   j_marker_name = ."Cylinder_horizontal bar".Bar.MARKER_11
!
constraint attributes  &
   constraint_name = ."Cylinder_horizontal bar".JOINT_2  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
!---------------------------------- Sensors -----------------------------------!
!
!
executive_control create sensor  &
   sensor_name = ."Cylinder_horizontal bar".SENSOR_1  &
   adams_id = 1  &
   compare = le  &
   value = -1.57  &
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
   sim_script_name = ."Cylinder_horizontal bar".Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=no end_time=1.57 number_of_steps=50 model_name=.\"Cylinder_horizontal bar\""
!
!------------------------------ Dynamic Graphics ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ."Cylinder_horizontal bar".ground
!
geometry create shape gcontact  &
   contact_force_name = ."Cylinder_horizontal bar".GCONTACT_7  &
   adams_id = 7  &
   contact_element_name = ."Cylinder_horizontal bar".CONTACT_1  &
   force_display = components
!
geometry attributes  &
   geometry_name = ."Cylinder_horizontal bar".GCONTACT_7  &
   color = RED
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = -9.80665  &
   z_component_gravity = 0.0
!
!----------------------------- Analysis settings ------------------------------!
!
!
executive_control set kinematics_parameters  &
   model_name = ."Cylinder_horizontal bar"  &
   error = 1.0E-06
!
!---------------------------------- Measures ----------------------------------!
!
!
measure create object  &
   measure_name = ."Cylinder_horizontal bar".Bar_MEA_1  &
   from_first = no  &
   object = ."Cylinder_horizontal bar".Bar  &
   characteristic = cm_angular_velocity  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = ."Cylinder_horizontal bar".Bar_MEA_1  &
   color = WHITE
!
measure create function  &
   measure_name = ."Cylinder_horizontal bar".Angle  &
   function = ""  &
   units = "angle"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = ."Cylinder_horizontal bar".Angle  &
   color = WHITE
!
measure create function  &
   measure_name = ."Cylinder_horizontal bar".Bar_angular_velocity  &
   function = ""  &
   units = "angular_velocity"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = ."Cylinder_horizontal bar".Bar_angular_velocity  &
   active = off  &
   color = WHITE
!
!---------------------------- Function definitions ----------------------------!
!
!
measure modify function  &
   measure_name = ."Cylinder_horizontal bar".Angle  &
   function = "Az(.\"Cylinder_horizontal bar\".Bar.MARKER_3)"
!
measure modify function  &
   measure_name = ."Cylinder_horizontal bar".Bar_angular_velocity  &
   function = ".\"Cylinder_horizontal bar\".Bar.MARKER_3"
!
executive_control modify sensor  &
   sensor_name = ."Cylinder_horizontal bar".SENSOR_1  &
   function = "Az(.\"Cylinder_horizontal bar\".Bar.MARKER_3)"
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
geometry modify shape block  &
   block_name = ."Cylinder_horizontal bar".ground.Ground  &
   diag_corner_coords =   &
      (0.85meter),  &
      (-0.1meter),  &
      (0.2meter)
!
geometry modify shape link  &
   link_name = ."Cylinder_horizontal bar".Bar.LINK_2  &
   width = (3.0E-02meter)  &
   depth = (1.5E-02meter)
!
material modify  &
   material_name = ."Cylinder_horizontal bar".steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
model display  &
   model_name = ."Cylinder_horizontal bar"
