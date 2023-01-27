# Learn-a-little-golang-everyday-141-closures-goroutine.md

Posted on Jan. 27, 2023

---

## A problem

```go
package main

import "fmt"

func main() {
	done := make(chan bool)

	values := []string{"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r",
		"s", "t", "u", "v", "w", "x", "y", "z"}
	for _, v := range values {
		go func() {
			fmt.Println(v)
			done <- true
		}()
	}

	for range values {
		<-done
	}
}

```

The execution result is as below.

```text
GOROOT=/Users/bytedance/go/go1.19.1 #gosetup
GOPATH=/Users/bytedance/go #gosetup
API server listening at: 127.0.0.1:61009
debugserver-@(#)PROGRAM:LLDB  PROJECT:lldb-1400.0.38.13
 for arm64.
Got a connection, launched process /private/var/folders/b1/0fd1b6hs7lz0fm_mh346lybm0000gn/T/GoLand/___go_build_github_com_zzxwill_go_learning (pid = 5436).
h
z
z
z
z
z
z
z
z
z
z
z
z
z
z
z
z
z
z
z
z
z
z
z
z
z
Exiting.

Debugger finished with the exit code 0


```

We can see that the output is not as expected. And also noted not all the output is `z` , one of them are `h`.

## Why?

[https://go.dev/doc/faq#closures_and_goroutines](https://go.dev/doc/faq#closures_and_goroutines)


## Differences between `go func` and closures goroutine

Use `go func` to create a goroutine.

```go
package main

import "time"

var values = make([]int, 0)

func add(i int) {
	values = append(values, i)
}

func main() {
	for i := 0; i < 5; i++ {
		go add(i)
	}

	time.Sleep(10 * time.Second)
	for _, v := range values {
		println(v)
	}
}

```

```text
# result
1
0
3
2
4
```

Use closures goroutine to create a goroutine.

```go
package main


func main() {
	for i := 0; i < 5; i++ {
		go func(j int) {
			add(j)
		}(i)
	}


}

```

```text
# result
1
0
2
3
4
```

Seems there is no difference between `go func` and closures goroutine.
