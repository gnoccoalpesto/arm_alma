docker run -it \
--network=host \
--gpus all \
--env="DISPLAY=:1" \
--env="QT_X11_NO_MITSHM=1" \
--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
--env="XAUTHORITY=$XAUTH" \
--volume="$XAUTH:$XAUTH" \
--env="NVIDIA_VISIBLE_DEVICES=all" \
--env="NVIDIA_DRIVER_CAPABILITIES=all" \
--volume="/dev:/dev" \
--privileged \
--name uralma  \
uralma
