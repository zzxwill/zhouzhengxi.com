# Learn-a-little-golang-everyday-140-mock-test

Posted on Nov. 18, 2022

---

## Background

To write mock tests, [Gomonkey](https://github.com/agiledragon/gomonkey) is so easy to use.

But the [permission issue](https://github.com/agiledragon/gomonkey/issues/70) is so annoying on macOS including Intel chip
and M1 chip. So I have to find an alternative.

## GoMock VS Testify

There is a great guid on [GoMock](https://betterprogramming.pub/a-gomock-quick-start-guide-71bee4b3a6f1).

> Both frameworks can only mock for interfaces, so we need to organize code dependencies behind interfaces.

I find it's so difficult to understand the example in the [repo](https://github.com/golang/mock) at the first glance.

Besides, there are more starts in [Testify repo](https://github.com/stretchr/testify) and it's more popular, so I choose
Testify as an alternative to Gomonkey.

## A simple example

In the section `A Mocking Example` of [the doc](https://tutorialedge.net/golang/improving-your-tests-with-testify-go/),
there is a simple guide to use Testify.

But if your target function returns a complicated struct, like this:

```go
func def()

func (c *ABC) GetMembers(ctx context.Context, name string) ([]*org.Member, error) {
}
```
Then you need to mock the return value as below.

```go
func (c *MockABC) GetMembers(ctx context.Context, name string) ([]*org.Member, error) {
	args := m.Called(ctx, name)
	return args.Get(0).([]*org.Member), args.Error(1)
}

```






