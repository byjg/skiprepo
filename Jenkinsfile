def agentLabel = "ubuntuvm"

node(agentLabel) {
    
    stage("Checkout SCM") {
        checkout scm
    }

    stage("Building with Docker") {
        def arguments = [
            '-e APP=DEV',
            "-v ${WORKSPACE}/.m2:/root/.m2"
        ].join(" ")
        
        def mavenImage = docker.image('maven:3-jdk-8')
        
        mavenImage.pull()
        mavenImage.inside(arguments) {
            sh 'mvn clean install'
            sh 'export'
            sh 'cat /etc/staff-group-for-usr-local'
        }
        
        stash name: 'hello-world', includes: 'target/*.war'
    }
    
    stage("Finishing") {
        archiveArtifacts 'target/*.war'
    }

    stage("Creating Docker Image") {
        def dockerfile = 'Dockerfile.jenkinsfile'
        def testImage = docker.build("demojenkins:${env.BUILD_ID}", "-f ${dockerfile} .")
        // testImage.push();
    }
}


