pipeline{
    agent { label 'docker' }
    
    stages {
        stage ('CleanWorkspace') {
            steps {
                cleanWs()
            }
        }
        stage ('fetch') {
            steps {
                sh 'git clone https://github.com/gt-h/my-hello.git'
            }
        }
        stage ('install') {
            steps {
                dir("my-hello") {
                    sh 'docker run --rm --name my-hello -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven maven mvn clean package'
                }
            }
        }
        stage ('Build docker image') {
            steps {
                dir("my-hello") {
                    sh 'docker build -t result-images:$BUILD_NUMBER .'
                }    
            }
        }
        stage ('Start container') {
            steps {
                sh 'docker run result-images:$BUILD_NUMBER'
            }
        }
    }
    
    post {
        always {
            echo "job execution complete"
        }
        success {
            archiveArtifacts artifacts: 'my-hello/target/*.jar'
        }
    }
}
