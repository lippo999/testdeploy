pipeline {
    agent any
    tools {
        nodejs 'NodeJS 14'
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm ci'
                sh 'npm run build --prod'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker login -u lippo69 -p Lippo321604307!'
                sh 'docker build -t lippo69/first-image .'
                sh 'docker push lippo69/first-image'
                sh 'ssh ubuntu@172.16.97.128 "docker pull lippo69/first-image && docker stop test-deploy && docker rm test-deploy && docker run -d --test-deploy -p 80:80 lippo69/first-image"'
