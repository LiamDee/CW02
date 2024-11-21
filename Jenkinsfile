pipeline {
	agent any
	environment {
		DOCKERHUB_CREDS = credentials('docker')
	}

    stages {
        
        stage('Build Image') {
            steps {
                sh 'docker image build --tag liamdee/cw2-server:1.0 .'
            }
        }

        stage('Testing Image') {
            steps {
                sh 'docker image inspect liamdee/cw2-server:1.0'
                sh 'echo "Tests successful"'
            }
        }

        stage('Log into DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin'
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh ' docker image push liamdee/cw2-server:1.0'
            }
        }

	stage('Deploy to Kubernetes') {
		steps {
			sshagent(['jenkins-k8s-ssh-key']) {
				sh ''
                    script {
                        sh "ssh jenkins@ip-172-31-20-71 'kubectl create deployment cw2-server --image=liamdee/cw2-server:1.0'"
                        sh "ssh jenkins@ip-172-31-20-71 'kubectl expose deployment/cw2-server --type='NodePort' --port 8080 --name node-port-service'"
                    }
			}
		}
	}
    }
}
