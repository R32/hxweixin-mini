package mini.cat;

import mini.Data;
import haxe.DynamicAccess;
import haxe.Constraints.Function;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.stopVoice.html
*/
@:native("wx")
extern class Audio {
	// 设置 InnerAudioContext 的播放选项。设置之后对当前小程序全局生效。
	static function setInnerAudioOption(?obj:SFC<ErrMsg> & {
		?mixWithOther: Bool,
		?obeyMuteSwitch: Bool,
	}):Void;

	static function getAvailableAudioSources(?obj:SFC<{audioSources:Array<AudioSource>}>):Void;

	static function createInnerAudioContext():InnerAudioContext;

	static function createAudioContext(id:String, ?thiz:Dynamic):InnerAudioContext;

	static function getBackgroundAudioManager():BackgroundAudioManager;

	////////
	#if keep_wx_deprecated
	static function stopVoice(?obj:SFC<ErrMsg>):Void;
	static function pauseVoice(?obj:SFC<ErrMsg>):Void;
	static function playVoice(?obj:SFC<ErrMsg> & {
		filePath: String,
		?duration: Float,
	}):Void;

	static function stopBackgroundAudio(?obj:SFC<ErrMsg>):Void;
	static function pauseBackgroundAudio(?obj:SFC<ErrMsg>):Void;
	static function seekBackgroundAudio(?obj:SFC<ErrMsg> & {position: Float}):Void;
	static function playBackgroundAudio(?obj:SFC<ErrMsg> & {
		dataUrl: String,
		?title: String,
		?coverImgUrl: String,
	}):Void;
	static function onBackgroundAudioStop(callb: Function):Void;
	static function onBackgroundAudioPlay(callb: Function):Void;
	static function onBackgroundAudioPause(callb: Function):Void;
	static function getBackgroundAudioPlayerState(obj:SFC<{
		duration: Float,
		currentPosition: Float,
		status: Int,
		downloadPercent: Float,
		dataUrl: String,
	}>):Void;
	#end
}

extern class BackgroundAudioManager {
	var src: String;
	var startTime: Float;
	var title: String;    // require
	var epname: String;
	var singer: String;
	var coverImgUrl: String;
	var webUrl: String;
	var protocol: String; // http, hls
	var duration(default, never): Float;
	var currentTime(default, never): Float;
	var buffered(default, never): Float;
	var paused(default, never): Bool;

	function play():Void;
	function pause():Void;
	function stop():Void;
	function seek(pos:Float):Void;

	function onCanplay(callb: Function):Void;
	function onWaiting(callb: Function):Void;
	function onError(callb: {errCode:Int, errMsg:String}->Void):Void;
	function onPlay(callb: Function):Void;
	function onPause(callb: Function):Void;
	function onSeeking(callb: Function):Void;
	function onSeeked(callb: Function):Void;
	function onEnded(callb: Function):Void;
	function onStop(callb: Function):Void;
	function onTimeUpdate(callb: Function):Void;
	function onNext(callb: Function):Void;
	function onPrev(callb: Function):Void;
}

extern class AudioContext {
	function play():Void;
	function pause():Void;
	function seek(pos:Float):Void;
	function setSrc(src:String):Void;
}

extern class InnerAudioContext {
	var src: String;                      // 音频资源的地址，用于直接播放。2.2.3 开始支持云文件ID
	var startTime: Float;                 // 开始播放的位置（单位：s），默认为 0
	var autoplay: Bool;
	var loop: Bool;
	var obeyMuteSwitch: Bool;             // 是否遵循系统静音开关，默认为 true
	var volume: Float;                    // 0.~1.0
	var duration(default, never): Float;  // 当前音频的长度（单位 s）。只有在当前有合法的 src 时返回（只读）
	var currentTime(default, never): Float;
	var paused(default, never): Bool;
	var buffered(default, never): Float;  // 音频缓冲的时间点，仅保证当前播放时间点到此时间点内容已缓冲

	function play():Void;
	function pause():Void;
	function stop():Void;
	function seek(pos: Float):Void;
	function destroy():Void;

	function onCanplay(callb: Function):Void;
	function onPlay(callb: Function):Void;
	function onPause(callb: Function):Void;
	function onStop(callb: Function):Void;
	function onEnded(callb: Function):Void;
	function onTimeUpdate(callb: Function):Void;
	function onError(callb: {errCode:Int, errMsg:String}->Void):Void;
	function onWaiting(callb: Function):Void;
	function onSeeking(callb: Function):Void;
	function onSeeked(callb: Function):Void;

	function offCanplay(?callb: Function):Void;
	function offPlay(?callb: Function):Void;
	function offPause(?callb: Function):Void;
	function offStop(?callb: Function):Void;
	function offEnded(?callb: Function):Void;
	function offTimeUpdate(?callb: Function):Void;
	function offError(?callb: Function):Void;
	function offWaiting(?callb: Function):Void;
	function offSeeking(?callb: Function):Void;
	function offSeeked(?callb: Function):Void;
}
