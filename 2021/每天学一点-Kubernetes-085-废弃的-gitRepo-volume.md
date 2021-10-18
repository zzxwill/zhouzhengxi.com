# 每天学一点-Kubernetes-085-废弃的-gitRepo-volume

Posted on Oct. 18, 2021

---


gitRepo 是一种磁盘类型
https://kubernetes.io/docs/concepts/storage/volumes/#gitrepo

已经 deprecated 了。

>Warning: The gitRepo volume type is deprecated. To provision a container with a git repo, mount an EmptyDir into an InitContainer that clones the repo using git, then mount the EmptyDir into the Pod's container.

替代方案：

```
v1.Container{
  Name:            "git-configuration",
  Image:           "alpine/git:latest",
  ImagePullPolicy: v1.PullIfNotPresent,
  Command: []string{
     "sh",
     "-c",
     fmt.Sprintf("git clone %s %s && cp -r %s/* %s", meta.RemoteGit, BackendVolumeMountPath,
        BackendVolumeMountPath, WorkingVolumeMountPath),
  },
  VolumeMounts: initContainerVolumeMounts,
})
```
