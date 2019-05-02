package mini.cat;

import mini.Data;
import haxe.Constraints.Function;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/CanvasContext.html
*/
@:native("wx")
extern class Canvas {

	var fillStyle: Color;    // color string
	var strokeStyle: Color;
	var shadowOffsetX: Float;
	var shadowOffsetY: Float;
	var shadowBlur: Float;
	var shadowColor: Color;
	var lineWidth: Float;
	var lineCap: LineCap;
	var lineJoin: LineJoin;
	var miterLimit: Float;
	var lineDashOffset: Float;
	var font: String;
	var globalAlpha: Float;
	var globalCompositeOperation: String;

	function draw(?reserve:Bool, ?callb:Function):Void;

	function createLinearGradient(x0:Float, y0:Float, y1:Float, y1:Float):CanvasGradient;

	function createCircularGradient(x:Float, y:Float, r:Float):CanvasGradient;

	function createPattern(src:String, repeat:Repetition):Color;

	function measureText(text:String):{width:Int};

	function save():Void;

	function restore():Void;

	function beginPath():Void;

	function moveTo(x:Float, y:Float):Void;

	function lineTo(x:Float, y:Float):Void;

	function quadraticCurveTo(cpx:Float, cpy:Float, x:Float, y:Float):Void;

	function bezierCurveTo(cpx1:Float, cpy1:Float, cpx2:Float, cpy2:Float, x:Float, y:Float):Void;

	function arc(x:Float, y:Float, r:Float, startAngle:Float, endAngle:Float, ?counterclockwise:Bool):Void;

	function rect(x:Float, y:Float, width:Float, height:Float):Void;

	function arcTo(x1:Float, y1:Float, x2:Float, y2:Float, r:Float):Void;

	function clip(x1:Float, y1:Float, x2:Float, y2:Float, r:Float):Void;

	function fillRect(x:Float, y:Float, width:Float, height:Float):Void;

	function strokeRect(x:Float, y:Float, width:Float, height:Float):Void;

	function clearRect(x:Float, y:Float, width:Float, height:Float):Void;

	function fill():Void;

	function stroke():Void;

	function closePath():Void;

	function scale(w:Float, h:Float):Void;

	function rotate(a:Float):Void;

	function translate(x:Float, y:Float):Void;

	@:overload(function(src:String, dx:Float, dy:Float):Void{})
	@:overload(function(src:String, dx:Float, dy:Float, dWidth:Float, dWidth:Float):Void{})
	function drawImage(src:String, sx:Float, sy:Float, sWidth:Float, sHeight:Float,
		dx:Float, dy:Float, dWidth:Float, dWidth:Float):Void;

	function strokeText(text:String, x:Float, y:Float, ?maxWidth:Float):Void;

	function fillText(text:String, x:Float, y:Float, ?maxWidth:Float):Void;

	function setTextAlign(align:Align):Void;

	function setTextBaseline(base:TextBaseline):Void;

	function transform(scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, tx:Float, ty:Float):Void;

	function setTransform(scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, tx:Float, ty:Float):Void;

	#if keep_wx_deprecated
	function setFillStyle(color:Color):Void;
	function setStrokeStyle(color:Color):Void;
	function setShadow(?dx:Float, ?dy:Float, ?blur:Float, ?color:Color):Void;
	function setGlobalAlpha(alpha:Float):Void;
	function setLineWidth(w:Float):Void;
	function setLineJoin(lj:LineJoin):Void;
	function setLineCap(lc:LineCap):Void;
	function setLineDash(p:Array<Float>, offset:Float):Void;
	function setMiterLimit(n:Float):Void;
	function setFontSize(size:Float):Void;
	#end
	@:native("createCanvasContext") static function create(id:String, ?thiz:Dynamic):Canvas;

	@:native("canvasToTempFilePath") static function toTempFilePath(obj:SFC<{
		tempFilePath: String,
	}> & {
		canvasId: String,
		?fileType: FileType,
		?quality: Float,
		?x: Int,
		?y: Int,
		?width: Int,
		?height: Int,
		?destWidth: Int,
		?destHeight: Int,
	}, ?thiz:Dynamic):Void;

	@:native("canvasPutImageData") static function putImageData(obj:SFC<ErrMsg> & {
		canvasId: String,
		data: js.lib.Uint8ClampedArray,  // rgba
		?x: Int,
		?y: Int,
		?width: Int,
		?height: Int,
	}, ?thiz:Dynamic):Void;

	@:native("canvasGetImageData") static function getImageData(obj:SFC<{
		width: Int,
		height: Int,
		data: js.lib.Uint8ClampedArray,
	}> & {
		canvasId: String,
		x: Int,
		y: Int,
		width: Int,
		height: Int,
	}, ?thiz:Dynamic):Void;
}

private extern class Pattern {}

private typedef Color = haxe.extern.EitherType<String, Pattern>;

extern class CanvasGradient {
	function addColorStop(stop:Float, color:String):Void;
}

private enum abstract Align(String) {
	var left;
	var center;
	var right;
}

private enum abstract FileType(String) {
	var png;
	var jpg;
}

private enum abstract LineCap(String) {
	var butt;
	var round;
	var square;
}

private enum abstract LineJoin(String) {
	var bevel;
	var round;
	var miter;
}

private enum abstract Repetition(String) {
	var repeat;
	var repeatX = "repeat-x";
	var repeatY = "repeat-y";
	var noRepeat = "no-repeat";
}

private enum abstract TextBaseline(String) {
	var top;
	var bottom;
	var middle;
	var normal;
}
