# 每天学一点-go-语言-075-data-race

Posted on Mar 9 2021

---

开发 CRD controller，遇到了

data race
--- FAIL: TestWorkloaddefinition (12.12s)

7850Error:    testing.go:965: race detected during execution of test



最终通过减慢两次 reconciler 的时间解决的