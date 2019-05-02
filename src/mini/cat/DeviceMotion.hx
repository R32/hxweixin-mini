package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.stopDeviceMotionListening.html
*/
@:native("wx")
extern class DeviceMotion {

	@:native("stopDeviceMotionListening")
	static function stop(?obj:SFC<ErrMsg>):Void;

	@:native("startDeviceMotionListening")
	static function start(?obj:SFC<ErrMsg> & {interval:DeviceInterval}):Void;

	@:native("onDeviceMotionChange")
	static function onChange(callb: {alpha:Float,beta:Float,gamma:Float}->Void):Void;
}
