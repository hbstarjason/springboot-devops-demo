Argo CD 安装请猛击：[Argocd-install.md](https://github.com/hbstarjason/Continuous-Deploy/blob/master/Argocd-install.md)

使用Argo CD自动部署本项目：

- 使用Argo CLI自动部署

```bash
####### 提前安装好Argo CD
####### 提前下载好Argo CLI

# 查看当前集群
$ ./argocd-linux-amd64 cluster list 
SERVER                                                                      NAME      STATUS      MESSAGE
https://kubernetes.default.svc                                                        Successful  

# 添加本项目
$ ./argocd-linux-amd64 app create springboot-devops-demo \
  --repo https://github.com/hbstarjason/springboot-devops-demo.git \
  --path argocd \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace springboot-devops-demo

## --revision master  
## --sync-policy automated  
## --auto-prune

# 部署本项目
$ ./argocd-linux-amd64 app sync springboot-devops-demo
# 开启--sync-policy automated，此步骤可省略

# 查看并验证
$ ./argocd-linux-amd64 app list

### 登录UI查看
```

- 使用CRD自动部署

  ```bash  
  $ kubectl create ns springboot-devops-demo
  $ kubectl apply -f  springboot-devops-demo-argocd.yaml
 
  ```

  
