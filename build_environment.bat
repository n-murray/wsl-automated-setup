echo Building Docker container and importing to WSL
docker build --build-arg USER=%USERNAME% -t dev-env -f resources\Dockerfile .
docker run --name dev-env dev-env
docker export --output="dev-env.tar.gz" dev-env
docker container rm dev-env
docker rmi dev-env

echo Setting the WSL version to 2 and importing the new distro
wsl --set-default-version 2
wsl --import dev-env .\installDir .\dev-env.tar.gz
wsl --set-default dev-env

echo Cleaning up build files
del dev-env.tar.gz