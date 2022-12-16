pipeline {    
    agent any
    environment {
        PROJECT_ID = 'oss-project-363004'
        CLUSTER_NAME = 'kube'
        LOCATION = 'asia-northeast3-a'
        CREDENTIALS_ID = 'OssCub'  //GithubApp을 통해 추가한 jenkins credential id
	BUILD_ID='0.1'
    }
    stages {
        stage("Build image") {
            steps {
                script {
                    myapp = docker.build("listenyoon/oss-cub:${env.BUILD_ID}")
                }
            }
        }
        stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
			    myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }
// 	stage('Deploy to GKE') {
// 	    when {
// 		branch 'develop'
// 	    }
// 	    steps{
// 		sh "sed -i 's/oss-cub:latest/oss-cub:${env.BUILD_ID}/g' deployment.yaml"
// 		step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, 
// 		location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, 
// 		verifyDeployments: true])
// 	    }
// 	}
    }
}
