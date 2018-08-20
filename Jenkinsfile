node {
    checkout scm

    docker.withServer('tcp://127.0.0.1:2375') {
        docker.image('maven:3.3-jdk-8').inside('-e APP=dev -v $HOME/.m2:/root/.m2') {
            mvn install
        }
    }
}

