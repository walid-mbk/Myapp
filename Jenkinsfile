pipeline {
    agent any
   
    stages {
       
       stage('Git checkout') {
        steps {
           git branch: 'master', credentialsId: 'git-jenkins', url: 'https://github.com/walid-mbk/Myapp.git'
         }
      }

      stage("npm install") {
            steps {
                sh "npm install"
            }
        }

      stage('build')
      {
         steps {
            script{
               sh "ansible-playbook Ansible/build.yml -i Ansible/inventory/host.yml"
            }
         }
      }

      stage('docker')
      {
         steps {
            script{
               sh 'ansible-playbook Ansible/docker.yml -i Ansible/inventory/host.yml'
            }
         }
      }

      stage('push to dockerhub')
      {
         steps {
            script{
               sh 'ansible-playbook Ansible/docker-registry.yml -i Ansible/inventory/host.yml'
            }
         }
      }


       
                      
    }
}                          