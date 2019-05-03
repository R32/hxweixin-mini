package mini;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/reference/api/Page.html
*/
@:dce
@:require(!mini_game)
class Page {

	var route(default,never):String;

	extern function setData(d:Dynamic, ?callb:()->Void);

	macro static public function make(opt: ExprOf<Options>, ?custom) {
		var type = mini.Macros.getPrivateType("mini.Page", "Options");
		var anon = mini.Macros.mergeAnon(type, opt, custom);
		return macro js.Syntax.code("Page({0})", $anon);
	}

	macro static public function getCurrentPages() return macro js.Syntax.code("getCurrentPages()");
}

private typedef Options = {
	//
	?data: Dynamic,

	// 页面加载时触发。一个页面只会调用一次，可以在 onLoad 的参数中获取打开当前页面路径中的 query 参数。
	?onLoad: QueryData->Void,

	// 页面显示/切入前台时触发。
	?onShow: ()->Void,

	// 页面初次渲染完成时触发。一个页面只会调用一次，代表页面已经准备妥当，可以和视图层进行交互。
	// 使用 this.setData 重设数据后, 如果 WXML 内有被引用的数据, 将再次触发这里
	// 注意：对界面内容进行设置的 API 如wx.setNavigationBarTitle，请在onReady之后进行
	?onReady: ()->Void,

	// 页面隐藏/切入后台时触发。 如 wx.navigateTo 或底部 tab 切换到其他页面，小程序切入后台等。
	?onHide: ()->Void,

	// 页面卸载时触发。如wx.redirectTo或wx.navigateBack到其他页面时。
	?onUnload: ()->Void,

	/**
	 监听用户下拉刷新事件。
	 - 需要在app.json的window选项中或页面配置中开启enablePullDownRefresh。
	 - 可以通过wx.startPullDownRefresh触发下拉刷新，调用后触发下拉刷新动画，效果与用户手动下拉刷新一致。
	 - 当处理完数据刷新后，wx.stopPullDownRefresh可以停止当前页面的下拉刷新。
	*/
	?onPullDownRefresh: ()->Void,

	/**
	 监听用户上拉触底事件。
	 - 可以在app.json的window选项中或页面配置中设置触发距离onReachBottomDistance。
	 - 在触发距离内滑动期间，本事件只会被触发一次。
	*/
	?onReachBottom: ()->Void,

	/**
	 监听用户滑动页面事件。
	*/
	?onPageScroll: ({scrollTop: Float})->Void,

	/**
	 监听用户点击页面内转发按钮（<button> 组件 open-type="share"）或右上角菜单“转发”按钮的行为，并自定义转发内容。
	 - 注意：只有定义了此事件处理函数，右上角菜单才会显示“转发”按钮
	*/
	?onShareAppMessage: ({
		from: String,
		target: Dynamic,
		webViewUrl: String,
	})->{                    // 此事件处理函数需要 return 一个 Object，用于自定义转发内容，返回内容如下：
		?title: String,        // 转发标题, 默认为当前小程序名称
		?path: String,         // 转发路径, 默认为当前页面 path ，必须是以 / 开头的完整路径
		?imageUrl: String,
	},

	/**
	 小程序屏幕旋转时触发。
	*/
	?onResize: WindowResize-> Void,

	/**
	 点击 tab 时触发
	*/
	?onTabItemTap: ({
		index: String,     // 被点击tabItem的序号，从0开始
		pathPath: String,  // 被点击tabItem的页面路径
		text: String,      // 被点击tabItem的按钮文字
	})->Void
}
