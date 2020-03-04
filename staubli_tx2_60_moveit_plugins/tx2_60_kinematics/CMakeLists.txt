include_directories(include)

set(IKFAST_LIBRARY_NAME staubli_tx2_60_manipulator_moveit_ikfast_plugin)

add_library(${IKFAST_LIBRARY_NAME} src/staubli_tx2_60_manipulator_ikfast_moveit_plugin.cpp)
target_link_libraries(${IKFAST_LIBRARY_NAME} ${catkin_LIBRARIES} ${Boost_LIBRARIES} ${LAPACK_LIBRARIES})

install(
  TARGETS ${IKFAST_LIBRARY_NAME} 
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION})

install(
  FILES staubli_tx2_60_manipulator_moveit_ikfast_plugin_description.xml 
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/tx2_60_kinematics)
