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
   size_of_icons = 1.5  &
   spacing_for_grid = 100.0
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = ."Latch Design"
!
model attributes  &
   model_name = ."Latch Design"  &
   size_of_icons = 1.5
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = ."Latch Design".steel  &
   adams_id = 1  &
   density = 7.801E-03  &
   youngs_modulus = 2.07E+07  &
   poissons_ratio = 0.29
!
!-------------------------------- Rigid Parts ---------------------------------!
!
! Create parts and their dependent markers and graphics
!
!-------------------------------- Ground_Block --------------------------------!
!
!
! ****** Ground Part ******
!
part modify rigid_body name_and_position  &
   part_name = ground  &
   new_part_name = Ground_Block
!
defaults model  &
   part_name = Ground_Block
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = ."Latch Design".Ground_Block.MARKER_7  &
   adams_id = 7  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Ground_Block.MARKER_33  &
   adams_id = 33  &
   location = -2.0, 1.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Ground_Block.MARKER_35  &
   adams_id = 35  &
   location = -23.0, 1.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Ground_Block.MARKER_37  &
   adams_id = 37  &
   location = -10.0, 22.0, 0.0  &
   orientation = 315.0d, 90.0d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = ."Latch Design".Ground_Block  &
   material_type = ."Latch Design".steel
!
! ****** Points for current part ******
!
point create  &
   point_name = ."Latch Design".Ground_Block.POINT_1  &
   location = 0.0, 0.0, 0.0
!
point create  &
   point_name = ."Latch Design".Ground_Block.POINT_2  &
   location = 3.0, 3.0, 0.0
!
point create  &
   point_name = ."Latch Design".Ground_Block.POINT_3  &
   location = 2.0, 8.0, 0.0
!
point create  &
   point_name = ."Latch Design".Ground_Block.POINT_4  &
   location = -10.0, 22.0, 0.0
!
point create  &
   point_name = ."Latch Design".Ground_Block.POINT_8  &
   location = -1.0, 10.0, 0.0
!
point create  &
   point_name = ."Latch Design".Ground_Block.POINT_8_2  &
   location = -6.0, 5.0, 0.0
!
! ****** Graphics for current part ******
!
geometry create shape block  &
   block_name = ."Latch Design".Ground_Block.BOX_11  &
   adams_id = 11  &
   corner_marker = ."Latch Design".Ground_Block.MARKER_33  &
   diag_corner_coords = -16.0, -2.0, 4.0
!
part attributes  &
   part_name = ."Latch Design".Ground_Block  &
   name_visibility = on  &
   size_of_icons = 1.5
!
!----------------------------------- Pivot ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
part create rigid_body name_and_position  &
   part_name = ."Latch Design".Pivot  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Pivot
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = ."Latch Design".Pivot.MARKER_1  &
   adams_id = 1  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Pivot.MARKER_2  &
   adams_id = 2  &
   location = 3.0, 3.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Pivot.MARKER_3  &
   adams_id = 3  &
   location = 2.0, 8.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Pivot.cm  &
   adams_id = 10  &
   location = 1.5651519959, 3.7896571989, 0.0  &
   orientation = 167.0134198664d, 90.0d, 90.0d
!
marker create  &
   marker_name = ."Latch Design".Pivot.MARKER_6  &
   adams_id = 6  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Pivot.MARKER_8  &
   adams_id = 8  &
   location = 2.0, 8.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Pivot.MARKER_29  &
   adams_id = 29  &
   location = 3.0, 3.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = ."Latch Design".Pivot  &
   material_type = ."Latch Design".steel
!
! ****** Graphics for current part ******
!
geometry create shape plate  &
   plate_name = ."Latch Design".Pivot.PLATE_5  &
   marker_name = ."Latch Design".Pivot.MARKER_1,  &
                 ."Latch Design".Pivot.MARKER_2,  &
                 ."Latch Design".Pivot.MARKER_3  &
   width = 1.0  &
   radius = 1.0
!
part attributes  &
   part_name = ."Latch Design".Pivot  &
   color = RED  &
   name_visibility = off
!
!----------------------------------- Handle -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
part create rigid_body name_and_position  &
   part_name = ."Latch Design".Handle  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Handle
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = ."Latch Design".Handle.MARKER_4  &
   adams_id = 4  &
   location = 2.0, 8.0, 0.0  &
   orientation = 130.601294645d, 180.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Handle.MARKER_5  &
   adams_id = 5  &
   location = -10.0, 22.0, 0.0  &
   orientation = 130.601294645d, 180.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Handle.cm  &
   adams_id = 11  &
   location = -4.0, 15.0, 0.0  &
   orientation = 220.601294645d, 90.0000000009d, 89.9999999982d
!
marker create  &
   marker_name = ."Latch Design".Handle.MARKER_9  &
   adams_id = 9  &
   location = 2.0, 8.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Handle.MARKER_15  &
   adams_id = 15  &
   location = -1.0, 10.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Handle.MARKER_36  &
   adams_id = 36  &
   location = -10.0, 22.0, 0.0  &
   orientation = 315.0d, 90.0d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = ."Latch Design".Handle  &
   material_type = ."Latch Design".steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = ."Latch Design".Handle.LINK_6  &
   i_marker = ."Latch Design".Handle.MARKER_4  &
   j_marker = ."Latch Design".Handle.MARKER_5  &
   width = 1.8439088915  &
   depth = 0.9219544457
!
part attributes  &
   part_name = ."Latch Design".Handle  &
   color = GREEN  &
   name_visibility = off
!
!------------------------------------ Hook ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
part create rigid_body name_and_position  &
   part_name = ."Latch Design".Hook  &
   adams_id = 6  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Hook
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = ."Latch Design".Hook.MARKER_25  &
   adams_id = 25  &
   location = 5.0, 3.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Hook.cm  &
   adams_id = 32  &
   location = -6.0491803279, 4.0273224044, 0.0  &
   orientation = 269.299995408d, 90.0d, 90.0d
!
marker create  &
   marker_name = ."Latch Design".Hook.MARKER_27  &
   adams_id = 27  &
   location = -6.0, 5.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Hook.MARKER_28  &
   adams_id = 28  &
   location = 3.0, 3.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Hook.MARKER_34  &
   adams_id = 34  &
   location = -14.0, 1.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = ."Latch Design".Hook  &
   material_type = ."Latch Design".steel
!
! ****** Graphics for current part ******
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Hook.MARKER_25
!
geometry create shape extrusion  &
   extrusion_name = ."Latch Design".Hook.EXTRUSION_10  &
   adams_id = 10  &
   reference_marker = ."Latch Design".Hook.MARKER_25  &
   analytical = yes  &
   points_for_profile = 0.0, 0.0, -0.5  &
      , -2.0, 2.0, -0.5  &
      , -11.0, 3.0, -0.5  &
      , -19.0, 3.0, -0.5  &
      , -20.0, 2.0, -0.5  &
      , -20.0, 0.0, -0.5  &
      , -19.0, -2.0, -0.5  &
      , -17.0, -2.0, -0.5  &
      , -17.0, 0.0, -0.5  &
      , -10.0, 0.0, -0.5  &
      , -1.0, -1.0, -0.5  &
      , 0.0, 0.0, -0.5  &
   length_along_z_axis = 1.0
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Hook
!
part attributes  &
   part_name = ."Latch Design".Hook  &
   color = MAGENTA  &
   name_visibility = off
!
!----------------------------------- Slider -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
part create rigid_body name_and_position  &
   part_name = ."Latch Design".Slider  &
   adams_id = 5  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Slider
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = ."Latch Design".Slider.MARKER_13  &
   adams_id = 13  &
   location = -1.0, 10.0, 0.0  &
   orientation = 225.0d, 180.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Slider.MARKER_14  &
   adams_id = 14  &
   location = -6.0, 5.0, 0.0  &
   orientation = 225.0d, 180.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Slider.cm  &
   adams_id = 24  &
   location = -3.5, 7.5, 0.0  &
   orientation = 315.0d, 90.0000000235d, 89.999999739d
!
marker create  &
   marker_name = ."Latch Design".Slider.MARKER_16  &
   adams_id = 16  &
   location = -1.0, 10.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = ."Latch Design".Slider.MARKER_26  &
   adams_id = 26  &
   location = -6.0, 5.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = ."Latch Design".Slider  &
   material_type = ."Latch Design".steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = ."Latch Design".Slider.LINK_9  &
   i_marker = ."Latch Design".Slider.MARKER_13  &
   j_marker = ."Latch Design".Slider.MARKER_14  &
   width = 0.7071067812  &
   depth = 0.3535533906
!
part attributes  &
   part_name = ."Latch Design".Slider  &
   color = CYAN  &
   name_visibility = off
!
!---------------------------------- Contacts ----------------------------------!
!
!
contact create  &
   contact_name = ."Latch Design".CONTACT_1  &
   adams_id = 1  &
   type = solid_to_solid  &
   i_geometry_name = ."Latch Design".Hook.EXTRUSION_10  &
   j_geometry_name = ."Latch Design".Ground_Block.BOX_11  &
   stiffness = 1.0E+06  &
   damping = 100.0  &
   exponent = 2.2  &
   dmax = 1.0E-02
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint revolute  &
   joint_name = ."Latch Design".JOINT_1  &
   adams_id = 1  &
   i_marker_name = ."Latch Design".Pivot.MARKER_6  &
   j_marker_name = ."Latch Design".Ground_Block.MARKER_7
!
constraint attributes  &
   constraint_name = ."Latch Design".JOINT_1  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = ."Latch Design".JOINT_2  &
   adams_id = 2  &
   i_marker_name = ."Latch Design".Pivot.MARKER_8  &
   j_marker_name = ."Latch Design".Handle.MARKER_9
!
constraint attributes  &
   constraint_name = ."Latch Design".JOINT_2  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = ."Latch Design".JOINT_3  &
   adams_id = 3  &
   i_marker_name = ."Latch Design".Handle.MARKER_15  &
   j_marker_name = ."Latch Design".Slider.MARKER_16
!
constraint attributes  &
   constraint_name = ."Latch Design".JOINT_3  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = ."Latch Design".JOINT_4  &
   adams_id = 4  &
   i_marker_name = ."Latch Design".Slider.MARKER_26  &
   j_marker_name = ."Latch Design".Hook.MARKER_27
!
constraint attributes  &
   constraint_name = ."Latch Design".JOINT_4  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = ."Latch Design".JOINT_5  &
   adams_id = 5  &
   i_marker_name = ."Latch Design".Hook.MARKER_28  &
   j_marker_name = ."Latch Design".Pivot.MARKER_29
!
constraint attributes  &
   constraint_name = ."Latch Design".JOINT_5  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
force create direct single_component_force  &
   single_component_force_name = ."Latch Design".SFORCE_1  &
   adams_id = 1  &
   type_of_freedom = translational  &
   i_marker_name = ."Latch Design".Handle.MARKER_36  &
   j_marker_name = ."Latch Design".Ground_Block.MARKER_37  &
   action_only = on  &
   function = ""
!
!---------------------------------- Sensors -----------------------------------!
!
!
executive_control create sensor  &
   sensor_name = ."Latch Design".SENSOR_1  &
   adams_id = 1  &
   compare = le  &
   angular_value = 0.0  &
   angular_error = 1.0E-03  &
   codgen = off  &
   halt = on  &
   print = off  &
   restart = off  &
   return = off  &
   yydump = off  &
   function = ""
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = ."Latch Design".Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=no end_time=0.2 number_of_steps=100 model_name=.\"Latch Design\""
!
!-------------------------- Adams View UDE Instances --------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
undo begin_block suppress = yes
!
ude create instance  &
   instance_name = ."Latch Design".SPRING_1  &
   definition_name = .MDI.Forces.spring  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude attributes  &
   instance_name = ."Latch Design".SPRING_1  &
   color = RED
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = ."Latch Design".SPRING_1.i_marker  &
   object_value = (."Latch Design".Hook.MARKER_34)
!
variable modify  &
   variable_name = ."Latch Design".SPRING_1.j_marker  &
   object_value = (."Latch Design".Ground_Block.MARKER_35)
!
variable modify  &
   variable_name = ."Latch Design".SPRING_1.stiffness_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = ."Latch Design".SPRING_1.stiffness_coefficient  &
   real_value = 800.0
!
variable modify  &
   variable_name = ."Latch Design".SPRING_1.stiffness_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = ."Latch Design".SPRING_1.damping_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = ."Latch Design".SPRING_1.damping_coefficient  &
   real_value = 0.5
!
variable modify  &
   variable_name = ."Latch Design".SPRING_1.damping_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = ."Latch Design".SPRING_1.free_length_mode  &
   string_value = "design_length"
!
variable modify  &
   variable_name = ."Latch Design".SPRING_1.free_length  &
   real_value = 1.0
!
variable modify  &
   variable_name = ."Latch Design".SPRING_1.preload  &
   real_value = 0.0
!
variable modify  &
   variable_name = ."Latch Design".SPRING_1.i_dynamic_visibility  &
   string_value = "on"
!
variable modify  &
   variable_name = ."Latch Design".SPRING_1.j_dynamic_visibility  &
   string_value = "off"
!
variable modify  &
   variable_name = ."Latch Design".SPRING_1.spring_visibility  &
   string_value = "Depends"
!
variable modify  &
   variable_name = ."Latch Design".SPRING_1.damper_visibility  &
   string_value = "Depends"
!
ude modify instance  &
   instance_name = ."Latch Design".SPRING_1
!
undo end_block
!
!------------------------------ Dynamic Graphics ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
geometry create shape force  &
   force_name = ."Latch Design".SFORCE_1_force_graphic_1  &
   adams_id = 44  &
   force_element_name = ."Latch Design".SFORCE_1  &
   applied_at_marker_name = ."Latch Design".Handle.MARKER_36
!
geometry create shape gcontact  &
   contact_force_name = ."Latch Design".GCONTACT_17  &
   adams_id = 17  &
   contact_element_name = ."Latch Design".CONTACT_1  &
   force_display = components
!
geometry attributes  &
   geometry_name = ."Latch Design".GCONTACT_17  &
   color = RED
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = -980.665  &
   z_component_gravity = 0.0
!
force attributes  &
   force_name = ."Latch Design".gravity  &
   size_of_icons = 1.5
!
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------------- Measures ----------------------------------!
!
!
measure create angle  &
   measure_name = ."Latch Design".Overcentre_angle  &
   first_point = ."Latch Design".Slider.MARKER_13  &
   middle_point = ."Latch Design".Pivot.MARKER_8  &
   last_point = ."Latch Design".Slider.MARKER_14  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = ."Latch Design".Overcentre_angle  &
   color = WHITE
!
measure create computed  &
   measure_name = ."Latch Design".SPRING_1_MEA_1  &
   text_of_expression = "0"  &
   create_measure_display = no
!
entity attributes  &
   entity_name = ."Latch Design".SPRING_1_MEA_1  &
   color = WHITE
!
!---------------------------- Function definitions ----------------------------!
!
!
force modify direct single_component_force  &
   single_component_force_name = ."Latch Design".SFORCE_1  &
   function = "80.0"
!
executive_control modify sensor  &
   sensor_name = ."Latch Design".SENSOR_1  &
   function = ".\"Latch Design\".Overcentre_angle"
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = ."Latch Design".SPRING_1
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = Ground_Block
!
marker modify  &
   marker_name = ."Latch Design".Ground_Block.MARKER_7  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, ."Latch Design".Ground_Block.POINT_1))
!
geometry modify shape block  &
   block_name = ."Latch Design".Ground_Block.BOX_11  &
   diag_corner_coords =   &
      (-16.0cm),  &
      (-2.0cm),  &
      (4.0cm)
!
marker modify  &
   marker_name = ."Latch Design".Pivot.MARKER_1  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, ."Latch Design".Ground_Block.POINT_1))  &
   relative_to = ."Latch Design".Pivot
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
marker modify  &
   marker_name = ."Latch Design".Pivot.MARKER_2  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, ."Latch Design".Ground_Block.POINT_2))  &
   relative_to = ."Latch Design".Pivot
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
marker modify  &
   marker_name = ."Latch Design".Pivot.MARKER_3  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, ."Latch Design".Ground_Block.POINT_3))  &
   relative_to = ."Latch Design".Pivot
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
marker modify  &
   marker_name = ."Latch Design".Pivot.MARKER_6  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, ."Latch Design".Ground_Block.POINT_1))  &
   relative_to = ."Latch Design".Pivot
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
marker modify  &
   marker_name = ."Latch Design".Pivot.MARKER_8  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, ."Latch Design".Ground_Block.POINT_3))  &
   relative_to = ."Latch Design".Pivot
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
marker modify  &
   marker_name = ."Latch Design".Pivot.MARKER_29  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, ."Latch Design".Ground_Block.POINT_2))  &
   relative_to = ."Latch Design".Pivot
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
marker modify  &
   marker_name = ."Latch Design".Handle.MARKER_4  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, ."Latch Design".Ground_Block.POINT_3))  &
   orientation =   &
      (ORI_ALONG_AXIS(."Latch Design".Ground_Block.POINT_3, ."Latch Design".Ground_Block.POINT_4, "X"))  &
   relative_to = ."Latch Design".Handle
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
marker modify  &
   marker_name = ."Latch Design".Handle.MARKER_5  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, ."Latch Design".Ground_Block.POINT_4))  &
   orientation =   &
      (ORI_ALONG_AXIS(."Latch Design".Ground_Block.POINT_3, ."Latch Design".Ground_Block.POINT_4, "X"))  &
   relative_to = ."Latch Design".Handle
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
geometry modify shape link  &
   link_name = ."Latch Design".Handle.LINK_6  &
   width = (1.8439088915cm)  &
   depth = (0.9219544457cm)
!
marker modify  &
   marker_name = ."Latch Design".Handle.MARKER_9  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, ."Latch Design".Ground_Block.POINT_3))  &
   relative_to = ."Latch Design".Handle
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
marker modify  &
   marker_name = ."Latch Design".Handle.MARKER_15  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, ."Latch Design".Ground_Block.POINT_8))  &
   relative_to = ."Latch Design".Handle
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
marker modify  &
   marker_name = ."Latch Design".Slider.MARKER_13  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, ."Latch Design".Ground_Block.POINT_8))  &
   orientation =   &
      (ORI_ALONG_AXIS(."Latch Design".Ground_Block.POINT_8, ."Latch Design".Ground_Block.POINT_8_2, "X"))  &
   relative_to = ."Latch Design".Slider
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
marker modify  &
   marker_name = ."Latch Design".Slider.MARKER_14  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, ."Latch Design".Ground_Block.POINT_8_2))  &
   orientation =   &
      (ORI_ALONG_AXIS(."Latch Design".Ground_Block.POINT_8, ."Latch Design".Ground_Block.POINT_8_2, "X"))  &
   relative_to = ."Latch Design".Slider
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
geometry modify shape link  &
   link_name = ."Latch Design".Slider.LINK_9  &
   width = (0.7071067812cm)  &
   depth = (0.3535533906cm)
!
marker modify  &
   marker_name = ."Latch Design".Slider.MARKER_16  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, ."Latch Design".Ground_Block.POINT_8))  &
   relative_to = ."Latch Design".Slider
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
marker modify  &
   marker_name = ."Latch Design".Slider.MARKER_26  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, ."Latch Design".Ground_Block.POINT_8_2))  &
   relative_to = ."Latch Design".Slider
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
marker modify  &
   marker_name = ."Latch Design".Hook.MARKER_27  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, ."Latch Design".Ground_Block.POINT_8_2))  &
   relative_to = ."Latch Design".Hook
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
marker modify  &
   marker_name = ."Latch Design".Hook.MARKER_28  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, ."Latch Design".Ground_Block.POINT_2))  &
   relative_to = ."Latch Design".Hook
!
defaults coordinate_system  &
   default_coordinate_system = ."Latch Design".Ground_Block
!
material modify  &
   material_name = ."Latch Design".steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
geometry modify shape force  &
   force_name = ."Latch Design".SFORCE_1_force_graphic_1  &
   applied_at_marker_name = (."Latch Design".SFORCE_1.i)
!
measure modify computed  &
   measure_name = ."Latch Design".SPRING_1_MEA_1  &
   text_of_expression =   &
      "(."Latch Design".SPRING_1.force)"
!
model display  &
   model_name = ."Latch Design"
