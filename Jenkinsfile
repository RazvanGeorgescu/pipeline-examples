pipeline {
    agent {
        dockerfile {
            label 'Docker'
            args '-v /var/jenkins_home/.m2:/home/jenkins/.m2 -e HOME=/home/jenkins/  -e MAVEN_CONFIG=/home/jenkins/.m2 -e MAVEN_OPTS="-Duser.home=/home/jenkins/"'
        }
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
                sh "ssh -V"
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
