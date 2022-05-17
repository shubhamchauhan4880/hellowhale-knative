pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('Docker_hub_passs')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t shubhamchauhan4880/nodeapp:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push shubhamchauhan4880/nodeapp:latest'
			}
		}
	}
	
		stage('Deploy App') {
      			steps {
       				script {
         				 kubernetesDeploy(configs: "hellowhale.yml", kubeconfigId: "mykubeconfig")
      					  }
      				}
   					 }

	post {
		always {
			sh 'docker logout'
		}
	}

}
