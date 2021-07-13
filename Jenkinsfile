pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/abh1sh3k/jenkins-docker-slave.git', branch: 'main')
      }
    }

    stage('test') {
      steps {
        bat(script: 'dir', returnStatus: true)
      }
    }

  }
}