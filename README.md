# uralmaDocker

config:

chmod +x ./build_erc.sh ./ur_alma_docker_create_AMD.bash
# build: ur-alma image
./build_erc.sh

alma image is build from erc image

./build_alma.sh
# run: ur-alma container
./ur_alma_docker_create_AMD.bash

## a questo punto dovrebbe entrare automaticamente. per le volte successive:
NOTA: segui le istruzioni per esecuzione docker con permessi da su
docker start ur-alma
(puoi verificare con docker stop ur-alma o docker stats ur-alma)
# nuovo terminale
docker exec -it ur-alma /bin/bash


# da fare all'interno:
## c'è uno script per sistemare le cose autonomamente
## esecuzione doppia catkin_make, source, service ssh start (per fare dei test se vuoi)
/freedom/START.sh


# apertura connessioni video
#meno sicuro
xhost +local:root
#più sicuro
xhost +local:"docker inspect --format='{{ .Config.Hostname }}' ur-alma"
