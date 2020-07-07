pipeline {
    agent any
    stages {
        stage('build') {
            steps {
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
                env.BRANCH_NAME == 'olivergondza-patch-1'
              }
            }    
            steps {
                echo "deploying the app"
            }
        }
    }
    post {
        always {
            // always say something about how the build went
        }
        success {
            // if the build succeded post something
        }
        failure {
            // if the build failed post something
        }       
    }
}
