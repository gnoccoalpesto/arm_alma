build_erc(){
    echo "Building ERC UR3"
    docker build -f Dockerfile_alma --no-cache --tag uralma .
}

build_erc
