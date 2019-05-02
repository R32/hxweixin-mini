package mini.cat;

import mini.Data;
import haxe.DynamicAccess;
import haxe.Constraints.Function;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.saveImageToPhotosAlbum.html
*/
@:native("wx")
extern class Image {

	static function saveImageToPhotosAlbum(obj:SFC<ErrMsg> & {
		filePath: String, // 图片文件路径，可以是临时文件路径或永久文件路径，不支持网络图片路径
	}):Void;

	static function previewImage(obj:SFC<ErrMsg> & {
		urls: Array<String>,
		?current: String,
	}):Void;

	static function getImageInfo(obj:SFC<{
		width: Int,
		height: Int,
		path: String,
		orientation: Orientation,
		type: String,
	}> & {
		src: String,     // 图片的路径，可以是相对路径、临时文件路径、存储文件路径、网络图片路径
	}):Void;

	static function compressImage(obj:SFC<{
		tempFilePath: String,
	}> & {
		src: String,
		?quality: Int,   // default is 80
	}):Void;
}

private enum abstract Orientation(String) to String {
	var up;
	var right;
	var down;
	var left;
	var upMirrored = "up-mirrored";
	var rightMirrored = "right-mirrored";
	var downMirrored = "down-mirrored";
	var leftMirrored = "left-mirrored";
}
