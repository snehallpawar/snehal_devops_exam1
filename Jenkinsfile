pipeline {
  agent any
  environment {
    AWS_DEFAULT_REGION = 'ap-south-1'
  }
  stages {
    stage('Terraform Init') {
      steps {
        script {
          sh 'terraform init'
        }
      }
    }
    stage('Terraform Plan') {
      steps {
        script {
          sh 'terraform plan'
        }
      }
    }
    stage('Terraform Apply') {
      steps {
        script {
          sh 'terraform apply -auto-approve'
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
