pipeline {
    agent any
    tools {
        nodejs 'node 20'
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm ci'
                sh 'npm run build --prod'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t lippo69/first-image .'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker login -u lippo69 -p Lippo321604307!'
                sh 'docker build -t lippo69/first-image .'
                sh 'docker push lippo69/first-image'
                sh 'docker pull lippo69/first-image && docker run -d --name test-deploy -p 80:80 lippo69/first-image'
            }
        }
    }
}
