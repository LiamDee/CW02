pipeline {
	agent any
	environment {
		DOCKERHUB_CREDDENTIALS = credentials('docker')
	}

    stages {
        
        stage('Build Image') {
            steps {
                sh 'docker image build --tag liamdee/cw2-server:1.0 .'
            }
        }

        stage('Testing Image') {
            steps {
                sh 'docker inspect -f . liamdee/cw2-server:1.0'
                sh 'echo "Tests successful"'
            }
        }

        stage('Log into DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh ' docker image push liamdee/cw2-server:1.0'
            }
        }

    //	stage('Deploy to Kubernetes') {
    //		steps {
    //			sshagent(['jenkins-k8s-ssh-key']) {
    //				sh ''
    //			}
    //		}
    //	}
    }
}
