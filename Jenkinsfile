pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                checkout scm
                sh 'echo "Checkout Successful"'
            }

        }
        stage('terraform') {
            steps {
		sh 'echo "Testing Terraform Plan & apply"'
            }
        }
        stage('validate') {
            steps {
		sh 'echo "Validate testing"'
            }
        }
    }
}
