package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.createLivePusherContext.html
*/
@:native("wx")
extern class Live {

	static function createLivePusherContext():LivePusherContext;

	static function createLivePlayerContext(id:String, ?thiz:Dynamic):LivePlayerContext;
}

/**
* livePusherContext 与页面内唯一的 <live-pusher> 组件绑定，操作对应的 <live-pusher> 组件。
*/
extern class LivePusherContext {
	function start(?obj:SFC<ErrMsg>):Void;
	function stop(?obj:SFC<ErrMsg>):Void;
	function pause(?obj:SFC<ErrMsg>):Void;
	function resume(?obj:SFC<ErrMsg>):Void;
	function switchCamera(?obj:SFC<ErrMsg>):Void;
	function snapshot(?obj:SFC<ErrMsg>):Void;
	function toggleTorch(?obj:SFC<ErrMsg>):Void;

	function stopBGM(?obj:SFC<ErrMsg>):Void;
	function pauseBGM(?obj:SFC<ErrMsg>):Void;
	function resumeBGM(?obj:SFC<ErrMsg>):Void;
	function setBGMVolume(?obj:SFC<ErrMsg> & {volume:Float}):Void;
	function playBGM(obj:SFC<ErrMsg> & {url:String}):Void;
}

/**
* livePlayerContext 通过 id 跟一个 <live-player> 组件绑定，操作对应的 <live-player> 组件。
*/
extern class LivePlayerContext {
	function play(?obj:SFC<ErrMsg>):Void;
	function stop(?obj:SFC<ErrMsg>):Void;
	function mute(?obj:SFC<ErrMsg>):Void;
	function pause(?obj:SFC<ErrMsg>):Void;
	function resume(?obj:SFC<ErrMsg>):Void;
	function requestFullScreen(?obj:SFC<ErrMsg> & {?direction:ScreenDirection}):Void;
	function exitFullScreen(?obj:SFC<ErrMsg>):Void;
}
