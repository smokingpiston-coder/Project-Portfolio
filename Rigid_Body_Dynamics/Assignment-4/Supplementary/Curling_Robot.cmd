! CMD Version:2
! Version 2 enables expanded acceptable characters for object names.
! If unspecified, set to 1 or set to an invalid value, Adams View assumes traditional naming requirements.
!
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = mm  &
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
   icon_visibility = off  &
   grid_visibility = off  &
   size_of_icons = 50.0  &
   spacing_for_grid = 1000.0
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = Curling_Robot
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .Curling_Robot.steel  &
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
   default_coordinate_system = .Curling_Robot.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Curling_Robot.ground.MARKER_11  &
   adams_id = 11  &
   location = 0.0, 0.0, 0.0  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
marker create  &
   marker_name = .Curling_Robot.ground.MARKER_29  &
   adams_id = 29  &
   location = 200.0, 0.0, 5000.0  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .Curling_Robot.ground  &
   material_type = .Curling_Robot.steel
!
! ****** Points for current part ******
!
point create  &
   point_name = .Curling_Robot.ground.POINT_1_O  &
   location = 0.0, 0.0, 0.0
!
point create  &
   point_name = .Curling_Robot.ground.POINT_2_A  &
   location = 0.0, 800.0, 0.0
!
point create  &
   point_name = .Curling_Robot.ground.POINT_3_B  &
   location = 700.0, 800.0, 0.0
!
point create  &
   point_name = .Curling_Robot.ground.POINT_4_C  &
   location = 700.0, 300.0, 0.0
!
point create  &
   point_name = .Curling_Robot.ground.POINT_5_D  &
   location = 800.0, 300.0, 0.0
!
point create  &
   point_name = .Curling_Robot.ground.POINT_6_P  &
   location = 800.0, 350.0, 0.0
!
point create  &
   point_name = .Curling_Robot.ground.POINT_12  &
   location = 200.0, 0.0, 5000.0
!
point create  &
   point_name = .Curling_Robot.ground.POINT_12_2  &
   location = 200.0, 0.0, -500.0
!
point create  &
   point_name = .Curling_Robot.ground.POINT_13  &
   location = 1200.0, 0.0, -500.0
!
point create  &
   point_name = .Curling_Robot.ground.POINT_14  &
   location = 1200.0, 0.0, 5000.0
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Curling_Robot.ground  &
   name_visibility = off
!
!------------------------------------ Base ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
part create rigid_body name_and_position  &
   part_name = .Curling_Robot.Base  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.Base
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Curling_Robot.Base.MARKER_1  &
   adams_id = 1  &
   location = 0.0, 0.0, 0.0  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
marker create  &
   marker_name = .Curling_Robot.Base.cm  &
   adams_id = 21  &
   location = 0.0, 400.0, 0.0  &
   orientation = 0.0, 1.5707963268, 0.0
!
marker create  &
   marker_name = .Curling_Robot.Base.MARKER_10  &
   adams_id = 10  &
   location = 0.0, 0.0, 0.0  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
marker create  &
   marker_name = .Curling_Robot.Base.MARKER_13  &
   adams_id = 13  &
   location = 0.0, 800.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .Curling_Robot.Base  &
   mass = 100.0  &
   center_of_mass_marker = .Curling_Robot.Base.cm  &
   ixx = 1.094671205E+07  &
   iyy = 1.094671205E+07  &
   izz = 9.8030257163E+05  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape cylinder  &
   cylinder_name = .Curling_Robot.Base.CYLINDER_7  &
   adams_id = 7  &
   center_marker = .Curling_Robot.Base.MARKER_1  &
   angle_extent = 6.2831853072  &
   length = 800.0  &
   radius = 100.0  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
part attributes  &
   part_name = .Curling_Robot.Base  &
   color = RED  &
   name_visibility = off
!
!----------------------------------- Arm_AB -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
part create rigid_body name_and_position  &
   part_name = .Curling_Robot.Arm_AB  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.Arm_AB
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Curling_Robot.Arm_AB.MARKER_2  &
   adams_id = 2  &
   location = 0.0, 800.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Curling_Robot.Arm_AB.MARKER_3  &
   adams_id = 3  &
   location = 700.0, 800.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Curling_Robot.Arm_AB.cm  &
   adams_id = 22  &
   location = 350.0, 800.0, 0.0  &
   orientation = 4.7123889804, 1.5707963268, 1.5707963268
!
marker create  &
   marker_name = .Curling_Robot.Arm_AB.MARKER_12  &
   adams_id = 12  &
   location = 0.0, 800.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Curling_Robot.Arm_AB.MARKER_15  &
   adams_id = 15  &
   location = 700.0, 800.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 0.0
!
part create rigid_body mass_properties  &
   part_name = .Curling_Robot.Arm_AB  &
   mass = 14.0  &
   center_of_mass_marker = .Curling_Robot.Arm_AB.cm  &
   ixx = 6.8965322244E+05  &
   iyy = 6.8535013594E+05  &
   izz = 7245.5931501718  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Curling_Robot.Arm_AB.LINK_8  &
   i_marker = .Curling_Robot.Arm_AB.MARKER_2  &
   j_marker = .Curling_Robot.Arm_AB.MARKER_3  &
   width = 70.0  &
   depth = 35.0
!
part attributes  &
   part_name = .Curling_Robot.Arm_AB  &
   color = GREEN  &
   name_visibility = off
!
!-------------------------------- Hook_BC_link --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
part create rigid_body name_and_position  &
   part_name = .Curling_Robot.Hook_BC_link  &
   adams_id = 4  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.Hook_BC_link
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Curling_Robot.Hook_BC_link.MARKER_4  &
   adams_id = 4  &
   location = 700.0, 800.0, 0.0  &
   orientation = 4.7123889804, 0.0, 0.0
!
marker create  &
   marker_name = .Curling_Robot.Hook_BC_link.MARKER_5  &
   adams_id = 5  &
   location = 700.0, 300.0, 0.0  &
   orientation = 4.7123889804, 0.0, 0.0
!
marker create  &
   marker_name = .Curling_Robot.Hook_BC_link.cm  &
   adams_id = 23  &
   location = 700.0, 550.0, 0.0  &
   orientation = 0.0, 1.5707963268, 0.0
!
marker create  &
   marker_name = .Curling_Robot.Hook_BC_link.MARKER_14  &
   adams_id = 14  &
   location = 700.0, 800.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 0.0
!
marker create  &
   marker_name = .Curling_Robot.Hook_BC_link.MARKER_17  &
   adams_id = 17  &
   location = 700.0, 300.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .Curling_Robot.Hook_BC_link  &
   mass = 12.0  &
   center_of_mass_marker = .Curling_Robot.Hook_BC_link.cm  &
   ixx = 2.7735808179E+05  &
   iyy = 2.7414547689E+05  &
   izz = 6257.7717779888  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Curling_Robot.Hook_BC_link.LINK_9  &
   i_marker = .Curling_Robot.Hook_BC_link.MARKER_4  &
   j_marker = .Curling_Robot.Hook_BC_link.MARKER_5  &
   width = 40.0  &
   depth = 70.0
!
part attributes  &
   part_name = .Curling_Robot.Hook_BC_link  &
   color = MAIZE  &
   name_visibility = off
!
!---------------------------------- CD_link -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
part create rigid_body name_and_position  &
   part_name = .Curling_Robot.CD_link  &
   adams_id = 5  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.CD_link
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Curling_Robot.CD_link.MARKER_6  &
   adams_id = 6  &
   location = 700.0, 300.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Curling_Robot.CD_link.MARKER_7  &
   adams_id = 7  &
   location = 800.0, 300.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Curling_Robot.CD_link.cm  &
   adams_id = 24  &
   location = 750.0, 300.0, 0.0  &
   orientation = 1.5707963268, 1.5707963268, 0.0
!
marker create  &
   marker_name = .Curling_Robot.CD_link.MARKER_16  &
   adams_id = 16  &
   location = 700.0, 300.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Curling_Robot.CD_link.MARKER_19  &
   adams_id = 19  &
   location = 800.0, 300.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Curling_Robot.CD_link.MARKER_38  &
   adams_id = 38  &
   location = 719.9963226733, 288.4520104737, -57.1384890204  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .Curling_Robot.CD_link  &
   mass = 0.6  &
   center_of_mass_marker = .Curling_Robot.CD_link.cm  &
   ixx = 809.8663359609  &
   iyy = 574.4716555129  &
   izz = 245.0145718715  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Curling_Robot.CD_link.LINK_10  &
   i_marker = .Curling_Robot.CD_link.MARKER_6  &
   j_marker = .Curling_Robot.CD_link.MARKER_7  &
   width = 10.0  &
   depth = 70.0
!
part attributes  &
   part_name = .Curling_Robot.CD_link  &
   color = CYAN  &
   name_visibility = off
!
!---------------------------------- DP_link -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
part create rigid_body name_and_position  &
   part_name = .Curling_Robot.DP_link  &
   adams_id = 6  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.DP_link
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Curling_Robot.DP_link.MARKER_8  &
   adams_id = 8  &
   location = 800.0, 300.0, 0.0  &
   orientation = 1.5707963268, 0.0, 0.0
!
marker create  &
   marker_name = .Curling_Robot.DP_link.MARKER_9  &
   adams_id = 9  &
   location = 800.0, 350.0, 0.0  &
   orientation = 1.5707963268, 0.0, 0.0
!
marker create  &
   marker_name = .Curling_Robot.DP_link.cm  &
   adams_id = 25  &
   location = 800.0, 325.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Curling_Robot.DP_link.MARKER_18  &
   adams_id = 18  &
   location = 800.0, 300.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Curling_Robot.DP_link.Marker_P  &
   adams_id = 20  &
   location = 800.0, 350.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .Curling_Robot.DP_link  &
   mass = 0.6  &
   center_of_mass_marker = .Curling_Robot.DP_link.cm  &
   ixx = 216.6626034435  &
   iyy = 131.2499886048  &
   izz = 90.4819229289  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .Curling_Robot.DP_link.LINK_11  &
   i_marker = .Curling_Robot.DP_link.MARKER_8  &
   j_marker = .Curling_Robot.DP_link.MARKER_9  &
   width = 10.0  &
   depth = 70.0
!
part attributes  &
   part_name = .Curling_Robot.DP_link  &
   color = MAGENTA  &
   name_visibility = off
!
!--------------------------------- ice_strip ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
part create rigid_body name_and_position  &
   part_name = .Curling_Robot.ice_strip  &
   adams_id = 7  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ice_strip
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Curling_Robot.ice_strip.MARKER_26  &
   adams_id = 26  &
   location = 200.0, 0.0, -500.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Curling_Robot.ice_strip.cm  &
   adams_id = 27  &
   location = 700.0, 50.0, 2250.0  &
   orientation = 1.5707963268, 3.1415926536, 0.0
!
marker create  &
   marker_name = .Curling_Robot.ice_strip.MARKER_28  &
   adams_id = 28  &
   location = 200.0, 0.0, 5000.0  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Curling_Robot.ice_strip.MARKER_48  &
   adams_id = 48  &
   location = 720.0, 220.3329323227, 3000.0000000369  &
   orientation = 3.1415926536, 1.5707963268, 3.1415926536
!
part create rigid_body mass_properties  &
   part_name = .Curling_Robot.ice_strip  &
   material_type = .Curling_Robot.steel
!
! ****** Graphics for current part ******
!
geometry create shape block  &
   block_name = .Curling_Robot.ice_strip.BOX_15  &
   adams_id = 15  &
   corner_marker = .Curling_Robot.ice_strip.MARKER_26  &
   diag_corner_coords = 1000.0, 100.0, 5500.0
!
part attributes  &
   part_name = .Curling_Robot.ice_strip  &
   color = MAIZE  &
   name_visibility = off
!
!------------------------------- Curling_stone --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
part create rigid_body name_and_position  &
   part_name = .Curling_Robot.Curling_stone  &
   adams_id = 8  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.Curling_stone
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Curling_Robot.Curling_stone.PSMAR  &
   adams_id = 31  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .Curling_Robot.Curling_stone.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Curling_Robot.Curling_stone.cm  &
   adams_id = 32  &
   location = 719.9964493862, 163.0216247743, 1.1455374859E-02  &
   orientation = 4.712387088, 2.8991534277, 3.14158896
!
marker create  &
   marker_name = .Curling_Robot.Curling_stone.MARKER_36  &
   adams_id = 36  &
   location = 719.9964493862, 163.0216247743, 1.1455374859E-02  &
   orientation = 0.0, 0.0, 0.0
!
marker create  &
   marker_name = .Curling_Robot.Curling_stone.MARKER_37  &
   adams_id = 37  &
   location = 719.9963226733, 288.4520104737, -57.1384890204  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .Curling_Robot.Curling_stone  &
   mass = 19.1  &
   center_of_mass_marker = .Curling_Robot.Curling_stone.cm  &
   ixx = 1.7888348496E+08  &
   iyy = 1.0989509852E+08  &
   izz = 1.098946858E+08  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Curling_Robot.Curling_stone  &
   color = WHITE
!
!-------------------------------- Curling_grip --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
part create rigid_body name_and_position  &
   part_name = .Curling_Robot.Curling_grip  &
   adams_id = 9  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.Curling_grip
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Curling_Robot.Curling_grip.PSMAR  &
   adams_id = 33  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .Curling_Robot.Curling_grip.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Curling_Robot.Curling_grip.cm  &
   adams_id = 34  &
   location = 720.0042765474, 250.2042209236, -0.5095607873  &
   orientation = 3.1420174879, 3.0964495511, 1.5712994341
!
marker create  &
   marker_name = .Curling_Robot.Curling_grip.MARKER_35  &
   adams_id = 35  &
   location = 719.9964493862, 163.0216247743, 1.1455374859E-02  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .Curling_Robot.Curling_grip  &
   mass = 1.0E-04  &
   center_of_mass_marker = .Curling_Robot.Curling_grip.cm  &
   ixx = 1.6199555472E+06  &
   iyy = 1.1579134415E+06  &
   izz = 8.7107892213E+05  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Curling_Robot.Curling_grip  &
   color = GreenYellow
!
!---------- .Curling_Robot."curling_stone;Bolt Recess- Cut-Extrude2" ----------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
part create rigid_body name_and_position  &
   part_name = .Curling_Robot."curling_stone;Bolt Recess- Cut-Extrude2"  &
   adams_id = 10  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot."curling_stone;Bolt Recess- Cut-Extrude2"
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Curling_Robot."curling_stone;Bolt Recess- Cut-Extrude2".PSMAR  &
   adams_id = 44  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .Curling_Robot."curling_stone;Bolt Recess- Cut-Extrude2".PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Curling_Robot."curling_stone;Bolt Recess- Cut-Extrude2".cm  &
   adams_id = 45  &
   location = 720.0035729132, 163.1644111161, 3000.0003127092  &
   orientation = 1.57083316, 3.0514743415, 2.848880508E-05
!
marker create  &
   marker_name = .Curling_Robot."curling_stone;Bolt Recess- Cut-Extrude2".MARKER_40  &
   adams_id = 40  &
   location = 720.0, 118.0665174407, 3000.0000000369  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .Curling_Robot."curling_stone;Bolt Recess- Cut-Extrude2"  &
   mass = 19.1  &
   center_of_mass_marker =   &
                           .Curling_Robot."curling_stone;Bolt Recess- Cut-Extrude2".cm  &
   ixx = 1.7888146515E+08  &
   iyy = 1.0989953332E+08  &
   izz = 1.098878141E+08  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Curling_Robot."curling_stone;Bolt Recess- Cut-Extrude2"  &
   color = WHITE
!
!- .Curling_Robot."Complex_Curling_Stone_Handle;Mounting Boss- Extrude-Thin1" -!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
part create rigid_body name_and_position  &
   part_name = .Curling_Robot."Complex_Curling_Stone_Handle;Mounting Boss- Extrude-Thin1"  &
   adams_id = 11  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot."Complex_Curling_Stone_Handle;Mounting Boss- Extrude-Thin1"
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Curling_Robot."Complex_Curling_Stone_Handle;Mounting Boss- Extrude-Thin1".PSMAR  &
   adams_id = 46  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
marker attributes  &
   marker_name = .Curling_Robot."Complex_Curling_Stone_Handle;Mounting Boss- Extrude-Thin1".PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Curling_Robot."Complex_Curling_Stone_Handle;Mounting Boss- Extrude-Thin1".cm  &
   adams_id = 47  &
   location = 720.0080360799, 250.3470473429, 2999.4790512795  &
   orientation = 3.1421582081, 3.096448947, 1.5714409556
!
marker create  &
   marker_name = .Curling_Robot."Complex_Curling_Stone_Handle;Mounting Boss- Extrude-Thin1".MARKER_39  &
   adams_id = 39  &
   location = 720.0, 118.0665174407, 3000.0000000369  &
   orientation = 0.0, 0.0, 0.0
!
part create rigid_body mass_properties  &
   part_name = .Curling_Robot."Complex_Curling_Stone_Handle;Mounting Boss- Extrude-Thin1"  &
   mass = 1.0E-04  &
   center_of_mass_marker =   &
                           .Curling_Robot."Complex_Curling_Stone_Handle;Mounting Boss- Extrude-Thin1".cm  &
   ixx = 1.6199602742E+06  &
   iyy = 1.1579162617E+06  &
   izz = 8.7108109587E+05  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Curling_Robot."Complex_Curling_Stone_Handle;Mounting Boss- Extrude-Thin1"  &
   color = RED
!
! ****** Graphics from Parasolid file ******
!
file parasolid read  &
   file_name = "Curling_Robot.x_t"  &
   model_name = .Curling_Robot
!
geometry attributes  &
   geometry_name = .Curling_Robot.Curling_stone.SOLID16  &
   color = WHITE
!
geometry attributes  &
   geometry_name = .Curling_Robot.Curling_grip.SOLID17  &
   color = GreenYellow
!
geometry attributes  &
   geometry_name = .Curling_Robot."curling_stone;Bolt Recess- Cut-Extrude2".SOLID25  &
   color = WHITE
!
geometry attributes  &
   geometry_name = .Curling_Robot."Complex_Curling_Stone_Handle;Mounting Boss- Extrude-Thin1".SOLID26  &
   color = RED
!
!---------------------------------- Contacts ----------------------------------!
!
!
contact create  &
   contact_name = .Curling_Robot.CONTACT_1  &
   adams_id = 1  &
   type = solid_to_solid  &
   i_geometry_name = .Curling_Robot.ice_strip.BOX_15  &
   j_geometry_name = .Curling_Robot.Curling_stone.SOLID16  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1  &
   coulomb_friction = on  &
   mu_static = 1.0E-02  &
   mu_dynamic = 1.0E-02  &
   stiction_transition_velocity = 100.0  &
   friction_transition_velocity = 1000.0
!
contact create  &
   contact_name = .Curling_Robot.CONTACT_2  &
   adams_id = 2  &
   type = solid_to_solid  &
   i_geometry_name = .Curling_Robot.CD_link.LINK_10  &
   j_geometry_name = .Curling_Robot.Curling_grip.SOLID17  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1
!
contact create  &
   contact_name = .Curling_Robot.CONTACT_3  &
   adams_id = 3  &
   type = solid_to_solid  &
   i_geometry_name = .Curling_Robot."curling_stone;Bolt Recess- Cut-Extrude2".SOLID25  &
   j_geometry_name = .Curling_Robot.ice_strip.BOX_15  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1  &
   coulomb_friction = on  &
   mu_static = 1.0E-02  &
   mu_dynamic = 1.0E-02  &
   stiction_transition_velocity = 100.0  &
   friction_transition_velocity = 1000.0
!
contact create  &
   contact_name = .Curling_Robot.CONTACT_4  &
   adams_id = 4  &
   type = solid_to_solid  &
   i_geometry_name = .Curling_Robot.Curling_stone.SOLID16  &
   j_geometry_name = .Curling_Robot."curling_stone;Bolt Recess- Cut-Extrude2".SOLID25  &
   penalty = 1000.0  &
   restitution_coefficient = 0.0  &
   augmented_lagrangian_formulation = no
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint revolute  &
   joint_name = .Curling_Robot.JOINT_1_Yaxis  &
   adams_id = 1  &
   i_marker_name = .Curling_Robot.Base.MARKER_10  &
   j_marker_name = .Curling_Robot.ground.MARKER_11
!
constraint attributes  &
   constraint_name = .Curling_Robot.JOINT_1_Yaxis  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Curling_Robot.JOINT_2_Zaxis  &
   adams_id = 2  &
   i_marker_name = .Curling_Robot.Arm_AB.MARKER_12  &
   j_marker_name = .Curling_Robot.Base.MARKER_13
!
constraint attributes  &
   constraint_name = .Curling_Robot.JOINT_2_Zaxis  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Curling_Robot.JOINT_3_Xaxis  &
   adams_id = 3  &
   i_marker_name = .Curling_Robot.Hook_BC_link.MARKER_14  &
   j_marker_name = .Curling_Robot.Arm_AB.MARKER_15
!
constraint attributes  &
   constraint_name = .Curling_Robot.JOINT_3_Xaxis  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Curling_Robot.JOINT_4  &
   adams_id = 4  &
   i_marker_name = .Curling_Robot.CD_link.MARKER_16  &
   j_marker_name = .Curling_Robot.Hook_BC_link.MARKER_17
!
constraint attributes  &
   constraint_name = .Curling_Robot.JOINT_4  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Curling_Robot.JOINT_5  &
   adams_id = 5  &
   i_marker_name = .Curling_Robot.DP_link.MARKER_18  &
   j_marker_name = .Curling_Robot.CD_link.MARKER_19
!
constraint attributes  &
   constraint_name = .Curling_Robot.JOINT_5  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Curling_Robot.JOINT_6  &
   adams_id = 6  &
   i_marker_name = .Curling_Robot.ice_strip.MARKER_28  &
   j_marker_name = .Curling_Robot.ground.MARKER_29
!
constraint attributes  &
   constraint_name = .Curling_Robot.JOINT_6  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Curling_Robot.JOINT_7  &
   adams_id = 7  &
   i_marker_name = .Curling_Robot.Curling_grip.MARKER_35  &
   j_marker_name = .Curling_Robot.Curling_stone.MARKER_36
!
constraint attributes  &
   constraint_name = .Curling_Robot.JOINT_7  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Curling_Robot.JOINT_8  &
   adams_id = 8  &
   i_marker_name = .Curling_Robot.Curling_stone.MARKER_37  &
   j_marker_name = .Curling_Robot.CD_link.MARKER_38
!
constraint attributes  &
   constraint_name = .Curling_Robot.JOINT_8  &
   active = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Curling_Robot.JOINT_9  &
   adams_id = 9  &
   i_marker_name =   &
                   .Curling_Robot."Complex_Curling_Stone_Handle;Mounting Boss- Extrude-Thin1".MARKER_39  &
   j_marker_name =   &
                   .Curling_Robot."curling_stone;Bolt Recess- Cut-Extrude2".MARKER_40
!
constraint attributes  &
   constraint_name = .Curling_Robot.JOINT_9  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .Curling_Robot.Last_Sim  &
   commands =   &
              "simulation single_run scripted sim_script_name=.Curling_Robot.SIM_SCRIPT_1 reset_before_and_after=no model_name=.Curling_Robot"
!
simulation script create  &
   sim_script_name = .Curling_Robot.SIM_SCRIPT_1  &
   solver_commands = "! Insert ACF commands here:",  &
                     "SIMULATE/DYNAMIC, END=16.0, STEPS=1000"
!
!-------------------------- Adams View UDE Instances --------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
undo begin_block suppress = yes
!
ude create instance  &
   instance_name = .Curling_Robot.general_motion_2  &
   definition_name = .MDI.Constraints.general_motion  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .Curling_Robot.general_motion_3  &
   definition_name = .MDI.Constraints.general_motion  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .Curling_Robot.general_motion_1  &
   definition_name = .MDI.Constraints.general_motion  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.i_marker  &
   object_value = (.Curling_Robot.Arm_AB.MARKER_12)
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.j_marker  &
   object_value = (.Curling_Robot.Base.MARKER_13)
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.constraint  &
   object_value = (.Curling_Robot.JOINT_2_Zaxis)
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.t1_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.t2_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.t3_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.r1_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.r2_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.r3_type  &
   integer_value = 1
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.t1_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.t2_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.t3_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.r1_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.r2_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.r3_func  &
   string_value = "step(time,0,0,0.1,0)+step(time,0.1,0,0.2,3.5d)+step(time,0.2,0,0.4,-7d)"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.t1_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.t2_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.t3_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.r1_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.r2_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.r3_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.t1_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.t2_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.t3_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.r1_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.r2_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_2.r3_ic_velo  &
   real_value = 0.0
!
ude modify instance  &
   instance_name = .Curling_Robot.general_motion_2
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.i_marker  &
   object_value = (.Curling_Robot.Hook_BC_link.MARKER_14)
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.j_marker  &
   object_value = (.Curling_Robot.Arm_AB.MARKER_15)
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.constraint  &
   object_value = (.Curling_Robot.JOINT_3_Xaxis)
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.t1_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.t2_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.t3_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.r1_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.r2_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.r3_type  &
   integer_value = 1
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.t1_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.t2_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.t3_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.r1_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.r2_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.r3_func  &
   string_value = "step(time,0,0,0.1,12d)+step(time,0.1,0,0.2,0)+step(time,0.2,0,0.5,-12.5d)"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.t1_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.t2_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.t3_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.r1_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.r2_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.r3_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.t1_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.t2_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.t3_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.r1_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.r2_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_3.r3_ic_velo  &
   real_value = 0.0
!
ude modify instance  &
   instance_name = .Curling_Robot.general_motion_3
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.i_marker  &
   object_value = (.Curling_Robot.Base.MARKER_10)
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.j_marker  &
   object_value = (.Curling_Robot.ground.MARKER_11)
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.constraint  &
   object_value = (.Curling_Robot.JOINT_1_Yaxis)
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.t1_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.t2_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.t3_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.r1_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.r2_type  &
   integer_value = 0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.r3_type  &
   integer_value = 1
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.t1_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.t2_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.t3_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.r1_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.r2_func  &
   string_value = "0 * time"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.r3_func  &
   string_value = "step(time,0,0,2,0)+step(time,0.4,0.1,0.5,-0.828d)"
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.t1_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.t2_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.t3_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.r1_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.r2_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.r3_ic_disp  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.t1_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.t2_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.t3_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.r1_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.r2_ic_velo  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Curling_Robot.general_motion_1.r3_ic_velo  &
   real_value = 0.0
!
ude modify instance  &
   instance_name = .Curling_Robot.general_motion_1
!
undo end_block
!
!------------------------------ Dynamic Graphics ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
geometry create shape gcontact  &
   contact_force_name = .Curling_Robot.GCONTACT_21  &
   adams_id = 21  &
   contact_element_name = .Curling_Robot.CONTACT_1  &
   force_display = components
!
geometry attributes  &
   geometry_name = .Curling_Robot.GCONTACT_21  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .Curling_Robot.GCONTACT_24  &
   adams_id = 24  &
   contact_element_name = .Curling_Robot.CONTACT_2  &
   force_display = components
!
geometry attributes  &
   geometry_name = .Curling_Robot.GCONTACT_24  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .Curling_Robot.GCONTACT_30  &
   adams_id = 30  &
   contact_element_name = .Curling_Robot.CONTACT_3  &
   force_display = components
!
geometry attributes  &
   geometry_name = .Curling_Robot.GCONTACT_30  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .Curling_Robot.GCONTACT_33  &
   adams_id = 33  &
   contact_element_name = .Curling_Robot.CONTACT_4  &
   force_display = components
!
geometry attributes  &
   geometry_name = .Curling_Robot.GCONTACT_33  &
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
   measure_name = .Curling_Robot.curling_cm_x  &
   from_first = no  &
   object = .Curling_Robot.Curling_stone  &
   characteristic = cm_position  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Curling_Robot.curling_cm_x  &
   color = WHITE
!
measure create object  &
   measure_name = .Curling_Robot.curling_cm_y  &
   from_first = no  &
   object = .Curling_Robot.Curling_stone  &
   characteristic = cm_position  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Curling_Robot.curling_cm_y  &
   color = WHITE
!
measure create object  &
   measure_name = .Curling_Robot.curling_cm_z  &
   from_first = no  &
   object = .Curling_Robot.Curling_stone  &
   characteristic = cm_position  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Curling_Robot.curling_cm_z  &
   color = WHITE
!
measure create object  &
   measure_name = .Curling_Robot.Curling_stone_position  &
   from_first = no  &
   object = .Curling_Robot.Curling_stone  &
   characteristic = cm_position  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Curling_Robot.Curling_stone_position  &
   color = WHITE
!
measure create point  &
   measure_name = .Curling_Robot.Vx  &
   point = .Curling_Robot.DP_link.Marker_P  &
   characteristic = translational_velocity  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Curling_Robot.Vx  &
   color = WHITE
!
measure create point  &
   measure_name = .Curling_Robot.Vy  &
   point = .Curling_Robot.DP_link.Marker_P  &
   characteristic = translational_velocity  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Curling_Robot.Vy  &
   color = WHITE
!
measure create point  &
   measure_name = .Curling_Robot.Vz  &
   point = .Curling_Robot.DP_link.Marker_P  &
   characteristic = translational_velocity  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Curling_Robot.Vz  &
   color = WHITE
!
measure create point  &
   measure_name = .Curling_Robot.Ax  &
   point = .Curling_Robot.DP_link.Marker_P  &
   characteristic = translational_acceleration  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Curling_Robot.Ax  &
   color = WHITE
!
measure create point  &
   measure_name = .Curling_Robot.Ay  &
   point = .Curling_Robot.DP_link.Marker_P  &
   characteristic = translational_acceleration  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Curling_Robot.Ay  &
   color = WHITE
!
measure create point  &
   measure_name = .Curling_Robot.Az  &
   point = .Curling_Robot.DP_link.Marker_P  &
   characteristic = translational_acceleration  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Curling_Robot.Az  &
   color = WHITE
!
measure create point  &
   measure_name = .Curling_Robot.Ang_vel_x  &
   point = .Curling_Robot.DP_link.Marker_P  &
   characteristic = angular_velocity  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Curling_Robot.Ang_vel_x  &
   color = WHITE
!
measure create point  &
   measure_name = .Curling_Robot.Ang_vel_y  &
   point = .Curling_Robot.DP_link.Marker_P  &
   characteristic = angular_velocity  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Curling_Robot.Ang_vel_y  &
   color = WHITE
!
measure create point  &
   measure_name = .Curling_Robot.Ang_vel_z  &
   point = .Curling_Robot.DP_link.Marker_P  &
   characteristic = angular_velocity  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Curling_Robot.Ang_vel_z  &
   color = WHITE
!
measure create point  &
   measure_name = .Curling_Robot.curing_disp_z  &
   point = .Curling_Robot.Curling_stone.cm  &
   coordinate_rframe = .Curling_Robot.ground.MARKER_11  &
   characteristic = translational_displacement  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .Curling_Robot.curing_disp_z  &
   color = WHITE
!
!---------------------------- Function definitions ----------------------------!
!
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Curling_Robot.general_motion_2
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Curling_Robot.general_motion_3
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Curling_Robot.general_motion_1
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
marker modify  &
   marker_name = .Curling_Robot.ground.MARKER_11  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Curling_Robot.ground.POINT_1_O))
!
marker modify  &
   marker_name = .Curling_Robot.ground.MARKER_29  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Curling_Robot.ground.POINT_12))
!
marker modify  &
   marker_name = .Curling_Robot.Base.MARKER_1  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Curling_Robot.ground.POINT_1_O))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Curling_Robot.ground.POINT_1_O, .Curling_Robot.ground.POINT_2_A, "Z"))  &
   relative_to = .Curling_Robot.Base
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
marker modify  &
   marker_name = .Curling_Robot.Base.MARKER_10  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Curling_Robot.ground.POINT_1_O))  &
   relative_to = .Curling_Robot.Base
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
marker modify  &
   marker_name = .Curling_Robot.Arm_AB.MARKER_2  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Curling_Robot.ground.POINT_2_A))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Curling_Robot.ground.POINT_2_A, .Curling_Robot.ground.POINT_3_B, "X"))  &
   relative_to = .Curling_Robot.Arm_AB
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
marker modify  &
   marker_name = .Curling_Robot.Arm_AB.MARKER_3  &
   location =   &
      (LOC_RELATIVE_TO({700, 0.0, 0.0}, .Curling_Robot.Arm_AB.MARKER_2))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Curling_Robot.ground.POINT_2_A, .Curling_Robot.ground.POINT_3_B, "X"))  &
   relative_to = .Curling_Robot.Arm_AB
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
marker modify  &
   marker_name = .Curling_Robot.Hook_BC_link.MARKER_4  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Curling_Robot.ground.POINT_3_B))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Curling_Robot.ground.POINT_3_B, .Curling_Robot.ground.POINT_4_C, "X"))  &
   relative_to = .Curling_Robot.Hook_BC_link
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
marker modify  &
   marker_name = .Curling_Robot.Hook_BC_link.MARKER_5  &
   location =   &
      (LOC_RELATIVE_TO({500, 0.0, 0.0}, .Curling_Robot.Hook_BC_link.MARKER_4))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Curling_Robot.ground.POINT_3_B, .Curling_Robot.ground.POINT_4_C, "X"))  &
   relative_to = .Curling_Robot.Hook_BC_link
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
marker modify  &
   marker_name = .Curling_Robot.CD_link.MARKER_6  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Curling_Robot.ground.POINT_4_C))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Curling_Robot.ground.POINT_4_C, .Curling_Robot.ground.POINT_5_D, "X"))  &
   relative_to = .Curling_Robot.CD_link
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
marker modify  &
   marker_name = .Curling_Robot.CD_link.MARKER_7  &
   location =   &
      (LOC_RELATIVE_TO({100, 0.0, 0.0}, .Curling_Robot.CD_link.MARKER_6))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Curling_Robot.ground.POINT_4_C, .Curling_Robot.ground.POINT_5_D, "X"))  &
   relative_to = .Curling_Robot.CD_link
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
marker modify  &
   marker_name = .Curling_Robot.DP_link.MARKER_8  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Curling_Robot.ground.POINT_5_D))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Curling_Robot.ground.POINT_5_D, .Curling_Robot.ground.POINT_6_P, "X"))  &
   relative_to = .Curling_Robot.DP_link
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
marker modify  &
   marker_name = .Curling_Robot.DP_link.MARKER_9  &
   location =   &
      (LOC_RELATIVE_TO({50, 0.0, 0.0}, .Curling_Robot.DP_link.MARKER_8))  &
   orientation =   &
      (ORI_ALONG_AXIS(.Curling_Robot.ground.POINT_5_D, .Curling_Robot.ground.POINT_6_P, "X"))  &
   relative_to = .Curling_Robot.DP_link
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
marker modify  &
   marker_name = .Curling_Robot.DP_link.Marker_P  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Curling_Robot.ground.POINT_6_P))  &
   relative_to = .Curling_Robot.DP_link
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
marker modify  &
   marker_name = .Curling_Robot.ice_strip.MARKER_26  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Curling_Robot.ground.POINT_12_2))  &
   relative_to = .Curling_Robot.ice_strip
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
marker modify  &
   marker_name = .Curling_Robot.ice_strip.MARKER_28  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .Curling_Robot.ground.POINT_12))  &
   relative_to = .Curling_Robot.ice_strip
!
defaults coordinate_system  &
   default_coordinate_system = .Curling_Robot.ground
!
material modify  &
   material_name = .Curling_Robot.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
model display  &
   model_name = Curling_Robot
