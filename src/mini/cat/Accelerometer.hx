package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.stopAccelerometer.html
*/
@:native("wx")
extern class Accelerometer {

	@:native("stopAccelerometer")
	static function stop(?obj:SFC<ErrMsg>):Void;

	@:native("startAccelerometer")
	static function start(?obj:SFC<ErrMsg> & {interval:DeviceInterval}):Void;

	@:native("onAccelerometerChange")
	static function onChange(callb: P3D->Void):Void;
}
