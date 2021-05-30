package mini.cat;

import mini.Data;
import haxe.extern.Rest;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.setEnableDebug.html
*/
@:native("wx")
extern class Debug {

	static function setEnableDebug( obj : {enableDebug : Bool} & SFC<ErrMsg> ) : Void;

	static function getRealtimeLogManager() : RealtimeLogManager;

	static function getLogManager( obj : {level : Int} ) : LogManager;
}

@:native("console") extern var console : Console;

private extern class LogManager {
	function debug( data : Rest<Dynamic> ) : Void;
	function info(  data : Rest<Dynamic> ) : Void;
	function log(   data : Rest<Dynamic> ) : Void;
	function warn(  data : Rest<Dynamic> ) : Void;
}

private extern class RealtimeLogManager {
	function info(  data : Rest<Dynamic> ) : Void;
	function log(   data : Rest<Dynamic> ) : Void;
	function warn(  data : Rest<Dynamic> ) : Void;
	function error( data : Rest<Dynamic> ) : Void;
	function addFilterMsg( msg : String ) : Void;
	function setFilterMsg( msg : String ) : Void;
	@:native("in") function attach( page : mini.Page ) : Void;
}

private extern class Console extends LogManager {
	function error( data : Rest<Dynamic> ) : Void;
	function group( data : Rest<Dynamic> ) : Void;
	function groupEnd() : Void;
}

