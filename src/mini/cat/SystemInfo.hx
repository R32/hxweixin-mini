package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.getSystemInfoSync.html
*/
@:native("wx")
extern class SystemInfo {
	var brand(default, never): String;         // 设备品牌
	var model(default, never): String;         // 设备型号
	var pixelRatio(default, never): Float;     // 设备像素比
	var screenWidth(default, never): Int;      // 屏幕宽度，单位px
	var screenHeight(default, never): Int;     //
	var windowWidth(default, never): Int;      // 可使用窗口宽度，单位px
	var windowHeight(default, never): Int;     //
	var statusBarHeight(default, never): Int;  // 状态栏的高度，单位px
	var language(default, never): String;      // 微信设置的语言
	var version(default, never): String;       // 微信设置的语言
	var system(default, never): String;        // 操作系统及版本
	var platform(default, never): String;      // 客户端平台
	var fontSizeSetting(default, never): Int;  // 用户字体大小（单位px）以微信客户端「我-设置-通用-字体大小」中的设置为准
	var SDKVersion(default, never): String;    // 客户端基础库版本
	var benchmarkLevel(default, never): Int;   // 设备性能等级(仅Android小游戏), 该值越高，设备性能越好
	var albumAuthorized(default, never): Bool;              // 允许微信使用相册的开关（仅 iOS 有效）
	var cameraAuthorized(default, never): Bool;             // 允许微信使用摄像头的开关
	var locationAuthorized(default, never): Bool;           // 允许微信使用定位的开关
	var microphoneAuthorized(default, never): Bool;         // 允许微信使用麦克风的开关
	var notificationAuthorized(default, never): Bool;       // 允许微信通知的开关
	var notificationAlertAuthorized(default, never): Bool;  // 允许微信通知带有提醒的开关（仅 iOS 有效）
	var notificationBadgeAuthorized(default, never): Bool;  // 允许微信通知带有标记的开关（仅 iOS 有效）
	var notificationSoundAuthorized(default, never): Bool;  // 允许微信通知带有声音的开关（仅 iOS 有效）
	var bluetoothEnabled(default, never): Bool;             // 蓝牙的系统开关
	var locationEnabled(default, never): Bool;              // 地理位置的系统开关
	var wifiEnabled(default, never): Bool;                  // Wi-Fi 的系统开关

	@:native("getSystemInfo") static function get(obj:SFC<SystemInfo>):Void;
	@:native("getSystemInfoSync") static function getSync():SystemInfo;
}
