pipeline {
    agent any
    environment {
        NEW_VERSION = '1.2.0'
        SERVER_CREDENTIALS = credentials('test-multi-pipeline')
    }
    stages {
        stage('build') {
            steps {
                echo "building the app"
                echo "building the version ${NEW_VERSION}"                
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
                env.BRANCH_NAME == 'pipeline'
              }
            }    
            steps {
                echo "deploying the app"
                echo "deploying using credentials ${SERVER_CREDENTIALS}"
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
