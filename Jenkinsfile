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
		sh '''#!/bin/bash -l
                echo "Validate testing"
                rm -rf spec_terra
                git clone https://github.com/sunil-surendran/spec_terra.git
                cd spec_terra
                bundle install
                bundle exec awspec generate ec2 vpc-094bad71'''
            }
        }
    }
}
