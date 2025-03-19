pipeline {
    agent any
    parameters {
        string(name: 'profile_name', defaultValue: 'prod', description: 'dev:开发环境 sit:内部测试环境 user-test：用户测试环境 prod：生产环境 zb:灾备环境')
    }

    environment {

        //START**********************基础环境变量，每个项目均需要修改*****************

        project_name="cnce-sc-prepose"
        project_version="3.0.0"
        //docker服务名称
        docker_service_name="settlement-prepose"
        //项目源码git地址
        git_project_url = "http://118.5.50.1/cnce/settlement/cnce-settlement-center.git"
        //构建镜像服务器 （ip,port,username,password,docker-compose配置文件所在路径）
        app_build_server= "128.6.106.130,22,root,5K@b7Qz2&8X#,/data/config/dockerfile"
        //运行服务器  多个用竖线分割（ip,port,username,password,docker-compose配置文件所在路径）
        app_runtime_servers= "128.6.106.122,22,root,5K@b7Qz2&8X#,/data/config/business|128.6.106.123,22,root,5K@b7Qz2&8X#,/data/config/business"
        //服务备份地址 多个用竖线分割（ip,port,username,password,备份文件名称）
        app_bak_servers="118.2.20.5,22,zkr,Zkr123!@#,/CodeBak/sc-prepose.war"

        //END**********************基础环境变量，每个项目均需要修改*****************
        //git凭据ID
        GIT_ACCESS_KEY = "git-cnce-own"
    }
    stages {

        stage('拉取源码') {
            steps {
                //拉取项目
                git credentialsId: "${GIT_ACCESS_KEY}", url: "${git_project_url}"
            }

        }
      stage('更新结算内部引用包') {
        steps{
          sh """
                sed -i 's#<url>.*</url>#<url>${"http://101.35.227.2:8081/repository/maven-releases/"}</url>#g' ./pom.xml
                    cd ./cnce-sc-base
                    mvn clean  deploy
                    cd ../cnce-sc-base-vo
                    mvn clean  deploy
                    cd ../cnce-sc-base-service
                    mvn clean  deploy
                    cd ../cnce-sc-sdk
                    mvn clean  deploy
               """
        }

    }
        stage('编译项目') {
            steps{
                sh """
                cd ./cnce-sc-prepose
                   sed -i 's#active:.*#active: ${params.profile_name}#g'  ./src/main/resources/application.yml

                   mvn clean package -P${params.profile_name} -Dmaven.test.skip=true
                   """
            }

        }
        stage('发布项目') {
            steps{
                    script {
                        def nexus_url_map=[
                                            "dev": "http://repo.zqyy.natapp1.cc",
                                            "sit": "http://18.18.1.35:8081",
                                            "user-test": "http://172.20.30.2:8081",
                                            "prod": "http://128.6.106.137:8081",
                                            "zb": "http://118.1.10.15:8081"
                                          ]
                        nexus_url = nexus_url_map.get(params.profile_name)+"/repository/maven-releases/"
                }
                sh """
                    sed -i 's#<url>.*</url>#<url>${nexus_url}</url>#g' ./pom.xml
                    cd ./cnce-sc-prepose
                    mvn deploy -P${params.profile_name}
                   """
            }

        }
        stage('构建发布镜像') {
            steps{
                script {
                    def appBuildServerSplit=app_build_server.split(",")
                    def imageTag = docker_service_name.replaceAll("-","_")
                    def remote = [:]
                    remote.name = appBuildServerSplit[0]
                    remote.host = appBuildServerSplit[0]
                    remote.port = appBuildServerSplit[1].toInteger()
                    remote.allowAnyHosts = true
                    remote.user = appBuildServerSplit[2]
                    remote.password = appBuildServerSplit[3]
                    def dockerComposePath=appBuildServerSplit[4]
                    sshCommand remote: remote, command: """
                    cd ${dockerComposePath}
                    docker-compose build --no-cache ${docker_service_name}
                    docker-compose push ${docker_service_name}
                    # 标注tag版本，构建新的tag版本号，用于恢复 4.0.${BUILD_NUMBER}#g
                    sed -i 's#${imageTag}_tag=.*#${imageTag}_tag=4.0.${BUILD_NUMBER}#g' ${dockerComposePath}/.env
                    docker-compose build --no-cache ${docker_service_name}
                    docker-compose push ${docker_service_name}
                    sed -i 's#${imageTag}_tag=.*#${imageTag}_tag=latest#g' ${dockerComposePath}/.env
                    """
                }
            }
        }
        stage('更新容器服务') {
            steps{
                script {
                    for(app_runtime_server in app_runtime_servers.tokenize("|")){
                        def appRuntimeServerSplit=app_runtime_server.split(",")
                        def remote = [:]
                        remote.name = appRuntimeServerSplit[0]
                        remote.host = appRuntimeServerSplit[0]
                        remote.port = appRuntimeServerSplit[1].toInteger()
                        remote.allowAnyHosts = true
                        remote.user = appRuntimeServerSplit[2]
                        remote.password = appRuntimeServerSplit[3]
                        def dockerComposePath=appRuntimeServerSplit[4]
                        sshCommand remote: remote, command: """
                            cd ${dockerComposePath}
                             //拉取最新镜像
                            docker-compose pull ${docker_service_name}
                            //停止服务
                            docker-compose stop ${docker_service_name}
                            //删除原容器
                            docker-compose rm -f ${docker_service_name}
                            //启动新服务
                            docker-compose up -d ${docker_service_name}
                        """
                    }
                }
            }
        }
        // 网络不通，暂不使用
       // stage('备份发布包') {
       //     steps{
       //         script {
       //                 for(app_bak_server in app_bak_servers.tokenize("|")){
       //                             def appBakServerSplit=app_bak_server.split(",")
       //                             def remote = [:]
       //                             remote.name = appBakServerSplit[0]
       //                             remote.host = appBakServerSplit[0]
       //                             remote.port = appBakServerSplit[1].toInteger()
       //                             remote.allowAnyHosts = true
       //                             remote.user = appBakServerSplit[2]
       //                             remote.password = appBakServerSplit[3]
       //                             def bakFilePath=appBakServerSplit[4]
       //                             sshPut remote: remote, from: "./target/${project_name}-${project_version}-${params.profile_name}.war", into: "${bakFilePath}",override: true
       //                         }
       //                 }
       //         }
       // }

        stage('构建发布灾备私服') {
            steps{
                script {
                    def zb_nexus_url="http://118.1.10.15:8081/repository/maven-releases/"
                    //构建并发布灾备war包
                    sh  """
                            sed -i 's#active:.*#active: zb#g'  ./cnce-sc-prepose/src/main/resources/${params.profile_name}/application.yml
                            sed -i 's#<url>.*</url>#<url>${zb_nexus_url}</url>#g' ./pom.xml
                            cd ./cnce-sc-prepose
                            mvn clean install deploy -Pzb
                        """
                }
            }
        }
    }

}
