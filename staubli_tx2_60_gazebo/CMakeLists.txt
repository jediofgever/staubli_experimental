cmake_minimum_required(VERSION 2.8.3)
project(staubli_tx2_60_gazebo)

find_package(OpenCV REQUIRED )
find_package(catkin REQUIRED)
find_package(Eigen3 REQUIRED)
find_package(catkin REQUIRED COMPONENTS
  tf
  gazebo_ros
  gazebo_plugins
  roscpp
  image_transport
  camera_info_manager
  sensor_msgs
 )

find_package(gazebo 9 REQUIRED)
 
if(NOT EIGEN3_INCLUDE_DIRS)
set(EIGEN3_INCLUDE_DIRS ${EIGEN3_INCLUDE_DIR})
endif()


include_directories(include ${catkin_INCLUDE_DIRS} ${GAZEBO_INCLUDE_DIRS} ${SDFormat_INCLUDE_DIRS} ${EIGEN3_INCLUDE_DIR}  )
 
catkin_package(
  LIBRARIES  
  CATKIN_DEPENDS 
  roscpp 
  gazebo_ros 
  image_transport
  camera_info_manager
  sensor_msgs
 )  

add_library(staubli_tx2_60_gazebo_model_push SHARED plugins/MoveObject.cc)
target_link_libraries(staubli_tx2_60_gazebo_model_push ${GAZEBO_LIBRARIES} ${catkin_LIBRARIES})

add_library(staubli_tx2_60_gazebo_random_model_push SHARED plugins/RandomMoveObject.cc)
target_link_libraries(staubli_tx2_60_gazebo_random_model_push ${GAZEBO_LIBRARIES} ${catkin_LIBRARIES})

add_library(staubli_tx2_60_gazebo_pick_place SHARED plugins/SimulationPickandPlace.cc  ${SOURCES})
target_link_libraries(staubli_tx2_60_gazebo_pick_place ${GAZEBO_LIBRARIES} ${catkin_LIBRARIES} ${EIGEN3_LIBRARIES} ${OpenCV_LIBS} ${fanuc_arm_perception_utilities})
add_dependencies(staubli_tx2_60_gazebo_pick_place ${PROJECT_NAME}_EXPORTED_TARGETS})

add_library(staubli_tx2_60_gazebo_realsense_gazebo_plugin
    plugins/RealSensePlugin.cpp
    plugins/gazebo_ros_realsense.cpp
)
target_link_libraries(staubli_tx2_60_gazebo_realsense_gazebo_plugin ${catkin_LIBRARIES} ${GAZEBO_LIBRARIES})
add_dependencies(staubli_tx2_60_gazebo_realsense_gazebo_plugin ${catkin_EXPORTED_TARGETS})

#Install Libraries
install(TARGETS
    staubli_tx2_60_gazebo_model_push 
    staubli_tx2_60_gazebo_random_model_push
    staubli_tx2_60_gazebo_pick_place
    staubli_tx2_60_gazebo_realsense_gazebo_plugin
    ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
    LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
)
#Install Directory
install(DIRECTORY config DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})
install(DIRECTORY launch DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})
install(DIRECTORY meshes DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})
install(DIRECTORY urdf DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})
install(DIRECTORY worlds DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})