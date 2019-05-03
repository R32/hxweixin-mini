package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.stopWifi.html
*/
@:require(!mini_game)
@:native("wx")
extern class WIFI {

	var SSID(default, never): String;
	var BSSID(default, never): String;
	var secure(default, never): Bool;
	var signalStrength(default, never): Float;

	static function stopWifi(?obj:SFCX<ErrCode>):Void;

	static function startWifi(?obj:SFCX<ErrCode>):Void;

	static function setWifiList(obj:SFCX<ErrCode> & {wifiList:Array<WIFIOptions>}):Void;

	static function onWifiConnected(callb: {wifi:WIFI}->Void):Void;

	static function onGetWifiList(callb: {wifiLift:Array<WIFI>}->Void):Void;

	static function getWifiList(obj:SFCX<ErrCode>):Void;

	static function getConnectedWifi(obj:SFCX<{wifi:WIFI}>):Void;

	static function connectWifi(obj:SFCX<ErrCode> & WIFIOptions):Void;
}

private typedef WIFIOptions = {
	SSID: String,
	?BSSID: String,
	?password: String,
}
