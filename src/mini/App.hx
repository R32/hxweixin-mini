package mini;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/reference/api/App.html
*/
@:dce
@:require(!mini_game)
class App {

	macro static public function make(opt: ExprOf<Options>, ?custom) {
		var type = mini.Macros.getPrivateType("mini.App", "Options");
		var anon = mini.Macros.mergeAnon(type, opt, custom);
		return macro js.Syntax.code("App({0})", $anon);
	}

	macro static public function get() return macro js.Syntax.code("getApp()");
}

private typedef Options = {
	// 小程序初始化完成时触发，全局只触发一次。参数也可以使用 wx.getLaunchOptionsSync 获取。
	?onLaunch: AppLaunchOptions->Void,

	// 小程序启动，或从后台进入前台显示时触发。也可以使用 wx.onAppShow 绑定监听。
	?onShow: AppLaunchOptions->Void,

	// 小程序从前台进入后台时触发。也可以使用 wx.onAppHide 绑定监听。
	?onHide: ()->Void,

	// 小程序发生脚本错误或 API 调用报错时触发。也可以使用 wx.onError 绑定监听。
	?onError: String->Void,

	// 小程序要打开的页面不存在时触发。也可以使用 wx.onPageNotFound 绑定监听。注意事项请参考 wx.onPageNotFound。
	?onPageNotFound: PageNotFoundOptions->Void,

	// 注: 开发者可以添加任意的函数或数据变量到 Object 参数中，用 this 可以访问
}
