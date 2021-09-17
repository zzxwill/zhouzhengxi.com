# 每天学一点-go-语言-119-deprecation-of-io-ioutil

Posted on Sept. 15, 2021

---

deprecated in 1.16

>Deprecation of io/ioutil
The io/ioutil package has turned out to be a poorly defined and hard to understand collection of things. All functionality provided by the package has been moved to other packages. The io/ioutil package remains and will continue to work as before, but we encourage new code to use the new definitions in the io and os packages. Here is a list of the new locations of the names exported by io/ioutil:
Discard => io.Discard
NopCloser => io.NopCloser
ReadAll => io.ReadAll
ReadDir => os.ReadDir (note: returns a slice of os.DirEntry rather than a slice of fs.FileInfo)
ReadFile => os.ReadFile
TempDir => os.MkdirTemp
TempFile => os.CreateTemp
WriteFile => os.WriteFile

https://golang.org/doc/go1.16#ioutil
