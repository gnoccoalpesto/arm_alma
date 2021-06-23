#!/bin/bash

#/bin/bash -c '. /opt/ros/melodic/setup.bash; cd /catkin_ws;catkin_make'
cd /catkin_ws
catkin_make
catkin_make
echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc
#sudo service ssh start #restart
service ssh start #restart
