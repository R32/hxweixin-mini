package mini;

import mini.Data;
import haxe.Constraints.Function;
/**
* https://developers.weixin.qq.com/miniprogram/dev/api/
*/
@:native("wx")
extern class WX {

	static final env: {
		final USER_DATA_PATH: String;
	}

#if mini_game
	// 用户信息 2
	static function createUserInfoButton(opt:ButtonOptions & {withCredentials:Bool, ?lang:Lang}):UserInfoButton;
	// 设置 2
	static function createOpenSettingButton(opt:ButtonOptions):OpenSettingButton;
	// 意见反馈
	static function createFeedbackButton(opt:ButtonOptions):FeedbackButton;
	// 游戏圈
	static function createGameClubButton(opt:ButtonOptions & {icon:String}):GameClubButton;

	// 开放数据,开放数据域 -> mini.game.OpenDataContext

	// 防沉迷
	static  function checkIsUserAdvisedToRest(obj:SFC<{result:Bool}> & {todayPlayedTime:Float}):Void;

	// 客服消息
	static function openCustomerServiceConversation(obj:SFC<ErrMsg> & {
		?sessionFrom: String,
		?showMessageCard: Bool,
		?sendMessageTitle: String,
		?sendMessagePath: String,
		?sendMessageImg: String,
	}):Void;
#else
	// 基础
	static function canIUse(schema:String):Bool;

	// 小程序跳转 2
	static function navigateBackMiniProgram(obj:SFC<ErrMsg> & {?extraData:QueryData}):Void;

	// 收货地址
	static function chooseAddress(obj:SFC<Address>):Void;

	// 账号信息
	static function getAccountInfoSync():AccountInfo;

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

	// 发票
	static function chooseInvoiceTitle(obj:SFC<InvoiceTitle>):Void;

	static function chooseInvoice(obj:SFC <{
		invoiceInfo: {cardId:String, encryptCode:String, publisherAppId:String}
	}>):Void;

	// 生物认证
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

	// 设备-扫码
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
#end
	// 登录
	static function login(obj:SFC<{code:String}> & {?timeout:Float}):Void;

	static function checkSession(obj:SFC<ErrMsg>):Void;

	// 小程序跳转
	static function navigateToMiniProgram(obj:SFC<ErrMsg> & {
		appId: String,
		?path: String,
		?extraData: QueryData,
		?envVersion: EnvVersion,
	}):Void;

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

	// 授权
	static function authorize(obj:SFC<ErrMsg> & {scope:String}):Void;

	// 设置
	static function openSetting(obj:SFC<{authSetting:haxe.DynamicAccess<Bool>}>):Void;

	static function getSetting(obj:SFC<{authSetting:haxe.DynamicAccess<Bool>}>):Void;

	// 卡券
	static function openCard(obj:SFC<ErrMsg> & {cardList:Array<{cardId:String,code:String}>}):Void;

	static function addCard(obj:SFC<{
		cardList: Array<{code:String, cardId:String, cardExt:String, isSuccess:Bool}>
	}> & {
		cardList:Array <{cardId:String, cardExt:CardExt}>
	}):Void;

	// 运动数据
	static function getWeRunData(obj:SFC<{encryptedData:String, iv:String}>):Void;

	// 设备-性能
	static function onMemoryWarning(callb: {level:Int}->Void):Void;
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

//// UserInfoButton

private enum abstract ButtonType(String) {
	var text;
	var image;
}

private typedef ButtonStyle = {
	left: Float,
	top: Float,
	width: Float,
	height: Float,
	backgroundColor: String,
	borderColor: String,
	borderWidth: String,
	borderRadius: Float,
	textAlign: Align,
	fontSize: Float,
	lineHeight: Float,
}

private typedef ButtonOptions = {
	type: ButtonType,
	?text: String,
	?image: String,
	style: ButtonStyle,
}

extern class UserInfoButton {
	var type: ButtonType;
	var text: String;
	var image: String;
	var style: ButtonStyle;
	function show():Void;
	function hide():Void;
	function destroy():Void;
	function onTap(callb: {
		userInfo: UserInfo,
		rawData: String,
		signature: String,
		encryptedData: String,
		iv: String,
	}->Void):Void;
	function offTap(?callb: Function):Void;
}

//// OpenSettingButton
extern class OpenSettingButton extends UserInfoButton {
	override function onTap(callb: Function):Void;
}

typedef FeedbackButton = OpenSettingButton;
extern class GameClubButton extends OpenSettingButton {
	var icon: String; // "green", "white", "dark", "light";
}
