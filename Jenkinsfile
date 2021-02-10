pipeline {
  agent {
    docker {
      image 'maven:3-alpine'
      args '-v /root/.m2:/root/.m2'
    }
    stages {
        stage('Build') { 
           docker {
		image 'jenkins/slave'
		}
	}
}		 steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
     
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
}            
}
}
