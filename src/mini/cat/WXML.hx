package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.createSelectorQuery.html
*/
@:native("wx")
extern class WXML {
	static function createSelectorQuery():SelectorQuery;

	static function createIntersectionObserver(thiz:Dynamic, ?opt:{
		thresholds: Array<Float>,
		?initialRatio: Float,
		?observeAll: Bool,
	}):IntersectionObserver;
}

extern class SelectorQuery {
	/**
	* selectorQuery.in()
	*/
	@:native("in") function by(component:Dynamic):SelectorQuery;

	function select(s:String):NodesRef;

	function selectAll(s:String):NodesRef;

	function selectViewport():NodesRef;

	function exec(?callb:Array<Dynamic>->Void):Void;
}

extern class IntersectionObserver {

	function relativeTo(selector:String, ?margins:ViewPort):IntersectionObserver;

	function relativeToViewport(margins:ViewPort):IntersectionObserver;

	function disconnect():Void;

	function observe(tarSelector:String, callb:{
		intersectionRatio:Float,
		intersectionRect:ViewPort,
		boundingClientRect:ViewPort,
		relativeRect:ViewPort,
		time:Float,
	}->Void):Void;
}

extern class NodesRef {
	function fields(opt:FieldRequest, callb:Dynamic->Void):SelectorQuery;

	function context(callb:{context:Dynamic}->Void):SelectorQuery;

	function scrollOffset(callb:{
		id: String,
		dataset: Dynamic,
		scrollLeft: Float,
		scrollTop: Float,
	}->Void):SelectorQuery;

	function boundingClientRect(callb:{
		id: String,
		dataset: Dynamic,
		left: Float,
		right: Float,
		top: Float,
		bottom: Float,
		width: Float,
		height: Float,
	}->Void):SelectorQuery;
}

private typedef FieldRequest = {
	?id: Bool,
	?dataset: Bool,
	?rect: Bool,
	?size: Bool,
	?scrollOffset: Bool,
	?properties: Array<String>,
	?computedStyle: Array<String>,
	?context: Bool,
}

private typedef ViewPort = {
	?left: Float,
	?right: Float,
	?top: Float,
	?bottom: Float,
}
