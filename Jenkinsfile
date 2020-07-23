pipeline {
    agent {
        docker {
            image "maven:3.6.3-jdk-14"
            label 'Docker'
            args '-v /var/jenkins_home/.m2:/var/maven/.m2 -e HOME=/var/maven  -e MAVEN_CONFIG=/var/maven/.m2 -e MAVEN_OPTS="-Duser.home=/var/maven"'
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
            }
        }
        stage('deploy') {
            when {
              expression {
                env.BRANCH_NAME == 'master'
              }
            }    
            steps {
                sh "ssh -V"
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
