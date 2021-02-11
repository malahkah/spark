pipeline {
  agent {
    docker {
      image 'jenkins-slave-maven'
    }

  }
  stages {
    stage('Build') {
      agent {
        docker {
          image 'jenkins/slave'
        }

      }
      steps {
        snykSecurity(failOnIssues: true, severity: 'High', snykTokenId: '549c12cc-bb4b-429a-8b3a-331bc538ecac', organisation: 'malahkah', projectName: 'spark', monitorProjectOnBuild: true)
        sh 'mvn -B -DskipTests clean package'
      }
    }

    stage('JFROG') {
      steps {
        script {
          def server = Artifactory.server "artifactory"
          def buildInfo = Artifactory.newBuildInfo()
          def rtMaven = Artifactory.newMavenBuild()
          rtMaven.tool = 'maven'
          rtMaven.deployer server: server, releaseRepo: 'libs-release-local', snapshotRepo: 'libs-snapshot-local'
          buildInfo = rtMaven.run pom: 'pom.xml', goals: "clean install -Dlicense.skip=true"
          buildInfo.env.capture = true
          buildInfo.name = 'jpetstore-6'
          server.publishBuildInfo buildInfo
        }

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