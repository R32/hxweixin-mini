package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.stopHCE.html
*/
@:native("wx")
extern class NFC {

	static function stopHCE(?obj:SFCX<ErrCode>):Void;

	static function startHCE(obj:SFCX<ErrCode> & {aid_list:Array<String>}):Void;

	static function sendHCEMessage(obj:SFCX<ErrCode> & {data:js.lib.ArrayBuffer}):Void;

	static function onHCEMessage(callb: HCEMessage->Void):Void;

	static function getHCEState(obj:SFCX<ErrCode>):Void;
}

private typedef HCEMessage = {
	messageType: Int,  // 1 or 2;
	data: js.lib.ArrayBuffer,
	reason: Int,       // when messageType == 2
}