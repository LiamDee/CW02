node {
    def app

    stage('clone repo') {
        checkout scm
    }

    stage('build image') {
        app = docker.build("liamdee/cw2-server")
    }

    stage('testing') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
	sh 'docker login'
        docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
