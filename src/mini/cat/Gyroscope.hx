package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.stopGyroscope.html
*/
@:native("wx")
extern class Gyroscope {

	@:native("stopGyroscope")
	static function stop(?obj:SFC<ErrMsg>):Void;

	@:native("startGyroscope")
	static function start(?obj:SFC<ErrMsg> & {interval:DeviceInterval}):Void;

	@:native("onGyroscopeChange")
	static function onChange(callb: {res:P3D}->Void):Void;
}
