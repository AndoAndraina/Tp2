pipeline {
    agent any

    environment {
        IMAGE_NAME = 'ando27/project_mini'
        IMAGE_TAG = '1.0.0'
    }

    tools {
        maven 'Maven 3.9.9'
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github_credentials', url: 'https://github.com/AndoAndraina/Tp2.git'
            }
        }

        stage('Build the application') {
            steps {
                bat 'mvn clean install'
            }
        }

        stage('Unit Test Execution') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t ${env.IMAGE_NAME}:${env.IMAGE_TAG} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'akoho', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
                    script {
                        bat """
                        echo ${DOCKERHUB_PASS} | docker login -u ${DOCKERHUB_USER} --password-stdin
                        docker push ${IMAGE_NAME}:${IMAGE_TAG}
                        """
                    }
                }
            }
        }
    }
}
