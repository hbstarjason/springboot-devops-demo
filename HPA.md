# HPA

```bash
# https://kubernetes.io/zh/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

$ kubectl apply -f  https://raw.githubusercontent.com/hbstarjason/springboot-devops-demo/master/springboot-devops-demo.yaml
deployment.apps/springboot-devops-demo created
service/springboot-devops-demo created
ingress.extensions/springboot-devops-demo created

$ kubectl autoscale deployment springboot-devops-demo --cpu-percent=10 --min=1 --max=10
horizontalpodautoscaler.autoscaling/springboot-devops-demo autoscaled

$ kubectl get hpa 
NAME                     REFERENCE                           TARGETS         MINPODS   MAXPODS   REPLICAS   AGE
springboot-devops-demo   Deployment/springboot-devops-demo   <unknown>/10%   1         10        3          23s

$	kubectl run -i --tty load-generator --rm --image=busybox --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://springboot-devops-demo:8080; done"

$ kubectl get hpa 
NAME                     REFERENCE                           TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
springboot-devops-demo   Deployment/springboot-devops-demo   74%/10%   1         10        1          5m57s

### kubectl apply -f https://addons.kuboard.cn/metrics-server/0.3.7/metrics-server.yaml

$ kubectl get deploy
NAME                     READY   UP-TO-DATE   AVAILABLE   AGE
springboot-devops-demo   8/8     8            8           8m10s

$ kubectl get deploy
NAME                     READY   UP-TO-DATE   AVAILABLE   AGE
springboot-devops-demo   10/10   10           10          9m54s

$ kubectl get hpa 
NAME                     REFERENCE                           TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
springboot-devops-demo   Deployment/springboot-devops-demo   20%/10%   1         10        10         11m


### minikube addons list
### minikube addons enable metrics-server
### helm install stable/metrics-server
```

