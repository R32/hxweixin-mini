package mini.game;

import mini.Data;

/**
  资源
*/
@:native("wx")
extern class Res {
	static function loadSubpackage(obj:SFC<ErrMsg> & {name:String}):LoadSubpackageTask;

	static function loadFont(path:String):String;

	static function getTextLineHeight(obj: SFC<ErrMsg> & {
		?fontStyle:String,   // normal, italic
		?fontWeight:String,  // normal, bold
		?fontSize:Float,
		fontFamily:String,
		text:String,
	}):Float;

	static function createImage():mini.cat.Image;
}

private extern class LoadSubpackageTask {
	function onProgressUpdate(res: {
		progress: Float,
		totalBytesWritten: Float,
		totalBytesExpectedToWrite: Float,
	}):Void;
}