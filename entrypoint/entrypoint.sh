#!/bin/bash

#set -o allexport
#source .env
#set +o allexport

# Read the credentials for the device from environment variables
# FR_DEVICE, FR_TOKEN, FR_SECRET then register Freedom Robotics
# as a system service with a keep-alive if it exits.
#python /freedom/freedom_register.py
#python /freedom/freedom_keep_alive.py &


#echo "source /opt/ros/melodic/setup.bash" >> /etc/bash.bashrc
# echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
# echo "source /alma_ws/devel/setup.bash" >> ~/.bashrc
#echo "ROS_IP=${ROS_IP}" >> /etc/environment
#echo "ROS_MASTER_URI=${ROS_MASTER_URI}" >> /etc/environment

/bin/bash -c '. /opt/ros/melodic/setup.bash; cd /catkin_ws;catkin_make'

echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc

# Replace with your final code or other services to run before.
#sudo service ssh start #restart
sleep infinity
