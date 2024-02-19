# Go 1.22.0 is released

Posted on Feb. 19, 2024

---

I was about to upgrade a dependent library and noticed it was downgrading the lib.

```shell
$ go get downgraded xxx.org/xxx/xxx/v2@v2.1.1-release-fix9
go: downgraded xxx.org/xxx/xxx/v2 v2.1.1 => v2.1.1-release-fix9
```

It finds the tag `v2.1.1-release-fix9` is older than `v2.1.1` per [Semantic Versioning 2.0.0](https://semver.org/#spec-item-11).

```text
Example: 1.0.0-alpha < 1.0.0-alpha.1 < 1.0.0-alpha.beta < 1.0.0-beta < 1.0.0-beta.2 < 1.0.0-beta.11 < 1.0.0-rc.1 < 1.0.0.
```