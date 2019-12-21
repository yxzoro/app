# 跨端开发app框架
```
跨端开发app技术:
1.flutter
2.uniapp

二者的跨端原理类似:
flutter底层有一个dart绘图引擎,负责渲染出上层ui(用dart写),并且集成了不同平台的设备api.
uniapp底层有一个webview浏览器引擎,负责渲染出上层ui(用web写),并且集成了不同平台的设备api.

当然这里还有一个区别就是: dart绘图引擎 和 webview浏览器引擎 的区别
  dart绘图引擎是由google自家实现的统一标准,
  而webview在android和ios平台是各自实现的浏览器引擎,会有些浏览器兼容性问题(web前端固有的问题).

优缺点:
1.flutter的dart编译成二进制且dart绘图引擎性能很好,flutter的性能>=原生性能!
  flutter框架本身就自带了vue+mui的效果,即是mvvm框架又是ui框架,还有原生性能!
  flutter是google推出,必然引领跨端开发的未来!
  flutter其实也可以支持所有端,每个端实现一个dart绘图引擎即可.(但不会专门支持中国小程序的)
  * flutter的缺点只有一个: 不支持中国微信推出的小程序.

1.uniapp的webview引擎执行web代码,webview的性能 < 原生 <= flutter,但是足够用(业务类app)!
  uniapp搭配vue+mui这2个框架,也是mvvm+ui框架.
  uniapp是国内dcloud推出,在国内开发者使用量也挺多.
  uniapp可最大化复用现有的各种web端的框架/轮子,因为webview就是浏览器啊.
  uniapp支持所有端,也支持小程序.每个端实现一个增强版webview即可了.
  * uniapp的缺点只有一个: 性能不如flutter,但是对于普通业务类app足够了.  
```
