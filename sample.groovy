pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                echo 'Cloning Project Codebase...'
                git branch: 'main', url: 'https://github.com/Frankhill-che/airbnb-infrastructure1'
                sh 'ls'
            }
        }
        stage('Verify terraform version') {
            steps {
                echo 'Verifying terraform version...'
                sh 'terraform --version'
            }
        }
    }
}
