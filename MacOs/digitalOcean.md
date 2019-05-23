kubectl version:
```
Client Version: version.Info{Major:"1", Minor:"14", GitVersion:"v1.14.2", GitCommit:"66049e3b21efe110454d67df4fa62b08ea79a19b", GitTreeState:"clean", BuildDate:"2019-05-16T18:56:40Z", GoVersion:"go1.12.5", Compiler:"gc", Platform:"darwin/amd64"}
Server Version: version.Info{Major:"1", Minor:"14", GitVersion:"v1.14.2", GitCommit:"66049e3b21efe110454d67df4fa62b08ea79a19b", GitTreeState:"clean", BuildDate:"2019-05-16T16:14:56Z", GoVersion:"go1.12.5", Compiler:"gc", Platform:"linux/amd64"}

```


Creating a cluster using the default options is as easy as running:  
` doctl k8s cluster create example-cluster-01 `

Here's a more complete example of creating a cluster while specifying non-default options:  
```
doctl k8s cluster create \
   --region lon1 \
   --version 1.14.2-do.0 \
   --tag demo \
   --size s-2vcpu-4gb \
   --count 5 \
   --maintenance-window="tuesday=20:00" \
   --auto-upgrade \
   example-cluster-02

```

By default, the cluster's kubeconfig will be saved locally when you create it. You can grab the kubeconfig for an existing cluster using:  
```
doctl k8s cluster kubeconfig save <cluster-id|cluster-name>
```

