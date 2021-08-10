# 每天学一点-go-语言-110-goroutine-channel

Posted on Aug 10, 2021

---

channel
## unbufferred channel
ch := make(chan int)
close(ch)

ch <- x 写
x = <- ch 读，保存结果
<-ch  读，抛弃结果

## buffered channel

ch := make(chan int, 10)
