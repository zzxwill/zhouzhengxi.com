---
title: "每天学一点 Go 语言|13. testing 和 ginkgo 测试框架"
date: "2020-07-31"
---

# 测试

## testing

<table class=""><tbody><tr><td><strong>package</strong> test<br><br><strong>import</strong> (<br>"os"<br>"os/exec"<br>"path"<br>"testing"<br><br>"sigs.k8s.io/controller-runtime/pkg/client"<br>"sigs.k8s.io/controller-runtime/pkg/client/config"<br>)<br><br><strong>var</strong> (<br>rudrPath, _ = os.Getwd()<br>)<br><br><strong>func</strong> <strong>createKubernetesClient</strong>() (client.Client, error) {<br>c, err := client.New(config.GetConfigOrDie(), client.Options{})<br><br><strong>return</strong> c, err<br>}<br><br><strong>func</strong> <strong>TestCreateKubernetesClient</strong>(t *testing.T) {<br>_, err := createKubernetesClient()<br><strong>if</strong> err != nil {<br>t.Errorf("Failed to create a Kubernetes client: %s", err)<br>}<br>}<br><br><em>// TestBuildCliBinary is to build rudr binary.</em><br><strong>func</strong> <strong>TestBuildCliBinary</strong>(t *testing.T) {<br>rudrPath, err := os.Getwd()<br>mainPath := path.Join(rudrPath, "../../cmd/rudrx/main.go")<br><strong>if</strong> err != nil {<br>t.Errorf("Failed to build rudr binary: %s", err)<br>}<br><br>cmd := exec.Command("go", "build", "-o", path.Join(rudrPath, "rudr"), mainPath)<br><br>stdout, err := cmd.Output()<br><strong>if</strong> err != nil {<br>t.Errorf("Failed to build rudr binary: %s", err)<br>}<br>t.Log(stdout, err)<br><br><em>// TODO(zzxwill) If this failed, all other test-cases should be terminated</em><br><br>}<br><br><strong>func</strong> <strong>Command</strong>(name <strong>string</strong>, arg ...<strong>string</strong>) *<strong>exec</strong>.<strong>Cmd</strong> {<br>commandName := path.Join(rudrPath, name)<br><strong>return</strong> exec.Command(commandName, arg...)<br>}<br><br><strong>func</strong> <strong>TestTraitsList</strong>(t *testing.T) {<br>cmd := Command("rudr", []<strong>string</strong>{"traits", "list"}...)<br>stdout, err := cmd.Output()<br>t.Log(<strong>string</strong>(stdout), err)<br><strong>if</strong> err != nil {<br>t.Errorf("Failed to list traits: %s", err)<br>}<br><br>}</td></tr></tbody></table>

## ginkgo

它宣称是 BDD 「行为驱动开发」模式的测试。

<table class=""><tbody><tr><td><strong>var</strong> _ = ginkgo.Describe("Component", <strong>func</strong>() {<br>&nbsp; ginkgo.Context("run", <strong>func</strong>() {<br>&nbsp; &nbsp; ginkgo.It("should print successful creation information", <strong>func</strong>() {<br>&nbsp; &nbsp; &nbsp; &nbsp; cli := fmt.Sprintf("rudr run containerized %s -p 80 nginx:1.9.4", applicationName)<br>&nbsp; &nbsp; &nbsp; &nbsp; output, err := rudr.Exec(cli)<br>&nbsp; &nbsp; &nbsp; &nbsp; gomega.Expect(err).NotTo(gomega.HaveOccurred())<br>&nbsp; &nbsp; &nbsp; &nbsp; gomega.Expect(output).To(gomega.ContainSubstring("SUCCEED"))<br>&nbsp; &nbsp; })<br>&nbsp; })<br><br>&nbsp; ginkgo.Context("delete", <strong>func</strong>() {<br>&nbsp; &nbsp; ginkgo.It("should print successful deletion information", <strong>func</strong>() {<br>&nbsp; &nbsp; &nbsp; &nbsp; cli := fmt.Sprintf("rudr delete %s", applicationName)<br>&nbsp; &nbsp; &nbsp; &nbsp; output, err := rudr.Exec(cli)<br>&nbsp; &nbsp; &nbsp; &nbsp; gomega.Expect(err).NotTo(gomega.HaveOccurred())<br>&nbsp; &nbsp; &nbsp; &nbsp; gomega.Expect(output).To(gomega.ContainSubstring("DELETE SUCCEED"))<br>&nbsp; &nbsp; })<br>&nbsp; })<br>})</td></tr></tbody></table>

## 测试框架比较

<table class=""><tbody><tr><td><br></td><td>testing</td><td>ginkgo</td><td><br></td></tr><tr><td>复杂程度</td><td>容易</td><td>比较复杂，需要跟 gomega 配合，调用的方法不好区分是哪个库</td><td><br></td></tr><tr><td>判断 case paas/failed</td><td>手工</td><td>简单，有提供框架</td><td><br></td></tr><tr><td>test case 归类</td><td>难</td><td>容易</td><td><br></td></tr><tr><td><br></td><td><br></td><td><br></td><td><br></td></tr><tr><td><br></td><td><br></td><td><br></td><td><br></td></tr><tr><td><br></td><td><br></td><td><br></td><td><br></td></tr></tbody></table>
