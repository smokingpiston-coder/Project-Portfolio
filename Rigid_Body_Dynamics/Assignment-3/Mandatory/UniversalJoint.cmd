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
   model_name = UniversalJoint
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .UniversalJoint.steel  &
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
   default_coordinate_system = .UniversalJoint.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .UniversalJoint.ground.MARKER_53  &
   adams_id = 53  &
   location = 25.4034118443, 0.0, 0.0  &
   orientation = 90.0d, 90.0d, 270.0d
!
marker create  &
   marker_name = .UniversalJoint.ground.MARKER_68  &
   adams_id = 68  &
   location = -25.0225872027, 0.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .UniversalJoint.ground.MARKER_70  &
   adams_id = 70  &
   location = -25.0225872027, 0.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = .UniversalJoint.ground  &
   material_type = .UniversalJoint.steel
!
! ****** Points for current part ******
!
point create  &
   point_name = .UniversalJoint.ground.POINT_1_IP  &
   location = 0.0, 25.0, 0.0
!
point create  &
   point_name = .UniversalJoint.ground.POINT_2_IP  &
   location = -20.0, 25.0, 0.0
!
point create  &
   point_name = .UniversalJoint.ground.POINT_3_IP  &
   location = 0.0, -25.0, 0.0
!
point create  &
   point_name = .UniversalJoint.ground.POINT_4_IP  &
   location = -20.0, -25.0, 0.0
!
point create  &
   point_name = .UniversalJoint.ground.POINT_1_OP  &
   location = 80.0, 0.0, 0.0
!
point create  &
   point_name = .UniversalJoint.ground.POINT_2_OP  &
   location = 0.0, 0.0, 0.0
!
point create  &
   point_name = .UniversalJoint.ground.POINT_22  &
   location = 80.0, 0.0, 0.0
!
point create  &
   point_name = .UniversalJoint.ground.POINT_3_OP  &
   location = 20.0, 0.0, 25.0
!
point create  &
   point_name = .UniversalJoint.ground.POINT_4_OP  &
   location = 20.0, 0.0, -25.0
!
point create  &
   point_name = .UniversalJoint.ground.POINT_1_Fork  &
   location = 0.0, 0.0, 25.0
!
point create  &
   point_name = .UniversalJoint.ground.POINT_2_Fork  &
   location = 0.0, 0.0, -25.0
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .UniversalJoint.ground  &
   name_visibility = off
!
!-------------------------------- Input_shaft ---------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
part create rigid_body name_and_position  &
   part_name = .UniversalJoint.Input_shaft  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.Input_shaft
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .UniversalJoint.Input_shaft.MARKER_66  &
   adams_id = 66  &
   location = 0.0, -25.0, 0.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .UniversalJoint.Input_shaft.MARKER_67  &
   adams_id = 67  &
   location = -25.0225872027, 0.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .UniversalJoint.Input_shaft.MARKER_61  &
   adams_id = 61  &
   location = 0.0, 25.0, 0.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .UniversalJoint.Input_shaft.cm  &
   adams_id = 21  &
   location = -25.0225872027, 0.0, 0.0  &
   orientation = 270.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .UniversalJoint.Input_shaft.MARKER_2  &
   adams_id = 2  &
   location = -20.0, 0.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .UniversalJoint.Input_shaft.MARKER_69  &
   adams_id = 69  &
   location = -25.0225872027, 0.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .UniversalJoint.Input_shaft.MARKER_62  &
   adams_id = 62  &
   location = -20.0, 25.0, 0.0  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .UniversalJoint.Input_shaft.MARKER_63  &
   adams_id = 63  &
   location = -20.0, -25.0, 0.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .UniversalJoint.Input_shaft.MARKER_64  &
   adams_id = 64  &
   location = -20.0, -25.0, 0.0  &
   orientation = 90.0d, 90.0d, 270.0d
!
part create rigid_body mass_properties  &
   part_name = .UniversalJoint.Input_shaft  &
   mass = 26.742586609  &
   center_of_mass_marker = .UniversalJoint.Input_shaft.cm  &
   ixx = 1.8461682621E+04  &
   iyy = 1.2501231058E+04  &
   izz = 6062.3057394031  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape cylinder  &
   cylinder_name = .UniversalJoint.Input_shaft.CYLINDER_10  &
   adams_id = 10  &
   center_marker = .UniversalJoint.Input_shaft.MARKER_2  &
   angle_extent = 360.0  &
   length = 60.0  &
   radius = 5.0  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
geometry create shape cylinder  &
   cylinder_name = .UniversalJoint.Input_shaft.CYLINDER_182  &
   adams_id = 182  &
   center_marker = .UniversalJoint.Input_shaft.MARKER_61  &
   angle_extent = 360.0  &
   length = 20.0  &
   radius = 5.0  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
geometry create shape cylinder  &
   cylinder_name = .UniversalJoint.Input_shaft.CYLINDER_213  &
   adams_id = 213  &
   center_marker = .UniversalJoint.Input_shaft.MARKER_62  &
   angle_extent = 360.0  &
   length = 25.0  &
   radius = 5.0  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
geometry create shape cylinder  &
   cylinder_name = .UniversalJoint.Input_shaft.CYLINDER_244  &
   adams_id = 244  &
   center_marker = .UniversalJoint.Input_shaft.MARKER_63  &
   angle_extent = 360.0  &
   length = 25.0  &
   radius = 5.0  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
geometry create shape cylinder  &
   cylinder_name = .UniversalJoint.Input_shaft.CYLINDER_275  &
   adams_id = 275  &
   center_marker = .UniversalJoint.Input_shaft.MARKER_64  &
   angle_extent = 360.0  &
   length = 20.0  &
   radius = 5.0  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
part attributes  &
   part_name = .UniversalJoint.Input_shaft  &
   color = CYAN  &
   name_visibility = off
!
!-------------------------------- Output_shaft --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
part create rigid_body name_and_position  &
   part_name = .UniversalJoint.Output_shaft  &
   adams_id = 5  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.Output_shaft
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .UniversalJoint.Output_shaft.MARKER_43  &
   adams_id = 43  &
   location = 80.0, 0.0, 0.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .UniversalJoint.Output_shaft.cm  &
   adams_id = 49  &
   location = 25.4034118443, 0.0, 0.0  &
   orientation = 90.0d, 90.0d, 270.0d
!
marker create  &
   marker_name = .UniversalJoint.Output_shaft.MARKER_44  &
   adams_id = 44  &
   location = 20.0, 0.0, 25.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .UniversalJoint.Output_shaft.MARKER_45  &
   adams_id = 45  &
   location = 20.0, 0.0, -25.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .UniversalJoint.Output_shaft.MARKER_46  &
   adams_id = 46  &
   location = 20.0, 0.0, 25.0  &
   orientation = 180.0d, 180.0d, 0.0d
!
marker create  &
   marker_name = .UniversalJoint.Output_shaft.MARKER_50  &
   adams_id = 50  &
   location = 0.0, 0.0, -25.0  &
   orientation = 90.0d, 180.0d, 0.0d
!
marker create  &
   marker_name = .UniversalJoint.Output_shaft.MARKER_52  &
   adams_id = 52  &
   location = 25.4034118443, 0.0, 0.0  &
   orientation = 90.0d, 90.0d, 270.0d
!
part create rigid_body mass_properties  &
   part_name = .UniversalJoint.Output_shaft  &
   mass = 22.9758415225  &
   center_of_mass_marker = .UniversalJoint.Output_shaft.cm  &
   ixx = 1.530462288E+04  &
   iyy = 9891.7379932512  &
   izz = 5484.6843912189  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape cylinder  &
   cylinder_name = .UniversalJoint.Output_shaft.CYLINDER_21  &
   adams_id = 21  &
   center_marker = .UniversalJoint.Output_shaft.MARKER_43  &
   angle_extent = 360.0  &
   length = 60.0  &
   radius = 5.0  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
geometry create shape cylinder  &
   cylinder_name = .UniversalJoint.Output_shaft.CYLINDER_22  &
   adams_id = 22  &
   center_marker = .UniversalJoint.Output_shaft.MARKER_44  &
   angle_extent = 360.0  &
   length = 20.0  &
   radius = 5.0  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
geometry create shape cylinder  &
   cylinder_name = .UniversalJoint.Output_shaft.CYLINDER_23  &
   adams_id = 23  &
   center_marker = .UniversalJoint.Output_shaft.MARKER_45  &
   angle_extent = 360.0  &
   length = 20.0  &
   radius = 5.0  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
geometry create shape cylinder  &
   cylinder_name = .UniversalJoint.Output_shaft.CYLINDER_24  &
   adams_id = 24  &
   center_marker = .UniversalJoint.Output_shaft.MARKER_46  &
   angle_extent = 360.0  &
   length = 50.0  &
   radius = 5.0  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
part attributes  &
   part_name = .UniversalJoint.Output_shaft  &
   color = RED  &
   name_visibility = off
!
!------------------------------------ Hook ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
part create rigid_body name_and_position  &
   part_name = .UniversalJoint.Hook  &
   adams_id = 4  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.Hook
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .UniversalJoint.Hook.MARKER_65  &
   adams_id = 65  &
   location = 0.0, -25.0, 0.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .UniversalJoint.Hook.MARKER_5  &
   adams_id = 5  &
   location = 0.0, 0.0, 25.0  &
   orientation = 0.0d, 180.0d, 0.0d
!
marker create  &
   marker_name = .UniversalJoint.Hook.cm  &
   adams_id = 23  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .UniversalJoint.Hook.MARKER_6  &
   adams_id = 6  &
   location = 0.0, -25.0, 0.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .UniversalJoint.Hook.MARKER_51  &
   adams_id = 51  &
   location = 0.0, 0.0, -25.0  &
   orientation = 90.0d, 180.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .UniversalJoint.Hook  &
   mass = 15.3172276817  &
   center_of_mass_marker = .UniversalJoint.Hook.cm  &
   ixx = 3215.0222685982  &
   iyy = 1631.4443025517  &
   izz = 1631.4443025517  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape cylinder  &
   cylinder_name = .UniversalJoint.Hook.CYLINDER_19  &
   adams_id = 19  &
   center_marker = .UniversalJoint.Hook.MARKER_5  &
   angle_extent = 360.0  &
   length = 50.0  &
   radius = 5.0  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
geometry create shape cylinder  &
   cylinder_name = .UniversalJoint.Hook.CYLINDER_20  &
   adams_id = 20  &
   center_marker = .UniversalJoint.Hook.MARKER_6  &
   angle_extent = 360.0  &
   length = 50.0  &
   radius = 5.0  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
part attributes  &
   part_name = .UniversalJoint.Hook  &
   color = YELLOW  &
   name_visibility = off
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint revolute  &
   joint_name = .UniversalJoint.JOINT_1  &
   adams_id = 6  &
   i_marker_name = .UniversalJoint.Hook.MARKER_65  &
   j_marker_name = .UniversalJoint.Input_shaft.MARKER_66
!
constraint attributes  &
   constraint_name = .UniversalJoint.JOINT_1  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .UniversalJoint.JOINT_2  &
   adams_id = 4  &
   i_marker_name = .UniversalJoint.Output_shaft.MARKER_50  &
   j_marker_name = .UniversalJoint.Hook.MARKER_51
!
constraint attributes  &
   constraint_name = .UniversalJoint.JOINT_2  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .UniversalJoint.JOINT_3  &
   adams_id = 7  &
   i_marker_name = .UniversalJoint.Input_shaft.MARKER_67  &
   j_marker_name = .UniversalJoint.ground.MARKER_68
!
constraint attributes  &
   constraint_name = .UniversalJoint.JOINT_3  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .UniversalJoint.JOINT_4  &
   adams_id = 5  &
   i_marker_name = .UniversalJoint.Output_shaft.MARKER_52  &
   j_marker_name = .UniversalJoint.ground.MARKER_53
!
constraint attributes  &
   constraint_name = .UniversalJoint.JOINT_4  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .UniversalJoint.Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=no end_time=25.0 number_of_steps=1000 model_name=.UniversalJoint"
!
!---------------------------------- Motions -----------------------------------!
!
!
constraint create motion_generator  &
   motion_name = .UniversalJoint.MOTION_1  &
   adams_id = 1  &
   i_marker_name = .UniversalJoint.Input_shaft.MARKER_69  &
   j_marker_name = .UniversalJoint.ground.MARKER_70  &
   axis = b3  &
   function = ""
!
constraint attributes  &
   constraint_name = .UniversalJoint.MOTION_1  &
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
   measure_name = .UniversalJoint.Angle  &
   from_first = no  &
   object = .UniversalJoint.JOINT_3  &
   characteristic = ax_ay_az_projection_angles  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .UniversalJoint.Angle  &
   color = WHITE
!
measure create point  &
   measure_name = .UniversalJoint.Input_omega  &
   point = .UniversalJoint.Input_shaft.cm  &
   characteristic = angular_velocity  &
   component = mag_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .UniversalJoint.Input_omega  &
   color = WHITE
!
measure create point  &
   measure_name = .UniversalJoint.Output_omega  &
   point = .UniversalJoint.Output_shaft.cm  &
   characteristic = angular_velocity  &
   component = mag_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .UniversalJoint.Output_omega  &
   color = WHITE
!
measure create computed  &
   measure_name = .UniversalJoint.Analytical  &
   text_of_expression = "0"  &
   units = "no_units"  &
   create_measure_display = no
!
entity attributes  &
   entity_name = .UniversalJoint.Analytical  &
   color = WHITE
!
measure create computed  &
   measure_name = .UniversalJoint.Speed_Ratio  &
   text_of_expression = "0"  &
   units = "no_units"  &
   create_measure_display = no
!
entity attributes  &
   entity_name = .UniversalJoint.Speed_Ratio  &
   color = WHITE
!
!---------------------------- Adams View Variables ----------------------------!
!
!
variable create  &
   variable_name = .UniversalJoint.Beta  &
   units = "angle"  &
   range = -1.0, 1.0  &
   use_allowed_values = no  &
   delta_type = relative  &
   real_value = 0.0
!
variable create  &
   variable_name = .UniversalJoint.Length1  &
   units = "length"  &
   range = -1.0, 1.0  &
   use_allowed_values = no  &
   delta_type = relative  &
   real_value = 80.0
!
variable create  &
   variable_name = .UniversalJoint.Length2  &
   units = "length"  &
   range = -1.0, 1.0  &
   use_allowed_values = no  &
   delta_type = relative  &
   real_value = 20.0
!
variable create  &
   variable_name = .UniversalJoint.cm_length  &
   units = "length"  &
   range = -1.0, 1.0  &
   use_allowed_values = no  &
   delta_type = relative  &
   real_value = 25.4034118443
!
!---------------------------- Function definitions ----------------------------!
!
!
constraint modify motion_generator  &
   motion_name = .UniversalJoint.MOTION_1  &
   function = "30.0d * time"
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
marker modify  &
   marker_name = .UniversalJoint.ground.MARKER_53  &
   location =   &
      (.UniversalJoint.cm_length * COS(.UniversalJoint.Beta)),  &
      (.UniversalJoint.cm_length * SIN(.UniversalJoint.Beta)),  &
      0.0  &
   orientation =   &
      (ORI_ALONG_AXIS(.UniversalJoint.ground.POINT_2_OP, .UniversalJoint.ground.POINT_1_OP, "Z"))
!
point modify  &
   point_name = .UniversalJoint.ground.POINT_1_OP  &
   location =   &
      (.UniversalJoint.Length1 * COS(.UniversalJoint.Beta)),  &
      (.UniversalJoint.Length1 * SIN(.UniversalJoint.Beta)),  &
      0.0
!
point modify  &
   point_name = .UniversalJoint.ground.POINT_22  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .UniversalJoint.ground.POINT_1_OP))
!
point modify  &
   point_name = .UniversalJoint.ground.POINT_3_OP  &
   location =   &
      (.UniversalJoint.Length2 * COS(.UniversalJoint.Beta)),  &
      (.UniversalJoint.Length2 * SIN(.UniversalJoint.Beta)),  &
      25.0
!
point modify  &
   point_name = .UniversalJoint.ground.POINT_4_OP  &
   location =   &
      (.UniversalJoint.Length2 * COS(.UniversalJoint.Beta)),  &
      (.UniversalJoint.Length2 * SIN(.UniversalJoint.Beta)),  &
      -25.0
!
material modify  &
   material_name = .UniversalJoint.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
marker modify  &
   marker_name = .UniversalJoint.Input_shaft.MARKER_66  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .UniversalJoint.ground.POINT_3_IP))  &
   relative_to = .UniversalJoint.Input_shaft
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
marker modify  &
   marker_name = .UniversalJoint.Input_shaft.MARKER_61  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .UniversalJoint.ground.POINT_1_IP))  &
   orientation =   &
      (ORI_ALONG_AXIS(.UniversalJoint.ground.POINT_1_IP, .UniversalJoint.ground.POINT_2_IP, "Z"))  &
   relative_to = .UniversalJoint.Input_shaft
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
marker modify  &
   marker_name = .UniversalJoint.Input_shaft.MARKER_62  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .UniversalJoint.ground.POINT_2_IP))  &
   relative_to = .UniversalJoint.Input_shaft
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
marker modify  &
   marker_name = .UniversalJoint.Input_shaft.MARKER_63  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .UniversalJoint.ground.POINT_4_IP))  &
   relative_to = .UniversalJoint.Input_shaft
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
marker modify  &
   marker_name = .UniversalJoint.Input_shaft.MARKER_64  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .UniversalJoint.ground.POINT_4_IP))  &
   orientation =   &
      (ORI_ALONG_AXIS(.UniversalJoint.ground.POINT_4_IP, .UniversalJoint.ground.POINT_3_IP, "Z"))  &
   relative_to = .UniversalJoint.Input_shaft
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
geometry modify shape cylinder  &
   cylinder_name = .UniversalJoint.Input_shaft.CYLINDER_10  &
   length = (60cm)  &
   radius = (5cm)
!
geometry modify shape cylinder  &
   cylinder_name = .UniversalJoint.Input_shaft.CYLINDER_182  &
   length = (20.0cm)  &
   radius = (5cm)
!
geometry modify shape cylinder  &
   cylinder_name = .UniversalJoint.Input_shaft.CYLINDER_213  &
   length = (25.0cm)  &
   radius = (5cm)
!
geometry modify shape cylinder  &
   cylinder_name = .UniversalJoint.Input_shaft.CYLINDER_244  &
   length = (25.0cm)  &
   radius = (5cm)
!
geometry modify shape cylinder  &
   cylinder_name = .UniversalJoint.Input_shaft.CYLINDER_275  &
   length = (20.0cm)
!
marker modify  &
   marker_name = .UniversalJoint.Output_shaft.MARKER_43  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .UniversalJoint.ground.POINT_1_OP))  &
   orientation =   &
      (ORI_ALONG_AXIS(.UniversalJoint.ground.POINT_1_OP, .UniversalJoint.ground.POINT_2_OP, "Z"))  &
   relative_to = .UniversalJoint.Output_shaft
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
marker modify  &
   marker_name = .UniversalJoint.Output_shaft.cm  &
   location =   &
      (.UniversalJoint.cm_length * COS(.UniversalJoint.Beta)),  &
      (.UniversalJoint.cm_length * SIN(.UniversalJoint.Beta)),  &
      0.0  &
   orientation =   &
      (ORI_ALONG_AXIS(.UniversalJoint.ground.POINT_2_OP, .UniversalJoint.ground.POINT_1_OP, "Z"))  &
   relative_to = .UniversalJoint.Output_shaft
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
marker modify  &
   marker_name = .UniversalJoint.Output_shaft.MARKER_44  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .UniversalJoint.ground.POINT_3_OP))  &
   orientation =   &
      (ORI_ALONG_AXIS(.UniversalJoint.ground.POINT_3_OP, .UniversalJoint.ground.POINT_1_Fork, "Z"))  &
   relative_to = .UniversalJoint.Output_shaft
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
marker modify  &
   marker_name = .UniversalJoint.Output_shaft.MARKER_45  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .UniversalJoint.ground.POINT_4_OP))  &
   orientation =   &
      (ORI_ALONG_AXIS(.UniversalJoint.ground.POINT_4_OP, .UniversalJoint.ground.POINT_2_Fork, "Z"))  &
   relative_to = .UniversalJoint.Output_shaft
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
marker modify  &
   marker_name = .UniversalJoint.Output_shaft.MARKER_46  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .UniversalJoint.ground.POINT_3_OP))  &
   orientation =   &
      (ORI_ALONG_AXIS(.UniversalJoint.ground.POINT_3_OP, .UniversalJoint.ground.POINT_4_OP, "Z"))  &
   relative_to = .UniversalJoint.Output_shaft
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
marker modify  &
   marker_name = .UniversalJoint.Output_shaft.MARKER_50  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .UniversalJoint.ground.POINT_2_Fork))  &
   relative_to = .UniversalJoint.Output_shaft
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
marker modify  &
   marker_name = .UniversalJoint.Output_shaft.MARKER_52  &
   location =   &
      (.UniversalJoint.cm_length * COS(.UniversalJoint.Beta)),  &
      (.UniversalJoint.cm_length * SIN(.UniversalJoint.Beta)),  &
      0.0  &
   orientation =   &
      (ORI_ALONG_AXIS(.UniversalJoint.ground.POINT_2_OP, .UniversalJoint.ground.POINT_1_OP, "Z"))  &
   relative_to = .UniversalJoint.Output_shaft
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
geometry modify shape cylinder  &
   cylinder_name = .UniversalJoint.Output_shaft.CYLINDER_21  &
   length = (60cm)  &
   radius = (5cm)
!
geometry modify shape cylinder  &
   cylinder_name = .UniversalJoint.Output_shaft.CYLINDER_22  &
   length = (20.0cm)  &
   radius = (5cm)
!
geometry modify shape cylinder  &
   cylinder_name = .UniversalJoint.Output_shaft.CYLINDER_23  &
   length = (20.0cm)  &
   radius = (5cm)
!
geometry modify shape cylinder  &
   cylinder_name = .UniversalJoint.Output_shaft.CYLINDER_24  &
   length = (50.0cm)  &
   radius = (5cm)
!
marker modify  &
   marker_name = .UniversalJoint.Hook.MARKER_65  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .UniversalJoint.ground.POINT_3_IP))  &
   relative_to = .UniversalJoint.Hook
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
marker modify  &
   marker_name = .UniversalJoint.Hook.cm  &
   location =   &
      (LOC_RELATIVE_TO({0.0, 0.0, 0.0}, .UniversalJoint.ground.POINT_2_OP))  &
   relative_to = .UniversalJoint.Hook
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
marker modify  &
   marker_name = .UniversalJoint.Hook.MARKER_51  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .UniversalJoint.ground.POINT_2_Fork))  &
   relative_to = .UniversalJoint.Hook
!
defaults coordinate_system  &
   default_coordinate_system = .UniversalJoint.ground
!
geometry modify shape cylinder  &
   cylinder_name = .UniversalJoint.Hook.CYLINDER_19  &
   length = (50cm)  &
   radius = (5cm)
!
geometry modify shape cylinder  &
   cylinder_name = .UniversalJoint.Hook.CYLINDER_20  &
   length = (50cm)  &
   radius = (5cm)
!
measure modify computed  &
   measure_name = .UniversalJoint.Analytical  &
   text_of_expression =   &
      "(COS(.UniversalJoint.Beta) * (1 + TAN(.UniversalJoint.Angle + 90)**2) / (1 + TAN(.UniversalJoint.Angle + 90)**2 * COS(.UniversalJoint.Beta)**2))"
!
measure modify computed  &
   measure_name = .UniversalJoint.Speed_Ratio  &
   text_of_expression =   &
      "(.UniversalJoint.Output_omega / .UniversalJoint.Input_omega)"
!
model display  &
   model_name = UniversalJoint
