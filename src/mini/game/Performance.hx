package mini.game;

import mini.Data;

/**
 https://developers.weixin.qq.com/minigame/dev/api/Performance.html
*/
@:native("wx")
extern class Performance {

	function now():Float;

	static function triggerGC():Void;

	@:native("getPerformance") static function get():Performance;
}
