docker stop cognitive_robotics_cpu
docker rm cognitive_robotics_cpu
docker run -it \
  -p 6080:6080 \
  -p 8888:8888 \
  --name cognitive_robotics_cpu \
  --mount source=cognitive-robotics-opt-volume,target=/opt \
  prathap/cognitive_robotics_cpu:v1
