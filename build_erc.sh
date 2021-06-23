build_erc(){
    echo "Building ERC UR3"
    docker build -f Dockerfile --no-cache --tag ur-alma .
}

build_erc
