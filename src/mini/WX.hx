package mini;

import mini.Data;

/**
* https://developers.weixin.qq.com/miniprogram/dev/api/
*/
@:native("wx")
extern class WX {

	static function canIUse(schema:String):Bool;

	//// 开放接口
	static function login(obj:SFC<{code:String}> & {?timeout:Float}):Void;

	static function checkSession(obj:SFC<ErrMsg>):Void;

	static function navigateToMiniProgram(obj:SFC<ErrMsg> & {
		appId: String,
		?path: String,
		?extraData: QueryData,
		?envVersion: EnvVersion,
	}):Void;

	static function navigateBackMiniProgram(obj:SFC<ErrMsg> & {?extraData:QueryData}):Void;

	// 账号信息
	static function getAccountInfoSync():AccountInfo;

	// 用户信息
	static function getUserInfo(obj:SFC<{
		userInfo: UserInfo,
		rawData: String,
		signature: String,
		encryptedData: String,
		iv: String,
		errMsg:String,
	}> & {
		?withCredentials: Bool,
		?lang: Lang,
	}):Void;

	// 数据上报
	static function reportMonitor(name:String, id:Int):Void;

	static function reportAnalytics(name:String, data:KeyValue):Void;

	// 支付
	static function requestPayment(obj:SFC<ErrMsg> & {
		timeStamp: String,
		nonceStr: String,
		//package: String, // 关键字限制, 在传递时需加引号如: {"package": "pkg_string..."}
		?signType: SignType,
		paySign: String,
	}):Void;

	static function authorize(obj:SFC<ErrMsg> & {scope:String}):Void;

	static function openSetting(obj:SFC<{authSetting:haxe.DynamicAccess<Bool>}>):Void;

	static function getSetting(obj:SFC<{authSetting:haxe.DynamicAccess<Bool>}>):Void;

	static function chooseAddress(obj:SFC<Address>):Void;

	static function openCard(obj:SFC<ErrMsg> & {cardList:Array<{cardId:String,code:String}>}):Void;

	static function addCard(obj:SFC<{
		cardList: Array<{code:String, cardId:String, cardExt:String, isSuccess:Bool}>
	}> & {
		cardList:Array <{cardId:String, cardExt:CardExt}>
	}):Void;

	static function chooseInvoiceTitle(obj:SFC<InvoiceTitle>):Void;

	static function chooseInvoice(obj:SFC <{
		invoiceInfo: {cardId:String, encryptCode:String, publisherAppId:String}
	}>):Void;

	static function startSoterAuthentication(obj:SFC<{
		authMode: String,
		resultJSON: String,
		resultJSONSignature: String,
		errCode: Int,
		errMsg: String,
	}> & {
		requestAuthModes: Array<AuthModes>,
		challenge: String,
		?authContent: String,
	}):Void;

	static function checkIsSupportSoterAuthentication(obj:SFC<{supportMode:Array<AuthModes>}>):Void;

	static function checkIsSoterEnrolledInDevice(obj:SFC<{
		isEnrolled:Bool,
	}> & {
		checkAuthMode: AuthModes,
	}):Void;

	static function getWeRunData(obj:SFC<{encryptedData:String, iv:String}>):Void;

	//// Devices

	static function onMemoryWarning(callb: {level:Int}->Void):Void;

	static function scanCode(obj:SFC<{
		result: String,
		scanType: ScanTypeOut,
		charSet: String,
		path: String,
		rawData: String,
	}> & {
		?onlyFromCamera:Bool,
		?scanType:Array<ScanTypeIn>,
	}):Void;

	//// 第三方平台
	static function getExtConfigSync():{extConfig:Dynamic};
	static function getExtConfig(obj:SFC<{extConfig:Dynamic}>):Void;
}

private enum abstract EnvVersion(String) {
	var develop;
	var trial;
	var release;
}

private enum abstract SignType (String) to String {
	var MD5;
	var HMAC_SHA256 = "HMAC-SHA256";
}

private enum abstract AuthModes (String) {
	var fingerPrint;
	var facial;
	var speech;
}

private enum abstract ScanTypeIn(String) {
	var barCode;
	var qrCode;
	var datamatrix;
	var pdf417;
}

private enum abstract ScanTypeOut(String) {
	var QR_CODE;
	var AZTEC;
	var CODABAR;
	var CODE_39;
	var CODE_93;
	var CODE_128;
	var DATA_MATRIX;
	var EAN_8;
	var EAN_13;
	var ITF;
	var MAXICODE;
	var PDF_417;
	var RSS_14;
	var RSS_EXPANDED;
	var UPC_A;
	var UPC_E;
	var UPC_EAN_EXTENSION;
	var WX_CODE;
	var CODE_25;
}

private enum abstract Lang(String) {
	var en;
	var zh_CN;
	var zh_TW;
}

private typedef UserInfo = {
	nickName: String,
	avatarUrl: String,
	gender: Int,
	country: String,
	province: String,
	city: String,
	language: Lang,
}

private typedef AccountInfo = {
	miniProgram: {
		appId: String
	},
	plugin: {
		appId: String,
		version: String
	}
}

private typedef Address = {
	userName: String,
	postalCode: String,
	provinceName: String,
	cityName: String,
	countyName: String,
	detailInfo: String,
	nationalCode: String,
	telNumber: String,
}

private typedef CardExt = {
	?code: String,
	?openid: String,
	timestamp: Float,
	?nonce_str: String,
	?fixed_begintimestamp: Float,
	?outer_str: String,
	signature: String,
}

private typedef InvoiceTitle = {
	type: String,
	title: String,
	taxNumber: String,
	companyAddress: String,
	telephone: String,
	bankName: String,
	bankAccount: String,
}
