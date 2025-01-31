pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
    }
    stages {
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init -input=false'
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
