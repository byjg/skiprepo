node {
    stage("Checkout SCM") {
        checkout scm
    }

    stage("Building with Docker") {
        docker.withServer('tcp://127.0.0.1:2375') {
            docker.image('maven:3.3-jdk-8').withRun('-e APP=dev -v $HOME/.m2:/root/.m2') {c -> 
                sh 'mvn clean install'
            }
        }
        stash name: 'hello-world', includes: 'target/*.war'
    }
    
    stage("Finishing") {
        archiveArtifacts 'target/*.war'
    }
}

