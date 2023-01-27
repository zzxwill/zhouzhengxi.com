# Learn-a-little-golang-everyday-143-slice-go-queue

Posted on Jan. 27, 2023

---

I implemented a [Go queue using slice](https://github.com/zzxwill/go-queue/blob/master/slice-queue/queue.go).

But it's goroutine unsafe.

```go
func TestGorountineSafe(t *testing.T) {
	q := SliceQueue{}
	for i := 0; i < 10; i++ {
		go q.Push(i)
	}
	time.Sleep(5 * time.Second)
	t.Log("q.Len() = ", q.Len())
	for {
		t.Log(q.Pop())
		if q.Len() == 0 {
			break
		}
	}
	fmt.Println()
}
```

The push items are not orderly stored.

```github
GOROOT=/Users/bytedance/go/go1.19.1 #gosetup
GOPATH=/Users/bytedance/go #gosetup
/Users/bytedance/go/go1.19.1/bin/go test -c -o /private/var/folders/b1/0fd1b6hs7lz0fm_mh346lybm0000gn/T/GoLand/___TestGorountineSafe_in_github_com_zzxwill_go_queue_slice_queue.test -gcflags all=-N -l github.com/zzxwill/go-queue/slice-queue #gosetup
/Users/bytedance/go/go1.19.1/bin/go tool test2json -t /private/var/folders/b1/0fd1b6hs7lz0fm_mh346lybm0000gn/T/dlvLauncher.sh /Applications/GoLand.app/Contents/plugins/go/lib/dlv/macarm/dlv --listen=127.0.0.1:50759 --headless=true --api-version=2 --check-go-version=false --only-same-user=false exec /private/var/folders/b1/0fd1b6hs7lz0fm_mh346lybm0000gn/T/GoLand/___TestGorountineSafe_in_github_com_zzxwill_go_queue_slice_queue.test -- -test.v -test.paniconexit0 -test.run ^\QTestGorountineSafe\E$
=== RUN   TestGorountineSafe
    queue_test.go:101: q.Len() =  10
    queue_test.go:103: 9
    queue_test.go:103: 0
    queue_test.go:103: 1
    queue_test.go:103: 2
    queue_test.go:103: 3
    queue_test.go:103: 4
    queue_test.go:103: 5
    queue_test.go:103: 6
    queue_test.go:103: 7
    queue_test.go:103: 8

--- PASS: TestGorountineSafe (5.00s)
PASS

Debugger finished with the exit code 0

```

Working on it.
