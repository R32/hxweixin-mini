package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.updateShareMenu.html
*/
@:native("wx")
extern class Share {

	static function updateShareMenu(?obj:SFC<ErrMsg> & {
		?withShareTicket: Bool,
		?isUpdatableMessage: Bool,
		?activityId: String,
		?templateInfo: TemplateInfo
	}):Void;

	static function showShareMenu(?obj:SFC<ErrMsg> & {
		?withShareTicket: Bool,
	}):Void;

	static function hideShareMenu(?obj:SFC<ErrMsg>):Void;

	static function getShareInfo(?obj:SFC<{
		errMsg: String,
		encryptedData: String,
		iv: String,
	}> & {
		shareTicket: String,
		?timeout: Float,
	}):Void;
}

private typedef TemplateInfo = {
	parameterList: Array<{name:String, value:String}>,
}