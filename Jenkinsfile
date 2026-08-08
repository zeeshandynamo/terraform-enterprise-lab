pipeline {
    agent any

    triggers {
        githubPush()
    }

    environment {
        VAULT_ADDR = 'http://10.0.1.184:8200'
        TERRAFORM_WORKSPACE = 'dev'
        TF_VAR_FILE = 'environments/dev.tfvars'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm

                sh '''
                    echo "========================================"
                    echo "Source Code Checkout"
                    echo "========================================"
                    git status
                    git branch --show-current
                    echo "Commit:"
                    git rev-parse --short HEAD
                '''
            }
        }

        stage('Read Secret from Vault') {
            steps {
                withVault(
                    configuration: [
                        vaultUrl: "${VAULT_ADDR}",
                        vaultCredentialId: 'vault-approle'
                    ],
                    vaultSecrets: [[
                        path: 'secret/github',
                        secretValues: [[
                            vaultKey: 'pat',
                            envVar: 'GITHUB_PAT'
                        ]]
                    ]]
                ) {
                    sh '''
                        echo "========================================"
                        echo "Vault Authentication"
                        echo "========================================"
                        echo "Vault authentication successful."
                        echo "GitHub PAT retrieved from Vault."
                        echo "GitHub PAT Length: ${#GITHUB_PAT}"
                    '''
                }
            }
        }

        stage('Verify AWS IAM Role') {
            steps {
                sh '''
                    echo "========================================"
                    echo "AWS IAM Role Verification"
                    echo "========================================"

                    aws sts get-caller-identity
                '''
            }
        }

        stage('Terraform Version') {
            steps {
                sh '''
                    echo "========================================"
                    echo "Terraform Version"
                    echo "========================================"

                    terraform version
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                    echo "========================================"
                    echo "Terraform Init"
                    echo "========================================"

                    terraform init -input=false
                '''
            }
        }

        stage('Select Terraform Workspace') {
            steps {
                sh '''
                    echo "========================================"
                    echo "Terraform Workspace"
                    echo "========================================"

                    terraform workspace list

                    if terraform workspace select "${TERRAFORM_WORKSPACE}"; then
                        echo "Selected workspace: ${TERRAFORM_WORKSPACE}"
                    else
                        echo "ERROR: Terraform workspace '${TERRAFORM_WORKSPACE}' does not exist."
                        exit 1
                    fi

                    echo "Current workspace:"
                    terraform workspace show
                '''
            }
        }

        stage('Terraform Format Check') {
            steps {
                sh '''
                    echo "========================================"
                    echo "Terraform Format Check"
                    echo "========================================"

                    terraform fmt -check -recursive
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                sh '''
                    echo "========================================"
                    echo "Terraform Validate"
                    echo "========================================"

                    terraform validate
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                    echo "========================================"
                    echo "Terraform Plan"
                    echo "========================================"

                    terraform plan \
                        -input=false \
                        -var-file="${TF_VAR_FILE}" \
                        -out=tfplan
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                    echo "========================================"
                    echo "Terraform Apply"
                    echo "========================================"

                    terraform apply \
                        -input=false \
                        -auto-approve \
                        tfplan
                '''
            }
        }
    }

    post {

        success {
            echo '''
========================================
Terraform Pipeline Completed Successfully
========================================
'''
        }

        failure {
            echo '''
========================================
Terraform Pipeline Failed
========================================
Check the failed stage in the Jenkins console output.
'''
        }

        always {
            sh '''
                rm -f tfplan
            '''
        }
    }
}
