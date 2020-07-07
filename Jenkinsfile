pipeline {
    agent any
    parameters {
        string(name: 'commitID', defaultValue: '', description: 'version to deploy on prod')
        choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: '')
        booleanParam(name: 'executeTests', defaultValue: true, description: '')
    }
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
                params.executeTests == true
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
                echo "deploying the version ${params.VERSION}"
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
