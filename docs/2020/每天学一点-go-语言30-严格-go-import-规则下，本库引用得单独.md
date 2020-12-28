---
title: "每天学一点 Go 语言|30. 严格 go import 规则下，本库引用得单独放到最下方"
date: "2020-11-18"
tags: 
  - "golang"
---

## import

import (

  "context"

  "encoding/json"

  "testing"  

  "github.com/crossplane/crossplane-runtime/apis/core/v1alpha1"

  runtimev1alpha1 "github.com/crossplane/crossplane-runtime/apis/core/v1alpha1"

  "github.com/crossplane/crossplane-runtime/pkg/fieldpath"

  "github.com/crossplane/crossplane-runtime/pkg/test"

  "github.com/google/go-cmp/cmp"

  "github.com/google/go-cmp/cmp/cmpopts"

  "github.com/pkg/errors"

  "github.com/stretchr/testify/assert"

  v1 "k8s.io/api/apps/v1"

  metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

  "k8s.io/apimachinery/pkg/apis/meta/v1/unstructured"

  "k8s.io/apimachinery/pkg/runtime"

  "k8s.io/apimachinery/pkg/types"

  "k8s.io/apimachinery/pkg/util/intstr"

  clientgoscheme "k8s.io/client-go/kubernetes/scheme"

  "sigs.k8s.io/controller-runtime/pkg/client"  

  "github.com/crossplane/oam-kubernetes-runtime/apis/core"

  "github.com/crossplane/oam-kubernetes-runtime/apis/core/v1alpha2"

  "github.com/crossplane/oam-kubernetes-runtime/pkg/oam"

  "github.com/crossplane/oam-kubernetes-runtime/pkg/oam/mock"

  "github.com/crossplane/oam-kubernetes-runtime/pkg/oam/util"

)  

当前库——github.com/crossplane/oam-kubernetes-runtime，要单独放到最下面
