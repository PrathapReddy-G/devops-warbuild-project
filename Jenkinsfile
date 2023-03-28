pipeline
{
	agent any
	tools
	{
	maven "maven"
	}
	stages{
		stage('Code Checkout'){
			steps{
				git branch: 'main', url: 'https://github.com/PrathapReddy-G/devops-warbuild-project.git'

			}
		}
		stage('Execute Maven'){
			steps{
				sh 'mvn package'
			}
		}

		stage('War Deploy into Nexus'){
			steps{
				sh 'mvn deploy'
			}
		}


		stage("Copying the War file to Job Location"){
			steps{
				sh '/root/.jenkins/workspace/warfile-pipeline-project/target/*.war /root/.jenkins/workspace/warfile-pipeline-project/' 

		}
	}
	    stage("Docker Image Build"){
			steps{
			sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID . '
			}
	             }
	   stage("Docker Image taging"){
			steps{
			sh 'docker image tag $JOB_NAME:v1.$BUILD_ID gprathapreddy/$JOB_NAME:v1.$BUILD_ID'
			
		}

		}
		stage("push Image: DOCKERHUB"){
             steps{

                withCredentials([string(credentialsId: 'DockerPassword', variable: 'DockerPassword')]) {
                sh 'docker login -u gprathapreddy -p ${DockerPassword}'
                sh 'docker image push gprathapreddy/$JOB_NAME:v1.$BUILD_ID'
                
              }
         }
      }
	}
}



