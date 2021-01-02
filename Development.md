# How to develop this blog with docsify

[Docsify](https://docsify.js.org/) is a magical documentation site generator.

## Plugins

These are the plugins which are used in this site.

- [docsify-sidebar-collapse](https://github.com/iPeng6/docsify-sidebar-collapse)
  
  折叠左侧菜单


## Docsify tips
- 为文章添加日期
  [index.html](./index.html) 里添加日期格式：
  
  `formatUpdated: '{MM}/{DD}/{YYYY} {HH}:{mm}:{ss}',`

  在 Markdown 里通过 `{docsify-updated}` 使用，可以查看范例——[每天学一点-go-语言043-Getwd.md](./2021/每天学一点-go-语言043-Getwd.md)


- 页面无法滑动
  页面超出一屏，无法上线滑动，解决方法，参加 [issue](https://github.com/docsifyjs/docsify/issues/411)。