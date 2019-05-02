package mini.cat;

import mini.Data;
import haxe.Constraints.Function;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/CameraContext.html
*/
@:native("wx")
extern class Camera {

	function startRecord(?obj:SFC<ErrMsg> & {
		?timeoutCallback: TempPath->Void,
	}):Void;

	function stopRecord(?obj:SFC<TempPath>):Void;

	function takePhoto(?obj:SFC<{
		tempImagePath: String
	}> & {
		?quality: Quality,
	}):Void;


	@:native("createCameraContext") static function create():Camera;
}

private typedef TempPath = {
	tempThumbPath: String,
	tempVideoPath: String,
}

private enum abstract Quality(String) {
	var high;
	var normal;
	var low;
}
