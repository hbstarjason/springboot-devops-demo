# Spring Boot DevOps on Kubernetes

基于Kubernetes的Spring Boot DevOps项目实战

## 涉及相关技术栈
|      |                    Public                     | Private                             | Note                                        |
| ---- | :-------------------------------------------: | ----------------------------------- | ------------------------------------------- |
| 1    |                       /                       | VS code                             |                                             |
| 2    |                       /                       | Docker                              |                                             |
| 3    |                       /                       | JIRA                                |                                             |
| 4    |                       /                       | Confluence                          |                                             |
| 5    |                       /                       | Ansible、Terraform                  | Infrastructure as Code                      |
| 6    |             Azure AKS、Amazon EKS             | Kubeadm、Kops、Openshift3.X         | kubernetes                                  |
| 7    |                    Github                     | Gitlab、Gogs                        | Git                                         |
| 8    | Github Actions、<br/>Travis-CI、<br/>CircleCI | Gitlab-CI、Jenkins                  | Continuous Integration                      |
| 9    |                       /                       | Maven、Gradle                       |                                             |
| 10   |                       /                       | Nexus3、JFrog Artifactory           |                                             |
| 11   |                   Dockerhub                   | Harbor                              |                                             |
| 12   |                  SonarCloud                   | SonarQube                           |                                             |
| 13   |                       /                       | ArgoCD、FluxCD                      | GitOps、Continuous Delivery                 |
| 14   |                       /                       | Jmeter                              |                                             |
| 15   |                       /                       | Selenium                            |                                             |
| 16   |                       /                       | ArgoRollouts、Spinnaker             | Progressive Delivery、Continuous Deployment |
| 17   |                       /                       | Istio                               | Service Mesh                                |
| 18   |                       /                       | EFK（Elasticsearch+Fluentd+Kibana） | Logging                                     |
| 19   |                       /                       | Prometheus && Alertmanager          | Monitoring && Alerting                      |
| 20   |                       /                       | Skywalking                          | APM（Application Performance Management）   |
| 21   |                       /                       | Sentry                              |                                             |

## DevOps ToolChain
（图）

## User Guide

1. 提前安装好Jenkins，并且安装好kubernetes Plugin。

2. 安装好Kubernets集群，需要创建一个sa（[admin-rbac.yaml](https://github.com/hbstarjason/springboot-devops-demo/blob/master/jenkins/admin-rbac.yaml)）

3. 在Jenkins里新建Pipeline Job，填写上git地址：https://github.com/hbstarjason/springboot-devops-demo，“脚本地址”填写：jenkins/Jenkinsfile，保存执行Job，第一次Pipeline可能会报错，没关系，然后再次执行，填写上镜像仓库的地址。

4. 等待脚本自动运行完成CI部分。脚本会执行如下步骤：

   - Kubernetes Plugin 会在kubernetes集群上自动启动一个pod作为jenkins slave，这个pod启动后，会自动启动多个container进行工作，执行完毕后，这个pod会自动被删除回收。
   - 第1个container是maven，根据checkout的git代码，进行maven pacakge。
   - 第2个container是docker，根据之前的build出来的jar包进行docker build，docker push。
   - 第3个container是kubectl，执行kubectl apply -f  *.yaml，目前已注释。
   - 第4个container是Helm，执行Helm version，其他已注释。
   - 暂时缺少自动化测试步骤。（Jmeter、Selenium）
   - 其他container，随意可增加……

5. CD部分有多种选择。

   - 直接通过kubectl或者Helm完成CD。（比较简单，不推荐！）

   - 通过Argo CD进行GitOps完成CD。（spinnaker亦可，FluxCD亦可）

   - 灰度发布有多种选择：

     a）通过Argo rollouts自动进行Canary、Blue/Green。

     b）通过Spinnaker+promethues进行自动化Canary Analysis。

     c）通过Flagger+nginx ingress/istio+promethues进行自动化Canary。

6. SRE部分。

   - Logging，EFK（Elasticsearch+Fluentd+Kibana）
   - Monitoring && Alerting，Prometheus && Alertmanager
   - APM（Application Performance Management），Skywalking
   - Sentry

## History

- 2020-7-14，完善ReadMe，增加User Guide。
- 2020-7-11，增加利用Github Actions 自动发布到Heroku，访问地址：https://springboot-devops-demo.herokuapp.com/
- missing……

## Reference 

>待定 1  
>待定 2  
>待定 3     


