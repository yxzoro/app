## uniapp
### 熟悉uniapp框架的使用 = vue + mui
```
uniapp for all web/andriod/ios/wechat/ multi-platform develop.

原理: 
无论那个平台,上层ui层全部使用web/vue框架开发,
每个平台自己的原生能力/sdk接口函数则一对一地由uniapp封装成js的接口函数,再分平台调用即可.

###############################################################################
每个平台的设备api都被集成进了每个平台自己的增强版webview(也就是dcloud的H5+runtime)里面了,
app打包时会选择对应平台的增强版webview作为引擎来执行上层的web代码,各自集成不同平台的设备api.
(dcloud增强版webview的开源代码: https://github.com/dcloudio/H5P.Android 安卓版)

也就是说,上层ui只需要采用web技术写页面,下层设备api可直接调用webview接口,统一了跨端开发.
如此,什么平台都可以接过来啊...这比混合开发还要简单 => 等于就是用vue写web页面开发了!!!!

这种增强版webview跨端开发方案的优点:
1.完全可以跨所有端!只需要为各自平台实现一个集成设备api的webview引擎即可.(不是难事)
2.完全可以复用各种好用的web前端开发的框架/轮子...
  什么vue/react/echart/three.js等等web框架全部可以拿来直接用啊!!
  因为这个增强版webview本身就是个浏览器环境啊!这也是加速开发的最大的好处吧!!
这是真正做到了一套web代码,跨所有端...而且以后也不会过时,来一个平台接一个平台.
###############################################################################
```

```
Vue使用OOP的思想来写前端页面上的各种组件:
先从OOP角度思考解构页面成各组件对象,再挨个实现组件对象,最后组合起来.

Vue的推荐开发方式:
先解构你的web app页面,把一个页面拆分成各个组件对象(样式[css]+功能[js]的单个组件),
然后实现各个组件本身:
把一个组件需要的h5+css+js代码封装到一起,使其具有静态样式+动态功能,
该组件的一切属性+行为都封装在该段代码conponent.vue内.
每个组件有自己的一套实现逻辑,都是独立而完整的对象,
然后,使用这一个个组件拼出完整的页面.
一般也是一个div就是一块区域,或者一个div一个组件,div内部各种h5组件摆放.
Vue的这种设计/开发方式就是组件化+OOP.

**把复杂的东西拆分成一个个小而简单的东西,每个组件本身又简单而完整且实用**

你可以封装出各种各样的你设计的组件,甚至写出个组件框架来,以后就直接使用自己封装的常用组件就行了
这就是扩展h5本身的组件啊!!比如基于<button>自己写个<MyButton>来用,但是是增强版的button...
这样的开发方式太好用了太爽了!
```

#### 页面内嵌webview的开发技巧
```
使用webview组件可以把web相关的轮子都直接拿过来用!
什么地图/视频播放器/图表等等功能,直接拿过来用(自己写是写不出来的)!
无论安卓/ios/小程序,直接内嵌一个webview,然后就可以引入web端可复用的N多轮子!
而涉及到平台的api(如拍照/播放音乐等)再分别调用平台api即可.

问题: 
凡所有的web端能使用的轮子框架,在webview里面都能正常使用吗?是不是有些需要浏览器支持的?
```

#### 混合开发
```
这种模式又称为Hybrid开发，现在很多App都用这种模式去开发，
常见的有微信、淘宝、美团、爱奇艺等知名移动应用等。
国内也有很多公司使用Hybrid模式去开发平台，供开发者使用，
像Dcloud、AppCan、Inoic等，基本上都是参考Cordova衍生出的混合开发框架。

这类框架主要原理就是将APP的一部分需要动态变动的内容通过H5来实现，
通过原生的网页加载控件WebView (Android)或WKWebView（ios）来加载，H5部分是可以随时改变而不用发版，
这样就解决了动态化的需求，同时，由于h5代码只需要一次开发，就能同时在Android和iOS两个平台运行，
这也可以减小开发成本，我们称这种h5+原生的开发模式为混合开发。
采用混合模式开发的APP我们称之为混合应用或Hybrid APP。

由于原生开发可以访问平台所有功能，而混合开发中，h5代码是运行在WebView中，
而WebView实质上就是一个浏览器内核，其JavaScript依然运行在一个权限受限的沙箱中，
所以对于大多数系统能力都没有访问权限，如无法访问文件系统、不能使用蓝牙等。
所以，对于H5不能实现的功能，都需要原生去做。
而混合框架一般都会在原生代码中预先实现一些访问系统能力的API， 然后暴露给WebView以供JavaScript调用，
这样一来，WebView就成为了JavaScript与原生API之间通信的桥梁，主要负责JS与原生之间传递调用消息，
而消息的传递必须遵守一个标准的协议，它规定了消息的格式与含义，
我们把依赖于WebView的用于在JS与原生之间通信并实现了某种消息传输协议的工具称之为
WebView JavaScript Bridge, 简称 JsBridge，它也是混合开发框架的核心。

混合应用的优点是动态内容是H5，使用web技术栈就可以开发，社区及资源丰富，
缺点是性能不好,对于复杂用户界面或动画,webview性能不够(这里说的是web app,需要加载服务端页面所以慢)
(只需要让webview加载的是本地的代码,速度就不慢了,但同时也失去了web app动态加载的优点.在于取舍)
```

#### 使用uniapp的开发/调试方式
```
1.第一步是app/小程序的UI原型设计,每个页面/组件先设计好,产品本身的业务逻辑都想清楚了,再动手写
2.然后先创建h5应用(为了方便调试),写好每个页面(设备api调用部分先mock即可),h5项目也方便使用npm包
3.页面全都完成好了后,再重新创建对应平台的项目(小程序/app),直接覆盖页面文件夹(/pages),
4.然后加入真实的设备api的调用部分,调试/完善设备调用的功能接口,
5.最终,功能+页面,完整的产品就出来了.
(其实调设备api正如web项目中调后端api一样,页面先写好,再接入api.即前后端独立并行开发模式.)
```


[大前端](https://juejin.im/post/5c7217d9518825620b452809)


