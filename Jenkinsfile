    pipeline {
      agent { docker 'jenkins/slave' } 
        stages {
            stage ('Build') {
                agent {
                    docker {image 'jenkins/slave'}
                }
                steps {
                    sh "mvn -B -DskipTests clean package"
                }
            }
        }
        post {
            failure {
                script {
                    echo "TestRail failed"
                }
            }
        }
    }
