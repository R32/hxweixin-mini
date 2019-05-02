package mini.cat;

import mini.Data;
import haxe.DynamicAccess;
import haxe.Constraints.Function;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.saveVideoToPhotosAlbum.html
*/
@:native("wx")
extern class Video {

	function exitFullScreen():Void;
	// only works in IOS
	function hideStatusBar():Void;

	function pause():Void;

	function play():Void;

	function playbackRate(rate:Float):Void;

	function requestFullScreen(?obj:{?direction:ScreenDirection}):Void;

	function seek(?pos:Float):Void;

	function showStatusBar():Void;

	function stop():Void;

	static function saveVideoToPhotosAlbum(obj:SFC<ErrMsg> & {
		filePath: String, // 视频文件路径，可以是临时文件路径也可以是永久文件路径
	}):Void;

	@:native("createVideoContext") static function create(id:String, ?thiz:Dynamic): Video;
}
