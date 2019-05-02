package mini.cat;

import mini.Data;
import haxe.Constraints.Function;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.request.html
*/
@:native("wx")
extern class Web {

	static function request(cfg: SFC<{
		data: Dynamic,
		statusCode: Int,
		header: QueryData,
	}> & {
		url: String,
		?data: Dynamic,      // string, object, ArrayBuffer
		?header: QueryData,
		?method: Method,  // GET
		?dataType: String,   // json
		?responseType: ResponseType,
	}): RequestTask;

	static function downloadFile(cfg: SFC<{
		tempFilePath: String,
		statusCode: Int,
	}> & {
		url: String,
		?header: QueryData,
		?filePath: String,
	}): DownloadTask;

	static function uploadFile(cfg: SFC<{
		data: String,
		statusCode: Int,
	}> & {
		url: String,
		filePath: String,
		name: String,
		?header: QueryData,
		?formData: QueryData,
	}): UpLoadTask;
}

private extern class RequestTask {
	function abort():Void;
	function onHeadersReceived(callb: {header:QueryData}->Void):Void;
	function offHeadersReceived(?callb: Function):Void; // TODO:
}

private extern class DownloadTask extends RequestTask {
	function offProgressUpdate(?callb: Function):Void; // TODO:
	function onProgressUpdate(callb: {
		progress: Float,
		totalBytesWritten: Int,
		totalBytesExpectedToWrite: Int,
	}->Void):Void;
}

private typedef UpLoadTask = DownloadTask;

private enum abstract Method(String) {
	var OPTIONS;
	var GET;
	var HEAD;
	var POST;
	var PUT;
	var DELETE;
	var TRACE;
	var CONNECT;
}

private enum abstract ResponseType(String) {
	var text;
	var arraybuffer;
}