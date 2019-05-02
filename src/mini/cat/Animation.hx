package mini.cat;

import mini.Data;
import haxe.DynamicAccess;
import haxe.Constraints.Function;

private typedef FloatOrString = haxe.extern.EitherType<Float,String>;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.createAnimation.html
*/
@:native("wx")
extern class Animation {
	function top(v:FloatOrString):Animation;
	function right(v:FloatOrString):Animation;
	function bottom(v:FloatOrString):Animation;
	function left(v:FloatOrString):Animation;
	function width(v:FloatOrString):Animation;
	function height(v:FloatOrString):Animation;

	function export():Array<Dynamic>;

	function matrix(a: Float, b: Float, c: Float, d: Float, tx: Float, ty: Float):Animation;

	function matrix3d(
		_11: Float, _12: Float, _13: Float, _14: Float,
		_21: Float, _22: Float, _23: Float, _24: Float,
		_31: Float, _32: Float, _33: Float, _34: Float,
		_41: Float, _42: Float, _43: Float, _44: Float
	):Animation;

	function opacity(f: Float):Animation;

	function rotate(angle: Float):Animation;  // angle in [-180, 180]
	function rotate3d(x: Float, y: Float, z: Float, angle: Float):Animation;
	function rotateX(angle: Float):Animation;
	function rotateY(angle: Float):Animation;
	function rotateZ(angle: Float):Animation;

	function skew(angleX: Float, angleY: Float):Animation;
	function skewX(angle: Float):Animation;
	function skewY(angle: Float):Animation;

	function step(opt: AnimationOptions):Animation;

	function translate(tx: Float, ty: Float):Animation;
	function translate3d(tx: Float, ty: Float, tz:Float):Animation;
	function translateX(t: Float):Animation;
	function translateY(t: Float):Animation;
	function translateZ(t: Float):Animation;

	function backgroundColor(v: String):Animation;

	@:native("createAnimation") static function create(?obj: AnimationOptions): Animation;
}

private typedef AnimationOptions = {
	?duration: Float, // 400
	?timingFunction: AnimTimingFunc,
	?delay: Float,
	?transformOrigin: String,
}

private enum abstract AnimTimingFunc(String) {
	var linear    = "linear";
	var ease      = "ease";
	var easeIn    = "ease-in";
	var easeInOut = "ease-in-out";
	var easeOut   = "ease-out";
	var stepStart = "step-start";
	var stepEnd   = "step-end";
}
