search_mode=OPTIMIZE_MAX_JOINT
srdf_filename=staubli_tx2_90.srdf
robot_name_in_srdf=staubli_tx2_90
moveit_config_pkg=staubli_tx2_90_moveit_config
robot_name=staubli_tx2_90
planning_group_name=manipulator
ikfast_plugin_pkg=staubli_tx2_90_manipulator_ikfast_plugin
base_link_name=base_link
eef_link_name=link_6
ikfast_output_path=/home/royle/staubli_ws/src/PICK_PLACE_with_ROS_on_STAUBLI_ARM/staubli_experimental/staubli_tx2_90_support/urdf/staubli_tx2_90_manipulator_ikfast_plugin/src/staubli_tx2_90_manipulator_ikfast_solver.cpp

rosrun moveit_kinematics create_ikfast_moveit_plugin.py\
  --search_mode=$search_mode\
  --srdf_filename=$srdf_filename\
  --robot_name_in_srdf=$robot_name_in_srdf\
  --moveit_config_pkg=$moveit_config_pkg\
  $robot_name\
  $planning_group_name\
  $ikfast_plugin_pkg\
  $base_link_name\
  $eef_link_name\
  $ikfast_output_path
