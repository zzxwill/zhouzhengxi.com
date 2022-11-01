# Try Fermyon Cloud

Posted on Nov. 1, 2022

---

I learnt from a tweet that the Fermyon Cloud is open beta and [has raised $20M in series A funding](https://www.globenewswire.com/news-release/2022/10/24/2540093/0/en/Fermyon-Gives-Developers-Instant-Self-Service-for-WebAssembly-Microservice-Application-Deployment-With-Fermyon-Cloud-Closes-20-Million-Series-A-Funding-Led-by-Insight-Partners-in-Q.html).
I'm excited to try it out.

## Try getting started
It's pretty smooth to try out the [getting started](https://developer.fermyon.com/cloud/quickstart) guide. The [Rust project](https://github.com/fermyon/cloud-start)
can be easily deployed Fermyon cloud.

![img.png](img.png)

It's easy to visit the application, and the logs are also easy to view.

## Build Spin components in Golang

[This guide](https://developer.fermyon.com/spin/go-components) shows how to build Spin components in Golang.

TinyGo can convert Golang code to WebAssembly.

```shell
$ tinygo build -wasm-abi=generic -target=wasi -no-debug -o main.wasm main.go
```

Tinygo build replies on `wasm-opt` and I fixed by installing it.

```shell
$ npm i wasm-opt -g
```

Start up the project.

```shell
➜  fermyon-demo spin up --file some-random-api.ml
Serving http://127.0.0.1:3000
Available Routes:
  tinygo-hello: http://127.0.0.1:3000/hello
```

Visit the application.

```shell
➜  ~ curl http://127.0.0.1:3000/hello
Hello Fermyon!
```

The git repo for this Golang project is [fermyon-demo](https://github.com/zzxwill/fermyon-demo).
