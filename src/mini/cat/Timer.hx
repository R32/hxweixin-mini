package mini.cat;

import mini.Data;
import haxe.Constraints.Function;
import haxe.extern.Rest;

@:native("")
extern class Timer {
#if mini_game
	@:native("wx.setPreferredFramesPerSecond")
	static function setPreferredFramesPerSecond(fps:Int):Void;
	static function requestAnimationFrame(callback: Float -> Void): Int;
	static function cancelAnimationFrame(handle: Int): Void;
#end
	static function setTimeout(callback: Function, delay: Float, rest: Rest<Dynamic>): Int;
	static function clearTimeout(handle: Int): Void;

	static function setInterval(callback: Function, delay: Float, rest: Rest<Dynamic>): Int;
	static function clearInterval(handle: Int): Void;
}
