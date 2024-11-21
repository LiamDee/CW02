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
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@ip-172-31-21-73  'kubectl set image deployments/cw2-server cw2-server=liamdee/cw2-server:1.0'"
                    }
			}
		}
	}
    }
}
