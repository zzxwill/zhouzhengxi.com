# 每天学一点-Kubernetes-042-开发-Job

Posted on Apr. 20 2021

---

Job 开发

job 开发非常不友好，很难进入容器，调试时，开发时建议用 Deployment 替代

```
workingVolume := v1.Volume{Name: configurationName}
workingVolume.EmptyDir = &v1.EmptyDirVolumeSource{}

configMapVolumeSource := v1.ConfigMapVolumeSource{}
configMapVolumeSource.Name = tfInputConfigMapsName
inputTFConfigurationVolume := v1.Volume{Name: InputTFConfigurationVolumeName}
inputTFConfigurationVolume.ConfigMap = &configMapVolumeSource

//deploy := corev1.Deployment{
// TypeMeta: metav1.TypeMeta{
//    Kind:       "Deployment",
//    APIVersion: "apps/v1",
// },
// ObjectMeta: metav1.ObjectMeta{
//    Name:      configurationName,
//    Namespace: req.Namespace,
//    OwnerReferences: []metav1.OwnerReference{{
//       APIVersion: configuration.APIVersion,
//       Kind:       configuration.Kind,
//       Name:       configurationName,
//       UID:        configuration.UID,
//       Controller: pointer.BoolPtr(false),
//    }},
// },
// Spec: corev1.DeploymentSpec{
//    Selector: &metav1.LabelSelector{
//       MatchLabels: map[string]string{"name": "poc"},
//    },
//    Template: v1.PodTemplateSpec{
//       ObjectMeta: metav1.ObjectMeta{
//          Labels: map[string]string{"name": "poc"},
//       },
//       Spec: v1.PodSpec{
//          Containers: []v1.Container{{
//             Name:    configurationName,
//             Image:   TerraformImage,
//             ImagePullPolicy: v1.PullAlways,
//             Command: []string{
//                "bash",
//                "-c",
//                fmt.Sprintf("cp %s/* . && terraform init && terraform apply -auto-approve && tail -f /dev/null", InputTFConfigurationVolumeMountPath),
//          },
//             VolumeMounts: []v1.VolumeMount{
//                {
//                   Name:      InputTFConfigurationVolumeName,
//                   MountPath: InputTFConfigurationVolumeMountPath,
//                },
//             },
//             Env: envs,
//          }},
//          Volumes:       []v1.Volume{workingVolume, inputTFConfigurationVolume},
//          RestartPolicy: v1.RestartPolicyAlways,
//       },
//    },
// },
//}
//
//if err := r.Client.Create(ctx, &deploy); err != nil {
// return ctrl.Result{}, err
//}
//return ctrl.Result{}, nil

var parallelism int32 = 1
var completions int32 = 1
job := batchv1.Job{
  TypeMeta: metav1.TypeMeta{
     Kind:       "Job",
     APIVersion: "batch/v1",
  },
  ObjectMeta: metav1.ObjectMeta{
     Name:      configurationName,
     Namespace: req.Namespace,
     OwnerReferences: []metav1.OwnerReference{{
        APIVersion: configuration.APIVersion,
        Kind:       configuration.Kind,
        Name:       configurationName,
        UID:        configuration.UID,
        Controller: pointer.BoolPtr(false),
     }},
  },
  Spec: batchv1.JobSpec{
     Parallelism: &parallelism,
     Completions: &completions,
     Template: v1.PodTemplateSpec{
        Spec: v1.PodSpec{
           //InitContainers: []v1.Container{{
           // Name:    "prepare-input-terraform-configurations",
           // Image:   "busybox",
           // Command: []string{"sh", "-c", fmt.Sprintf("cp -r %s/* %s", InputTFConfigurationVolumeMountPath, workingVolumeMountPath)},
           // VolumeMounts: []v1.VolumeMount{
           //    {
           //       Name:      configurationName,
           //       MountPath: workingVolumeMountPath,
           //    },
           //    {
           //       Name:      InputTFConfigurationVolumeName,
           //       MountPath: InputTFConfigurationVolumeMountPath,
           //    },
           // },
           //}},
           Containers: []v1.Container{{
              Name:            configurationName,
              Image:           TerraformImage,
              ImagePullPolicy: v1.PullAlways,
              Command: []string{
                 "bash",
                 "-c",
                 fmt.Sprintf("cp %s/* %s && terraform init && terraform apply -auto-approve", InputTFConfigurationVolumeMountPath, workingVolumeMountPath),
              },
              VolumeMounts: []v1.VolumeMount{
                 {
                    Name:      InputTFConfigurationVolumeName,
                    MountPath: InputTFConfigurationVolumeMountPath,
                 },
              },
              Env: envs,
           }},
           Volumes:       []v1.Volume{workingVolume, inputTFConfigurationVolume},
           RestartPolicy: v1.RestartPolicyNever,
        },
     },
  },
}



```