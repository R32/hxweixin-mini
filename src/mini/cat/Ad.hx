package mini.cat;

import mini.Data;
import haxe.Constraints.Function;
/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.createRewardedVideoAd.html
*/
@:native("wx")
extern class Ad {
	static function createRewardedVideoAd(opt:{adUnitId:String}):RewardedVideoAd;

#if mini_game
	static function createBannerAd(opt:{
		adUnitId: String,
		style: {
			left: Float,
			top: Float,
			width: Float,
			height: Float,
		}
	}):BannerAd;
#else
	static function createInterstitialAd(opt:{adUnitId:String}):InterstitialAd;
#end
}

extern class RewardedVideoAd {
	function load():js.lib.Promise<Dynamic>;
	function show():Void;
	function onLoad(callb:Function):Void;
	function onError(callb:ErrCode->Void):Void;
	function onClose(callb:{isEnded:Bool}->Void):Void;
	function offLoad(?callb:Function):Void;
	function offError(?callb:Function):Void;
	function offClose(?callb:Function):Void;
}

extern class InterstitialAd {
	function show():Void;
	function onLoad(callb:Function):Void;
	function onError(callb:ErrCode->Void):Void;
	function onClose(callb:Function):Void;
	function offLoad(?callb:Function):Void;
	function offError(?callb:Function):Void;
	function offClose(?callb:Function):Void;
}

extern class BannerAd {
	function show():Void;
	function hide():Void;
	function destroy():Void;
	function onResize(callb: {width:Int, height:Int}->Void):Void;
	function onLoad(callb:Function):Void;
	function onError(callb:ErrCode-> Void):Void;
	function offResize(?callb:Function):Void;
	function offLoad(?callb:Function):Void;
	function offError(?callb:Function):Void;
}
