#FROM osrf/ros:melodic-desktop-full
FROM ros:melodic

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y lsb-core g++ openssh-server gedit vim #apt-utils

RUN rm /etc/ros/rosdep/sources.list.d/20-default.list && rosdep init && rosdep update

RUN apt-get update && apt-get install -y gdb gnupg2 apt-transport-https

#create workspace
RUN mkdir -p /catkin_ws/src

#universal_robot
RUN cd /catkin_ws/src && git clone https://github.com/Michal-Bidzinski/ERC_2021_simulator.git

#gazebo plugins
RUN cd /catkin_ws/src && git clone https://github.com/roboticsgroup/roboticsgroup_gazebo_plugins.git

RUN apt install ros-melodic-industrial-core -y

RUN rosdep update

RUN rosdep install --from-paths /catkin_ws/src/ --ignore-src --rosdistro melodic -r -y

#teleop
RUN apt install ros-melodic-teleop* -y

#joystick
RUN apt install ros-melodic-joy* -y

#aruco
RUN apt install ros-melodic-aruco-ros* -y

#controller
RUN apt install ros-melodic-ros-controllers* -y

#pip2
RUN apt install -y python-pip

#pip3
RUN apt install -y python3-pip

#almax
RUN apt install -y ros-melodic-moveit-visual-tools
RUN apt install -y ros-melodic-pcl-conversions
RUN apt install -y ros-melodic-pcl-ros
RUN cd /catkin_ws/src && git clone https://github.com/alma-x/simulation-cv
RUN cd /catkin_ws/src && git clone https://github.com/alma-x/almasim_ur3
RUN cd /catkin_ws/src && git clone https://github.com/alma-x/ur3-control

#RUN /bin/bash -c '. /opt/ros/melodic/setup.bash; cd /catkin_ws;catkin_make'

RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
#RUN echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc

# INSTALL RUNTIME SCRIPTS
RUN mkdir /freedom
#COPY ./freedom_register.py /freedom/
#COPY ./freedom_keep_alive.py /freedom/
COPY ./entrypoint/* /freedom/
RUN chmod +x /freedom/START.sh

#ENTRYPOINT service ssh restart && bash
#ENTRYPOINT ["/freedom/entrypoint.sh"]
