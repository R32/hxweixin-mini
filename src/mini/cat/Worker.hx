package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.createWorker.html
*/
@:native("wx")
extern class Worker {

	function onMessage(callb: {message:Dynamic}->Void):Void;
	function postMessage(obj:Dynamic):Void;
	function terminate():Void;

	@:native("createWorker") static function create(scriptPath:String):Worker;
}
