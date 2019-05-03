package mini.game;

import mini.Data;

/**
 https://developers.weixin.qq.com/minigame/dev/api/wx.requestMidasPayment.html
*/
@:native("wx")
extern class Payment {
	static function requestMidasPayment(obj:SFCX<ErrCode> & {
		mode: Mode,
		?env: Int,   // 0 or 1
		offerId: String,
		currencyType: CurrencyType,
		?platform: String,
		?buyQuantity: Int,
		?zoneId: String,
	}):Void;
}

private enum abstract Mode(String) {
	var game;
}
private enum abstract CurrencyType(String) {
	var CNY;
}
private enum abstract Platform(String) {
	var android;
}
