pipeline {    
    agent any
    environment {
        PROJECT_ID = 'oss-project-363004'
        CLUSTER_NAME = 'kube'
        LOCATION = 'asia-northeast3-a'
    }
    stages {
        stage("Build image") {
            steps {
                script {
                    myapp = docker.build("listenyoon/oss-cub:latest")
                }
            }
        }
        stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                    }
                }
            }
        }
    }
}
