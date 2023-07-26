# simple-node-js-react-npm-app

This repository is for the
[Build a Node.js and React app with npm](https://jenkins.io/doc/tutorials/build-a-node-js-and-react-app-with-npm/)
tutorial in the [Jenkins User Documentation](https://jenkins.io/doc/).

The repository contains a simple Node.js and React application which generates
a web page with the content "Welcome to React" and is accompanied by a test to
check that the application renders satisfactorily.

The `jenkins` directory contains an example of the `Jenkinsfile` (i.e. Pipeline)
you'll be creating yourself during the tutorial and the `scripts` subdirectory
contains shell scripts with commands that are executed when Jenkins processes
the "Test" and "Deliver" stages of your Pipeline.

# Sistematika Pengumpulan Submission

1. Link Github Repository submission adalah `https://github.com/agustinusbpm/a428-cicd-labs/tree/react-app` dengan menggunakan aplikasi `React App`
2. Saran yang diterapkan
    a. Mengganti port docker container untuk menjalankan `Grafana` dari `3030` menjadi `3031`.
    b. Mengubah port docker container untuk menjalankan `Prometheus` dari `9090` menjadi `9091`.
    c. Melakukan Deployment Ke Cloud Provider dengan mekanisme `Jenkins, Prometheus, dan Grafana: Localhost; Aplikasi: Amazon EC2.`
3. IP Address Publik yang digunakan aplikasi di Amazon EC2 adalah `54.179.63.68` public dns `ec2-54-179-63-68.ap-southeast-1.compute.amazonaws.com`
4. Langkah-langkah dalam deployment ke cloud provider adalah:
    a. Build Image di Docker localhost menggunakan `dockerfile` ketika menjalankan pipeline stage `Build`
    b. Push Image ke Registry Docker hub.
    c. Pull Image dari Registry Docker Hub ke AWS EC2 pada stage `Deploy` setelah proses deploy di lokal selama 1 menit.
    d. Pada AWS EC2, terinstall nginx yang berguna untuk reverse proxy dari port 3000 ke port 80.
5. Referensi yang diambil adalah
    a. https://www.dicoding.com/academies/428/discussions/267450
    b. https://jennykibiri.hashnode.dev/jenkins-pipeline-to-build-and-deploy-a-frontend-application-on-aws-ec2