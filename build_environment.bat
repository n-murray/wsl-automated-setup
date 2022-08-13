rem [32m Checking for Docker install [0m

IF EXIST .\dev-env.tar.gz (
    GOTO Import;
) ELSE (
    where helm >nul 2>nul
    IF "%ERRORLEVEL%" NEQ 0 (
        GOTO Builder;
    ) ELSE (
        GOTO Docker;
    )
)

:Builder
    echo on
    rem [32m Building Docker container using builder distro [0m
    wsl --set-default-version 2
    wsl --import builder .\builderInstall .\resources\builder\alpine-builder.tar.gz --version 2
    wsl -d builder -u root sh -c "resources/builder/build-tar.sh %USERNAME%"
    
    wsl --unregister builder
    rmdir .\builderInstall
    GOTO Import;

:Docker
    echo on
    rem [32m Building Docker container [0m
    docker build --build-arg USER=%USERNAME% -t dev-env -f resources\Dockerfile .
    docker run --name dev-env dev-env
    docker export --output="dev-env.tar.gz" dev-env
    docker container rm dev-env
    docker rmi dev-env

:Import
    rem [32m Importing the new distro [0m
    wsl --set-default-version 2
    wsl --import dev-env .\installDir .\dev-env.tar.gz
    wsl --set-default dev-env