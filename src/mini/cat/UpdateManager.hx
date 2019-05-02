package mini.cat;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.getUpdateManager.html
*/
@:native("wx")
extern class UpdateManager {
	function applyUpdate():Void;
	function onCheckForUpdate(callb: ({hasUpdate:Bool})->Void):Void;
	function onUpdateFailed(callb: ()->Void):Void;
	function onUpdateReady(callb: ()->Void):Void;

	@:native("getUpdateManager") static function get():UpdateManager;
}
