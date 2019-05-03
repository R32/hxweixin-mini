package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.setScreenBrightness.html
*/
@:native("wx")
extern class Screen {
	static function setScreenBrightness(obj:SFC<ErrMsg> & {value:Float}):Void;

	static function setKeepScreenOn(obj:SFC<ErrMsg> & {keepScreenOn:Bool}):Void;

	static function getScreenBrightness(obj:SFC<{value:Float}>):Void;

#if mini_game
	static function onDeviceOrientationChange(callb: {value:Orientation}->Void):Void;

	static function offDeviceOrientationChange(?callb:haxe.Constraints.Function):Void;
#else
	static function onUserCaptureScreen(callb:haxe.Constraints.Function):Void;
#end
}

private enum abstract Orientation(String) {
	var portrait;
	var landscape;
	var landscapeReverse;
}