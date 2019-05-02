package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.setScreenBrightness.html
*/
@:native("wx")
extern class Screen {
	static function setScreenBrightness(obj:SFC<ErrMsg> & {value:Float}):Void;

	static function setKeepScreenOn(obj:SFC<ErrMsg> & {keepScreenOn:Bool}):Void;

	static function onUserCaptureScreen(callb:haxe.Constraints.Function):Void;

	static function getScreenBrightness(obj:SFC<{value:Float}>):Void;
}
