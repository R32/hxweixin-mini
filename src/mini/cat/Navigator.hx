package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.switchTab.html
*/
@:native("wx")
extern class Navigator {
	// 跳转到 tabBar 页面，并关闭其他所有非 tabBar 页面
	static function switchTab( r:RoutingURL):Void;
	// 关闭所有页面，打开到应用内的某个页面
	static function reLaunch(  r:RoutingURL):Void;
	// 关闭当前页面，跳转到应用内的某个页面。但是不允许跳转到 tabbar 页面。
	static function redirectTo(r:RoutingURL):Void;
	// 保留当前页面，跳转到应用内的某个页面。但是不能跳到 tabbar 页面。使用 wx.navigateBack 可以返回到原页面。小程序中页面栈最多十层。
	static function navigateTo(r:RoutingURL):Void;
	// 关闭当前页面，返回上一页面或多级页面。可通过 getCurrentPages 获取当前的页面栈，决定需要返回几层。
	static function navigateBack(r: {delta:Int} & SFC<ErrMsg>):Void;
}

private typedef RoutingURL = {url:String} & SFC<ErrMsg>;