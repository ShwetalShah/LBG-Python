pipeline {
	agent any
	
	environment {
		old_version = "1"
		version = "2"
		PORT = "9000"
	}

	stages {
		stage('build') {
			steps {
				sh 'sudo chmod +x build.sh scripts/*.sh'
				sh './build.sh'
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
				'''
			}
		}
		stage('push image') {
			steps {
				sh 'docker push gcr.io/lbg-mea-12/python-app:agray-v${version}'
			}
		}
	}
	post {
		always {
			sh './scripts/cleanup.sh'
			cleanWs()
		}
	}
}

