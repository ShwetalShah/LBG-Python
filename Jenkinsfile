pipeline {
	agent any
	
	environment {
		version = "v1"
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
		stage('run unit tests') {
			steps {
				sh '''
				python3 -m venv venv
				sudo chmod +x venv/bin/activate
				./venv/bin/activate
				pip3 install -r requirements.txt
				python3 lbg.test.py
				python3 -m behave ./features/restapp.feature
				'''
			}
		}
	}
	post {
		always {
			sh 'docker-compose down --rmi all'
			cleanWs()
		}
	}
}

