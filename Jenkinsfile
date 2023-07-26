node{
    withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
        stage('Build') {
            checkout scm
            docker.image('node:16-buster-slim').inside('-p 3000:3000') {
                sh 'npm install'
                artifacts: 'node_modules/**'
            }
            sh 'docker build -t $USERNAME/submission-react-app .'
            sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
            sh 'docker push $USERNAME/submission-react-app'        
            }
        stage('Deploy') {
                sh 'docker pull bagaspm12/submission-react-app'
                docker.image('bagaspm12/submission-react-app').inside('-p 3000:3000') {
                    sh './jenkins/scripts/deliver.sh'
                    sleep(time: 1, unit: 'MINUTES')
                    sh './jenkins/scripts/kill.sh'
                }
            }
        }
    }

    

    // docker.image('node:16-buster-slim').inside('-p 3000:3000 --name submission-dicoding -dit') {
    //     stage('Test') {
    //         sh './jenkins/scripts/test.sh'
    //     }
    //     stage('Manual Approval') {
    //         input message: 'Lanjutkan ke tahap Deploy?'
    //     }
    //     stage('Deploy') {
    //         sh './jenkins/scripts/deliver.sh'
    //         sleep(time: 1, unit: 'MINUTES')
    //         sh './jenkins/scripts/kill.sh'
    //         //Deploy ke Cloud Provider AWS EC2
    //         // sshagent(['ec2-key']) {
    //         //     sh 'ssh -o StrictHostKeyChecking=no -l ec2-user ec2-user@89.207.132.170 docker pull submission-dicoding/react-app'
    //         //     sh 'ssh -o StrictHostKeyChecking=no -l ec2-user ec2-user@89.207.132.170 docker stop submission'
    //         //     sh 'ssh -o StrictHostKeyChecking=no -l ec2-user ec2-user@89.207.132.170 docker rm submission'
    //         //     sh 'ssh -o StrictHostKeyChecking=no -l ec2-user ec2-user@89.207.132.170 docker run -d -p 3000:3000 submission-dicoding/react-app'
    //         // }
    //     }
    // }
//}