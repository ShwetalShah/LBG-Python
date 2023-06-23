pipeline {
	agent any
	
	environment {
		version = "1"
		PORT = "9000"
	}

	stages {
		stage('build') {
			steps {
				sh 'docker-compose build'
			}
		}
		stage('run container') {
                        steps {
                                sh 'docker-compose up -d'
                        }
                }

	}
}

