# CF Summit Europe 2019 - Sample Chart

This repository contains the Helm Chart presented during the talk "Automated Side-by-Side development of applications for BOSH and Kubernetes" at the CF Summit Europe 2019.

## Usage

Clone the repository to get started with installing the Helm Chart on a Kubernetes cluster.

```sh
git clone https://github.com/anynines/cfeu19-sample-chart.git
cd cfeu19-sample-chart
helm install . --name=cfeu19-sample
```

The status of the Helm release can be checked using `helm status cfeu19-sample`. Once up and running, the endpoint can be called to check if the application is running.

For example, by deploying the Helm Chart on a local Kubernetes cluster provided by Docker for Desktop, the endpoint can be called by using `localhost` and the mapped port shown by `helm status cfeu19-sample` or by listing all services using `kubectl get svc`.

```sh
NAME                                TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)          AGE
cfeu19-sample-cfeu19-sample-chart   NodePort    10.103.93.2   <none>        3000:32003/TCP   6s
kubernetes                          ClusterIP   10.96.0.1     <none>        443/TCP          4d22h
```

In the example above, the mapped port is port number `32003`.
