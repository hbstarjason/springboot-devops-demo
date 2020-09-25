```bash
$ export GHUSER="hbstarjason"
$ export GHREPO="springboot-devops-demo"

$ export DOCKERSERVER="https://index.docker.io/v1/"
$ export DOCKERREPO="hbstarjason"
$ export DOCKERPASS="XXXXX"
$ export DOCKEREMAIL="XXXXXX"

$ kubectl create secret docker-registry hbstarjason \
    --docker-server=${DOCKERSERVER} \
    --docker-username=${DOCKERREPO} \
    --docker-password=${DOCKERPASS} \
    --docker-email=${DOCKEREMAIL}
    
$ git clone https://github.com/hbstarjason/springboot-devops-demo && \
   cd springboot-devops-demo/kaniko

$ kubectl apply -f build.yaml
job.batch/kaniko created
```

