# Learn-a-little-Kubernetes-everyday-100-kubernetes-short-name

Posted on Apri. 17, 2022

---



>type
// +kubebuilder:resource
categoriesstringpathstringscopestringshortNamestringsingularstring
configures naming and scope for a CRD.
shortName=[]string
specifies aliases for this CRD.
Short names are often used when people have work with your resource over and over again. For instance, “rs“ for “replicaset“ or “crd“ for customresourcedefinition.

Accept values like:

shortName=abc

shortName={abc,def}
