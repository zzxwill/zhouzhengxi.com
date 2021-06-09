# 每天学一点-go-语言-103-where-to-init-common-variables-in-ginkgo-test

Posted on Jun 9, 2021

---


Ginkgo/Gomega 公用的变量放在哪里?

> In general, the only code within a container block should be an It block or a BeforeEach/JustBeforeEach/JustAfterEach/AfterEach block, or closure variable declarations. It is generally a mistake to make an assertion in a container block.
It is also a mistake to initialize a closure variable in a container block. If one of your Its mutates that variable, subsequent Its will receive the mutated value. This is a case of test pollution and can be hard to track down. Always initialize your variables in BeforeEach blocks.
https://onsi.github.io/ginkgo/
