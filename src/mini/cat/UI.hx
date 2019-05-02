package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.showToast.html
*/
@:native("wx")
extern class UI {

	// Interaction
	static function showToast(obj:SFC<ErrMsg> & {
		title: String,
		?icon: ToastIcon,    // success
		?image: String,
		?duration: Float,    // 1500
		?mask: Bool,         // false
	}):Void;

	static function showModal(obj:SFC<{confirm:Bool, cancel:Bool}> & {
		title: String,
		content: String,
		?showCancel: Bool,   // true,
		?cancelText: String, // "取消",
		?cancelColor: Bool,  // "#000000",
		?confirmText: String,// "确定",
		?confirmColor: Bool, // "#576B95",
	}):Void;

	static function showLoading(obj:SFC<ErrMsg> & {
		title: String,
		?mask: Bool,         // false
	}):Void;

	static function showActionSheet(obj:SFC<{tapIndex:Int}> & {
		itemList: Array<String>,
		?itemColor: String,  // "#000000"
	}):Void;

	static function hideToast(?obj:SFC<ErrMsg>):Void;

	static function hideLoading(?obj:SFC<ErrMsg>):Void;

	// Navigation bar

	static function showNavigationBarLoading(?obj:SFC<ErrMsg>):Void;

	static function setNavigationBarTitle(obj:SFC<ErrMsg> & {
		title: String,
	}):Void;

	static function setNavigationBarColor(obj:SFC<ErrMsg> & {
		frontColor: String,
		backgroundColor: String,
		?animation: {
			?duration: Float,
			?timingFunc: NavTimingFunc
		},
	}):Void;

	static function hideNavigationBarLoading(?obj:SFC<ErrMsg>):Void;

	// Background

	static function setBackgroundTextStyle(obj:SFC<ErrMsg> & {
		textStyle: BackgroundTextStyle
	}):Void;

	static function setBackgroundColor(obj:SFC<ErrMsg> & {
		backgroundColor: String,
		?backgroundColorTop: String,    // only for IOS
		?backgroundColorBottom: String, // only for IOS
	}):Void;

	// Tab bar

	static function showTabBarRedDot(obj:SFC<ErrMsg> & {
		index: Int,
	}):Void;

	static function showTabBar(?obj:SFC<ErrMsg> & {
		?animation: Bool,
	}):Void;

	static function setTabBarStyle(obj:SFC<ErrMsg> & {
		color: String,
		selectedColor: String,
		backgroundColor: String,
		borderStyle: TabBorderStyle,
	}):Void;

	static function setTabBarItem(obj:SFC<ErrMsg> & {
		index: Int,
		?text: String,
		?iconPath: String,
		?selectedIconPath: String,
	}):Void;

	static function setTabBarBadge(obj:SFC<ErrMsg> & {
		index: Int,
		text: String,
	}):Void;

	static function removeTabBarBadge(obj:SFC<ErrMsg> & {
		index: Int,
	}):Void;

	static function hideTabBarRedDot(obj:SFC<ErrMsg> & {
		index: Int,
	}):Void;

	static function hideTabBar(?obj:SFC<ErrMsg> & {
		?animation: Bool,
	}):Void;

	// font
	static function loadFontFace(obj:SFC<ErrMsg> & {
		family: String,
		source: String,
		?desc: {
			?style: String,   // "normal", "italic", "oblique"
			?weight: String,  // "normal", "bold", 100, 200, 900 (int or string???)
			?variant: String, // "normal", "small-caps", "inherit"
		},
	}):Void;

	// 手动下拉刷新
	static function stopPullDownRefresh(?obj:SFC<ErrMsg>):Void;
	static function startPullDownRefresh(?obj:SFC<ErrMsg>):Void;

	// scroll
	static function pageScrollTo(?obj:SFC<ErrMsg> & {
		scrollTop: Float, // px
		?duration: Float, // 300
	}):Void;

	// topbar
	static function setTopBarText(?obj:SFC<ErrMsg> & {
		text: String,
	}):Void;

	// custom component
	static function nextTick(callb: ()->Void):Void;

	// menu
	static function getMenuButtonBoundingClientRect():Rect;

	// windows
	static function onWindowResize(callb: WindowResize->Void):Void;
	static function offWindowResize(?callb: haxe.Constraints.Function):Void;

	// File
	static function chooseMessageFile(obj:SFC<{
		tempFiles: Array<{
			path: String,
			size: Int,
			name: String,
			type: String,
			time: Float,
		}>,
	}> & {
		count: Int,
		?type: FileType, // all
		?extension: Array<String>,
	}):Void;

	static function chooseImage(?obj:SFC<{
		tempFilePaths: Array<String>,
		tempFiles: Array<{path:String, size:Int}>,
	}> & {
		?count: Int,
		?sizeType: Array<ImageSizeType>,
		?sourceType: Array<MediaSourceType>,
	}):Void;

	static function chooseVideo(?obj:SFC<{
		tempFilePath: String,
		duration: Float,
		size: Int,
		height: Int,
		width: Int,
	}> & {
		?compressed: Bool,
		?maxDuration: Float,
		?camera: CameraFrom,
		?sourceType: Array<MediaSourceType>,
	}):Void;


}

private enum abstract ToastIcon(String) {
	var success;
	var loading;
	var none;
}

private enum abstract NavTimingFunc(String) {
	var linear;
	var easeIn;
	var easeOut;
	var easeInOut;
}

private enum abstract BackgroundTextStyle(String) {
	var dark;
	var light;
}

private enum abstract TabBorderStyle(String) {
	var black;
	var white;
}

private enum abstract FileType(String) {
	var all;
	var video;
	var image;
	var file;
}

private enum abstract ImageSizeType(String) {
	var original;
	var compressed;
}

private enum abstract MediaSourceType(String) {
	var album;
	var camera;
}

private enum abstract CameraFrom(String) {
	var back;
	var front;
}
