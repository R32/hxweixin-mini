package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.stopCompass.html
*/

@:native("wx")
extern class Compass {

	@:native("stopCompass")
	static function stop(?obj:SFC<ErrMsg>):Void;

	@:native("startCompass")
	static function start(?obj:SFC<ErrMsg>):Void;

	@:native("onCompassChange")
	static function onChange(callb: {direction:Float,accuracy:Dynamic}->Void):Void;
}
