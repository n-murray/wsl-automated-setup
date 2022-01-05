rem [32m Building Docker container and importing to WSL [0m
docker build --build-arg USER=%USERNAME% -t dev-env -f resources\Dockerfile .
docker run --name dev-env dev-env
docker export --output="dev-env.tar.gz" dev-env
docker container rm dev-env
docker rmi dev-env

rem [32m Setting the WSL version to 2 and importing the new distro [0m
wsl --set-default-version 2
wsl --import dev-env .\installDir .\dev-env.tar.gz
wsl --set-default dev-env

rem [32m Cleaning up build files [0m
del dev-env.tar.gz