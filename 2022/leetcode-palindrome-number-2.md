# Palindrome Number (Solution 2)

Posted on July 18, 2022

---

Instead of converting a palindrome number to a string, reverse it in bits. It will take less time.


<table class=""><colgroup><col><col><col><col><col></colgroup><thead class="ant-table-thead"><tr><th class="time-column__1guG"><span class="ant-table-header-column"><div><span class="ant-table-column-title">Time Submitted</span><span class="ant-table-column-sorter"></span></div></span></th><th class="status-column__3SUg"><span class="ant-table-header-column"><div><span class="ant-table-column-title">Status</span><span class="ant-table-column-sorter"></span></div></span></th><th class="runtime-column__1ka_"><span class="ant-table-header-column"><div><span class="ant-table-column-title">Runtime</span><span class="ant-table-column-sorter"></span></div></span></th><th class="memory-column__1dxp"><span class="ant-table-header-column"><div><span class="ant-table-column-title">Memory</span><span class="ant-table-column-sorter"></span></div></span></th><th class="lang-column__tR-8"><span class="ant-table-header-column"><div><span class="ant-table-column-title">Language</span><span class="ant-table-column-sorter"></span></div></span></th></tr></thead><tbody class="ant-table-tbody"><tr class="ant-table-row ant-table-row-level-0" data-row-key="750013529"><td class="time-column__1guG">07/18/2022 14:23</td><td class="status-column__3SUg"><a href="/submissions/detail/750013529/" target="_blank" class="ac__35gz" data-submission-id="750013529">Accepted</a></td><td class="runtime-column__1ka_">16 ms</td><td class="memory-column__1dxp">6.7 MB</td><td class="lang-column__tR-8">golang</td></tr><tr class="ant-table-row ant-table-row-level-0" data-row-key="750012750"><td class="time-column__1guG">07/18/2022 14:22</td><td class="status-column__3SUg"><a href="/submissions/detail/750012750/" target="_blank" class="error__B-Nx" data-submission-id="750012750">Wrong Answer</a></td><td class="runtime-column__1ka_">N/A</td><td class="memory-column__1dxp">N/A</td><td class="lang-column__tR-8">golang</td></tr><tr class="ant-table-row ant-table-row-level-0" data-row-key="750012515"><td class="time-column__1guG">07/18/2022 14:22</td><td class="status-column__3SUg"><a href="/submissions/detail/750012515/" target="_blank" class="error__B-Nx" data-submission-id="750012515">Wrong Answer</a></td><td class="runtime-column__1ka_">N/A</td><td class="memory-column__1dxp">N/A</td><td class="lang-column__tR-8">golang</td></tr><tr class="ant-table-row ant-table-row-level-0" data-row-key="748920929"><td class="time-column__1guG">07/17/2022 07:58</td><td class="status-column__3SUg"><a href="/submissions/detail/748920929/" target="_blank" class="ac__35gz" data-submission-id="748920929">Accepted</a></td><td class="runtime-column__1ka_">32 ms</td><td class="memory-column__1dxp">7 MB</td><td class="lang-column__tR-8">golang</td></tr></tbody></table>

```go
import (
    "strings"
)

func isPalindrome(x int) bool {
    if x < 0 {
		return false
	}
    
    var reversedBits []int
    var keepX = x
    for {
        reversedBits = append(reversedBits, x % 10)
        x /= 10
        if x == 0 {
            break
        }
    }
    
    y := 0
    for _, b := range reversedBits {
        y = y * 10 + b
    }
    
    return keepX == y
}
```