pipeline {
    
    agent {
        label "ubuntuvm"
    }

    stages {

        stage("Building with Docker") {
            steps {
                script {
                def arguments = [
                    '-e APP=DEV',
                    // '-v $HOME/.m2:/root/.m2'
                    "-v ${WORKSPACE}/.m2:/root/.m2"
                ].join(" ")
                
                def mavenImage = docker.image('maven:3-jdk-8')
                
                mavenImage.pull()
                mavenImage.inside(arguments) {
                    sh 'mvn clean install'
                    sh 'export'
                    sh 'cat /etc/staff-group-for-usr-local'
                }

                // docker.image('maven:3.3-jdk-8').inside(arguments) {c -> 
                //     sh "docker logs ${c.id}"
                //     sh 'export'
                //     sh 'ls -la $MAVEN_CONFIG/'
                //     sh 'mvn clean package'
                //     sh "docker logs ${c.id}"
                // }
                }
                stash name: 'hello-world', includes: 'target/*.war'
            }
        }
        
        stage("Finishing") {
            steps {
                archiveArtifacts 'target/*.war'
            }
        }

        stage("Creating Docker Image") {
            steps {
                script {
                def dockerfile = 'Dockerfile.jenkinsfile'
                def testImage = docker.build("demojenkins:${env.BUILD_ID}", "-f ${dockerfile} .")
                // testImage.push();
                }
            }
        }
    }
}


