# extern definitions for weixin(wechat) mini-program


## Status

小程序文档: <https://developers.weixin.qq.com/miniprogram/dev/index.html>

小游戏文档: <https://developers.weixin.qq.com/minigame/dev/index.html>

##### 小程序(mini-program)  API List

- [x] 基础
  ```haxe
  import mini.cat.Debug;
  import mini.cat.AppEvent;      // 生命周期, 应用级事件
  import mini.cat.Timer;         // setTimeout, setInterval
  import mini.cat.SystemInfo;
  import mini.cat.UpdateManager;
  mini.WX.canIUse()
  ```
- [x] 路由
  ```haxe
  import mini.cat.Navigator;
  ```
- [x] 界面
  ```haxe
  import mini.cat.UI;            // 交互, 导航栏, 背景 ...
  import mini.cat.Animation;     // 动画
  mini.cat.UI.chooseMessageFile()// 原属于: 媒体-图片
  mini.cat.UI.chooseImage()      // 原属于: 媒体-图片
  mini.cat.UI.chooseVideo()      // 原属于: 媒体-视频
  ```
- [x] 网络
  ```haxe
  import mini.cat.Web;           // request, uploadFile, downloadFile,
  import mini.cat.DNS;
  import mini.cat.WebSocket;
  ```
- [x] 本地存储
  ```haxe
  import mini.cat.Storage;
  ```
- [x] 媒体
  ```haxe
  import mini.cat.Map;
  import mini.cat.Image;        // 图片
  import mini.cat.Video;        // 视频
  import mini.cat.Audio;        // 音频, 背景音频
  import mini.cat.AudioRecord;  // 录音
  import mini.cat.Live;         // 实时音视
  import mini.cat.Camera;
  ```
- [x] 位置
  ```haxe
  import mini.cat.Location;
  ```
- [x] 转发
  ```haxe
  import mini.cat.Share;
  ```
- [x] 画布
  ```haxe
  import mini.cat.Canvas;
  ```
- [x] 文件
  ```haxe
  import mini.cat.File;
  ```
- [x] 开放接口
  ```haxe
  import mini.WX;
  ```
- [x] 设备
  ```haxe
  import mini.cat.IBeacon;
  import mini.cat.WIFI;
  import mini.cat.BLE;          // 低功耗蓝牙
  import mini.cat.Bluetooth;    // 蓝牙
  import mini.cat.Contact;      // 联系人
  import mini.cat.Battery;      // 电量
  import mini.cat.Clipboard;    //
  import mini.cat.NFC;          //
  import mini.cat.NetWork;      // 网络连接状态
  import mini.cat.Screen;       // 屏幕亮度, 监听截图
  import mini.cat.PhoneCall;    // 拨打电话
  import mini.cat.Accelerometer;// 速度器
  import mini.cat.Compass;      // 罗盘
  import mini.cat.DeviceMotion; // 设备方向
  import mini.cat.Gyroscope;    // 陀螺仪
  import mini.cat.Vibrate;      // 振动
  mini.WX.onMemoryWarning()     // 内存警告监听
  mini.WX.scanCode()            // 扫码
  ```
- [x] Worker
  ```haxe
  import mini.cat.Worker;
  ```
- [x] 第三方平台
  ```haxe
  mini.WX.getExtConfigSync()
  mini.WX.getExtConfig()
  ```
- [x] WXML
  ```haxe
  import mini.cat.WXML;
  ```
- [x] 广告
  ```haxe
  import mini.cat.Ad;
  ```

<br />
<br />

##### 小游戏(mini-game) API List

**require**: `-D mini-game`

- [x] 基础
  ```haxe
  import mini.cat.Debug;
  import mini.cat.AppEvent;      // 生命周期, 应用级事件
  import mini.cat.SystemInfo;
  import mini.cat.UpdateManager;
  import mini.cat.Timer;         // setTimeout, setInterval
  import mini.game.Touch;        // 触摸事件
  import mini.game.Performance;  // 性能时间戳
  import mini.game.Res;          // 分包加载
  ```
- [x] 渲染
  ```haxe
  import mini.cat.Canvas;        // 画布
  import mini.cat.Timer;         // setPreferredFramesPerSecond, requestAnimationFrame,
  import mini.game.Res;          // loadFont, getTextLineHeight, createImage
  ```
- [x] 广告
  ```haxe
  import mini.cat.Ad;
  ```
- [x] 界面
  ```haxe
  import mini.cat.UI;            // 交互, 键盘 ...
  mini.cat.UI.chooseImage()      // 原属于: 媒体-图片
  ```
- [x] 网络
  ```haxe
  import mini.cat.Web;           // request, uploadFile, downloadFile,
  import mini.cat.WebSocket;
  ```
- [x] 转发
  ```haxe
  import mini.cat.Share;
  ```
- [x] 虚拟支付
  ```haxe
  import mini.game.Payment;
  ```
- [x] 本地存储
  ```haxe
  import mini.cat.Storage;
  ```
- [x] 媒体
  ```haxe
  import mini.cat.Audio;        // 音频
  import mini.cat.Image;        // 图片
  import mini.cat.AudioRecord;  // 录音
  import mini.cat.Video;        // 视频
  ```
- [x] 位置
  ```haxe
  import mini.cat.Location;
  ```
- [x] 文件
  ```haxe
  import mini.cat.File;
  ```
- [x] 开放接口
  ```haxe
  import mini.WX;
  import mini.game.OpenDataContext;
  ```
- [x] Worker
  ```haxe
  import mini.cat.Worker;
  ```
- [x] 设备
  ```haxe
  import mini.cat.Battery;      // 电量
  import mini.cat.Clipboard;    //
  import mini.cat.NetWork;      // 网络连接状态
  import mini.cat.Screen;       // 屏幕亮度, 监听截图, 转屏
  import mini.cat.Accelerometer;// 速度器
  import mini.cat.Compass;      // 罗盘
  import mini.cat.DeviceMotion; // 设备方向
  import mini.cat.Gyroscope;    // 陀螺仪
  import mini.cat.Vibrate;      // 振动

  mini.WX.onMemoryWarning()     // 内存警告监听
  ```


#### Notes

由于 wx 下方法太多, 因此在 haxe 中这些方法几乎被移出到了各个类, 因此如果你想要进行跳转, 则需要像下边调用:

```haxe
import mini.cat.*;

// ......
Navigator.navigateTo("path/to");
```

在编译之后, 将输出为:

```js
wx.navigateTo("path/to");
```

### Dependencies

* [haxe](https://github.com/HaxeFoundation/haxe)
