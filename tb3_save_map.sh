#! /bin/bash

#source files
source /opt/ros/kinetic/setup.bash

source ~/catkin_ws/devel/setup.bash

#save map

rosrun map_server map_saver -f ~/catkin_ws/src/tb3_shell_scripts/map

#kill in TB3
ssh tb315@10.42.0.115 'killall -9 bash'
ssh tb315@10.42.0.115 'killall -9 bringup.sh'
ssh tb315@10.42.0.115 'killall -9 python'
ssh tb315@10.42.0.115 'killall -9 hlds_laser_publisher'
ssh tb315@10.42.0.115 'killall -9 turtlebot3_diagnostics'
ssh tb315@10.42.0.115 'killall -9 sshd'
ssh tb315@10.42.0.115 'killall -9 raspi_camera.sh'
ssh tb315@10.42.0.115 'killall -9 roslaunch'
ssh tb315@10.42.0.115 'killall -9 raspicam_node'

#kill in LAPTOP
killall -9 ssh
killall -9 roslaunch
killall -9 rosout
killall -9 rosmaster

echo "Save Map Complete!!!"
