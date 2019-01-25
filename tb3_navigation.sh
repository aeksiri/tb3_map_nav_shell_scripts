#! /bin/bash

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

#Kill in LAPTOP
killall -9 ssh
killall -9 roslaunch
killall -9 rosout
killall -9 rosmaster

#source files

source /opt/ros/kinetic/setup.bash

source ~/catkin_ws/devel/setup.bash

#rosmaster

roscore &

sleep 5

#oepn camera in TB3

ssh tb315@10.42.0.115 'source /opt/ros/kinetic/setup.bash && export ROS_MASTER_URI=http://10.42.0.1:11311 && export ROS_HOSTNAME=10.42.0.115 && source ~/catkin_ws/devel/setup.bash && ~/catkin_ws/src/tb3_shell_scripts/./raspi_camera.sh' &

sleep 10

#bringup in TB3

ssh tb315@10.42.0.115 'source /opt/ros/kinetic/setup.bash && export ROS_MASTER_URI=http://10.42.0.1:11311 && export ROS_HOSTNAME=10.42.0.115 && export TURTLEBOT3_MODEL=burger && source ~/catkin_ws/devel/setup.bash && ~/catkin_ws/src/tb3_shell_scripts/./bringup.sh' &

sleep 10

#open image view

rqt_image_view &

sleep 5

#remote pc

roslaunch turtlebot3_navigation turtlebot3_navigation.launch map_file:=/home/ghost/catkin_ws/src/tb3_shell_scripts/map.yaml

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

echo "Navigation  Ready!!!"
