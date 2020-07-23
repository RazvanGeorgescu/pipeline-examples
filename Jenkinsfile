pipeline {
    agent any
    tools {
        maven "3.6.3"
    }
    stages {
        stage('build') {
            steps {
                sh "mvn -version"
                echo "building the app"
            }
        }
        stage('test') {
            when {
              expression {
                currentBuild.result == null || currentBuild.result == 'SUCCESS'
              }
            }
            steps {
                echo "testing the app"
            }
        }
        stage('deploy') {
            when {
              expression {
                env.BRANCH_NAME == 'master'
              }
            }    
            steps {
                echo "deploying the app"
            }
        }
    }
    post {
        always {
            echo 'this build has executed'
        }
        success {
            echo 'this build has succeeded'
        }
        failure {
            echo 'this build has failed'
        }       
    }
}
