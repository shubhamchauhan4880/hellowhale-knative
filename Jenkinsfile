pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('Docker_hub_passs')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t anmolseth007/nodeapp:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push anmolseth007/nodeapp:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
