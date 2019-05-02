package mini.cat;

import mini.Data;
import haxe.Constraints.Function;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.sendSocketMessage.html
*/
@:native("wx")
extern class WebSocket {
	static function sendSocketMessage(cfg:SFC<ErrMsg> & {
		data: Dynamic, // stirng/ArrayBuffer
	}): Void;

	static function onSocketOpen(callb:{header:QueryData}->Void):Void;

	static function onSocketMessage(callb:{data:Dynamic}->Void):Void;

	static function onSocketError(callb:Function):Void;

	static function onSocketClose(callb:Function):Void;

	static function connectSocket(cfg:SFC<ErrMsg> & {
		url: String,
		?header: QueryData,
		?protocols: Array<String>,
		?tcpNoDelay: Bool,
	}): SocketTask;

	static function closeSocket(?cfg:SFC<ErrMsg> & {
		?code: Int,
		?reason: String,
	}): Void;
}

// websocket
private extern class SocketTask {
	function onClose(callb:Function):Void;
	function onError(callb:ErrMsg->Void):Void;
	function onMessage(callb:{data:Dynamic}->Void):Void;
	function onOpen(callb:{header:QueryData}->Void):Void;
	function send(obj:SFC<ErrMsg> & {
		data: Dynamic
	}):Void;
	function close(?obj:SFC<ErrMsg> & {
		?code: Int,
		?reason: String,
	}):Void;
}
