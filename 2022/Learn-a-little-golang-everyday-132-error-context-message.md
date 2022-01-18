# Learn-a-little-golang-everyday-132-error-context-message

Posted on Jan. 18, 2022

---
Context message is the message wrapped in an error.


```
errors.Wrap(err, "failed to prepare Terraform backend configuration")
```

How to get the context message?

```
if err != nil && strings.Contains(err.Error(), ":") &&  strings.Split(err.Error(), ":")[0] != errGitHubBlockedNotBoolean{
  ...
}
```
