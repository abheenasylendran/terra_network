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
		sh './terra_script.sh'
            }
        }
        stage('validate') {
            steps {
		sh 'echo "Validate testing"'
		sh 'git clone https://github.com/sunil-surendran/spec_terra.git'
		sh 'awspec generate ec2 vpc-094bad71'
            }
        }
    }
}
