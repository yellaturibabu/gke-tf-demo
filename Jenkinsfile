pipeline {
    agent any 
  parameters {
  credentials credentialType: 'org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl', defaultValue: '', description: 'select gcp project credentials and projects', name: 'gcpproject', required: true
}
    environment {
            SVC_ACCOUNT_KEY = credentials("${params.gcpproject}")
            GCP_PROJECT = "${params.gcpproject}"
         }
    
    stages {
        stage('checkout') {
            steps {
                checkout scm
                sh 'mkdir -p creds' 
                sh 'echo $SVC_ACCOUNT_KEY | base64 -d > ./creds/serviceaccount.json'
            }
        }
    
        stage('plan') {
            steps {
                    sh  'terraform init -backend-config="bucket=$GCP_PROJECT" -backend-config="prefix=demo"  -backend-config="credentials=./creds/serviceaccount.json" '
                    sh 'terraform validate'
                    sh 'terraform plan -out=create.tfplan -var-file=./tfvars/"$GCP_PROJECT.tfvars"'
                    sh "[ -f \"create.tfplan\" ] || echo 'tfplan file is missing'"
                
                
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
                sh "[ -f \"create.tfplan\" ] && terraform apply create.tfplan"
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
