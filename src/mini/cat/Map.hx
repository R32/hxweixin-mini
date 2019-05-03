package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.createMapContext.html
*/
@:require(!mini_game)
@:native("wx")
extern class Map {

	function getCenterLocation(obj:SFC<Point>):Void;

	function getRegion(obj:SFC<{
		southwest: Float,
		northeast: Float,
	}>):Void;

	function getScale(obj:SFC<{
		scale: Float,
	}>):Void;

	function includePoints(obj:SFC<ErrMsg> & {
		points: Array<Point>,
		?padding: Array<Float>,
	}):Void;

	function moveToLocation():Void; // TODO: no doc

	function translateMarker(obj:SFC<ErrMsg> & {
		markerId: String,
		destination: Point,
		autoRotate: Bool,
		rotate: Float,
		?duration: Float,
		?animationEnd: haxe.Constraints.Function,
	}):Void;

	@:native("createMapContext") static function create(id:String, ?thiz:Dynamic):Map;
}

private typedef Point = {
	longitude: Float,
	latitude: Float,
}
