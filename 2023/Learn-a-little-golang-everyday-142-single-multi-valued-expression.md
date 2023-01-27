# Learn-a-little-golang-everyday-142-single-multi-valued-expression.md

Posted on Jan. 27, 2023

---

## Expression

表达式描述了值的计算，由运算对象（标识符、字面值、括号内的另一个表达式......）组成，它们被应用于运算符或函数。

> Expression describes computation of value and consists of operands (identifiers, literal, another expression between
> parentheses, …) which are applied to operators or function

字面值（literal）只表达类型的一些值，比如

`123` 就是 int 类型的 literal。

参考： https://go101.org/article/basic-types-and-value-literals.html


## Single-valued expression

单值表达式只有一个值，比如

`1 + 2` 的值是 `3`。

## Multi-valued expression

多值表达式有多个值，比如

`a, b := 1, 2` 的值是 `1` 和 `2`。


比如，`fmt.Println` 的返回值是 `n int, err error`，它的值是 `n` 和 `err`，那么函数 `fmt.Println` 的返回值就是多值表达式。
```go
 n, err := fmt.Println("abc")
```


