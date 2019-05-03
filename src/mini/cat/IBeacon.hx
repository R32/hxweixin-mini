package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.stopBeaconDiscovery.html
*/
@:require(!mini_game)
@:native("wx")
extern class IBeacon {

	static function stopBeaconDiscovery(?obj:SFCX<ErrCode>):Void;

	static function startBeaconDiscovery(obj:SFCX<ErrCode> & {
		uuids:Array<String>,
		?ignoreBluetoothAvailable: Bool,
	}):Void;

	static function onBeaconUpdate(callb: {beacons:IBeaconInfo}->Void):Void;

	static function onBeaconServiceChange(callb: {available:Bool, discovering:Bool}->Void):Void;

	static function getBeacons(obj:SFCX<{beacons:IBeaconInfo}>):Void;
}

private typedef IBeaconInfo = {
	uuid: String,
	major: String,
	minor: String,
	proximity: Int,
	accuracy: Float,
	rssi: Float,
}
