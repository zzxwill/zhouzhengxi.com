# Learn-a-little-Kubernetes-everyday-097-klog-level

Posted on Mar. 9, 2022

---

klog level

https://github.com/kubernetes/community/blob/master/contributors/devel/sig-instrumentation/logging.md

```github
logContent := buf.String()
- klog.Info("pod logs", "Pod", pod.Name, "Logs", logContent)
+ klog.V(4).Info("pod logs", "Pod", pod.Name, "Logs", logContent)
```

The default level is 2, so normally level 4 klog won’t be printed.

To enable level 4 klog, you can add `-v 4` in the arguments when you run main.go.



