package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.onNetworkStatusChange.html
*/
@:native("wx")
extern class NetWork {

	static function onNetworkStatusChange(callb: {isConnected:Bool, networkType:NetworkType}->Void):Void;

	static function getNetworkType(obj: SFC<{networkType:NetworkType}>):Void;

}

enum abstract NetworkType(String) {
	var wifi;
	var _2g = "2g";
	var _3g = "3g";
	var _4g = "4g";
	var unknown;
	var none;
}
