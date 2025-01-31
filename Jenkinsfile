pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
    }
    stages {
        stage('Terraform Init') {
            steps {
                script {
                    // Remove -input=false for terraform init to allow for state migration prompt
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -input=false'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve -input=false'
                }
            }
        }
        stage('Invoke Lambda') {
            steps {
                script {
                    sh 'aws lambda invoke --function-name MyLambdaFunction response.json --log-type Tail'
                }
            }
        }
    }
}
