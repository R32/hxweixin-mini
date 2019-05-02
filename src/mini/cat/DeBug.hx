package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.setEnableDebug.html
*/
@:native("wx")
extern class Debug {
	static function setEnableDebug(obj:{enableDebug:Bool} & SFC<ErrMsg>):Void;

	static function getLogManager(obj:{level:Int}):LogManager;
}

extern class LogManager {
	function debug(data:haxe.extern.Rest<Dynamic>):Void;
	function info(data:haxe.extern.Rest<Dynamic>):Void;
	function log(data:haxe.extern.Rest<Dynamic>):Void;
	function warn(data:haxe.extern.Rest<Dynamic>):Void;
}