package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.openLocation.html
*/
@:native("wx")
extern class Location {
	@:native("getLocation") static function get(obj:SFC<{
		latitude: Float,
		longitude: Float,
		speed: Float,
		accuracy: Float,
		altitude: Float,
		verticalAccuracy: Float,
		horizontalAccuracy: Float,
	}> & {
		?type: LocationType,
		?altitude: Bool,
	}):Void;
#if (!mini_game)
	@:native("chooseLocation") static function choose(obj:SFC<{
		name: String,
		address: String,
		latitude: Float,
		longitude: Float,
	}>):Void;

	@:native("openLocation") static function open(obj:SFC<ErrMsg> & {
		latitude: Float,
		longitude: Float,
		?scale: Float,
		?name: String,
		?address: String,
	}):Void;
#end
}

private enum abstract LocationType(String) {
	var wgs84;
	var gcj02;
}
