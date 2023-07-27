node{
    // withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
    //     stage('Build') {
    //         docker.image('node:16-buster-slim').inside('-p 3000:3000') {
    //             sh 'npm install'
    //             artifacts: 'node_modules/**'
    //             }
    //         sh 'docker build -t $USERNAME/submission-react-app .'
    //         sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
    //         sh 'docker push $USERNAME/submission-react-app'        
    //         }
    // docker.image('bagaspm12/submission-react-app').inside('-p 3000:3000') {
    //     stage('Test') {
    //             sh './jenkins/scripts/test.sh'
    //     }
    //     stage('Manual Approval') {
    //         input message: 'Lanjutkan ke tahap Deploy?'
    //     }
    // }
        stage('Deploy') {
    checkout scm
            //Deploy Di Local
            // sh 'docker pull bagaspm12/submission-react-app'
            // docker.image('bagaspm12/submission-react-app').inside('-p 3000:3000') {
            //     sh './jenkins/scripts/deliver.sh'
            //     sleep(time: 1, unit: 'MINUTES')
            //     sh './jenkins/scripts/kill.sh'
            //     }
            //Deploy Di AWS EC2
            withCredentials([sshUserPrivateKey(credentialsId: 'ec2-key', keyFileVariable: 'private-key', usernameVariable: 'ec2-user')]) {
                sh 'ssh -i \"$private-key\" -o StrictHostKeyChecking=no $ec2-user@54.179.63.68 echo "Testing SSH"'
            }
            // sshagent(['ec2-key']) {
            //     
            //     // sh 'ssh -o StrictHostKeyChecking=no -l ec2-user@54.179.63.68 docker pull bagaspm12/submission-react-app'
            //     // sh 'ssh -o StrictHostKeyChecking=no -l ec2-user@54.179.63.68 docker stop submission'
            //     // sh 'ssh -o StrictHostKeyChecking=no -l ec2-user@54.179.63.68 docker rm submission'
            //     // sh 'ssh -o StrictHostKeyChecking=no -l ec2-user@54.179.63.68 docker run -d -p 3000:3000 bagaspm12/submission-react-app'
            //     }
            }
        }
    // }