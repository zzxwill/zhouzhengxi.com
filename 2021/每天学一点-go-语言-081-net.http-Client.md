# 每天学一点-go-语言-081-net.http-Client

Posted on April 8. 2021

---

http.Client 可以传入 request 参数，这样就可以设置 `Accept`。

```go
func main()  {
  october, _ := time.Parse(time.RFC3339,"2020-09-30T23:59:59Z")

  var no int
  var t float64

  for _, i := range []int{1,2,3,4,5,6,7,8,9,10} {
     url:= fmt.Sprintf("https://api.github.com/repos/oam-dev/kubevela/pulls?state=closed&sort=created&per_page=100&page=%d", i)
     client := &http.Client{}
     req, _ := http.NewRequest("GET", url, nil)
     req.Header.Set("Accept", "application/vnd.github.v3+json")
     res, _ := client.Do(req)
     var data []byte
     data, err := io.ReadAll(res.Body)
     if err != nil {
        fmt.Println(err)
     }

     //fmt.Println(res.Body.Read(data))
     // fmt.Println(string(data))

     var prs []PR
     err = json.Unmarshal(data, &prs)
     if err != nil {
        fmt.Println(err)
     }

     for _, i := range prs {
        if i.User.Login == "zzxwill" {
           fmt.Println(i.Title,i.CreatedAt, i. ClosedAt)
           cr, _ := time.Parse(time.RFC3339,i.CreatedAt)
           if cr.Sub(october).Hours() < 0 {
              continue
           }

           //fmt.Println(err)
           cl, _ := time.Parse(time.RFC3339,i.ClosedAt)
           t += cl.Sub(cr).Hours()
           no++
        }
     }
  }
  fmt.Println(no)
  fmt.Println(t)

}
```

