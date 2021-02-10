pipeline {
  agent {
    docker {
      args '-v $HOME/.m2:/root/.m2'
      image 'maven:3-alpine'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'mvn -Dmaven.test.skip=true clean package'
      }
    }

  }
}