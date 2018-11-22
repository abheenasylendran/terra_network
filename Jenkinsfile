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
		sh '#!/bin/bash -l'    
		sh 'echo "Validate testing"'
		sh 'rm -rf spec_terra'
		sh 'git clone https://github.com/sunil-surendran/spec_terra.git'
		sh 'cd spec_terra'
		sh '''#!/bin/bash -l
		bundle install'''
		sh 'bundle exec awspec generate ec2 vpc-094bad71'
            }
        }
    }
}
