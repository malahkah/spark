pipeline {
  agent {
    docker {
      image 'maven:3-alpine'
      args '-v /root/.m2:/root/.m2'
    }
<<<<<<< HEAD
    stages {
        stage('Build') { 
           docker {
		image 'jenkins/slave'
		}
	}
		 steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
=======

  }
  stages {
    stage('Build') {
      steps {
        dockerNode(image: 'jenkins/slave') {
          sh 'mvn -B -DskipTests clean package'
>>>>>>> c48b7499247fcf46c5973ca6795f23017cd2dcbc
        }

      }
    }

    stage('Deliver') {
      steps {
        sh './jenkins/scripts/deliver.sh'
      }
    }

  }
}