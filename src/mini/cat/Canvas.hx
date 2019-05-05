package mini.cat;

import mini.Data;
import haxe.Constraints.Function;

/**
 program: https://developers.weixin.qq.com/miniprogram/dev/api/CanvasContext.html
 game:    https://developers.weixin.qq.com/minigame/dev/api/wx.createCanvas.html
*/
@:native("wx")
extern class Canvas {
#if mini_game
	var width: Int;
	var height: Int;
	function toTempFilePath(obj:SFC<{tempFilePath:String}> & RectFile):Void;
	function toTempFilePathSync(?obj: RectFile):String;
	function toDataURL():String;

	// [_2d=>js.html.CanvasRenderingContext2D, webgl=>js.html.webgl.WebGLRenderingContext]
	function getContext(type:ContextType, ?attr:ContextAttributes):Dynamic;
	static function createCanvas():Canvas;
#else
	static function createCanvasContext(id:String, ?thiz:Dynamic):CanvasContext;

	@:native("canvasToTempFilePath") static function toTempFilePath(obj:SFC<{
		tempFilePath: String,
	}> & RectFile & {
		canvasId: String,
	}, ?thiz:Dynamic):Void;

	@:native("canvasPutImageData") static function putImageData(obj:SFC<ErrMsg> & {
		canvasId: String,
		data: js.lib.Uint8ClampedArray,  // rgba
		?x: Float,
		?y: Float,
		?width: Float,
		?height: Float,
	}, ?thiz:Dynamic):Void;

	@:native("canvasGetImageData") static function getImageData(obj:SFC<{
		width: Float,
		height: Float,
		data: js.lib.Uint8ClampedArray,
	}> & {
		canvasId: String,
		x: Float,
		y: Float,
		width: Float,
		height: Float,
	}, ?thiz:Dynamic):Void;
#end
}

@:require(!mini_game)
extern class CanvasContext {
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

	function measureText(text:String):{width:Float};

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
}

private typedef RectFile = {
	?x: Float,
	?y: Float,
	?width: Float,
	?height: Float,
	?destWidth: Float,
	?destHeight: Float,
	?fileType: FileType,
	?quality: Float,
}

private extern class Pattern {}

private typedef Color = haxe.extern.EitherType<String, Pattern>;

extern class CanvasGradient {
	function addColorStop(stop:Float, color:String):Void;
}

private typedef ContextAttributes = {
	?antialias: Bool,
	?preserveDrawingBuffer: Bool,
	?antialiasSamples: Float,
}

private enum abstract ContextType(String) {
	var _2d = "2d";
	var webgl;
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
