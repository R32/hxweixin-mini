package mini.cat;

import mini.Data;
import haxe.Constraints.Function;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/RecorderManager.html
*/
@:native("wx")
extern class AudioRecord {

	function start(obj:SFC<ErrMsg> & {
		?duration: Float,
		?sampleRate: Int,
		?numberOfChannels: Int,
		?encodeBitRate: Int,
		?format: AudioFormat,
		?frameSize: Int,
		?audioSource: AudioSource,
	}):Void;
	function pause():Void;
	function resume():Void;
	function stop():Void;

	function onStart(callb: Function):Void;
	function onResume(callb: Function):Void;
	function onPause(callb: Function):Void;
	function onStop(callb: {tempFilePath:String}->Void):Void;
	function onFrameRecorded(callb:{frameBuffer:js.lib.ArrayBuffer,isLastFrame:Bool}->Void):Void;
	function onError(callb: ErrMsg->Void):Void;
	function onInterruptionBegin(callb: Function):Void;
	function onInterruptionEnd(callb: Function):Void;

	////

	static function getRecorderManager():AudioRecord;

	#if keep_wx_deprecated
	static function stopRecord():Void;
	static function startRecord(obj:SFC<{tempFilePath: String}>):Void;
	#end
}

private enum abstract AudioFormat(String) {
	var aac;
	var mp3;
}
