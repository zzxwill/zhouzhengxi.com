# Palindrome Number

Posted on July 18, 2022

---

Convert a palindrome number to a string.

```go
import (
    "strings"
    "strconv"
)

func isPalindrome(x int) bool {
    y := strconv.Itoa(x)
    splited := strings.Split(y, "")
    z := make([]string, len(splited))
    i := len(splited) - 1
    for i >= 0 {
        z = append(z, splited[i])
        i -= 1
    }
    strV := strings.Join(z, "")
    if y == strV {
        return true
    }
    return false
}
```