package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.getBatteryInfoSync.html
*/
@:native("wx")
extern class Battery {

	var isCharging(default, never):Bool;

	var level(default, never):Int;

	@:native("getBatteryInfoSync") static function getInfoSync():Battery;

	@:native("getBatteryInfo")static function getInfo(obj:SFC<Battery>):Void;
}
