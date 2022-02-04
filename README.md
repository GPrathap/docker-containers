Based on your preference you can run either run cpu or gpu docker container 

### To build the gpu docker container
    cd gpu
    ./build.sh 


### To run the gpu docker container
    cd gpu
    ./run.sh 

### To build the cpu docker container
    cd cpu 
    ./build.sh 


### To run the cpu docker container
    cd cpu
    ./run.sh 
    
### To test the docker container 
    cd /opt/evorobotpy2/xpendulum
  
    python ../bin/es.py -f pendulum.ini -s 1 -p


## Some useful commands you may need
    docker ps --all # to see all the docker containers 
    docker start cognitive_robotics_gpu # start the docker container 
    docker stop cognitive_robotics_gpu # stop running docker container 
    docker exec -it cognitive_robotics_gpu bash  # attach to docker container 

## If you dont like to build any of the containers, you may pull 
    docker pull prathap/cognitive_robotics_cpu:v1 
    docker pull prathap/cognitive_robotics_gpu:v1
    or 
    ./cognitive_robotics_gpu_docker.sh 
    ./cognitive_robotics_cpu_docker.sh 

### Acknowledgement 
Initially these scripts were written by @vladkurenkov
