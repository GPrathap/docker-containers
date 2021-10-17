docker stop cognitive_robotics_gpu
docker rm cognitive_robotics_gpu
docker run -it -d --privileged  -e DISPLAY=$DISPLAY \
                --mount source=cognitive-robotics-opt-volume,target=/opt  \
                -v /tmp/.X11-unix:/tmp/.X11-unix:rw -p 6080:6080 -p 8888:8888 \
                --name cognitive_robotics_gpu prathap/cognitive_robotics_gpu:v1 bash
xhost +
docker exec -it cognitive_robotics_gpu bash