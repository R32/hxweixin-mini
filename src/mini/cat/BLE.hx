package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.readBLECharacteristicValue.html
*/
@:native("wx")
extern class BLE {

	static function readBLECharacteristicValue(obj:SFCX<ErrCode> & BLEInfo):Void;

	static function onBLEConnectionStateChange(callb: {deviceId:String,connected:Bool}->Void):Void;

	static function onBLECharacteristicValueChange(callb: BLEInfoValue->Void):Void;

	static function notifyBLECharacteristicValueChange(obj: SFCX<ErrCode> & BLEInfoState):Void;

	static function getBLEDeviceServices(obj: SFCX<{services:Array<BLEService>}> & {deviceId:String}):Void;

	static function getBLEDeviceCharacteristics(obj: SFCX<{characteristics:Array<BLECharacteristic>}> & {
		deviceId:String,
		serviceId:String,
	}):Void;

	static function createBLEConnection(obj: SFCX<ErrCode> & {deviceId:String,?timeout:Float}):Void;

	static function closeBLEConnection(obj: SFCX<ErrCode> & {deviceId:String}):Void;

	static function writeBLECharacteristicValue(obj: SFCX<ErrCode> & BLEInfoValue):Void;
}

private typedef BLEInfo = {
	deviceId: String,
	serviceId: String,
	characteristicId: String,
}

private typedef BLEInfoValue = BLEInfo & {value:js.lib.ArrayBuffer}

private typedef BLEInfoState = BLEInfo & {state:Bool}

private typedef BLEService = {
	uuid: String,
	isPrimary: Bool,
}

private typedef BLECharacteristic = {
	uuid: String,
	properties: {
		read:Bool,
		write:Bool,
		notify:Bool,
		indicate:Bool,
	},
}
