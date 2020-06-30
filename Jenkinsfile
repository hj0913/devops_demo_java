pipeline {
    agent any

    stages {
        //拉取代码
        stage('scm') {
            steps {
                script {
                    git credentialsId: 'hj0913', url: 'git@github.com:hj0913/devops_demo_java.git'
                }
            }
        }

        //构建打包
        stage('package') {
            steps {
                script {
                    withMaven(jdk: 'jdk8', maven: 'M3') {
                        sh "mvn clean package -Dmaven.test.skip=true"
                    }
                }
            }
        }

        //构建上传镜像
        stage('docker') {
            steps {
                script {
                    docker.withRegistry('https://ccr.ccs.tencentyun.com', 'TECENT_DOCKER_REGISTRY') {
                        def devops = docker.build("ccr.ccs.tencentyun.com/docker_devops/devops-demo-java:1.0.0", "-f ./Dockerfile .")
                        devops.push()
                    }
                }
            }
        }

        //拉取镜像 拉起服务
        stage("deploy") {
            steps {
                script {
                    docker.withRegistry('https://ccr.ccs.tencentyun.com', 'TECENT_DOCKER_REGISTRY') {
                        sh "docker run -p 8082:8080 -d --name=devops-demo-java ccr.ccs.tencentyun.com/docker_devops/devops-demo-java:1.0.0"
                    }
                }
            }
        }
    }
}
