pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/abh1sh3k/jenkins-docker-slave.git', branch: 'main')
      }
    }

    stage('Build') {
      steps {
        script {
          app = docker.build("abh1sh3k/jenkins-slave")
        }
      }
    }

    stage('Push Image') {
      steps {
        script {
            withDockerRegistry(credentialsId: 'docker', url: 'https://registry.hub.docker.com') {
              app.push("${env.BUILD_NUMBER}")            
              app.push("latest")
            }
        }
      }
    }
  }
}