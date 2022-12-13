
def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
]



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
        stage('terraform init') {
            steps {
                echo 'Initialising project...'
                sh 'terraform init'
            }
        }
        stage('terraform validate') {
            steps {
                echo 'Validating project code...'
                sh 'terraform validate'
            }
        }
        stage('terraform plan') {
            steps {
                echo 'Preparing the dry run...'
                sh 'terraform plan'
            }
        }
        stage('chekov scanner') {
            steps {
                echo 'Preparing the dry run...'
                sh """
                sudo pip3 install checkov
                checkov -d . --skip-check CKV_AWS_79,CKV2_AWS_41,CKV_AWS*
                """
            }
        }
        stage('Manual approval') {
            steps {
               
                input 'Approval required for deployment'
            }
        }
        stage('terraform apply') {
            steps {
                echo 'Creating the infrastructure...'
                sh 'terraform apply --auto-approve'
                
            }
        }
        
      }
      
      post {
        always {
            echo 'I will always say Hello again!'
            slackSend channel: '#glorious-w-f-devops-alerts', color: COLOR_MAP[currentBuild.currentResult], message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
        }
    
      }
        
    }
    
    
