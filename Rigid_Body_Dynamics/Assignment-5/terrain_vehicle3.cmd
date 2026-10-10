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
   size_of_icons = 25.4  &
   spacing_for_grid = 50.0
!
!--------------------------- Plugins used by Model ----------------------------!
!
!
plugin load  &
   plugin_name = .MDI.plugins.vibration
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = terrain_vehicle3
!
model attributes  &
   model_name = .terrain_vehicle3  &
   size_of_icons = 25.0
!
view erase
!
!-------------------------------- Data storage --------------------------------!
!
!
data_element create spline  &
   spline_name = .terrain_vehicle3.rear_damper_force1  &
   adams_id = 1  &
   x = -2000.0, -1300.0, -500.0, -300.0, -250.0, -200.0, -150.0, -100.0,  &
       -50.0, 0.0, 50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 500.0, 1300.0,  &
       2000.0  &
   y = -1757.83, -1031.22, -575.07, -446.88, -411.13, -364.38, -312.82,  &
       -254.38, -156.06, 0.0, 309.32, 481.25, 584.37, 667.56, 739.06, 806.25,  &
       1075.11, 2200.28, 3750.03  &
   linear_extrapolate = no
!
data_element create spline  &
   spline_name = .terrain_vehicle3.rear_damper_force2  &
   adams_id = 2  &
   x = -2000.0, -1300.0, -500.0, -300.0, -250.0, -200.0, -150.0, -100.0,  &
       -50.0, 0.0, 50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 500.0, 1300.0,  &
       2000.0  &
   y = -3515.66, -2062.44, -1150.14, -893.76, -822.26, -728.76, -625.64,  &
       -508.76, -312.12, 0.0, 618.64, 962.5, 1168.74, 1335.12, 1478.12,  &
       1612.5, 2150.22, 4400.56, 7500.06  &
   linear_extrapolate = no
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .terrain_vehicle3.steel  &
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
part modify rigid_body name_and_position  &
   part_name = ground  &
   adams_id = 1000000
!
defaults model  &
   part_name = ground
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .terrain_vehicle3.ground.ground_Marker  &
   adams_id = 1000000  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.ground.ground_Marker  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.ground.MARKER_ground_ref  &
   adams_id = 1000098  &
   location = 1100.0, 0.0, 750.0  &
   orientation = 180.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.ground.MARKER_ground_ref  &
   visibility = off  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.ground.road1_ref_1  &
   adams_id = 1000105  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.ground.road1_ref_1  &
   visibility = off  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.ground.marker_1  &
   adams_id = 1000214  &
   location = 349.518755114, -429.541707844, 266.644668132  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.ground.marker_1  &
   visibility = off  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.ground.marker_2  &
   adams_id = 1000260  &
   location = 349.518755114, 429.541707844, 266.644668132  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.ground.marker_2  &
   visibility = off  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.ground.marker_3  &
   adams_id = 1000261  &
   location = 1581.15, -453.0, 241.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.ground.marker_3  &
   visibility = off  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.ground.marker_4  &
   adams_id = 1000262  &
   location = 1581.15, 453.0, 241.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.ground.marker_4  &
   visibility = off  &
   name_visibility = off
!
! ****** Floating Markers for current part ******
!
floating_marker create  &
   floating_marker_name = .terrain_vehicle3.ground.tire_fl_tire_jf_1  &
   adams_id = 1000106
!
floating_marker create  &
   floating_marker_name = .terrain_vehicle3.ground.tire_fr_tire_jf_1  &
   adams_id = 1000133
!
floating_marker create  &
   floating_marker_name = .terrain_vehicle3.ground.tire_rl_tire_jf_1  &
   adams_id = 1000149
!
floating_marker create  &
   floating_marker_name = .terrain_vehicle3.ground.tire_rr_tire_jf_1  &
   adams_id = 1000163
!
part attributes  &
   part_name = .terrain_vehicle3.ground  &
   size_of_icons = 25.4
!
!----------------------------------- frame ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
part create rigid_body name_and_position  &
   part_name = .terrain_vehicle3.frame  &
   adams_id = 1  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.frame
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MK23  &
   adams_id = 23  &
   location = 350.92655621, 0.0, 380.983598458  &
   orientation = 270.0d, 150.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MK23  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MK59  &
   adams_id = 59  &
   location = 1143.0, 141.2875, 412.75  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MK59  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MK61  &
   adams_id = 61  &
   location = 1143.0, -141.2875, 412.75  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MK61  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.frame.cm  &
   adams_id = 500001  &
   location = 1093.0, 0.0, 689.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.cm  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.frame.Origin  &
   adams_id = 600001  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.Origin  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000016  &
   adams_id = 1000016  &
   location = 254.0, -73.025, 349.25  &
   orientation = 90.0d, 101.6336339989d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000016  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000018  &
   adams_id = 1000018  &
   location = 469.9, -73.025, 304.8  &
   orientation = 90.0d, 101.6336339989d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000018  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000026  &
   adams_id = 1000026  &
   location = 254.0, 73.025, 349.25  &
   orientation = 90.0d, 101.6336339989d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000026  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000028  &
   adams_id = 1000028  &
   location = 469.9, 73.025, 304.8  &
   orientation = 90.0d, 101.6336339989d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000028  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000036  &
   adams_id = 1000036  &
   location = 280.890416882, -96.8375, 479.860596792  &
   orientation = 90.0d, 101.6336339989d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000036  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000038  &
   adams_id = 1000038  &
   location = 496.790416882, -96.8375, 435.410596792  &
   orientation = 90.0d, 101.6336339989d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000038  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000046  &
   adams_id = 1000046  &
   location = 280.890416882, 96.8375, 479.860596792  &
   orientation = 90.0d, 101.6336339989d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000046  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000048  &
   adams_id = 1000048  &
   location = 496.790416882, 96.8375, 435.410596792  &
   orientation = 90.0d, 101.6336339989d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000048  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MK13  &
   adams_id = 13  &
   location = 427.396107106, -119.0625, 644.906091948  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MK13  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MK42  &
   adams_id = 42  &
   location = 427.396107106, 119.0625, 644.906091948  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MK42  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.frame.Origin4  &
   adams_id = 600024  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.Origin4  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.frame.Origin3  &
   adams_id = 600025  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.Origin3  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.frame.Origin2  &
   adams_id = 600026  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.Origin2  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000005  &
   adams_id = 1000005  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000005  &
   visibility = off  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MK83  &
   adams_id = 83  &
   location = 1161.0, 0.0, 609.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MK83  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MARKER_frame_ref  &
   adams_id = 1000097  &
   location = 1100.0, 0.0, 750.0  &
   orientation = 180.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MARKER_frame_ref  &
   color = RED  &
   visibility = on  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000100  &
   adams_id = 1000100  &
   location = 1143.0, 0.0, 412.75  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000100  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000102  &
   adams_id = 1000102  &
   location = 1161.0, 0.0, 609.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000102  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.frame.height_frame_ref  &
   adams_id = 1000103  &
   location = 900.0, 0.0, 290.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.height_frame_ref  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.frame.vel_ref  &
   adams_id = 1000166  &
   location = 1093.0, 0.0, 689.0  &
   orientation = 180.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.vel_ref  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000213  &
   adams_id = 1000213  &
   location = 350.92655621, 0.0, 380.983598458  &
   orientation = 270.0d, 150.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000213  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000308  &
   adams_id = 1000308  &
   location = 1161.0, 0.0, 609.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .terrain_vehicle3.frame  &
   mass = 212.0  &
   center_of_mass_marker = .terrain_vehicle3.frame.cm  &
   ixx = 1.0E+07  &
   iyy = 2.0E+07  &
   izz = 1.0E+07  &
   ixy = -3.2527928409E+04  &
   izx = 1.491355645E+06  &
   iyz = 1395.6722254242
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.frame.Hi57_shell  &
   reference_marker = .terrain_vehicle3.frame.Origin  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi57.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.frame.Hi57_shell  &
   color = BLUE_GRAY
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.frame.ATV_4post_flex_hi47  &
   reference_marker = .terrain_vehicle3.frame.MARKER_1000005  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_hi47.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.frame.ATV_4post_flex_hi47  &
   color = PEACH
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.frame.Hi37_shell  &
   reference_marker = .terrain_vehicle3.frame.Origin2  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi37.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.frame.Hi37_shell  &
   color = DARK_GRAY
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.frame.Hi36_shell  &
   reference_marker = .terrain_vehicle3.frame.Origin2  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi36.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.frame.Hi36_shell  &
   color = DARK_GRAY
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.frame.Hi35_shell  &
   reference_marker = .terrain_vehicle3.frame.Origin2  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi35.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.frame.Hi35_shell  &
   color = MAIZE
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.frame.Hi34_shell  &
   reference_marker = .terrain_vehicle3.frame.Origin2  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi34.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.frame.Hi34_shell  &
   color = DimGray
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.frame.Hi33_shell  &
   reference_marker = .terrain_vehicle3.frame.Origin2  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi33.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.frame.Hi33_shell  &
   color = Orange
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.frame.Hi31_shell  &
   reference_marker = .terrain_vehicle3.frame.Origin2  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi31.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.frame.Hi31_shell  &
   color = RED
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.frame.Hi30_shell  &
   reference_marker = .terrain_vehicle3.frame.Origin2  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi30.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.frame.Hi30_shell  &
   color = DARK_GRAY
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.frame.Hi29_shell  &
   reference_marker = .terrain_vehicle3.frame.Origin2  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi29.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.frame.Hi29_shell  &
   color = RED
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.frame.Hi56_shell  &
   reference_marker = .terrain_vehicle3.frame.Origin2  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi56.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.frame.Hi56_shell  &
   color = BLACK
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.frame.Hi27_shell  &
   reference_marker = .terrain_vehicle3.frame.Origin3  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi27.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.frame.Hi27_shell  &
   color = BLUE_GRAY
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.frame.Hi26_shell  &
   reference_marker = .terrain_vehicle3.frame.Origin3  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi26.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.frame.Hi26_shell  &
   color = DARK_GRAY
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.frame.Hi24_shell  &
   reference_marker = .terrain_vehicle3.frame.Origin4  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi24.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.frame.Hi24_shell  &
   color = YELLOW
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.frame.Hi23_shell  &
   reference_marker = .terrain_vehicle3.frame.Origin4  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi23.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.frame.Hi23_shell  &
   color = BLACK
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.frame.Hi22_shell  &
   reference_marker = .terrain_vehicle3.frame.Origin4  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi22.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.frame.Hi22_shell  &
   color = DARK_GRAY
!
geometry create shape ellipsoid  &
   ellipsoid_name = .terrain_vehicle3.frame.ELLIPSOID_341  &
   adams_id = 341  &
   center_marker = .terrain_vehicle3.frame.cm  &
   x_scale_factor = 25.0  &
   y_scale_factor = 25.0  &
   z_scale_factor = 25.0
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.frame.ELLIPSOID_341  &
   color = RED
!
part attributes  &
   part_name = .terrain_vehicle3.frame  &
   size_of_icons = 25.4
!
!---------------------------------- lca_left ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
part create rigid_body name_and_position  &
   part_name = .terrain_vehicle3.lca_left  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.lca_left
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .terrain_vehicle3.lca_left.CM  &
   adams_id = 500002  &
   location = 348.937552314, -221.3766523436, 263.909075686  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.lca_left.CM  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.lca_left.MARKER_1000008  &
   adams_id = 1000008  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.lca_left.MARKER_1000008  &
   visibility = off  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.lca_left.MARKER_1000015  &
   adams_id = 1000015  &
   location = 254.0, -73.025, 349.25  &
   orientation = 90.0d, 101.6336339989d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.lca_left.MARKER_1000015  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.lca_left.MARKER_1000017  &
   adams_id = 1000017  &
   location = 469.9, -73.025, 304.8  &
   orientation = 90.0d, 101.6336339989d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.lca_left.MARKER_1000017  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.lca_left.MARKER_1000069  &
   adams_id = 1000069  &
   location = 339.1662, -383.3114, 216.408  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.lca_left.MARKER_1000069  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.lca_left.MK14  &
   adams_id = 14  &
   location = 351.7392, -233.8324, 277.4442  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.lca_left.MK14  &
   name_visibility = off  &
   size_of_icons = 25.4
!
part create rigid_body mass_properties  &
   part_name = .terrain_vehicle3.lca_left  &
   mass = 2.849124349  &
   center_of_mass_marker = .terrain_vehicle3.lca_left.CM  &
   ixx = 2.6126476024E+04  &
   iyy = 1.6369612474E+04  &
   izz = 3.4083074401E+04  &
   ixy = 1807.6999103994  &
   izx = -1743.248033497  &
   iyz = 8794.9451262036
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.lca_left.left_lca_rigid  &
   reference_marker = .terrain_vehicle3.lca_left.MARKER_1000008  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi201.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.lca_left.left_lca_rigid  &
   color = Orange
!
part attributes  &
   part_name = .terrain_vehicle3.lca_left  &
   size_of_icons = 25.4
!
!---------------------------------- uca_left ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
part create rigid_body name_and_position  &
   part_name = .terrain_vehicle3.uca_left  &
   adams_id = 5  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.uca_left
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .terrain_vehicle3.uca_left.MK19  &
   adams_id = 19  &
   location = 369.570377444, -359.387618282, 364.038262524  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.uca_left.MK19  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.uca_left.CM  &
   adams_id = 500005  &
   location = 378.545915246, -227.0344040964, 407.628577172  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.uca_left.CM  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.uca_left.Origin  &
   adams_id = 600005  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.uca_left.Origin  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.uca_left.MARKER_1000035  &
   adams_id = 1000035  &
   location = 280.890416882, -96.8375, 479.860596792  &
   orientation = 90.0d, 101.6336339989d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.uca_left.MARKER_1000035  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.uca_left.MARKER_1000037  &
   adams_id = 1000037  &
   location = 496.790416882, -96.8375, 435.410596792  &
   orientation = 90.0d, 101.6336339989d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.uca_left.MARKER_1000037  &
   name_visibility = off
!
part create rigid_body mass_properties  &
   part_name = .terrain_vehicle3.uca_left  &
   mass = 1.593305034  &
   center_of_mass_marker = .terrain_vehicle3.uca_left.CM  &
   ixx = 1.4202957446E+04  &
   iyy = 9451.5594065208  &
   izz = 1.9622938993E+04  &
   ixy = 897.8555139628  &
   izx = -1186.3742330532  &
   iyz = 4459.4430591606
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.uca_left.Hi58_shell  &
   reference_marker = .terrain_vehicle3.uca_left.Origin  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi58.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.uca_left.Hi58_shell  &
   color = YELLOW
!
part attributes  &
   part_name = .terrain_vehicle3.uca_left  &
   size_of_icons = 25.4
!
!-------------------------------- knuckle_left --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
part create rigid_body name_and_position  &
   part_name = .terrain_vehicle3.knuckle_left  &
   adams_id = 6  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.knuckle_left
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .terrain_vehicle3.knuckle_left.MK20  &
   adams_id = 20  &
   location = 369.570377444, -359.387618282, 364.038262524  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.knuckle_left.MK20  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.knuckle_left.MK22  &
   adams_id = 22  &
   location = 440.8213815, -366.041817572, 273.779765114  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.knuckle_left.MK22  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.knuckle_left.MK86  &
   adams_id = 86  &
   location = 349.518755114, -429.541707844, 266.644668132  &
   orientation = 0.0d, 90.0d, 90.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.knuckle_left.MK86  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.knuckle_left.cm  &
   adams_id = 500006  &
   location = 331.60198729, -412.417174402, 277.164903124  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.knuckle_left.cm  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.knuckle_left.Origin  &
   adams_id = 600006  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.knuckle_left.Origin  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.knuckle_left.MARKER_1000068  &
   adams_id = 1000068  &
   location = 339.1662, -383.3114, 216.408  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.knuckle_left.MARKER_1000068  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.knuckle_left.MARKER_1000078  &
   adams_id = 1000078  &
   location = 349.518755114, -429.541707844, 266.644668132  &
   orientation = 0.0d, 90.0d, 90.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.knuckle_left.MARKER_1000078  &
   name_visibility = off  &
   size_of_icons = 25.4
!
part create rigid_body mass_properties  &
   part_name = .terrain_vehicle3.knuckle_left  &
   mass = 3.617987887  &
   center_of_mass_marker = .terrain_vehicle3.knuckle_left.cm  &
   ixx = 6654.1651239012  &
   iyy = 1.4012601336E+04  &
   izz = 1.1250845066E+04  &
   ixy = 2493.6132779248  &
   izx = -47.4927540466  &
   iyz = 486.4758868527
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.knuckle_left.Hi61_shell  &
   reference_marker = .terrain_vehicle3.knuckle_left.Origin  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi61.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.knuckle_left.Hi61_shell  &
   color = SKYBLUE
!
part attributes  &
   part_name = .terrain_vehicle3.knuckle_left  &
   size_of_icons = 25.4
!
!------------------------------- steer_rod_left -------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
part create rigid_body name_and_position  &
   part_name = .terrain_vehicle3.steer_rod_left  &
   adams_id = 7  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.steer_rod_left
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .terrain_vehicle3.steer_rod_left.MK21  &
   adams_id = 21  &
   location = 440.8213815, -366.041817572, 273.779765114  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.steer_rod_left.MK21  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.steer_rod_left.CM  &
   adams_id = 500007  &
   location = 443.050577702, -203.590720326, 330.381803294  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.steer_rod_left.CM  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.steer_rod_left.Origin  &
   adams_id = 600007  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.steer_rod_left.Origin  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.steer_rod_left.MARKER_1000061  &
   adams_id = 1000061  &
   location = 445.492692198, -25.4, 392.376950322  &
   orientation = 359.2143371759d, 109.1943000888d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.steer_rod_left.MARKER_1000061  &
   name_visibility = off
!
part create rigid_body mass_properties  &
   part_name = .terrain_vehicle3.steer_rod_left  &
   mass = 6.82426236E-05  &
   center_of_mass_marker = .terrain_vehicle3.steer_rod_left.CM  &
   ixx = 0.6968644127  &
   iyy = 7.7218567563E-02  &
   izz = 0.6219630632  &
   ixy = 8.4972049991E-03  &
   izx = 2.9591657578E-03  &
   iyz = 0.2154102051
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.steer_rod_left.Hi60_shell  &
   reference_marker = .terrain_vehicle3.steer_rod_left.Origin  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi60.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.steer_rod_left.Hi60_shell  &
   color = GREEN
!
part attributes  &
   part_name = .terrain_vehicle3.steer_rod_left  &
   size_of_icons = 25.4
!
!------------------------------ steering_column -------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
part create rigid_body name_and_position  &
   part_name = .terrain_vehicle3.steering_column  &
   adams_id = 8  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.steering_column
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .terrain_vehicle3.steering_column.MK24  &
   adams_id = 24  &
   location = 350.92655621, 0.0, 380.983598458  &
   orientation = 270.0d, 150.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.steering_column.MK24  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.steering_column.CM  &
   adams_id = 500008  &
   location = 651.588588108, 20.0958498057, 901.967990828  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.steering_column.CM  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.steering_column.Origin  &
   adams_id = 600008  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.steering_column.Origin  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.steering_column.MARKER_1000062  &
   adams_id = 1000062  &
   location = 445.492692198, -25.4, 392.376950322  &
   orientation = 0.0d, 90.0d, 180.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.steering_column.MARKER_1000062  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.steering_column.MARKER_1000064  &
   adams_id = 1000064  &
   location = 445.492692198, 25.4, 392.376950322  &
   orientation = 180.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.steering_column.MARKER_1000064  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.steering_column.MARKER_1000212  &
   adams_id = 1000212  &
   location = 350.92655621, 0.0, 380.983598458  &
   orientation = 270.0d, 150.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.steering_column.MARKER_1000212  &
   name_visibility = off
!
part create rigid_body mass_properties  &
   part_name = .terrain_vehicle3.steering_column  &
   mass = 1.6129884E-03  &
   center_of_mass_marker = .terrain_vehicle3.steering_column.CM  &
   ixx = 119.8207204871  &
   iyy = 84.4028771294  &
   izz = 75.4428400172  &
   ixy = 2.7053980085  &
   izx = 34.7572760337  &
   iyz = 4.253277816
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.steering_column.Hi5_shell  &
   reference_marker = .terrain_vehicle3.steering_column.Origin  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi5.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.steering_column.Hi5_shell  &
   color = Brown
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.steering_column.Hi4_shell  &
   reference_marker = .terrain_vehicle3.steering_column.Origin  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi4.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.steering_column.Hi4_shell  &
   color = SKYBLUE
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.steering_column.Hi3_shell  &
   reference_marker = .terrain_vehicle3.steering_column.Origin  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi3.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.steering_column.Hi3_shell  &
   color = DARK_GRAY
!
part attributes  &
   part_name = .terrain_vehicle3.steering_column  &
   size_of_icons = 25.4
!
!--------------------------------- lca_right ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
part create rigid_body name_and_position  &
   part_name = .terrain_vehicle3.lca_right  &
   adams_id = 9  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.lca_right
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .terrain_vehicle3.lca_right.CM  &
   adams_id = 500009  &
   location = 348.803607954, 223.7544282078, 263.257258092  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.lca_right.CM  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.lca_right.MARKER_1000007  &
   adams_id = 1000007  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.lca_right.MARKER_1000007  &
   visibility = off  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.lca_right.MARKER_1000025  &
   adams_id = 1000025  &
   location = 254.0, 73.025, 349.25  &
   orientation = 90.0d, 101.6336339989d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.lca_right.MARKER_1000025  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.lca_right.MARKER_1000027  &
   adams_id = 1000027  &
   location = 469.9, 73.025, 304.8  &
   orientation = 90.0d, 101.6336339989d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.lca_right.MARKER_1000027  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.lca_right.MARKER_1000074  &
   adams_id = 1000074  &
   location = 339.1662, 383.3114, 216.408  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.lca_right.MARKER_1000074  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.lca_right.MK41  &
   adams_id = 41  &
   location = 351.744028794, 233.824364964, 277.453140292  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.lca_right.MK41  &
   name_visibility = off  &
   size_of_icons = 25.4
!
part create rigid_body mass_properties  &
   part_name = .terrain_vehicle3.lca_right  &
   mass = 2.891584005  &
   center_of_mass_marker = .terrain_vehicle3.lca_right.CM  &
   ixx = 2.730819088E+04  &
   iyy = 1.6457775549E+04  &
   izz = 3.5185539538E+04  &
   ixy = -1869.4947964868  &
   izx = -1726.2506894272  &
   iyz = -9095.685615044
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.lca_right.right_lca_rigid  &
   reference_marker = .terrain_vehicle3.lca_right.MARKER_1000007  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi200.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.lca_right.right_lca_rigid  &
   color = Orange
!
part attributes  &
   part_name = .terrain_vehicle3.lca_right  &
   size_of_icons = 25.4
!
!--------------------------------- uca_right ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
part create rigid_body name_and_position  &
   part_name = .terrain_vehicle3.uca_right  &
   adams_id = 12  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.uca_right
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .terrain_vehicle3.uca_right.MK47  &
   adams_id = 47  &
   location = 369.570377444, 359.387618282, 364.038262524  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.uca_right.MK47  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.uca_right.CM  &
   adams_id = 500012  &
   location = 378.545915246, 227.0344040964, 407.628577172  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.uca_right.CM  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.uca_right.Origin  &
   adams_id = 600012  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.uca_right.Origin  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.uca_right.MARKER_1000045  &
   adams_id = 1000045  &
   location = 280.890416882, 96.8375, 479.860596792  &
   orientation = 90.0d, 101.6336339989d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.uca_right.MARKER_1000045  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.uca_right.MARKER_1000047  &
   adams_id = 1000047  &
   location = 496.790416882, 96.8375, 435.410596792  &
   orientation = 90.0d, 101.6336339989d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.uca_right.MARKER_1000047  &
   name_visibility = off
!
part create rigid_body mass_properties  &
   part_name = .terrain_vehicle3.uca_right  &
   mass = 1.593305034  &
   center_of_mass_marker = .terrain_vehicle3.uca_right.CM  &
   ixx = 1.4202957446E+04  &
   iyy = 9451.5594065208  &
   izz = 1.9622938993E+04  &
   ixy = -897.8555139628  &
   izx = -1186.3742330532  &
   iyz = -4459.4430591606
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.uca_right.Hi64_shell  &
   reference_marker = .terrain_vehicle3.uca_right.Origin  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi64.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.uca_right.Hi64_shell  &
   color = YELLOW
!
part attributes  &
   part_name = .terrain_vehicle3.uca_right  &
   size_of_icons = 25.4
!
!------------------------------- knuckle_right --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
part create rigid_body name_and_position  &
   part_name = .terrain_vehicle3.knuckle_right  &
   adams_id = 13  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.knuckle_right
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .terrain_vehicle3.knuckle_right.MK48  &
   adams_id = 48  &
   location = 369.570377444, 359.387618282, 364.038262524  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.knuckle_right.MK48  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.knuckle_right.MK51  &
   adams_id = 51  &
   location = 440.821383024, 366.041707844, 273.779803214  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.knuckle_right.MK51  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.knuckle_right.MK88  &
   adams_id = 88  &
   location = 349.518755114, 429.541707844, 266.644668132  &
   orientation = 180.0d, 90.0d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.knuckle_right.MK88  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.knuckle_right.CM  &
   adams_id = 500013  &
   location = 331.602058918, 412.4170695, 277.164405792  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.knuckle_right.CM  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.knuckle_right.Origin  &
   adams_id = 600013  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.knuckle_right.Origin  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.knuckle_right.MARKER_1000073  &
   adams_id = 1000073  &
   location = 339.1662, 383.3114, 216.408  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.knuckle_right.MARKER_1000073  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.knuckle_right.MARKER_1000080  &
   adams_id = 1000080  &
   location = 349.518755114, 429.541707844, 266.644668132  &
   orientation = 180.0d, 90.0d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.knuckle_right.MARKER_1000080  &
   name_visibility = off  &
   size_of_icons = 25.4
!
part create rigid_body mass_properties  &
   part_name = .terrain_vehicle3.knuckle_right  &
   mass = 3.617986392  &
   center_of_mass_marker = .terrain_vehicle3.knuckle_right.CM  &
   ixx = 6654.1321368704  &
   iyy = 1.4012561239E+04  &
   izz = 1.125088584E+04  &
   ixy = -2493.5526393364  &
   izx = -47.5108997522  &
   iyz = -486.5133657455
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.knuckle_right.Hi89_shell  &
   reference_marker = .terrain_vehicle3.knuckle_right.Origin  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi89.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.knuckle_right.Hi89_shell  &
   color = SKYBLUE
!
part attributes  &
   part_name = .terrain_vehicle3.knuckle_right  &
   size_of_icons = 25.4
!
!------------------------------ steer_rod_right -------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
part create rigid_body name_and_position  &
   part_name = .terrain_vehicle3.steer_rod_right  &
   adams_id = 14  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.steer_rod_right
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .terrain_vehicle3.steer_rod_right.MK52  &
   adams_id = 52  &
   location = 440.821383024, 366.041707844, 273.779803214  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.steer_rod_right.MK52  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.steer_rod_right.CM  &
   adams_id = 500014  &
   location = 443.050936604, 203.5249528172, 330.389935612  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.steer_rod_right.CM  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.steer_rod_right.Origin  &
   adams_id = 600014  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.steer_rod_right.Origin  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.steer_rod_right.MARKER_1000063  &
   adams_id = 1000063  &
   location = 445.492692198, 25.4, 392.376950322  &
   orientation = 180.7856628208d, 109.1943001042d, 180.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.steer_rod_right.MARKER_1000063  &
   name_visibility = off
!
part create rigid_body mass_properties  &
   part_name = .terrain_vehicle3.steer_rod_right  &
   mass = 6.821783272E-05  &
   center_of_mass_marker = .terrain_vehicle3.steer_rod_right.CM  &
   ixx = 0.6963611234  &
   iyy = 7.7196190252E-02  &
   izz = 0.6214819906  &
   ixy = -8.4900920649E-03  &
   izx = 2.9607433133E-03  &
   iyz = -0.2153883958
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.steer_rod_right.Hi66_shell  &
   reference_marker = .terrain_vehicle3.steer_rod_right.Origin  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi66.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.steer_rod_right.Hi66_shell  &
   color = GREEN
!
part attributes  &
   part_name = .terrain_vehicle3.steer_rod_right  &
   size_of_icons = 25.4
!
!---------------------------------- swingarm ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
part create rigid_body name_and_position  &
   part_name = .terrain_vehicle3.swingarm  &
   adams_id = 16  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.swingarm
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .terrain_vehicle3.swingarm.MK60  &
   adams_id = 60  &
   location = 1143.0, 141.2875, 412.75  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.swingarm.MK60  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.swingarm.MK62  &
   adams_id = 62  &
   location = 1143.0, -141.2875, 412.75  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.swingarm.MK62  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.swingarm.MK63  &
   adams_id = 63  &
   location = 1581.15, 82.55, 241.3  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.swingarm.MK63  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.swingarm.MK65  &
   adams_id = 65  &
   location = 1581.15, -82.55, 241.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.swingarm.MK65  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.swingarm.CM  &
   adams_id = 500016  &
   location = 1432.25947736, -107.714085689, 299.63074313  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.swingarm.CM  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.swingarm.Origin  &
   adams_id = 600016  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.swingarm.Origin  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.swingarm.MARKER_1000076  &
   adams_id = 1000076  &
   location = 1581.15, -82.55, 241.3  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.swingarm.MARKER_1000076  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.swingarm.MK82  &
   adams_id = 82  &
   location = 1343.0, 0.0, 354.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.swingarm.MK82  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.swingarm.MARKER_1000099  &
   adams_id = 1000099  &
   location = 1143.0, 0.0, 412.75  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.swingarm.MARKER_1000099  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.swingarm.MARKER_1000101  &
   adams_id = 1000101  &
   location = 1343.0, 0.0, 354.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.swingarm.MARKER_1000101  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.swingarm.MARKER_1000165  &
   adams_id = 1000165  &
   location = 1581.15, -82.55, 241.3  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.swingarm.MARKER_1000165  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.swingarm.MARKER_1000309  &
   adams_id = 1000309  &
   location = 1343.0, 0.0, 354.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .terrain_vehicle3.swingarm  &
   mass = 1.920048816  &
   center_of_mass_marker = .terrain_vehicle3.swingarm.CM  &
   ixx = 1.6990004846E+04  &
   iyy = 6.9845703599E+04  &
   izz = 5.3044259834E+04  &
   ixy = 7.1811180248  &
   izx = -1.6638368394E+04  &
   iyz = 3.509680658
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.swingarm.Hi101_shell  &
   reference_marker = .terrain_vehicle3.swingarm.Origin  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi101.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.swingarm.Hi101_shell  &
   color = SILVER
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.swingarm.Hi100_shell  &
   reference_marker = .terrain_vehicle3.swingarm.Origin  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi100.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.swingarm.Hi100_shell  &
   color = ClayRed
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.swingarm.Hi99_shell  &
   reference_marker = .terrain_vehicle3.swingarm.Origin  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi99.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.swingarm.Hi99_shell  &
   color = DARK_GRAY
!
part attributes  &
   part_name = .terrain_vehicle3.swingarm  &
   size_of_icons = 25.4
!
!--------------------------------- axle_rear ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
part create rigid_body name_and_position  &
   part_name = .terrain_vehicle3.axle_rear  &
   adams_id = 17  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.axle_rear
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .terrain_vehicle3.axle_rear.cm  &
   adams_id = 500017  &
   location = 1581.150252476, 3.562871904, 241.300048768  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.axle_rear.cm  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.axle_rear.MK66  &
   adams_id = 66  &
   node_id = 54501  &
   location = 1581.15, -82.55, 241.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.axle_rear.MK66  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.axle_rear.MK64  &
   adams_id = 1000001  &
   node_id = 54500  &
   location = 1581.15, 82.55, 241.3  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.axle_rear.MK64  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.axle_rear.MARKER_1000006  &
   adams_id = 1000006  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.axle_rear.MARKER_1000006  &
   visibility = off  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.axle_rear.MARKER_1000075  &
   adams_id = 1000075  &
   node_id = 54501  &
   location = 1581.15, -82.55, 241.3  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.axle_rear.MARKER_1000075  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.axle_rear.Origin_2  &
   adams_id = 600018  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.axle_rear.Origin_2  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.axle_rear.Origin_1  &
   adams_id = 600019  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.axle_rear.Origin_1  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.axle_rear.MARKER_1000161  &
   adams_id = 1000161  &
   location = 1581.15, 453.0, 241.3  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.axle_rear.MARKER_1000161  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.axle_rear.MARKER_1000147  &
   adams_id = 1000147  &
   location = 1581.15, -453.0, 241.3  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.axle_rear.MARKER_1000147  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.axle_rear.MARKER_1000164  &
   adams_id = 1000164  &
   node_id = 54501  &
   location = 1581.15, -82.55, 241.3  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.axle_rear.MARKER_1000164  &
   name_visibility = off  &
   size_of_icons = 25.4
!
part create rigid_body mass_properties  &
   part_name = .terrain_vehicle3.axle_rear  &
   mass = 12.29253683  &
   center_of_mass_marker = .terrain_vehicle3.axle_rear.cm  &
   ixx = 8.6933730648E+05  &
   iyy = 8435.6882705252  &
   izz = 8.6933728713E+05  &
   ixy = 6.0383463117E-02  &
   izx = -3.611257071E-03  &
   iyz = 0.1886175628
!
! ****** Graphics for current part ******
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.axle_rear.rear_axle_rigid  &
   reference_marker = .terrain_vehicle3.axle_rear.MARKER_1000006  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi202.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.axle_rear.rear_axle_rigid  &
   color = BLUE
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.axle_rear.Hi103_shell  &
   reference_marker = .terrain_vehicle3.axle_rear.Origin_1  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi103.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.axle_rear.Hi103_shell  &
   color = MAIZE
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.axle_rear.Hi105_shell  &
   reference_marker = .terrain_vehicle3.axle_rear.Origin_2  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi105.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.axle_rear.Hi105_shell  &
   color = RED
!
part attributes  &
   part_name = .terrain_vehicle3.axle_rear  &
   size_of_icons = 25.4
!
!----------------------------- wheel_right_front ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
part create rigid_body name_and_position  &
   part_name = .terrain_vehicle3.wheel_right_front  &
   adams_id = 22  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.wheel_right_front
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .terrain_vehicle3.wheel_right_front.MARKER_1000145  &
   adams_id = 1000145  &
   location = 349.518755114, 462.0, 266.644668132  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.wheel_right_front.MARKER_1000145  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.wheel_right_front.MK89  &
   adams_id = 89  &
   location = 349.518755114, 429.541707844, 266.644668132  &
   orientation = 180.0d, 90.0d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.wheel_right_front.MK89  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.wheel_right_front.MK127  &
   adams_id = 127  &
   location = 349.518755114, 454.941707844, 266.644668132  &
   orientation = 90.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.wheel_right_front.MK127  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.wheel_right_front.CM  &
   adams_id = 500022  &
   location = 349.518755368, 457.370577764, 266.65984006  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.wheel_right_front.CM  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.wheel_right_front.Origin  &
   adams_id = 600022  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.wheel_right_front.Origin  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.wheel_right_front.MARKER_1000079  &
   adams_id = 1000079  &
   location = 349.518755114, 429.541707844, 266.644668132  &
   orientation = 180.0d, 90.0d, 270.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.wheel_right_front.MARKER_1000079  &
   name_visibility = off  &
   size_of_icons = 25.4
!
part create rigid_body mass_properties  &
   part_name = .terrain_vehicle3.wheel_right_front  &
   mass = 2.619988643  &
   center_of_mass_marker = .terrain_vehicle3.wheel_right_front.CM  &
   ixx = 2.8190696967E+04  &
   iyy = 4.7475495094E+04  &
   izz = 2.8192505073E+04  &
   ixy = -3.6964123491  &
   izx = -6.2300120341E-03  &
   iyz = -0.1184217478
!
! ****** Graphics for current part ******
!
geometry create shape ellipsoid  &
   ellipsoid_name = .terrain_vehicle3.wheel_right_front.SPHERE_PLANE_CONTACT_8_Sphere  &
   adams_id = 4  &
   center_marker = .terrain_vehicle3.wheel_right_front.MK127  &
   x_scale_factor = 477.52  &
   y_scale_factor = 477.52  &
   z_scale_factor = 477.52
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.wheel_right_front.SPHERE_PLANE_CONTACT_8_Sphere  &
   visibility = off
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.wheel_right_front.Hi11_shell  &
   reference_marker = .terrain_vehicle3.wheel_right_front.Origin  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi11.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.wheel_right_front.Hi11_shell  &
   color = RED
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.wheel_right_front.Hi10_shell  &
   reference_marker = .terrain_vehicle3.wheel_right_front.Origin  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi10.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.wheel_right_front.Hi10_shell  &
   color = BLUE
!
part attributes  &
   part_name = .terrain_vehicle3.wheel_right_front  &
   size_of_icons = 25.4
!
!------------------------------ wheel_left_front ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
part create rigid_body name_and_position  &
   part_name = .terrain_vehicle3.wheel_left_front  &
   adams_id = 23  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.wheel_left_front
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .terrain_vehicle3.wheel_left_front.MARKER_1000119  &
   adams_id = 1000119  &
   location = 349.518755114, -462.0, 266.644668132  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.wheel_left_front.MARKER_1000119  &
   name_visibility = off
!
marker create  &
   marker_name = .terrain_vehicle3.wheel_left_front.MK87  &
   adams_id = 87  &
   location = 349.518755114, -429.541707844, 266.644668132  &
   orientation = 0.0d, 90.0d, 90.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.wheel_left_front.MK87  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.wheel_left_front.MK125  &
   adams_id = 125  &
   location = 349.518755114, -454.941707844, 266.644668132  &
   orientation = 90.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.wheel_left_front.MK125  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.wheel_left_front.CM  &
   adams_id = 500023  &
   location = 349.518755368, -457.370577764, 266.65984006  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.wheel_left_front.CM  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.wheel_left_front.Origin  &
   adams_id = 600023  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.wheel_left_front.Origin  &
   name_visibility = off  &
   size_of_icons = 25.4
!
marker create  &
   marker_name = .terrain_vehicle3.wheel_left_front.MARKER_1000077  &
   adams_id = 1000077  &
   location = 349.518755114, -429.541707844, 266.644668132  &
   orientation = 0.0d, 90.0d, 90.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.wheel_left_front.MARKER_1000077  &
   name_visibility = off  &
   size_of_icons = 25.4
!
part create rigid_body mass_properties  &
   part_name = .terrain_vehicle3.wheel_left_front  &
   mass = 2.619988643  &
   center_of_mass_marker = .terrain_vehicle3.wheel_left_front.CM  &
   ixx = 2.8190696967E+04  &
   iyy = 4.7475495094E+04  &
   izz = 2.8192505073E+04  &
   ixy = 3.6964124136  &
   izx = -6.2298061984E-03  &
   iyz = 0.1184206128
!
! ****** Graphics for current part ******
!
geometry create shape ellipsoid  &
   ellipsoid_name = .terrain_vehicle3.wheel_left_front.SPHERE_PLANE_CONTACT_7_Sphere  &
   adams_id = 3  &
   center_marker = .terrain_vehicle3.wheel_left_front.MK125  &
   x_scale_factor = 477.52  &
   y_scale_factor = 477.52  &
   z_scale_factor = 477.52
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.wheel_left_front.SPHERE_PLANE_CONTACT_7_Sphere  &
   visibility = off
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.wheel_left_front.Hi17_shell  &
   reference_marker = .terrain_vehicle3.wheel_left_front.Origin  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi17.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.wheel_left_front.Hi17_shell  &
   color = RED
!
geometry create shape shell  &
   shell_name = .terrain_vehicle3.wheel_left_front.Hi16_shell  &
   reference_marker = .terrain_vehicle3.wheel_left_front.Origin  &
   file_name = "./terrain_vehicle_geometry/ATV_4post_flex_Hi16.shl"  &
   wireframe_only = no
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.wheel_left_front.Hi16_shell  &
   color = BLUE
!
part attributes  &
   part_name = .terrain_vehicle3.wheel_left_front  &
   size_of_icons = 25.4
!
!--------------------------------- Equations ----------------------------------!
!
!
part create equation differential_equation  &
   differential_equation_name = .terrain_vehicle3.DIFF_vel_error_filter  &
   adams_id = 1  &
   initial_condition = 0.0  &
   function = ""  &
   implicit = off  &
   static_hold = on  &
   dynamic_hold = off
!
part create equation differential_equation  &
   differential_equation_name = .terrain_vehicle3.DIFF_vel_error_integrator  &
   adams_id = 2  &
   initial_condition = 0.0  &
   function = ""  &
   implicit = off  &
   static_hold = on  &
   dynamic_hold = off
!
part create equation differential_equation  &
   differential_equation_name = .terrain_vehicle3.DIFF_yaw_error_filter  &
   adams_id = 3  &
   initial_condition = 0.0  &
   function = ""  &
   implicit = off  &
   static_hold = on  &
   dynamic_hold = off
!
part create equation differential_equation  &
   differential_equation_name = .terrain_vehicle3.DIFF_yaw_error_integrator  &
   adams_id = 4  &
   initial_condition = 0.0  &
   function = ""  &
   implicit = off  &
   static_hold = on  &
   dynamic_hold = off
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint spherical  &
   joint_name = .terrain_vehicle3.left_uca_knuckle_spherical  &
   adams_id = 9  &
   i_marker_name = .terrain_vehicle3.knuckle_left.MK20  &
   j_marker_name = .terrain_vehicle3.uca_left.MK19
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.left_uca_knuckle_spherical  &
   name_visibility = off  &
   size_of_icons = 25.4
!
constraint create joint spherical  &
   joint_name = .terrain_vehicle3.left_steer_outer_spherical  &
   adams_id = 10  &
   i_marker_name = .terrain_vehicle3.knuckle_left.MK22  &
   j_marker_name = .terrain_vehicle3.steer_rod_left.MK21
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.left_steer_outer_spherical  &
   name_visibility = off  &
   size_of_icons = 25.4
!
constraint create joint revolute  &
   joint_name = .terrain_vehicle3.steering_revolute  &
   adams_id = 11  &
   i_marker_name = .terrain_vehicle3.steering_column.MK24  &
   j_marker_name = .terrain_vehicle3.frame.MK23
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.steering_revolute  &
   name_visibility = off  &
   size_of_icons = 25.4
!
constraint create joint spherical  &
   joint_name = .terrain_vehicle3.right_uca_knuckle_spherical  &
   adams_id = 22  &
   i_marker_name = .terrain_vehicle3.knuckle_right.MK48  &
   j_marker_name = .terrain_vehicle3.uca_right.MK47
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.right_uca_knuckle_spherical  &
   name_visibility = off  &
   size_of_icons = 25.4
!
constraint create joint spherical  &
   joint_name = .terrain_vehicle3.right_steer_outer  &
   adams_id = 24  &
   i_marker_name = .terrain_vehicle3.steer_rod_right.MK52  &
   j_marker_name = .terrain_vehicle3.knuckle_right.MK51
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.right_steer_outer  &
   name_visibility = off  &
   size_of_icons = 25.4
!
constraint create joint spherical  &
   joint_name = .terrain_vehicle3.frame_swingarm_right_spherical  &
   adams_id = 28  &
   i_marker_name = .terrain_vehicle3.swingarm.MK60  &
   j_marker_name = .terrain_vehicle3.frame.MK59
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.frame_swingarm_right_spherical  &
   name_visibility = off  &
   size_of_icons = 25.4
!
constraint create joint spherical  &
   joint_name = .terrain_vehicle3.swingarm_left_spherical  &
   adams_id = 31  &
   i_marker_name = .terrain_vehicle3.axle_rear.MK66  &
   j_marker_name = .terrain_vehicle3.swingarm.MK65
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.swingarm_left_spherical  &
   name_visibility = off  &
   size_of_icons = 25.4
!
constraint create joint revolute  &
   joint_name = .terrain_vehicle3.left_wheel_rev  &
   adams_id = 41  &
   i_marker_name = .terrain_vehicle3.wheel_left_front.MK87  &
   j_marker_name = .terrain_vehicle3.knuckle_left.MK86
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.left_wheel_rev  &
   name_visibility = off  &
   size_of_icons = 25.4
!
constraint create joint revolute  &
   joint_name = .terrain_vehicle3.right_wheel_rev  &
   adams_id = 42  &
   i_marker_name = .terrain_vehicle3.wheel_right_front.MK89  &
   j_marker_name = .terrain_vehicle3.knuckle_right.MK88
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.right_wheel_rev  &
   name_visibility = off  &
   size_of_icons = 25.4
!
constraint create joint hooke  &
   joint_name = .terrain_vehicle3.left_steer_inner  &
   adams_id = 71  &
   i_marker_name = .terrain_vehicle3.steer_rod_left.MARKER_1000061  &
   j_marker_name = .terrain_vehicle3.steering_column.MARKER_1000062
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.left_steer_inner  &
   name_visibility = off
!
constraint create joint hooke  &
   joint_name = .terrain_vehicle3.right_steer_inner  &
   adams_id = 72  &
   i_marker_name = .terrain_vehicle3.steer_rod_right.MARKER_1000063  &
   j_marker_name = .terrain_vehicle3.steering_column.MARKER_1000064
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.right_steer_inner  &
   name_visibility = off
!
!------------------------------ Joint Primitives ------------------------------!
!
!
constraint create primitive_joint inline  &
   jprim_name = .terrain_vehicle3.frame_swingarm_left_inplane  &
   adams_id = 1  &
   i_marker_name = .terrain_vehicle3.swingarm.MK62  &
   j_marker_name = .terrain_vehicle3.frame.MK61
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.frame_swingarm_left_inplane  &
   name_visibility = off
!
constraint create primitive_joint inline  &
   jprim_name = .terrain_vehicle3.swingarm_right_inplane  &
   adams_id = 2  &
   i_marker_name = .terrain_vehicle3.axle_rear.MK64  &
   j_marker_name = .terrain_vehicle3.swingarm.MK63
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.swingarm_right_inplane  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
force create element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_lca_front_left  &
   adams_id = 1  &
   i_marker_name = .terrain_vehicle3.lca_left.MARKER_1000015  &
   j_marker_name = .terrain_vehicle3.frame.MARKER_1000016  &
   damping = 50.0, 50.0, 50.0  &
   stiffness = 2.5E+04, 2.5E+04, 2.5E+04  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 0.0, 0.0, 0.0  &
   tstiffness = 0.0, 0.0, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force attributes  &
   force_name = .terrain_vehicle3.bushing_lca_front_left  &
   name_visibility = off  &
   size_of_icons = 15.0
!
force create element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_lca_rear_left  &
   adams_id = 2  &
   i_marker_name = .terrain_vehicle3.lca_left.MARKER_1000017  &
   j_marker_name = .terrain_vehicle3.frame.MARKER_1000018  &
   damping = 50.0, 50.0, 50.0  &
   stiffness = 2.5E+04, 2.5E+04, 2.5E+04  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 0.0, 0.0, 0.0  &
   tstiffness = 0.0, 0.0, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force attributes  &
   force_name = .terrain_vehicle3.bushing_lca_rear_left  &
   name_visibility = off  &
   size_of_icons = 15.0
!
force create element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_lca_front_right  &
   adams_id = 3  &
   i_marker_name = .terrain_vehicle3.lca_right.MARKER_1000025  &
   j_marker_name = .terrain_vehicle3.frame.MARKER_1000026  &
   damping = 50.0, 50.0, 50.0  &
   stiffness = 2.5E+04, 2.5E+04, 2.5E+04  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 0.0, 0.0, 0.0  &
   tstiffness = 0.0, 0.0, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force attributes  &
   force_name = .terrain_vehicle3.bushing_lca_front_right  &
   name_visibility = off  &
   size_of_icons = 15.0
!
force create element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_lca_rear_right  &
   adams_id = 4  &
   i_marker_name = .terrain_vehicle3.lca_right.MARKER_1000027  &
   j_marker_name = .terrain_vehicle3.frame.MARKER_1000028  &
   damping = 50.0, 50.0, 50.0  &
   stiffness = 2.5E+04, 2.5E+04, 2.5E+04  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 0.0, 0.0, 0.0  &
   tstiffness = 0.0, 0.0, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force attributes  &
   force_name = .terrain_vehicle3.bushing_lca_rear_right  &
   name_visibility = off  &
   size_of_icons = 15.0
!
force create element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_uca_front_left  &
   adams_id = 5  &
   i_marker_name = .terrain_vehicle3.uca_left.MARKER_1000035  &
   j_marker_name = .terrain_vehicle3.frame.MARKER_1000036  &
   damping = 50.0, 50.0, 50.0  &
   stiffness = 2.5E+04, 2.5E+04, 2.5E+04  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 0.0, 0.0, 0.0  &
   tstiffness = 0.0, 0.0, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force attributes  &
   force_name = .terrain_vehicle3.bushing_uca_front_left  &
   name_visibility = off  &
   size_of_icons = 15.0
!
force create element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_uca_rear_left  &
   adams_id = 6  &
   i_marker_name = .terrain_vehicle3.uca_left.MARKER_1000037  &
   j_marker_name = .terrain_vehicle3.frame.MARKER_1000038  &
   damping = 50.0, 50.0, 50.0  &
   stiffness = 2.5E+04, 2.5E+04, 2.5E+04  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 0.0, 0.0, 0.0  &
   tstiffness = 0.0, 0.0, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force attributes  &
   force_name = .terrain_vehicle3.bushing_uca_rear_left  &
   name_visibility = off  &
   size_of_icons = 15.0
!
force create element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_uca_front_right  &
   adams_id = 7  &
   i_marker_name = .terrain_vehicle3.uca_right.MARKER_1000045  &
   j_marker_name = .terrain_vehicle3.frame.MARKER_1000046  &
   damping = 50.0, 50.0, 50.0  &
   stiffness = 2.5E+04, 2.5E+04, 2.5E+04  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 0.0, 0.0, 0.0  &
   tstiffness = 0.0, 0.0, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force attributes  &
   force_name = .terrain_vehicle3.bushing_uca_front_right  &
   name_visibility = off  &
   size_of_icons = 15.0
!
force create element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_uca_rear_right  &
   adams_id = 8  &
   i_marker_name = .terrain_vehicle3.uca_right.MARKER_1000047  &
   j_marker_name = .terrain_vehicle3.frame.MARKER_1000048  &
   damping = 50.0, 50.0, 50.0  &
   stiffness = 2.5E+04, 2.5E+04, 2.5E+04  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 0.0, 0.0, 0.0  &
   tstiffness = 0.0, 0.0, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force attributes  &
   force_name = .terrain_vehicle3.bushing_uca_rear_right  &
   name_visibility = off  &
   size_of_icons = 15.0
!
force create element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_lca_outer_left  &
   adams_id = 11  &
   i_marker_name = .terrain_vehicle3.knuckle_left.MARKER_1000068  &
   j_marker_name = .terrain_vehicle3.lca_left.MARKER_1000069  &
   damping = 50.0, 50.0, 50.0  &
   stiffness = 2.5E+04, 2.5E+04, 2.5E+04  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 0.0, 0.0, 0.0  &
   tstiffness = 0.0, 0.0, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force attributes  &
   force_name = .terrain_vehicle3.bushing_lca_outer_left  &
   name_visibility = off
!
force create element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_lca_outer_right  &
   adams_id = 12  &
   i_marker_name = .terrain_vehicle3.knuckle_right.MARKER_1000073  &
   j_marker_name = .terrain_vehicle3.lca_right.MARKER_1000074  &
   damping = 50.0, 50.0, 50.0  &
   stiffness = 2.5E+04, 2.5E+04, 2.5E+04  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 0.0, 0.0, 0.0  &
   tstiffness = 0.0, 0.0, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force attributes  &
   force_name = .terrain_vehicle3.bushing_lca_outer_right  &
   name_visibility = off
!
force create direct single_component_force  &
   single_component_force_name = .terrain_vehicle3.rear_axle_static_hold  &
   adams_id = 1  &
   type_of_freedom = rotational  &
   i_marker_name = .terrain_vehicle3.axle_rear.MARKER_1000075  &
   j_marker_name = .terrain_vehicle3.swingarm.MARKER_1000076  &
   action_only = off  &
   function = ""
!
force attributes  &
   force_name = .terrain_vehicle3.rear_axle_static_hold  &
   name_visibility = off
!
force create direct single_component_force  &
   single_component_force_name = .terrain_vehicle3.left_wheel_static_hold  &
   adams_id = 2  &
   type_of_freedom = rotational  &
   i_marker_name = .terrain_vehicle3.wheel_left_front.MARKER_1000077  &
   j_marker_name = .terrain_vehicle3.knuckle_left.MARKER_1000078  &
   action_only = off  &
   function = ""
!
force attributes  &
   force_name = .terrain_vehicle3.left_wheel_static_hold  &
   name_visibility = off
!
force create direct single_component_force  &
   single_component_force_name = .terrain_vehicle3.right_wheel_static_hold  &
   adams_id = 3  &
   type_of_freedom = rotational  &
   i_marker_name = .terrain_vehicle3.wheel_right_front.MARKER_1000079  &
   j_marker_name = .terrain_vehicle3.knuckle_right.MARKER_1000080  &
   action_only = off  &
   function = ""
!
force attributes  &
   force_name = .terrain_vehicle3.right_wheel_static_hold  &
   name_visibility = off
!
force create direct single_component_force  &
   single_component_force_name = .terrain_vehicle3.bumpstop_rear  &
   adams_id = 5  &
   type_of_freedom = translational  &
   i_marker_name = .terrain_vehicle3.swingarm.MARKER_1000101  &
   j_marker_name = .terrain_vehicle3.frame.MARKER_1000102  &
   action_only = off  &
   function = ""
!
force attributes  &
   force_name = .terrain_vehicle3.bumpstop_rear  &
   name_visibility = off
!
force create direct single_component_force  &
   single_component_force_name = .terrain_vehicle3.rear_axle_drive  &
   adams_id = 6  &
   type_of_freedom = rotational  &
   i_marker_name = .terrain_vehicle3.axle_rear.MARKER_1000164  &
   j_marker_name = .terrain_vehicle3.swingarm.MARKER_1000165  &
   action_only = on  &
   function = ""
!
force attributes  &
   force_name = .terrain_vehicle3.rear_axle_drive  &
   name_visibility = off
!
force create direct single_component_force  &
   single_component_force_name = .terrain_vehicle3.steering_torque  &
   adams_id = 7  &
   type_of_freedom = rotational  &
   i_marker_name = .terrain_vehicle3.steering_column.MARKER_1000212  &
   j_marker_name = .terrain_vehicle3.frame.MARKER_1000213  &
   action_only = off  &
   function = ""
!
force attributes  &
   force_name = .terrain_vehicle3.steering_torque  &
   active = off  &
   name_visibility = off
!
force create element_like translational_spring_damper  &
   spring_damper_name = .terrain_vehicle3.spring_damper_left  &
   adams_id = 1  &
   i_marker_name = .terrain_vehicle3.frame.MK13  &
   j_marker_name = .terrain_vehicle3.lca_left.MK14  &
   damping = 0.1  &
   stiffness = 35.0  &
   preload = 500.0  &
   displacement_at_preload = 392.3
!
force attributes  &
   force_name = .terrain_vehicle3.spring_damper_left  &
   name_visibility = off  &
   size_of_icons = 25.4
!
force create element_like translational_spring_damper  &
   spring_damper_name = .terrain_vehicle3.spring_damper_right  &
   adams_id = 2  &
   i_marker_name = .terrain_vehicle3.lca_right.MK41  &
   j_marker_name = .terrain_vehicle3.frame.MK42  &
   damping = 0.1  &
   stiffness = 35.0  &
   preload = 500.0  &
   displacement_at_preload = 392.3
!
force attributes  &
   force_name = .terrain_vehicle3.spring_damper_right  &
   name_visibility = off  &
   size_of_icons = 25.4
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .terrain_vehicle3.sim_3sec  &
   type = auto_select  &
   initial_static = yes  &
   step_size = 1.0E-02  &
   end_time = 3.0
!
simulation script create  &
   sim_script_name = .terrain_vehicle3.Last_Sim  &
   commands =   &
              "simulation single_run transient type=dynamic initial_static=yes end_time=4.0 step_size=1.0E-02 model_name=.terrain_vehicle3"
!
simulation script create  &
   sim_script_name = .terrain_vehicle3.SIM_SCRIPT_1  &
   commands =   &
              "mdi vibration vibration_analysis_linear multirun_full_solve  &",  &
              "   instance_name = .terrain_vehicle3.VibrationAnalysis_1  &",  &
              "   damping = 1  &", "   start_at = script  &",  &
              "   frequency_begin = 0.2  &", "   frequency_end = 20.0  &",  &
              "   frequency_steps = 500  &",  &
              "   frequency_logarithmic = 1  &",  &
              "   sim_script = .terrain_vehicle3.sim_3sec &",  &
              "   use_pstate = 0 &", "    &", "   "
!
simulation script create  &
   sim_script_name = .terrain_vehicle3.SIM_SCRIPT_2  &
   commands =   &
              "mdi vibration vibration_analysis_linear multirun_full_solve  &",  &
              "   instance_name = .terrain_vehicle3.VibrationAnalysis_1  &",  &
              "   damping = 1  &", "   start_at = script  &",  &
              "   frequency_begin = 0.2  &", "   frequency_end = 20.0  &",  &
              "   frequency_steps = 500  &",  &
              "   frequency_logarithmic = 1  &",  &
              "   sim_script = .terrain_vehicle3.sim_3sec &",  &
              "   use_pstate = 0 &", "    &", "   "
!
!-------------------------- Adams View UDE Instances --------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
undo begin_block suppress = yes
!
ude create instance  &
   instance_name = .terrain_vehicle3.road1  &
   definition_name = .MDI.Forces.vpg_road  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude attributes  &
   instance_name = .terrain_vehicle3.road1  &
   color = ClayRed  &
   visibility = on
!
ude create instance  &
   instance_name = .terrain_vehicle3.tire_fl  &
   definition_name = .MDI.Forces.vpg_tire  &
   location = 349.518755114, -462.0, 266.644668132  &
   orientation = 0.0, 90.0, 0.0
!
ude create instance  &
   instance_name = .terrain_vehicle3.tire_fr  &
   definition_name = .MDI.Forces.vpg_tire  &
   location = 349.518755114, 462.0, 266.644668132  &
   orientation = 0.0, 90.0, 0.0
!
ude create instance  &
   instance_name = .terrain_vehicle3.tire_rl  &
   definition_name = .MDI.Forces.vpg_tire  &
   location = 1581.15, -458.0, 241.3  &
   orientation = 0.0, 90.0, 0.0
!
ude create instance  &
   instance_name = .terrain_vehicle3.tire_rr  &
   definition_name = .MDI.Forces.vpg_tire  &
   location = 1581.15, 458.0, 241.3  &
   orientation = 0.0, 90.0, 0.0
!
ude create instance  &
   instance_name = .terrain_vehicle3.Vibration_Actuator_1  &
   definition_name = .vibration.Vibration_Actuator  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .terrain_vehicle3.Input_FL  &
   definition_name = .vibration.Input_Channel  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .terrain_vehicle3.Output_accZ  &
   definition_name = .vibration.Output_Channel  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .terrain_vehicle3.Vibration_Actuator_2  &
   definition_name = .vibration.Vibration_Actuator  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .terrain_vehicle3.Input_FR  &
   definition_name = .vibration.Input_Channel  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .terrain_vehicle3.Vibration_Actuator_3  &
   definition_name = .vibration.Vibration_Actuator  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .terrain_vehicle3.Input_RL  &
   definition_name = .vibration.Input_Channel  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .terrain_vehicle3.Vibration_Actuator_4  &
   definition_name = .vibration.Vibration_Actuator  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .terrain_vehicle3.Input_RR  &
   definition_name = .vibration.Input_Channel  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .terrain_vehicle3.spring_damper_rear  &
   definition_name = .MDI.Forces.spring  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude attributes  &
   instance_name = .terrain_vehicle3.spring_damper_rear  &
   color = RED
!
ude create instance  &
   instance_name = .terrain_vehicle3.VibrationAnalysis_1  &
   definition_name = .vibration.Vibration_Analysis  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .terrain_vehicle3.FVA_1  &
   definition_name = .vibration.ForcedVibrationAnalysis  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .terrain_vehicle3.road1.ref_marker  &
   object_value = .terrain_vehicle3.ground.road1_ref_1
!
variable modify  &
   variable_name = .terrain_vehicle3.road1.road_property_file  &
   string_value = "D:/CHALMERS UNI/6th Study period/Rigid Body dynamics MMS/Assignment 5/terrain_vehicle/3d_bump.rdf"
!
variable modify  &
   variable_name = .terrain_vehicle3.road1.road_graphics  &
   string_value = "on"
!
ude modify instance  &
   instance_name = .terrain_vehicle3.road1
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.cm_offset  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.center_offset  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.ic_vmode  &
   string_value = "standard"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.vm  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.wm  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.long_vel  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.spin_vel  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.vx  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.vy  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.vz  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.wx  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.wy  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.wz  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.ic_vx  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.ic_vy  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.ic_vz  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.ic_wx  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.ic_wy  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.ic_wz  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.ic_vm  &
   string_value = "ground"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.ic_wm  &
   string_value = "cm"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.vmmrk  &
   object_value = (.terrain_vehicle3.tire_fl.wheel_part.wheel_cm)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.wmmrk  &
   object_value = (.terrain_vehicle3.tire_fl.wheel_part.wheel_cm)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.side  &
   string_value = "left"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.road_property_file  &
   string_value = (.terrain_vehicle3.road1.road_property_file)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.j_fmarker  &
   object_value = .terrain_vehicle3.ground.tire_fl_tire_jf_1
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.ref_marker  &
   object_value = (.terrain_vehicle3.road1.ref_marker.object_value)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.wheel_tire_mass  &
   real_value = 10.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.Ixx_Iyy  &
   real_value = 1.0E+05
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.Izz  &
   real_value = 1.0E+05
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.property_file  &
   string_value = "pac2002_front.tir"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fl.road_name  &
   string_value = (.terrain_vehicle3.road1)
!
ude modify instance  &
   instance_name = .terrain_vehicle3.tire_fl
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker create  &
   marker_name = .terrain_vehicle3.tire_fl.wheel_part.MARKER_1000118  &
   adams_id = 1000118  &
   location = 349.518755114, -462.0, 266.644668132  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.tire_fl.wheel_part.MARKER_1000118  &
   name_visibility = off
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.cm_offset  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.center_offset  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.ic_vmode  &
   string_value = "standard"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.vm  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.wm  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.long_vel  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.spin_vel  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.vx  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.vy  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.vz  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.wx  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.wy  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.wz  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.ic_vx  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.ic_vy  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.ic_vz  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.ic_wx  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.ic_wy  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.ic_wz  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.ic_vm  &
   string_value = "ground"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.ic_wm  &
   string_value = "cm"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.vmmrk  &
   object_value = (.terrain_vehicle3.tire_fr.wheel_part.wheel_cm)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.wmmrk  &
   object_value = (.terrain_vehicle3.tire_fr.wheel_part.wheel_cm)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.side  &
   string_value = "right"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.road_property_file  &
   string_value = (.terrain_vehicle3.road1.road_property_file)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.j_fmarker  &
   object_value = .terrain_vehicle3.ground.tire_fr_tire_jf_1
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.ref_marker  &
   object_value = (.terrain_vehicle3.road1.ref_marker.object_value)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.wheel_tire_mass  &
   real_value = 10.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.Ixx_Iyy  &
   real_value = 1.0E+05
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.Izz  &
   real_value = 1.0E+05
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.property_file  &
   string_value = "pac2002_front.tir"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_fr.road_name  &
   string_value = (.terrain_vehicle3.road1)
!
ude modify instance  &
   instance_name = .terrain_vehicle3.tire_fr
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker create  &
   marker_name = .terrain_vehicle3.tire_fr.wheel_part.MARKER_1000144  &
   adams_id = 1000144  &
   location = 349.518755114, 462.0, 266.644668132  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.tire_fr.wheel_part.MARKER_1000144  &
   name_visibility = off
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.cm_offset  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.center_offset  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.ic_vmode  &
   string_value = "standard"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.vm  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.wm  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.long_vel  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.spin_vel  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.vx  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.vy  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.vz  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.wx  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.wy  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.wz  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.ic_vx  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.ic_vy  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.ic_vz  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.ic_wx  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.ic_wy  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.ic_wz  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.ic_vm  &
   string_value = "ground"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.ic_wm  &
   string_value = "cm"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.vmmrk  &
   object_value = (.terrain_vehicle3.tire_rl.wheel_part.wheel_cm)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.wmmrk  &
   object_value = (.terrain_vehicle3.tire_rl.wheel_part.wheel_cm)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.side  &
   string_value = "left"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.road_property_file  &
   string_value = (.terrain_vehicle3.road1.road_property_file)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.j_fmarker  &
   object_value = .terrain_vehicle3.ground.tire_rl_tire_jf_1
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.ref_marker  &
   object_value = (.terrain_vehicle3.road1.ref_marker.object_value)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.wheel_tire_mass  &
   real_value = 10.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.Ixx_Iyy  &
   real_value = 1.0E+05
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.Izz  &
   real_value = 1.0E+05
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.property_file  &
   string_value = "pac2002_rear.tir"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rl.road_name  &
   string_value = (.terrain_vehicle3.road1)
!
ude modify instance  &
   instance_name = .terrain_vehicle3.tire_rl
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker create  &
   marker_name = .terrain_vehicle3.tire_rl.wheel_part.MARKER_1000146  &
   adams_id = 1000146  &
   location = 1581.15, -453.0, 241.3  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.tire_rl.wheel_part.MARKER_1000146  &
   name_visibility = off
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.cm_offset  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.center_offset  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.ic_vmode  &
   string_value = "standard"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.vm  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.wm  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.long_vel  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.spin_vel  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.vx  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.vy  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.vz  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.wx  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.wy  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.wz  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.ic_vx  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.ic_vy  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.ic_vz  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.ic_wx  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.ic_wy  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.ic_wz  &
   string_value = "off"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.ic_vm  &
   string_value = "ground"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.ic_wm  &
   string_value = "cm"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.vmmrk  &
   object_value = (.terrain_vehicle3.tire_rr.wheel_part.wheel_cm)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.wmmrk  &
   object_value = (.terrain_vehicle3.tire_rr.wheel_part.wheel_cm)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.side  &
   string_value = "right"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.road_property_file  &
   string_value = (.terrain_vehicle3.road1.road_property_file)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.j_fmarker  &
   object_value = .terrain_vehicle3.ground.tire_rr_tire_jf_1
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.ref_marker  &
   object_value = (.terrain_vehicle3.road1.ref_marker.object_value)
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.wheel_tire_mass  &
   real_value = 10.0
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.Ixx_Iyy  &
   real_value = 1.0E+05
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.Izz  &
   real_value = 1.0E+05
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.property_file  &
   string_value = "pac2002_rear.tir"
!
variable modify  &
   variable_name = .terrain_vehicle3.tire_rr.road_name  &
   string_value = (.terrain_vehicle3.road1)
!
ude modify instance  &
   instance_name = .terrain_vehicle3.tire_rr
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker create  &
   marker_name = .terrain_vehicle3.tire_rr.wheel_part.MARKER_1000160  &
   adams_id = 1000160  &
   location = 1581.15, 453.0, 241.3  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .terrain_vehicle3.tire_rr.wheel_part.MARKER_1000160  &
   name_visibility = off
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_1.type  &
   string_value = "SweptSin"
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_1.force_magnitude  &
   real_value = 1.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_1.phase_angle_deg  &
   string_value = "0"
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_1.is_force  &
   integer_value = 1
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_1.is_leading  &
   integer_value = 1
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_1.mass  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_1.offset_in_plane  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_1.offset_normal_to_plane  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_1.spline_ref  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_1.spline_interp  &
   integer_value = 1
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_1.stiffness_coefficient  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_1.force_expression  &
   string_value = ""
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_1.mag_units  &
   string_value = "force"
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_1.phase_angle_spline_ref  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_1.phase_angle_spline_interp  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Vibration_Actuator_1
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FL.i_marker  &
   object_value = (.terrain_vehicle3.knuckle_left.MARKER_1000078)
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FL.j_marker  &
   object_value = .terrain_vehicle3.ground.marker_1
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FL.actuator  &
   object_value = .terrain_vehicle3.Vibration_Actuator_1
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FL.frame  &
   string_value = "Global"
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FL.axis  &
   string_value = "Z"
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FL.mode  &
   string_value = "Translational"
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FL.user_state_variable  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FL.kin_ic_type  &
   string_value = ""
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FL.kin_oc_func_str  &
   string_value = ""
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FL.ic_type  &
   string_value = "sforcebased"
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FL.cross_correlation_actuators  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FL.cross_correlation_ics  &
   object_value = (NONE)
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Input_FL
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .terrain_vehicle3.Output_accZ.func_str  &
   string_value = "ACCZ"
!
variable modify  &
   variable_name = .terrain_vehicle3.Output_accZ.out_marker  &
   object_value = .terrain_vehicle3.frame.cm
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Output_accZ
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_2.type  &
   string_value = "SweptSin"
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_2.force_magnitude  &
   real_value = 1.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_2.phase_angle_deg  &
   string_value = "0"
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_2.is_force  &
   integer_value = 1
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_2.is_leading  &
   integer_value = 1
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_2.mass  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_2.offset_in_plane  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_2.offset_normal_to_plane  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_2.spline_ref  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_2.spline_interp  &
   integer_value = 1
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_2.stiffness_coefficient  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_2.force_expression  &
   string_value = ""
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_2.mag_units  &
   string_value = "force"
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_2.phase_angle_spline_ref  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_2.phase_angle_spline_interp  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Vibration_Actuator_2
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FR.i_marker  &
   object_value = (.terrain_vehicle3.knuckle_right.MARKER_1000080)
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FR.j_marker  &
   object_value = .terrain_vehicle3.ground.marker_2
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FR.actuator  &
   object_value = .terrain_vehicle3.Vibration_Actuator_2
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FR.frame  &
   string_value = "Global"
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FR.axis  &
   string_value = "Z"
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FR.mode  &
   string_value = "Translational"
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FR.user_state_variable  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FR.kin_ic_type  &
   string_value = ""
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FR.kin_oc_func_str  &
   string_value = ""
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FR.ic_type  &
   string_value = "sforcebased"
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FR.cross_correlation_actuators  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_FR.cross_correlation_ics  &
   object_value = (NONE)
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Input_FR
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_3.type  &
   string_value = "SweptSin"
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_3.force_magnitude  &
   real_value = 1.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_3.phase_angle_deg  &
   string_value = "0"
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_3.is_force  &
   integer_value = 1
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_3.is_leading  &
   integer_value = 1
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_3.mass  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_3.offset_in_plane  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_3.offset_normal_to_plane  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_3.spline_ref  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_3.spline_interp  &
   integer_value = 1
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_3.stiffness_coefficient  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_3.force_expression  &
   string_value = ""
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_3.mag_units  &
   string_value = "force"
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_3.phase_angle_spline_ref  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_3.phase_angle_spline_interp  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Vibration_Actuator_3
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RL.i_marker  &
   object_value = (.terrain_vehicle3.axle_rear.MARKER_1000147)
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RL.j_marker  &
   object_value = .terrain_vehicle3.ground.marker_3
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RL.actuator  &
   object_value = .terrain_vehicle3.Vibration_Actuator_3
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RL.frame  &
   string_value = "Global"
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RL.axis  &
   string_value = "Z"
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RL.mode  &
   string_value = "Translational"
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RL.user_state_variable  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RL.kin_ic_type  &
   string_value = ""
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RL.kin_oc_func_str  &
   string_value = ""
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RL.ic_type  &
   string_value = "sforcebased"
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RL.cross_correlation_actuators  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RL.cross_correlation_ics  &
   object_value = (NONE)
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Input_RL
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_4.type  &
   string_value = "SweptSin"
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_4.force_magnitude  &
   real_value = 1.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_4.phase_angle_deg  &
   string_value = "0"
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_4.is_force  &
   integer_value = 1
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_4.is_leading  &
   integer_value = 1
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_4.mass  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_4.offset_in_plane  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_4.offset_normal_to_plane  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_4.spline_ref  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_4.spline_interp  &
   integer_value = 1
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_4.stiffness_coefficient  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_4.force_expression  &
   string_value = ""
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_4.mag_units  &
   string_value = "force"
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_4.phase_angle_spline_ref  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.Vibration_Actuator_4.phase_angle_spline_interp  &
   integer_value = 1
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Vibration_Actuator_4
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RR.i_marker  &
   object_value = (.terrain_vehicle3.axle_rear.MARKER_1000161)
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RR.j_marker  &
   object_value = .terrain_vehicle3.ground.marker_4
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RR.actuator  &
   object_value = .terrain_vehicle3.Vibration_Actuator_4
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RR.frame  &
   string_value = "Global"
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RR.axis  &
   string_value = "Z"
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RR.mode  &
   string_value = "Translational"
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RR.user_state_variable  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RR.kin_ic_type  &
   string_value = ""
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RR.kin_oc_func_str  &
   string_value = ""
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RR.ic_type  &
   string_value = "sforcebased"
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RR.cross_correlation_actuators  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.Input_RR.cross_correlation_ics  &
   object_value = (NONE)
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Input_RR
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .terrain_vehicle3.spring_damper_rear.i_marker  &
   object_value = (.terrain_vehicle3.frame.MARKER_1000308)
!
variable modify  &
   variable_name = .terrain_vehicle3.spring_damper_rear.j_marker  &
   object_value = (.terrain_vehicle3.swingarm.MARKER_1000309)
!
variable modify  &
   variable_name = .terrain_vehicle3.spring_damper_rear.stiffness_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .terrain_vehicle3.spring_damper_rear.stiffness_coefficient  &
   real_value = 200.0
!
variable modify  &
   variable_name = .terrain_vehicle3.spring_damper_rear.stiffness_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.spring_damper_rear.damping_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .terrain_vehicle3.spring_damper_rear.damping_coefficient  &
   real_value = 5.0
!
variable modify  &
   variable_name = .terrain_vehicle3.spring_damper_rear.damping_spline  &
   object_value = .terrain_vehicle3.rear_damper_force2
!
variable modify  &
   variable_name = .terrain_vehicle3.spring_damper_rear.free_length_mode  &
   string_value = "Constant_Value"
!
variable modify  &
   variable_name = .terrain_vehicle3.spring_damper_rear.free_length  &
   real_value = 313.0
!
variable modify  &
   variable_name = .terrain_vehicle3.spring_damper_rear.preload  &
   real_value = 4000.0
!
variable modify  &
   variable_name = .terrain_vehicle3.spring_damper_rear.i_dynamic_visibility  &
   string_value = "Off"
!
variable modify  &
   variable_name = .terrain_vehicle3.spring_damper_rear.j_dynamic_visibility  &
   string_value = "Off"
!
variable modify  &
   variable_name = .terrain_vehicle3.spring_damper_rear.spring_visibility  &
   string_value = "depends"
!
variable modify  &
   variable_name = .terrain_vehicle3.spring_damper_rear.damper_visibility  &
   string_value = "depends"
!
ude modify instance  &
   instance_name = .terrain_vehicle3.spring_damper_rear
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.input_channels  &
   object_value =   &
      .terrain_vehicle3.Input_FL,  &
      .terrain_vehicle3.Input_FR,  &
      .terrain_vehicle3.Input_RL,  &
      .terrain_vehicle3.Input_RR
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.output_channels  &
   object_value = .terrain_vehicle3.Output_accZ
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.solve_type  &
   string_value = "forced"
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.start_at  &
   string_value = "script"
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.number_of_modes  &
   integer_value = 0
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.frequency_begin  &
   real_value = 0.2
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.frequency_end  &
   real_value = 20.0
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.frequency_steps  &
   integer_value = 500
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.frequency_logarithmic  &
   integer_value = 1
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.user_frequencies  &
   real_value = 0.0
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.statemat_ref  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.eigen_ref  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.fva_ref  &
   object_value = .terrain_vehicle3.FVA_1
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.sim_script  &
   object_value = .terrain_vehicle3.sim_3sec
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.damping  &
   integer_value = 1
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.usermodes  &
   integer_value = 0
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.have_kinematic_ics  &
   integer_value = 0
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.use_pstate  &
   integer_value = 0
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.pstate_obj  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .terrain_vehicle3.VibrationAnalysis_1.pstate_ref_marker  &
   object_value = (NONE)
!
ude modify instance  &
   instance_name = .terrain_vehicle3.VibrationAnalysis_1
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .terrain_vehicle3.FVA_1.vibrationAnalysis  &
   object_value = .terrain_vehicle3.VibrationAnalysis_1
!
ude modify instance  &
   instance_name = .terrain_vehicle3.FVA_1
!
undo end_block
!
!--------------------------- UDE Dependent Objects ----------------------------!
!
!
constraint create joint fixed  &
   joint_name = .terrain_vehicle3.JOINT_77  &
   adams_id = 77  &
   i_marker_name = .terrain_vehicle3.tire_rl.wheel_part.MARKER_1000146  &
   j_marker_name = .terrain_vehicle3.axle_rear.MARKER_1000147
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.JOINT_77  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .terrain_vehicle3.JOINT_76  &
   adams_id = 76  &
   i_marker_name = .terrain_vehicle3.tire_fr.wheel_part.MARKER_1000144  &
   j_marker_name = .terrain_vehicle3.wheel_right_front.MARKER_1000145
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.JOINT_76  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .terrain_vehicle3.JOINT_78  &
   adams_id = 78  &
   i_marker_name = .terrain_vehicle3.tire_rr.wheel_part.MARKER_1000160  &
   j_marker_name = .terrain_vehicle3.axle_rear.MARKER_1000161
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.JOINT_78  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .terrain_vehicle3.JOINT_74  &
   adams_id = 74  &
   i_marker_name = .terrain_vehicle3.tire_fl.wheel_part.MARKER_1000118  &
   j_marker_name = .terrain_vehicle3.wheel_left_front.MARKER_1000119
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.JOINT_74  &
   name_visibility = off
!
!------------------------------ Dynamic Graphics ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
geometry create shape force  &
   force_name = .terrain_vehicle3.SFORCE_5_force_graphic_1  &
   adams_id = 342  &
   force_element_name = .terrain_vehicle3.bumpstop_rear  &
   applied_at_marker_name = .terrain_vehicle3.swingarm.MARKER_1000101
!
geometry create shape force  &
   force_name = .terrain_vehicle3.SFORCE_7_force_graphic_1  &
   adams_id = 391  &
   force_element_name = .terrain_vehicle3.steering_torque  &
   applied_at_marker_name = .terrain_vehicle3.steering_column.MARKER_1000212
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.SFORCE_7_force_graphic_1  &
   active = off
!
geometry create shape spring_damper  &
   spring_damper_name = .terrain_vehicle3.left_spring_damper_graphic  &
   adams_id = 5  &
   i_marker_name = .terrain_vehicle3.frame.MK13  &
   j_marker_name = .terrain_vehicle3.lca_left.MK14  &
   coil_count = 15  &
   diameter_of_spring = 65.0  &
   damper_diameter_at_ij = 50.0, 30.0  &
   tip_length_at_ij = 0.0, 0.0  &
   cup_length_at_ij = 250.0, 250.0
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.left_spring_damper_graphic  &
   color = RED
!
geometry create shape spring_damper  &
   spring_damper_name = .terrain_vehicle3.graphics_spring_damper_right  &
   adams_id = 6  &
   i_marker_name = .terrain_vehicle3.lca_right.MK41  &
   j_marker_name = .terrain_vehicle3.frame.MK42  &
   coil_count = 15  &
   diameter_of_spring = 65.0  &
   damper_diameter_at_ij = 30.0, 50.0  &
   tip_length_at_ij = 0.0, 0.0  &
   cup_length_at_ij = 250.0, 250.0
!
geometry attributes  &
   geometry_name = .terrain_vehicle3.graphics_spring_damper_right  &
   color = RED
!
!---------------------------------- Motions -----------------------------------!
!
!
constraint create motion_generator  &
   motion_name = .terrain_vehicle3.steering_lock  &
   adams_id = 2  &
   type_of_freedom = rotational  &
   joint_name = .terrain_vehicle3.steering_revolute  &
   function = ""
!
constraint attributes  &
   constraint_name = .terrain_vehicle3.steering_lock  &
   name_visibility = off  &
   size_of_icons = 25.4
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = ACC  &
   x_component_gravity = 0.0  &
   y_component_gravity = 0.0  &
   z_component_gravity = -9806.65
!
force attributes  &
   force_name = .terrain_vehicle3.ACC  &
   name_visibility = off  &
   size_of_icons = 25.4
!
!----------------------------- Analysis settings ------------------------------!
!
!
executive_control set numerical_integration_parameters  &
   model_name = terrain_vehicle3  &
   scale = 1.0, 1.0, 1.0E-03
!
executive_control set equilibrium_parameters  &
   model_name = terrain_vehicle3  &
   error = 1.0E-03  &
   imbalance = 1.0E-03  &
   stability = 1.0
!
executive_control set kinematics_parameters  &
   model_name = terrain_vehicle3  &
   tlimit = 2.54E+11  &
   pattern_for_jacobian = yes, no, no, yes, no, no, yes, no, no, yes
!
executive_control set initial_conditions_parameters  &
   model_name = terrain_vehicle3  &
   error = 1.0E-03  &
   aerror = 1.0E-03  &
   pattern_for_jacobian = yes, no, no, yes, no, no, yes, no, no, yes
!
output_control set output  &
   model_name = terrain_vehicle3  &
   reqsave = off  &
   grsave = off
!
!---------------------------------- Measures ----------------------------------!
!
!
measure create object  &
   measure_name = .terrain_vehicle3.frame_cm_accZ  &
   from_first = no  &
   object = .terrain_vehicle3.frame  &
   characteristic = cm_acceleration  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .terrain_vehicle3.frame_cm_accZ  &
   color = WHITE
!
measure create object  &
   measure_name = .terrain_vehicle3.frame_cm_accY  &
   from_first = no  &
   object = .terrain_vehicle3.frame  &
   characteristic = cm_acceleration  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .terrain_vehicle3.frame_cm_accY  &
   color = WHITE
!
measure create object  &
   measure_name = .terrain_vehicle3.frame_cm_accX  &
   from_first = no  &
   object = .terrain_vehicle3.frame  &
   characteristic = cm_acceleration  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .terrain_vehicle3.frame_cm_accX  &
   color = WHITE
!
measure create object  &
   measure_name = .terrain_vehicle3.rear_bumpstop_force  &
   from_first = yes  &
   object = .terrain_vehicle3.bumpstop_rear  &
   characteristic = element_force  &
   component = mag_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .terrain_vehicle3.rear_bumpstop_force  &
   color = WHITE
!
measure create function  &
   measure_name = .terrain_vehicle3.swingarm_angle  &
   function = ""  &
   units = "angle"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .terrain_vehicle3.swingarm_angle  &
   color = WHITE
!
measure create function  &
   measure_name = .terrain_vehicle3.frame_pitch_angle  &
   function = ""  &
   units = "angle"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .terrain_vehicle3.frame_pitch_angle  &
   color = WHITE
!
measure create function  &
   measure_name = .terrain_vehicle3.frame_roll_angle  &
   function = ""  &
   units = "angle"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .terrain_vehicle3.frame_roll_angle  &
   color = WHITE
!
measure create function  &
   measure_name = .terrain_vehicle3.frame_yaw_angle  &
   function = ""  &
   units = "angle"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .terrain_vehicle3.frame_yaw_angle  &
   color = WHITE
!
measure create function  &
   measure_name = .terrain_vehicle3.longitudinal_velocity  &
   function = ""  &
   units = "velocity"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .terrain_vehicle3.longitudinal_velocity  &
   color = WHITE
!
measure create function  &
   measure_name = .terrain_vehicle3.frame_pitch_velocity  &
   function = ""  &
   units = "angular_velocity"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .terrain_vehicle3.frame_pitch_velocity  &
   color = WHITE
!
measure create function  &
   measure_name = .terrain_vehicle3.frame_pitch_acc  &
   function = ""  &
   units = "angular_acceleration"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .terrain_vehicle3.frame_pitch_acc  &
   color = WHITE
!
measure create function  &
   measure_name = .terrain_vehicle3.rear_damper_length  &
   function = ""  &
   units = "length"  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .terrain_vehicle3.rear_damper_length  &
   color = WHITE
!
measure create computed  &
   measure_name = .terrain_vehicle3.rear_spring_damper_force  &
   text_of_expression = "0"  &
   create_measure_display = no
!
entity attributes  &
   entity_name = .terrain_vehicle3.rear_spring_damper_force  &
   color = WHITE
!
!---------------------------- Adams View Variables ----------------------------!
!
!
variable create  &
   variable_name = .terrain_vehicle3.constant_velocity  &
   units = "velocity"  &
   range = -1.0, 1.0  &
   use_allowed_values = no  &
   delta_type = relative  &
   real_value = 5000.0
!
!---------------------------- Function definitions ----------------------------!
!
!
constraint modify motion_generator  &
   motion_name = .terrain_vehicle3.steering_lock  &
   function = "0"
!
measure modify function  &
   measure_name = .terrain_vehicle3.swingarm_angle  &
   function = "AZ(.terrain_vehicle3.swingarm.MARKER_1000099,.terrain_vehicle3.frame.MARKER_1000100)"
!
measure modify function  &
   measure_name = .terrain_vehicle3.frame_pitch_angle  &
   function = "PITCH(.terrain_vehicle3.frame.MARKER_frame_ref,.terrain_vehicle3.ground.MARKER_ground_ref)"
!
measure modify function  &
   measure_name = .terrain_vehicle3.frame_roll_angle  &
   function = "ROLL(.terrain_vehicle3.frame.MARKER_frame_ref,.terrain_vehicle3.ground.MARKER_ground_ref)"
!
measure modify function  &
   measure_name = .terrain_vehicle3.frame_yaw_angle  &
   function = "YAW(.terrain_vehicle3.frame.MARKER_frame_ref,.terrain_vehicle3.ground.MARKER_ground_ref)"
!
measure modify function  &
   measure_name = .terrain_vehicle3.longitudinal_velocity  &
   function = "VX(.terrain_vehicle3.frame.vel_ref,0,.terrain_vehicle3.frame.vel_ref)"
!
measure modify function  &
   measure_name = .terrain_vehicle3.frame_pitch_velocity  &
   function = "WY(.terrain_vehicle3.frame.MARKER_frame_ref,.terrain_vehicle3.ground.MARKER_ground_ref,.terrain_vehicle3.frame.MARKER_frame_ref)"
!
measure modify function  &
   measure_name = .terrain_vehicle3.frame_pitch_acc  &
   function = "WDTY(.terrain_vehicle3.frame.MARKER_frame_ref,.terrain_vehicle3.ground.MARKER_ground_ref,.terrain_vehicle3.frame.MARKER_frame_ref)"
!
measure modify function  &
   measure_name = .terrain_vehicle3.rear_damper_length  &
   function = "DM(.terrain_vehicle3.swingarm.MK82,.terrain_vehicle3.frame.MK83)"
!
part modify equation differential_equation  &
   differential_equation_name = .terrain_vehicle3.DIFF_vel_error_filter  &
   function = "2*PI*0.25*((-VX(.terrain_vehicle3.frame.vel_ref,0,.terrain_vehicle3.frame.vel_ref)+.terrain_vehicle3.constant_velocity)-DIF(.terrain_vehicle3.DIFF_vel_error_filter))"
!
part modify equation differential_equation  &
   differential_equation_name = .terrain_vehicle3.DIFF_vel_error_integrator  &
   function = "DIF(.terrain_vehicle3.DIFF_vel_error_filter)*step(time,1,0,2,1)"
!
part modify equation differential_equation  &
   differential_equation_name = .terrain_vehicle3.DIFF_yaw_error_filter  &
   function = "2*PI*0.25*(YAW(.terrain_vehicle3.frame.vel_ref,.terrain_vehicle3.ground.MARKER_ground_ref)-DIF(.terrain_vehicle3.DIFF_yaw_error_filter))"
!
part modify equation differential_equation  &
   differential_equation_name = .terrain_vehicle3.DIFF_yaw_error_integrator  &
   function = "DIF(.terrain_vehicle3.DIFF_yaw_error_filter)"
!
force modify direct single_component_force  &
   single_component_force_name = .terrain_vehicle3.rear_axle_static_hold  &
   function = "IF(MODE-5:0,1,0)*10000*AZ(.terrain_vehicle3.axle_rear.MARKER_1000075,.terrain_vehicle3.swingarm.MARKER_1000076)"
!
force modify direct single_component_force  &
   single_component_force_name = .terrain_vehicle3.left_wheel_static_hold  &
   function = "IF(MODE-5:0,1,0)*1000*AZ(.terrain_vehicle3.wheel_left_front.MARKER_1000077,.terrain_vehicle3.knuckle_left.MARKER_1000078)"
!
force modify direct single_component_force  &
   single_component_force_name = .terrain_vehicle3.right_wheel_static_hold  &
   function = "IF(MODE-5:0,1,0)*1000*AZ(.terrain_vehicle3.wheel_right_front.MARKER_1000079,.terrain_vehicle3.knuckle_right.MARKER_1000080)"
!
force modify direct single_component_force  &
   single_component_force_name = .terrain_vehicle3.bumpstop_rear  &
   function = "BISTOP(DM(.terrain_vehicle3.swingarm.MARKER_1000101,.terrain_vehicle3.frame.MARKER_1000102), VR(.terrain_vehicle3.swingarm.MARKER_1000101,.terrain_vehicle3.frame.MARKER_1000102), 285.0, 400.0, 10000, 1.5, 100, 1.0)"
!
force modify direct single_component_force  &
   single_component_force_name = .terrain_vehicle3.rear_axle_drive  &
   function = "STEP(time,0,0,0.5,1)*(80*DIF(.terrain_vehicle3.DIFF_vel_error_filter)+5*DIF(.terrain_vehicle3.DIFF_vel_error_integrator))"
!
force modify direct single_component_force  &
   single_component_force_name = .terrain_vehicle3.steering_torque  &
   function = "1*(10*DIF(.terrain_vehicle3.DIFF_yaw_error_filter)+1*DIF(.terrain_vehicle3.DIFF_yaw_error_integrator))"
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .terrain_vehicle3.road1
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .terrain_vehicle3.tire_fl
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .terrain_vehicle3.tire_fr
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .terrain_vehicle3.tire_rl
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .terrain_vehicle3.tire_rr
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Vibration_Actuator_1
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Input_FL
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Output_accZ
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Vibration_Actuator_2
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Input_FR
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Vibration_Actuator_3
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Input_RL
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Vibration_Actuator_4
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .terrain_vehicle3.Input_RR
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .terrain_vehicle3.spring_damper_rear
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .terrain_vehicle3.VibrationAnalysis_1
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .terrain_vehicle3.FVA_1
!
!------------------------- Part IC Reference Markers --------------------------!
!
!
part modify rigid_body initial_velocity  &
   part_name = .terrain_vehicle3.tire_fl.wheel_part  &
   vm = .terrain_vehicle3.tire_fl.wheel_part.wheel_cm  &
   wm = .terrain_vehicle3.tire_fl.wheel_part.wheel_cm
!
part modify rigid_body initial_velocity  &
   part_name = .terrain_vehicle3.tire_fl.belt_part  &
   vm = .terrain_vehicle3.tire_fl.wheel_part.wheel_cm  &
   wm = .terrain_vehicle3.tire_fl.wheel_part.wheel_cm
!
part modify rigid_body initial_velocity  &
   part_name = .terrain_vehicle3.tire_fr.wheel_part  &
   vm = .terrain_vehicle3.tire_fr.wheel_part.wheel_cm  &
   wm = .terrain_vehicle3.tire_fr.wheel_part.wheel_cm
!
part modify rigid_body initial_velocity  &
   part_name = .terrain_vehicle3.tire_fr.belt_part  &
   vm = .terrain_vehicle3.tire_fr.wheel_part.wheel_cm  &
   wm = .terrain_vehicle3.tire_fr.wheel_part.wheel_cm
!
part modify rigid_body initial_velocity  &
   part_name = .terrain_vehicle3.tire_rl.wheel_part  &
   vm = .terrain_vehicle3.tire_rl.wheel_part.wheel_cm  &
   wm = .terrain_vehicle3.tire_rl.wheel_part.wheel_cm
!
part modify rigid_body initial_velocity  &
   part_name = .terrain_vehicle3.tire_rl.belt_part  &
   vm = .terrain_vehicle3.tire_rl.wheel_part.wheel_cm  &
   wm = .terrain_vehicle3.tire_rl.wheel_part.wheel_cm
!
part modify rigid_body initial_velocity  &
   part_name = .terrain_vehicle3.tire_rr.wheel_part  &
   vm = .terrain_vehicle3.tire_rr.wheel_part.wheel_cm  &
   wm = .terrain_vehicle3.tire_rr.wheel_part.wheel_cm
!
part modify rigid_body initial_velocity  &
   part_name = .terrain_vehicle3.tire_rr.belt_part  &
   vm = .terrain_vehicle3.tire_rr.wheel_part.wheel_cm  &
   wm = .terrain_vehicle3.tire_rr.wheel_part.wheel_cm
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
marker modify  &
   marker_name = .terrain_vehicle3.ground.road1_ref_1  &
   location =   &
      (.terrain_vehicle3.road1.location)  &
   orientation =   &
      (.terrain_vehicle3.road1.orientation)
!
marker modify  &
   marker_name = .terrain_vehicle3.ground.marker_1  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .terrain_vehicle3.knuckle_left.MARKER_1000078))  &
   orientation =   &
      (ORI_ALIGN_AXIS(NONE, "Z" // "Z"))
!
marker modify  &
   marker_name = .terrain_vehicle3.ground.marker_2  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .terrain_vehicle3.knuckle_right.MARKER_1000080))  &
   orientation =   &
      (ORI_ALIGN_AXIS(NONE, "Z" // "Z"))
!
marker modify  &
   marker_name = .terrain_vehicle3.ground.marker_3  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .terrain_vehicle3.axle_rear.MARKER_1000147))  &
   orientation =   &
      (ORI_ALIGN_AXIS(NONE, "Z" // "Z"))
!
marker modify  &
   marker_name = .terrain_vehicle3.ground.marker_4  &
   location =   &
      (LOC_RELATIVE_TO({0, 0, 0}, .terrain_vehicle3.axle_rear.MARKER_1000161))  &
   orientation =   &
      (ORI_ALIGN_AXIS(NONE, "Z" // "Z"))
!
material modify  &
   material_name = .terrain_vehicle3.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
marker modify  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000016  &
   orientation =   &
      (ORI_ALONG_AXIS(.terrain_vehicle3.frame.MARKER_1000016, .terrain_vehicle3.frame.MARKER_1000018, "Z"))  &
   relative_to = .terrain_vehicle3.frame
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000018  &
   orientation =   &
      (ORI_ALONG_AXIS(.terrain_vehicle3.frame.MARKER_1000016, .terrain_vehicle3.frame.MARKER_1000018, "Z"))  &
   relative_to = .terrain_vehicle3.frame
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000026  &
   orientation =   &
      (ORI_ALONG_AXIS(.terrain_vehicle3.frame.MARKER_1000026, .terrain_vehicle3.frame.MARKER_1000028, "Z"))  &
   relative_to = .terrain_vehicle3.frame
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000028  &
   orientation =   &
      (ORI_ALONG_AXIS(.terrain_vehicle3.frame.MARKER_1000026, .terrain_vehicle3.frame.MARKER_1000028, "Z"))  &
   relative_to = .terrain_vehicle3.frame
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000036  &
   orientation =   &
      (ORI_ALONG_AXIS(.terrain_vehicle3.frame.MARKER_1000036, .terrain_vehicle3.frame.MARKER_1000038, "Z"))  &
   relative_to = .terrain_vehicle3.frame
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000038  &
   orientation =   &
      (ORI_ALONG_AXIS(.terrain_vehicle3.frame.MARKER_1000036, .terrain_vehicle3.frame.MARKER_1000038, "Z"))  &
   relative_to = .terrain_vehicle3.frame
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000046  &
   orientation =   &
      (ORI_ALONG_AXIS(.terrain_vehicle3.frame.MARKER_1000046, .terrain_vehicle3.frame.MARKER_1000048, "Z"))  &
   relative_to = .terrain_vehicle3.frame
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.frame.MARKER_1000048  &
   orientation =   &
      (ORI_ALONG_AXIS(.terrain_vehicle3.frame.MARKER_1000046, .terrain_vehicle3.frame.MARKER_1000048, "Z"))  &
   relative_to = .terrain_vehicle3.frame
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.lca_left.MARKER_1000015  &
   location =   &
      (LOC_RELATIVE_TO({0.0, 0.0, 0.0}, .terrain_vehicle3.frame.MARKER_1000016))  &
   orientation =   &
      (ORI_RELATIVE_TO({0.0, 0.0, 0.0}, .terrain_vehicle3.frame.MARKER_1000016))  &
   relative_to = .terrain_vehicle3.lca_left
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.lca_left.MARKER_1000017  &
   location =   &
      (LOC_RELATIVE_TO({0.0, 0.0, 0.0}, .terrain_vehicle3.frame.MARKER_1000018))  &
   orientation =   &
      (ORI_RELATIVE_TO({0.0, 0.0, 0.0}, .terrain_vehicle3.frame.MARKER_1000018))  &
   relative_to = .terrain_vehicle3.lca_left
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.uca_left.MARKER_1000035  &
   orientation =   &
      (ORI_RELATIVE_TO({0, 0, 0}, .terrain_vehicle3.frame.MARKER_1000036))  &
   relative_to = .terrain_vehicle3.uca_left
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.uca_left.MARKER_1000037  &
   location =   &
      (LOC_RELATIVE_TO({0.0, 0.0, 0.0}, .terrain_vehicle3.frame.MARKER_1000038))  &
   orientation =   &
      (ORI_RELATIVE_TO({0.0, 0.0, 0.0}, .terrain_vehicle3.frame.MARKER_1000038))  &
   relative_to = .terrain_vehicle3.uca_left
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.lca_right.MARKER_1000025  &
   location =   &
      (LOC_RELATIVE_TO({0.0, 0.0, 0.0}, .terrain_vehicle3.frame.MARKER_1000026))  &
   orientation =   &
      (ORI_RELATIVE_TO({0.0, 0.0, 0.0}, .terrain_vehicle3.frame.MARKER_1000026))  &
   relative_to = .terrain_vehicle3.lca_right
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.lca_right.MARKER_1000027  &
   location =   &
      (LOC_RELATIVE_TO({0.0, 0.0, 0.0}, .terrain_vehicle3.frame.MARKER_1000028))  &
   orientation =   &
      (ORI_RELATIVE_TO({0.0, 0.0, 0.0}, .terrain_vehicle3.frame.MARKER_1000028))  &
   relative_to = .terrain_vehicle3.lca_right
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.uca_right.MARKER_1000045  &
   location =   &
      (LOC_RELATIVE_TO({0.0, 0.0, 0.0}, .terrain_vehicle3.frame.MARKER_1000046))  &
   orientation =   &
      (ORI_RELATIVE_TO({0.0, 0.0, 0.0}, .terrain_vehicle3.frame.MARKER_1000046))  &
   relative_to = .terrain_vehicle3.uca_right
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.uca_right.MARKER_1000047  &
   location =   &
      (LOC_RELATIVE_TO({0.0, 0.0, 0.0}, .terrain_vehicle3.frame.MARKER_1000048))  &
   orientation =   &
      (ORI_RELATIVE_TO({0.0, 0.0, 0.0}, .terrain_vehicle3.frame.MARKER_1000048))  &
   relative_to = .terrain_vehicle3.uca_right
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
force modify element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_lca_front_left  &
   damping =   &
      (50(N-sec/mm)),  &
      (50(N-sec/mm)),  &
      (50(N-sec/mm))  &
   stiffness =   &
      (25000(N/mm)),  &
      (25000(N/mm)),  &
      (25000(N/mm))
!
force modify element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_lca_rear_left  &
   damping =   &
      (50(N-sec/mm)),  &
      (50(N-sec/mm)),  &
      (50(N-sec/mm))  &
   stiffness =   &
      (25000(N/mm)),  &
      (25000(N/mm)),  &
      (25000(N/mm))
!
force modify element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_lca_front_right  &
   damping =   &
      (50(N-sec/mm)),  &
      (50(N-sec/mm)),  &
      (50(N-sec/mm))  &
   stiffness =   &
      (25000(N/mm)),  &
      (25000(N/mm)),  &
      (25000(N/mm))
!
force modify element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_lca_rear_right  &
   damping =   &
      (50(N-sec/mm)),  &
      (50(N-sec/mm)),  &
      (50(N-sec/mm))  &
   stiffness =   &
      (25000(N/mm)),  &
      (25000(N/mm)),  &
      (25000(N/mm))
!
force modify element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_uca_front_left  &
   damping =   &
      (50(N-sec/mm)),  &
      (50(N-sec/mm)),  &
      (50(N-sec/mm))  &
   stiffness =   &
      (25000(N/mm)),  &
      (25000(N/mm)),  &
      (25000(N/mm))
!
force modify element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_uca_rear_left  &
   damping =   &
      (50(N-sec/mm)),  &
      (50(N-sec/mm)),  &
      (50(N-sec/mm))  &
   stiffness =   &
      (25000(N/mm)),  &
      (25000(N/mm)),  &
      (25000(N/mm))
!
force modify element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_uca_front_right  &
   damping =   &
      (50(N-sec/mm)),  &
      (50(N-sec/mm)),  &
      (50(N-sec/mm))  &
   stiffness =   &
      (25000(N/mm)),  &
      (25000(N/mm)),  &
      (25000(N/mm))
!
force modify element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_uca_rear_right  &
   damping =   &
      (50(N-sec/mm)),  &
      (50(N-sec/mm)),  &
      (50(N-sec/mm))  &
   stiffness =   &
      (25000(N/mm)),  &
      (25000(N/mm)),  &
      (25000(N/mm))
!
force modify element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_lca_outer_left  &
   damping =   &
      (50(N-sec/mm)),  &
      (50(N-sec/mm)),  &
      (50(N-sec/mm))  &
   stiffness =   &
      (25000(N/mm)),  &
      (25000(N/mm)),  &
      (25000(N/mm))
!
force modify element_like bushing  &
   bushing_name = .terrain_vehicle3.bushing_lca_outer_right  &
   damping =   &
      (50(N-sec/mm)),  &
      (50(N-sec/mm)),  &
      (50(N-sec/mm))  &
   stiffness =   &
      (25000(N/mm)),  &
      (25000(N/mm)),  &
      (25000(N/mm))
!
marker modify  &
   marker_name = .terrain_vehicle3.tire_fl.wheel_part.gfo_i  &
   orientation =   &
      (ORI_RELATIVE_TO({0d, 270d, 0d}, .terrain_vehicle3.tire_fl.wheel_part.wheel_cm))  &
   relative_to = .terrain_vehicle3.tire_fl.wheel_part
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.tire_fr.wheel_part.gfo_i  &
   orientation =   &
      (ORI_RELATIVE_TO({0d, 270d, 0d}, .terrain_vehicle3.tire_fr.wheel_part.wheel_cm))  &
   relative_to = .terrain_vehicle3.tire_fr.wheel_part
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.tire_rl.wheel_part.gfo_i  &
   orientation =   &
      (ORI_RELATIVE_TO({0d, 270d, 0d}, .terrain_vehicle3.tire_rl.wheel_part.wheel_cm))  &
   relative_to = .terrain_vehicle3.tire_rl.wheel_part
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
marker modify  &
   marker_name = .terrain_vehicle3.tire_rr.wheel_part.gfo_i  &
   orientation =   &
      (ORI_RELATIVE_TO({0d, 270d, 0d}, .terrain_vehicle3.tire_rr.wheel_part.wheel_cm))  &
   relative_to = .terrain_vehicle3.tire_rr.wheel_part
!
defaults coordinate_system  &
   default_coordinate_system = .terrain_vehicle3.ground
!
geometry modify shape force  &
   force_name = .terrain_vehicle3.SFORCE_5_force_graphic_1  &
   applied_at_marker_name = (.terrain_vehicle3.bumpstop_rear.i)
!
geometry modify shape force  &
   force_name = .terrain_vehicle3.SFORCE_7_force_graphic_1  &
   applied_at_marker_name = (.terrain_vehicle3.steering_torque.i)
!
measure modify computed  &
   measure_name = .terrain_vehicle3.rear_spring_damper_force  &
   text_of_expression =   &
      "(.terrain_vehicle3.spring_damper_rear.force)"
!
model display  &
   model_name = terrain_vehicle3
