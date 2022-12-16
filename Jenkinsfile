pipeline {    
    agent any
    environment {
        PROJECT_ID = 'oss-project-363004'
        CLUSTER_NAME = 'kube'
        LOCATION = 'asia-northeast3-a'
        CREDENTIALS_ID = 'OssCub'  //GithubApp을 통해 추가한 jenkins credential id
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
