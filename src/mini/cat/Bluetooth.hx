package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.stopBluetoothDevicesDiscovery.html
*/
@:require(!mini_game)
@:native("wx")
extern class Bluetooth {

	static function stopBluetoothDevicesDiscovery(?obj:SFCX<ErrCode>):Void;

	static function startBluetoothDevicesDiscovery(?obj:SFCX<ErrCode> & {
		?services: Array<String>,
		?allowDuplicatesKey: Bool,
		?interval: Int,
	}):Void;

	static function openBluetoothAdapter(?obj:SFCX<ErrCode>):Void;

	static function onBluetoothDeviceFound(callb: {devices:Array<BTDevice>}->Void):Void;

	static function onBluetoothAdapterStateChange(callb: BTState->Void):Void;

	static function getConnectedBluetoothDevices(obj:SFCX<{
		devices: Array<{name:String,deviceId:String}>
	}> & {
		services: Array<String>
	}):Void;

	static function getBluetoothDevices(obj:SFCX<{devices:Array<BTDevice>}>):Void;

	static function getBluetoothAdapterState(obj:SFCX<BTState>):Void;

	static function closeBluetoothAdapter(?obj:SFCX<ErrCode>):Void;
}

private typedef BTDevice = {
	name: String,
	deviceId: String,
	RSSI: Float,
	advertisData: js.lib.ArrayBuffer,
	advertisServiceUUIDs: Array<String>,
	localName: String,
	serviceData: Dynamic,
}

private typedef BTState = {
	available: Bool,
	discovering: Bool,
}
