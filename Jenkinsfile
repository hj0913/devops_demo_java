pipeline {
    agent any

    stages {
        //拉取代码
        stage('scm') {
            steps {
                script {
                    git credentialsId: 'hj0913', url: 'git@github.com:hj0913/jenkinsdemo.git'
                }
            }
        }

        //构建打包
        stage('package') {
            steps {
                script {
                    withMaven(jdk: 'jdk8', maven: 'M3') {
                        sh "mvn clean test -U -Dmaven.test.failure.ignore=true"
                    }
                }
            }
        }

        //构建上传镜像
        stage('docker'){
            steps{

            }
        }

        //拉取镜像 拉起服务
        stage("deploy"){
            steps{

            }
        }
    }
}
