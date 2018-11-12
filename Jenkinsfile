pipeline {

  agent any
  
  parameters {
  string defaultValue: 'tftest', description: '', name: 'tfauth', trim: true
}


  environment {
    SVC_ACCOUNT_KEY = credentials("${params.tfauth}")
  }

  stages {

    stage('Checkout') {
      steps {
        checkout scm
        sh 'mkdir -p creds' 
        sh 'echo $SVC_ACCOUNT_KEY | base64 -d > ./creds/serviceaccount.json'
      }
    }

    stage('TF Plan') {
      steps {
     script {
          sh 'terraform init'
          sh 'terraform plan -out myplan'
            }
      }      
    }

    stage('Approval') {
      steps {
        script {
          def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
        }
      }
    }

    stage('TF Apply') {
      steps {
      script {
          sh 'terraform apply -input=false myplan'
        }
      }
    }

  } 
    post {
        //changed {}
        //aborted {}
        //failure {}
        //success {}
        //unstable {}
        //notBuilt {}
        always {
            echo "Clearing workspace"
            deleteDir() // Clean up the local workspace so we don't leave behind a mess, or sensitive files
        }
    }
}
