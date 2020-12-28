---
title: "每天学一点 Go 语言|28. 解读 rand"
date: "2020-11-04"
---

## random

<table class=""><tbody><tr><td><strong>func</strong> <strong>generateRandomString</strong>(length <strong>int</strong>) (<strong>string</strong>, error) {<br>&nbsp; baseChars := "abcdefghijklmnopqrstuvwxyz" + "0123456789"<br>&nbsp; <strong>var</strong> bytes = make([]<strong>byte</strong>, length)<br><br>&nbsp; <strong>if</strong> _, err := rand.Read(bytes); err != nil {<br>&nbsp; &nbsp; <strong>return</strong> "", err<br>&nbsp; }<br>&nbsp; <strong>for</strong> i, b := <strong>range</strong> bytes {<br>&nbsp; &nbsp; bytes[i] = baseChars[b%<strong>byte</strong>(len(baseChars))]<br>&nbsp; }<br>&nbsp; <strong>return</strong> <strong>string</strong>(bytes), nil<br>}</td></tr></tbody></table>

rand.Read(bytes) 是怎么将数据写入 bytes 的？

它调用了 io.ReadFull(Reader, b)

Reader 是怎么来的？

https://golang.org/pkg/io/#ReadFull

// Reader is a global, shared instance of a cryptographically

// secure random number generator.

//

// On Linux and FreeBSD, Reader uses getrandom(2) if available, /dev/urandom otherwise.

// On OpenBSD, Reader uses getentropy(2).

// On other Unix-like systems, Reader reads from /dev/urandom.

// On Windows systems, Reader uses the CryptGenRandom API.

// On Wasm, Reader uses the Web Crypto API.  

getrandom() 是 Linux 系统调用，他从 _/dev/urandom_ 设备里获取随机字符串

https://man7.org/linux/man-pages/man2/getrandom.2.html

所以，bytes 里对随机字符串就是这么来的。

“%” 是取余操作，其余就比较好理解了。
