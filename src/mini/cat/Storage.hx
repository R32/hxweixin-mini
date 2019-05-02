package mini.cat;

import mini.Data;
import haxe.DynamicAccess;
import haxe.Constraints.Function;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.setStorageSync.html
*/
@:native("wx")
extern class Storage {

	@:native("getStorageSync")     static function getSync(key:String):Any;
	@:native("setStorageSync")     static function setSync(key:String, data:Any):Void;
	@:native("removeStorageSync")  static function removeSync(key:String):Void;
	@:native("getStorageInfoSync") static function getInfoSync():StorageInfo;
	@:native("clearStorageSync")   static function clearSync():Void;

	@:native("setStorage")     static function set(obj:SFC<ErrMsg> & {
		key: String,
		data: Any,
	}):Void;

	@:native("getStorage")     static function get(obj:SFC<{data:Any}> & {
		key: String,
	}):Void;

	@:native("removeStorage")  static function remove(obj:SFC<ErrMsg> & {
		key: String,
	}):Void;

	@:native("getStorageInfo") static function getInfo(obj:SFC<StorageInfo>):Void;

	@:native("clearStorage")   static function clear(?obj:SFC<ErrMsg>):Void;
}

private typedef StorageInfo = {
	keys: Array<String>,
	currentSize: Int, // in bytes
	limitSize: Int,
}
