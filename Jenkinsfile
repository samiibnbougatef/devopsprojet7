pipeline{
    agent any
    tools{
        maven 'M2'
    }
    stages{
        stage('clone'){
            steps{
                git credentialsId: 'gitlab', url: 'git@gitlab.com:samiibnbougatef/projet_j2e.git'
            }
        }
         stage('build'){
        steps{
             sh 'mvn clean install package'
         }
     }

    stage('docker'){
        steps{
        withCredentials([sshUserPrivateKey(credentialsId: 'ansadmin', keyFileVariable: '', usernameVariable: 'ansadmin')]) {
 

            sh 'scp  /var/lib/jenkins/workspace/projet7/webapp/target/webapp.war ansadmin@3.1.25.173:/home/ansadmin/projet7/ressources/webapp.war'
          
        }
        

    stage('ansible tasks'){
        steps{
       
        ansiblePlaybook disableHostKeyChecking: true , credentialsId: 'ansadmin', installation: 'ansible', playbook: '/home/ansadmin/projet7/docker-ansible.yaml'
        ansiblePlaybook disableHostKeyChecking: true , credentialsId: 'ansadmin', installation: 'ansible', playbook: '/home/ansadmin/projet7/docker-image.yaml'
            
        }
    }
        
        
    }
}
