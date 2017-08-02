# ARouter

[![CI Status](http://img.shields.io/travis/RogerAbyss/ARouter.svg?style=flat)](https://travis-ci.org/RogerAbyss/ARouter)
[![Version](https://img.shields.io/cocoapods/v/ARouter.svg?style=flat)](http://cocoapods.org/pods/ARouter)
[![License](https://img.shields.io/cocoapods/l/ARouter.svg?style=flat)](http://cocoapods.org/pods/ARouter)
[![Platform](https://img.shields.io/cocoapods/p/ARouter.svg?style=flat)](http://cocoapods.org/pods/ARouter)

- [x] App之间互相跳转
- [x] App根据后台参数全局跳转
- [x] 动态修改属性方式,不用修改代码 
- [ ] 路由策略以及算法优化性能

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

ARouter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ARouter"
```

## Usage

设置scheme,默认为 **test**, 代表我只处理形如``test://xxx``的url,否则我给系统。
```
APP_ROUTER.scheme = @"<!-Replace Me->";
```

自检
```
[ARouter selfChecking];
```
Then, Do things under protocol
默认的protocol如下

### push

```
[scheme]://push?target=[target*taget*...]&info=[param]&[param]
```

**你需要设置APP_ROUTER.nav**

* 跳转
```
[scheme]://push?target=[ViewControlleClassName]
```

* 跳转(传递简单参数)
```
[scheme]://push?target=[ViewControlleClassName]&a=1&b=2
```

* 跳转(复杂参数)
```
[scheme]://push?target=[ViewControlleClassName]&info=[jsonstring]
```

* 多级跳转(只有last能接受参数,如果中间需要传递参数请移步protocol chain)
```
// * 分割
[scheme]://push?target=[ViewControlleClassName*ViewControlleClassName*ViewControlleClassName]&info=[jsonstring]
```

## Author

RogerAbyss, roger_ren@qq.com

## License

ARouter is available under the MIT license. See the LICENSE file for more info.
