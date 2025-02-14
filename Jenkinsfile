pipeline {
    agent any
    tools{
        maven 'maven_3_8_1'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Sapinderjeet/cicd-jenkins']])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t sapinder/rps-app:latest .'
                }
            }
        }
         stage('Push image to Hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u sapinder -p ${dockerhubpwd}'
                    }
                    sh 'docker push sapinder/rps-app:latest'
                }
            }
        }
    }
}