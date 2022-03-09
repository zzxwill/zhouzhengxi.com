# Learn-a-little-golang-everyday-135-gomonkey-magic

Posted on Mar. 9, 2022

---

Gomonkey is a very useful tool to fake the execution of a function.

```go

package monkey

import (
  "strings"
  "testing"

  . "github.com/agiledragon/gomonkey/v2"

  "github.com/zzxwill/try-cloudnative/try-cue/monkey/say"
)

const haha = "Haha..."



func TestStringToUpper(t *testing.T) {
   patches := ApplyFunc(strings.ToUpper, func(s string) string {
       return haha
   })
   defer patches.Reset()
   output := strings.ToUpper("hello")
   if output != haha {
       t.Errorf("Expected %s, got %s", haha, output)
   }
}


```
