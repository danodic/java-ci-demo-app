pipeline {
    triggers {
        pollSCM('*/1 * * * *')   
    }
    
    agent {
      label 'DEV-BUILD'
    }

    tools {
        maven "M3"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/danodic/java-ci-demo-app.git'
            }
        }
    
        stage('Test') {
            steps {
                sh "mvn clean test"
            }
        }
        
        stage('Deploy') {
            steps {
                sh "mvn clean package"
                
                sshPublisher(
                    publishers: [
                        sshPublisherDesc(
                            configName: 'CI Target', 
                            transfers: [sshTransfer(sourceFiles: 'target/*.jar')])
                    ])
            }
        }
    }
    
    post {
        success {
            junit '**/target/surefire-reports/TEST-*.xml'
            archiveArtifacts 'target/*.jar'
        }
    }
}
