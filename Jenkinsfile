pipeline {
    agent any
    stages {
    
        stage('build-code') {
            steps {
                sh 'chmod +x mvnw'
                sh 'mvn clean compile package'
            }
        }
        stage('build-image') {
            steps {
                sh 'docker build -t jpetstore .'
            }
        }
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'DockerHub', usernameVariable: 'username', passwordVariable: 'pass')]) {
                sh 'docker login -u ${username} -p ${pass}'
                sh 'docker tag jpetstore ranahesham/jpetstore:v1.1'
                sh 'docker image push ranahesham/jpetstore:v1.1'
                }
            }
        }
        stage('deploy_on_the_same_machine') {
            steps {
                sh 'docker run -d -p 8081:8080 ranahesham/jpetstore:v1.1'
            }
        }
        stage('deploy_on_slave_machine') {
            steps {
                ansiblePlaybook credentialsId: 'private_key', inventory: 'inventory.yaml', playbook: 'docker_task.yaml'
            }
        }       

    }
}
