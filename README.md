# Spring Boot DevOps on Kubernetes

**基于Kubernetes的Spring Boot DevOps项目实战**

### 涉及相关技术栈
|      |                      Public                      | Private                                         | Note                                        |
| ---- | :----------------------------------------------: | ----------------------------------------------- | ------------------------------------------- |
| 1    |                        /                         | VS code、skaffold                               |                                             |
| 2    |                        /                         | Docker                                          |                                             |
| 3    |                        /                         | JIRA                                            |                                             |
| 4    |                        /                         | Confluence                                      |                                             |
| 5    |                        /                         | **Terraform**、Ansible                          | Infrastructure as Code                      |
| 6    |        Azure AKS、Amazon EKS、Google GCP         | **Kubeadm**、Minikube、Kind、Kops、Openshift3.X | kubernetes                                  |
| 7    |                    **Github**                    | **Gitea**、Gogs、Gitlab                         | Git                                         |
| 8    | **Github Actions**、<br/>**Travis-CI**、CircleCI | **Jenkins**、Gitlab-CI                          | Continuous Integration                      |
| 9    |                        /                         | **Maven**、Gradle                               |                                             |
| 10   |                        /                         | **Nexus3**、JFrog Artifactory                   |                                             |
| 11   |                  **Dockerhub**                   | **Harbor**                                      | Registry                                    |
| 12   |                  **SonarCloud**                  | **SonarQube**                                   |                                             |
| 13   |                        /                         | **Helm**、**ArgoCD**、FluxCD                    | GitOps、Continuous Delivery                 |
| 14   |                        /                         | **ArgoRollouts**、**Spinnaker**、Flagger        | Progressive Delivery、Continuous Deployment |
| 15   |                        /                         | Selenium                                        |                                             |
| 16   |                        /                         | Jmeter                                          |                                             |
| 17   |                        /                         | Istio                                           | Service Mesh                                |
| 18   |                        /                         | EFK（Elasticsearch+Fluentd+Kibana）             | Logging                                     |
| 19   |                        /                         | **Prometheus && Alertmanager**                  | Monitoring && Alerting                      |
| 20   |                        /                         | **Skywalking**                                  | APM（Application Performance Management）   |
| 21   |                        /                         | Sentry                                          |                                             |

## DevOps ToolChain
（图）

## User Guide

1. 提前安装好Jenkins，并且安装好kubernetes Plugin。

2. 安装好Kubernets集群，需要创建一个sa（[admin-rbac.yaml](https://github.com/hbstarjason/springboot-devops-demo/blob/master/jenkins/admin-rbac.yaml)）

3. 在Jenkins里新建Pipeline Job，填写上git地址：[springboot-devops-demo](https://github.com/hbstarjason/springboot-devops-demo)，“脚本地址”填写：jenkins/Jenkinsfile，保存执行Job，第一次Pipeline可能会报错，没关系，然后再次执行Job，填写上镜像仓库的相关信息。

4. 等待脚本自动运行完成CI部分。脚本会执行如下步骤：

   - Kubernetes Plugin 会在kubernetes集群上自动启动一个pod作为jenkins slave，这个pod启动后，会再自动启动多个container进行工作，执行完毕后，这个pod会自动被删除回收。
   - 第1个container是maven，根据checkout的git代码，进行maven pacakge。
   - 第2个container是docker，根据之前build出来的jar包进行docker build，docker push。
   - 第3个container是kubectl，执行kubectl apply -f  *.yaml，目前已注释。
   - 第4个container是Helm，只执行Helm version，其他已注释。
   - 暂时缺少自动化测试步骤。（Jmeter、Selenium）
   - 其他container，随意可增加……

5. CD部分有多种选择。

   - 直接通过kubectl或者Helm完成CD。（比较简单，不推荐！）

   - 通过ArgoCD进行GitOps完成CD。（Spinnaker亦可，FluxCD亦可）

   - 灰度发布有多种选择：

     a）通过Argo rollouts自动进行Canary、Blue/Green。

     b）通过Spinnaker+Promethues进行自动化Canary Analysis。

     c）通过Flagger+Nginx ingress/istio+Promethues进行自动化Canary。

6. SRE部分。

   - Logging，EFK（Elasticsearch+Fluentd+Kibana）
   - Monitoring && Alerting，Prometheus && Alertmanager
   - APM（Application Performance Management），Skywalking
   - Sentry

### 本地环境食用方法：

- 使用Skaffold。

```bash
# 安装kubernetes集群（此处省略）

# 安装openjdk-8-jdk环境
$ sudo apt-get update
$ sudo apt-get install openjdk-8-jdk -y

$ git clone https://github.com/hbstarjason/springboot-devops-demo && \
  cd springboot-devops-demo
$ mvn -B clean package -DskipTests
$ skaffold dev  

# 直接能看到运行结果
```

- 直接使用kubectl。

  ```bash
  $ git clone https://github.com/hbstarjason/springboot-devops-demo && \
    cd springboot-devops-demo
  $ kuebctl create ns springboot-devops-demo
  $ kubectl apply -f springboot-devops-demo.yaml -n springboot-devops-demo  
  ```

- 使用Helm。

  ```bash
  $ git clone https://github.com/hbstarjason/springboot-devops-demo && \
    cd springboot-devops-demo
  $ kubectl create ns springboot-devops-demo
  $ helm version
  version.BuildInfo{Version:"v3.2.4", GitCommit:"0ad800ef43d3b826f31a5ad8dfbb4fe05d143688", GitTreeState:"clean", GoVersion:"go1.13.12"}
  $ helm install springboot-devops-demo  ./charts/ -f ./charts/values.yaml --namespace springboot-devops-demo
  ```

  

## History

- 2020-8-12，增加利用Github Actions自动安装Minikube，并采用Helm部署至Minikube进行验证测试。
- 2020-7-20，完善ReadMe，增加使用Helm在本地环境直接运行。
- 2020-7-15，增加本地开发环境食用方法，采用Skaffold。
- 2020-7-15，增加使用ArgoCD部分。
- 2020-7-14，完善ReadMe，增加User Guide。
- 2020-7-11，增加利用Github Actions 自动发布到Heroku，访问地址：https://springboot-devops-demo.herokuapp.com/
- 2020-5-8，增加Travis-CI部分，集成SonarCloud。
- Missing……

## Reference 

>待定 1  
>待定 2  
>待定 3     


