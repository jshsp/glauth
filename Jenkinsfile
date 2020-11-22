
def notifyBuild(String buildStatus = 'STARTED', String message = '') {
  // build status of null means successful
  buildStatus =  buildStatus ?: 'SUCCESSFUL'

  // Default values
  def colorName = 'RED'
  def colorCode = '#FF0000'
  def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
  def summary = "${subject} (${env.BUILD_URL}) ${message}"

  // Override default values based on build status
  if (buildStatus == 'STARTED' || buildStatus == 'MESSAGE') {
    color = 'YELLOW'
    colorCode = '#FFFF00'
  } else if (buildStatus == 'SUCCESSFUL') {
    color = 'GREEN'
    colorCode = '#00FF00'
  } else {
    color = 'RED'
    colorCode = '#FF0000'
  }

  // Send notifications
  slackSend (color: colorCode, message: summary)
}     
pipeline {
  environment {
    COMMIT = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
    PROJECT = "redskysec"
    APP_NAME = "glauth"
    FE_SVC_NAME = "${APP_NAME}"
    CLUSTER = "jenkins-cd"
    CLUSTER_ZONE = "us-east1-b"
    IMAGE_TAG = localhost:32000/${PROJECT}-${APP_NAME}:${COMMIT}
    JENKINS_CRED = "${PROJECT}"
    ENVSPACE = "${env.APP_NAME}-${env.BRANCH_NAME}"
  }
  agent {
    kubernetes {
      //label "st2dio"
      defaultContainer 'jnlp'
      yaml """
apiVersion: v1
kind: Pod
metadata:
labels:
  component: ci
  jenkins: slave
spec:
  # Use service account that can deploy to all namespaces
  serviceAccountName: cd-jenkins
  containers:

  - name: gcloud
    image: gcr.io/cloud-builders/gcloud
    command:
    - cat
    tty: true
    volumeMounts:
  - name: kubectl
    image: gcr.io/cloud-builders/kubectl
    command:
    - cat
    tty: true
       
  - name: git
    image: gcr.io/cloud-builders/git
    command:
    - cat
    tty: true

  - name: docker
    image: docker:latest
    command:
    - cat
    tty: true
    volumeMounts:
    - mountPath: /var/run/docker.sock
      name: docker-sock
  
  volumes:
    - name: docker-sock
      hostPath:
        path: /var/run/docker.sock
"""
    }
  }

  stages {
    stage('CHECKOUT SCM') {
      steps {
        notifyBuild('checkout scm #YOLO')
      }
    }
  
   

    stage('docker build') {
      steps {
        script {
              container('docker') {   
                dir("${env.WORKSPACE}/src"){
			sh('docker build -t ${IMAGE} .')
			sh('docker push -t ${IMAGE} ')
                }
              }
              notifyBuild("Templates Done")
          }
        
      }  
   }

    stage('Finally') {
      steps {
        notifyBuild('DONE')
      }
    }
  } 
}

      
