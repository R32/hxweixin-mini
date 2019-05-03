package mini.cat;

import mini.Data;
import haxe.Constraints.Function;

/**
 program: https://developers.weixin.qq.com/miniprogram/dev/api/wx.getLaunchOptionsSync.html
 game:    https://developers.weixin.qq.com/minigame/dev/api/wx.getSystemInfoSync.html
*/
@:native("wx")
extern class AppEvent {
	static function getLaunchOptionsSync():AppLaunchOptions;
	static function onError(callb: String->Void):Void;
	static function onAudioInterruptionEnd(callb: Function):Void;
	static function onAudioInterruptionBegin(callb: Function):Void;
	static function offError():Void;
	static function offAudioInterruptionEnd():Void;
	static function offAudioInterruptionBegin():Void;

#if mini_game
	static function onShow(callb: AppLaunchOptions->Void):Void;
	static function onHide(callb: Function):Void;
	static function offShow(?callb: Function):Void;
	static function offHide(?callb: Function):Void;
	static function exitMiniProgram(?obj:SFC<ErrMsg>):Void;
#else
	static function onPageNotFound(callb:PageNotFoundOptions->Void):Void;
	static function onAppShow(callb: AppLaunchOptions->Void):Void;
	static function onAppHide(callb: Function):Void;
	static function offPageNotFound():Void;
	static function offAppShow():Void;
	static function offAppHide():Void;
#end
}
