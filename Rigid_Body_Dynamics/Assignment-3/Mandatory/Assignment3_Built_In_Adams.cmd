! CMD Version:2
! Version 2 enables expanded acceptable characters for object names.
! If unspecified, set to 1 or set to an invalid value, Adams View assumes traditional naming requirements.
!
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = cm  &
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
   size_of_icons = 5.0  &
   spacing_for_grid = 100.0
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = Assignment3_Built_In_Adams
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .Assignment3_Built_In_Adams.steel  &
   adams_id = 1  &
   density = 7.801E-03  &
   youngs_modulus = 2.07E+07  &
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
   default_coordinate_system = .Assignment3_Built_In_Adams.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Assignment3_Built_In_Adams.ground.MARKER_6  &
   adams_id = 6  &
   location = -50.0, 0.0, 0.0  &
   orientation = 90.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Assignment3_Built_In_Adams.ground.MARKER_10  &
   adams_id = 10  &
   location = -50.0, 0.0, 0.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Assignment3_Built_In_Adams.ground.MARKER_14  &
   adams_id = 14  &
   location = 48.3, 0.0, 0.0  &
   orientation = 90.0d, 90.0d, 270.0d
!
part create rigid_body mass_properties  &
   part_name = .Assignment3_Built_In_Adams.ground  &
   material_type = .Assignment3_Built_In_Adams.steel
!
! ****** Points for current part ******
!
point create  &
   point_name = .Assignment3_Built_In_Adams.ground.POINT_1_Origin  &
   location = 0.0, 0.0, 0.0
!
point create  &
   point_name = .Assignment3_Built_In_Adams.ground.POINT_2_IP  &
   location = -80.0, 0.0, 0.0
!
point create  &
   point_name = .Assignment3_Built_In_Adams.ground.POINT_3_OP  &
   location = 80.0, 0.0, 0.0
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Assignment3_Built_In_Adams.ground  &
   name_visibility = off
!
!-------------------------------- INPUT_Shaft ---------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Assignment3_Built_In_Adams.ground
!
part create rigid_body name_and_position  &
   part_name = .Assignment3_Built_In_Adams.INPUT_Shaft  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Assignment3_Built_In_Adams.INPUT_Shaft
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Assignment3_Built_In_Adams.INPUT_Shaft.MARKER_1  &
   adams_id = 1  &
   location = -80.0, 0.0, 0.0  &
   orientation = 90.0d, 90.0d, 270.0d
!
marker create  &
   marker_name = .Assignment3_Built_In_Adams.INPUT_Shaft.cm  &
   adams_id = 7  &
   location = -50.0, 0.0, 0.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Assignment3_Built_In_Adams.INPUT_Shaft.MARKER_11  &
   adams_id = 11  &
   location = 0.0, 0.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .Assignment3_Built_In_Adams.INPUT_Shaft.MARKER_5  &
   adams_id = 5  &
   location = -50.0, 0.0, 0.0  &
   orientation = 90.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Assignment3_Built_In_Adams.INPUT_Shaft.MARKER_9  &
   adams_id = 9  &
   location = -50.0, 0.0, 0.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
part create rigid_body mass_properties  &
   part_name = .Assignment3_Built_In_Adams.INPUT_Shaft  &
   material_type = .Assignment3_Built_In_Adams.steel
!
! ****** Graphics for current part ******
!
geometry create shape cylinder  &
   cylinder_name = .Assignment3_Built_In_Adams.INPUT_Shaft.CYLINDER_4  &
   adams_id = 4  &
   center_marker = .Assignment3_Built_In_Adams.INPUT_Shaft.MARKER_1  &
   angle_extent = 360.0  &
   length = 60.0  &
   radius = 5.0  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
part attributes  &
   part_name = .Assignment3_Built_In_Adams.INPUT_Shaft  &
   color = CYAN  &
   name_visibility = off
!
!-------------------------------- OUTPUT_Shaft --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Assignment3_Built_In_Adams.ground
!
part create rigid_body name_and_position  &
   part_name = .Assignment3_Built_In_Adams.OUTPUT_Shaft  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Assignment3_Built_In_Adams.OUTPUT_Shaft
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Assignment3_Built_In_Adams.OUTPUT_Shaft.MARKER_2  &
   adams_id = 2  &
   location = 80.0, 0.0, 0.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Assignment3_Built_In_Adams.OUTPUT_Shaft.cm  &
   adams_id = 8  &
   location = 48.3, 0.0, 0.0  &
   orientation = 90.0d, 90.0d, 270.0d
!
marker create  &
   marker_name = .Assignment3_Built_In_Adams.OUTPUT_Shaft.MARKER_12  &
   adams_id = 12  &
   location = 0.0, 0.0, 0.0  &
   orientation = 300.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Assignment3_Built_In_Adams.OUTPUT_Shaft.MARKER_13  &
   adams_id = 13  &
   location = 48.3, 0.0, 0.0  &
   orientation = 90.0d, 90.0d, 270.0d
!
part create rigid_body mass_properties  &
   part_name = .Assignment3_Built_In_Adams.OUTPUT_Shaft  &
   mass = 147.0453857439  &
   center_of_mass_marker = .Assignment3_Built_In_Adams.OUTPUT_Shaft.cm  &
   ixx = 4.7789750367E+04  &
   iyy = 4.7789750367E+04  &
   izz = 7352.2692871962  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape cylinder  &
   cylinder_name = .Assignment3_Built_In_Adams.OUTPUT_Shaft.CYLINDER_5  &
   adams_id = 5  &
   center_marker = .Assignment3_Built_In_Adams.OUTPUT_Shaft.MARKER_2  &
   angle_extent = 360.0  &
   length = 60.0  &
   radius = 5.0  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
part attributes  &
   part_name = .Assignment3_Built_In_Adams.OUTPUT_Shaft  &
   color = RED  &
   name_visibility = off
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint hooke  &
   joint_name = .Assignment3_Built_In_Adams.JOINT_3  &
   adams_id = 3  &
   i_marker_name = .Assignment3_Built_In_Adams.INPUT_Shaft.MARKER_11  &
   j_marker_name = .Assignment3_Built_In_Adams.OUTPUT_Shaft.MARKER_12
!
constraint attributes  &
   constraint_name = .Assignment3_Built_In_Adams.JOINT_3  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Assignment3_Built_In_Adams.JOINT_2  &
   adams_id = 2  &
   i_marker_name = .Assignment3_Built_In_Adams.INPUT_Shaft.MARKER_9  &
   j_marker_name = .Assignment3_Built_In_Adams.ground.MARKER_10
!
constraint attributes  &
   constraint_name = .Assignment3_Built_In_Adams.JOINT_2  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Assignment3_Built_In_Adams.JOINT_1  &
   adams_id = 4  &
   i_marker_name = .Assignment3_Built_In_Adams.OUTPUT_Shaft.MARKER_13  &
   j_marker_name = .Assignment3_Built_In_Adams.ground.MARKER_14
!
constraint attributes  &
   constraint_name = .Assignment3_Built_In_Adams.JOINT_1  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .Assignment3_Built_In_Adams.Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=no end_time=25.0 number_of_steps=1000 model_name=.Assignment3_Built_In_Adams"
!
!---------------------------------- Motions -----------------------------------!
!
!
constraint create motion_generator  &
   motion_name = .Assignment3_Built_In_Adams.MOTION_1  &
   adams_id = 1  &
   i_marker_name = .Assignment3_Built_In_Adams.INPUT_Shaft.MARKER_5  &
   j_marker_name = .Assignment3_Built_In_Adams.ground.MARKER_6  &
   axis = b3  &
   function = ""
!
constraint attributes  &
   constraint_name = .Assignment3_Built_In_Adams.MOTION_1  &
   name_visibility = off
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = 0.0  &
   z_component_gravity = 0.0
!
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------------- Measures ----------------------------------!
!
!
measure create object  &
   measure_name = .Assignment3_Built_In_Adams.Angle  &
   from_first = yes  &
   object = .Assignment3_Built_In_Adams.JOINT_2  &
   characteristic = ax_ay_az_projection_angles  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Assignment3_Built_In_Adams.Angle  &
   color = WHITE
!
measure create point  &
   measure_name = .Assignment3_Built_In_Adams.Input_omega  &
   point = .Assignment3_Built_In_Adams.INPUT_Shaft.cm  &
   characteristic = angular_velocity  &
   component = mag_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Assignment3_Built_In_Adams.Input_omega  &
   color = WHITE
!
measure create point  &
   measure_name = .Assignment3_Built_In_Adams.Output_omega  &
   point = .Assignment3_Built_In_Adams.OUTPUT_Shaft.cm  &
   characteristic = angular_velocity  &
   component = mag_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Assignment3_Built_In_Adams.Output_omega  &
   color = WHITE
!
measure create computed  &
   measure_name = .Assignment3_Built_In_Adams.Speed_ratio  &
   text_of_expression = "0"  &
   units = "no_units"  &
   create_measure_display = no
!
entity attributes  &
   entity_name = .Assignment3_Built_In_Adams.Speed_ratio  &
   color = WHITE
!
measure create computed  &
   measure_name = .Assignment3_Built_In_Adams.Analytical  &
   text_of_expression = "0"  &
   units = "no_units"  &
   create_measure_display = no
!
entity attributes  &
   entity_name = .Assignment3_Built_In_Adams.Analytical  &
   color = WHITE
!
!---------------------------- Adams View Variables ----------------------------!
!
!
variable create  &
   variable_name = .Assignment3_Built_In_Adams.length  &
   units = "length"  &
   range = -1.0, 1.0  &
   use_allowed_values = no  &
   delta_type = relative  &
   real_value = 80.0
!
variable create  &
   variable_name = .Assignment3_Built_In_Adams.beta  &
   units = "angle"  &
   range = -1.0, 1.0  &
   use_allowed_values = no  &
   delta_type = relative  &
   real_value = 0.0
!
variable create  &
   variable_name = .Assignment3_Built_In_Adams.cm_length  &
   units = "length"  &
   range = -1.0, 1.0  &
   use_allowed_values = no  &
   delta_type = relative  &
   real_value = 48.3
!
!---------------------------- Function definitions ----------------------------!
!
!
constraint modify motion_generator  &
   motion_name = .Assignment3_Built_In_Adams.MOTION_1  &
   function = "30.0d * time"
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
marker modify  &
   marker_name = .Assignment3_Built_In_Adams.ground.MARKER_14  &
   location =   &
      (.Assignment3_Built_In_Adams.cm_length * COS(.Assignment3_Built_In_Adams.beta)),  &
      (.Assignment3_Built_In_Adams.cm_length * SIN(.Assignment3_Built_In_Adams.beta)),  &
      0.0  &
   orientation =   &
      (ORI_ALONG_AXIS(.Assignment3_Built_In_Adams.ground.POINT_1_Origin, .Assignment3_Built_In_Adams.ground.POINT_3_OP, "Z"))
!
point modify  &
   point_name = .Assignment3_Built_In_Adams.ground.POINT_3_OP  &
   location =   &
      (.Assignment3_Built_In_Adams.length * COS(.Assignment3_Built_In_Adams.beta)),  &
      (.Assignment3_Built_In_Adams.length * SIN(.Assignment3_Built_In_Adams.beta)),  &
      0.0
!
material modify  &
   material_name = .Assignment3_Built_In_Adams.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
marker modify  &
   marker_name = .Assignment3_Built_In_Adams.INPUT_Shaft.MARKER_1  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Assignment3_Built_In_Adams.ground.POINT_2_IP))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Assignment3_Built_In_Adams.ground.POINT_2_IP, .Assignment3_Built_In_Adams.ground.POINT_1_Origin, "Z"))  &
   relative_to = .Assignment3_Built_In_Adams.INPUT_Shaft
!
defaults coordinate_system  &
   default_coordinate_system = .Assignment3_Built_In_Adams.ground
!
marker modify  &
   marker_name = .Assignment3_Built_In_Adams.INPUT_Shaft.MARKER_11  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Assignment3_Built_In_Adams.ground.POINT_1_Origin))  &
   relative_to = .Assignment3_Built_In_Adams.INPUT_Shaft
!
defaults coordinate_system  &
   default_coordinate_system = .Assignment3_Built_In_Adams.ground
!
geometry modify shape cylinder  &
   cylinder_name = .Assignment3_Built_In_Adams.INPUT_Shaft.CYLINDER_4  &
   length = (60.0cm)  &
   radius = (5cm)
!
marker modify  &
   marker_name = .Assignment3_Built_In_Adams.OUTPUT_Shaft.MARKER_2  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Assignment3_Built_In_Adams.ground.POINT_3_OP))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Assignment3_Built_In_Adams.ground.POINT_3_OP, .Assignment3_Built_In_Adams.ground.POINT_1_Origin, "Z"))  &
   relative_to = .Assignment3_Built_In_Adams.OUTPUT_Shaft
!
defaults coordinate_system  &
   default_coordinate_system = .Assignment3_Built_In_Adams.ground
!
marker modify  &
   marker_name = .Assignment3_Built_In_Adams.OUTPUT_Shaft.cm  &
   location =   &
      (.Assignment3_Built_In_Adams.cm_length * COS(.Assignment3_Built_In_Adams.beta)),  &
      (.Assignment3_Built_In_Adams.cm_length * SIN(.Assignment3_Built_In_Adams.beta)),  &
      0.0  &
   orientation =   &
      (ORI_ALONG_AXIS(.Assignment3_Built_In_Adams.ground.POINT_1_Origin, .Assignment3_Built_In_Adams.ground.POINT_3_OP, "Z"))  &
   relative_to = .Assignment3_Built_In_Adams.OUTPUT_Shaft
!
defaults coordinate_system  &
   default_coordinate_system = .Assignment3_Built_In_Adams.ground
!
marker modify  &
   marker_name = .Assignment3_Built_In_Adams.OUTPUT_Shaft.MARKER_12  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Assignment3_Built_In_Adams.ground.POINT_1_Origin))  &
   relative_to = .Assignment3_Built_In_Adams.OUTPUT_Shaft
!
defaults coordinate_system  &
   default_coordinate_system = .Assignment3_Built_In_Adams.ground
!
marker modify  &
   marker_name = .Assignment3_Built_In_Adams.OUTPUT_Shaft.MARKER_13  &
   location =   &
      (.Assignment3_Built_In_Adams.cm_length * COS(.Assignment3_Built_In_Adams.beta)),  &
      (.Assignment3_Built_In_Adams.cm_length * SIN(.Assignment3_Built_In_Adams.beta)),  &
      0.0  &
   orientation =   &
      (ORI_ALONG_AXIS(.Assignment3_Built_In_Adams.ground.POINT_1_Origin, .Assignment3_Built_In_Adams.ground.POINT_3_OP, "Z"))  &
   relative_to = .Assignment3_Built_In_Adams.OUTPUT_Shaft
!
defaults coordinate_system  &
   default_coordinate_system = .Assignment3_Built_In_Adams.ground
!
geometry modify shape cylinder  &
   cylinder_name = .Assignment3_Built_In_Adams.OUTPUT_Shaft.CYLINDER_5  &
   length = (60.0cm)  &
   radius = (5cm)
!
measure modify computed  &
   measure_name = .Assignment3_Built_In_Adams.Speed_ratio  &
   text_of_expression =   &
      "(.Assignment3_Built_In_Adams.Output_omega / .Assignment3_Built_In_Adams.Input_omega)"
!
measure modify computed  &
   measure_name = .Assignment3_Built_In_Adams.Analytical  &
   text_of_expression =   &
      "(COS(.Assignment3_Built_In_Adams.beta) * (1 + TAN(.Assignment3_Built_In_Adams.Angle + 90)**2) / (1 + TAN(.Assignment3_Built_In_Adams.Angle + 90)**2 * COS(.Assignment3_Built_In_Adams.beta)**2))"
!
model display  &
   model_name = Assignment3_Built_In_Adams
