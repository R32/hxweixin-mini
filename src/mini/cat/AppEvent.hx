package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.getLaunchOptionsSync.html
*/
@:native("wx")
extern class AppEvent {
	static function getLaunchOptionsSync():AppLaunchOptions;
	static function onPageNotFound(callb:PageNotFoundOptions->Void):Void;
	static function onError(callb: String->Void):Void;
	static function onAudioInterruptionEnd(callb: haxe.Constraints.Function):Void;
	static function onAudioInterruptionBegin(callb: haxe.Constraints.Function):Void;
	static function onAppShow(callb: AppLaunchOptions->Void):Void;
	static function onAppHide(callb: ()->Void):Void;
	static function offPageNotFound():Void;
	static function offError():Void;
	static function offAudioInterruptionEnd():Void;
	static function offAudioInterruptionBegin():Void;
	static function offAppShow():Void;
	static function offAppHide():Void;
}
