package mini.game;

import mini.Data;
import haxe.Constraints.Function;

/**
 https://developers.weixin.qq.com/minigame/dev/api/Touch.html
*/
@:native("wx")
extern class Touch {
	var identifier(default, never): Float;
	var screenX(default, never): Float;
	var screenY(default, never): Float;

	static function onTouchStart(callb:TouchInfo->Void):Void;
	static function onTouchMove(callb:TouchInfo->Void):Void;
	static function onTouchEnd(callb:TouchInfo->Void):Void;
	static function onTouchCancel(callb:TouchInfo->Void):Void;

	static function offTouchStart(?callb:Function):Void;
	static function offTouchMove(?callb:Function):Void;
	static function offTouchEnd(?callb:Function):Void;
	static function offTouchCancel(?callb:Function):Void;
}

private typedef TouchInfo = {
	touches: Array<Touch>,
	changedTouches: Array<Touch>,
	timeStamp: Float,
}
