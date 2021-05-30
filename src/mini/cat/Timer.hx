package mini.cat;

import mini.Data;
import haxe.Constraints.Function;
import haxe.extern.Rest;

@:native("wx")
extern class Timer {
#if mini_game
	static function setPreferredFramesPerSecond( fps : Int ) : Void;
#end
}

#if mini_game
@:native("requestAnimationFrame") extern function requestAnimationFrame( callback: Float -> Void ) : Int;
@:native("cancelAnimationFrame") extern function cancelAnimationFrame( handle : Int ) : Void;
#end

@:native("setInterval") extern function setInterval( callback : Function, delay : Float, rest : Rest<Dynamic> ) : Int;
@:native("setTimeout") extern function setTimeout( callback : Function, delay: Float, rest : Rest<Dynamic>) : Int;
@:native("clearInterval") extern function clearInterval( handle : Int ) : Void;
@:native("clearTimeout") extern function clearTimeout( handle : Int ) : Void;
