package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.saveFile.html
*/
@:native("wx")
extern class File {
#if (!mini_game)
	static function saveFile(obj:SFC<{savedFilePath:String}> & {tempFilePath:String}):Void;

	static function removeSavedFile(obj:SFC<ErrMsg> & {filePath:String}):Void;

	static function openDocument(obj:SFC<ErrMsg> & {filePath:String, ?fileType:DocFileType}):Void;

	static function getSavedFileList(obj:SFC<{fileList:Array<FileItem>}>):Void;

	static function getSavedFileInfo(obj:SFC<{size:Int, createTime:Float}> & {filePath:String}):Void;

	static function getFileInfo(obj:SFC<{size:Int, digest:String}> & {filePath:String, ?digestAlgorithm:DigestAlgorithm}):Void;
#end
	static function getFileSystemManager():FileSystemManager;
}

/**
* https://developers.weixin.qq.com/miniprogram/dev/api/FileSystemManager.html
*/
extern class FileSystemManager {

	function access(obj:SFC<ErrMsg> & {path:String}):Void;

	function appendFile(obj:SFC<ErrMsg> & {filePath:String, data:FileDataIn, ?encoding:FileEncoding}):Void;

	function saveFile(obj:SFC<{savedFilePath:String}> & {tempFilePath:String, ?filePath:String}):Void;

	function getSavedFileList(obj:SFC<{fileList:Array<FileItem>}>):Void;

	function removeSavedFile(obj:SFC<ErrMsg> & {filePath:String}):Void;

	function copyFile(obj:SFC<ErrMsg> & {srcPath:String, destPath:String}):Void;

	function getFileInfo(obj:SFC<{size:Int}> & {filePath:String}):Void;

	function mkdir(obj:SFC<ErrMsg> & {dirPath:String, ?recursive:Bool}):Void;

	function readdir(obj:SFC<{files:Array<String>}> & {dirPath:String}):Void;

	function readFile(obj:SFC<{data:FileDataOut}> & {filePath:String, ?encoding:FileEncoding}):Void;

	function rename(obj:SFC<ErrMsg> & {oldPath:String, newPath:String}):Void;

	function rmdir(obj:SFC<ErrMsg> & {dirPath:String, ?recursive:Bool}):Void;

	// .stats is EithType<FileStat, Dynamic<FileStat>
	function stat(obj:SFC<{stats:Dynamic}> & {path:String, ?recursive:Bool}):Void;

	function unlink(obj:SFC<ErrMsg> & {filePath:String}):Void;

	function unzip(obj:SFC<ErrMsg> & {zipFilePath:String, targetPath:String}):Void;

	function writeFile(obj:SFC<ErrMsg> & {filePath:String, data:FileDataIn, ?encoding:FileEncoding}):Void;

	// Sync since WX 2.2
	@throw function accessSync(path:String):Void;
	@throw function appendFileSync(filePath:String, data:FileDataIn, ?encoding:FileEncoding):Void;
	@throw function copyFileSync(srcPath:String, destPath:String):Void;
	@throw function mkdirSync(dirPath:String, ?recursive:Bool):Void;
	@throw function readdirSync(dirPath:String):Array<String>;
	@throw function readFileSync(filePath:String, ?encoding:FileEncoding):FileDataOut;
	@throw function renameSync(oldPath:String, newPath:String):Void;
	@throw function rmdirSync(dirPath:String, ?recursive:Bool):Void;
	@throw function saveFileSync(tempFilePath:String, ?filePath:String):String;
	@throw function statSync(path:String, ?recursive:Bool):Dynamic;
	@throw function unlinkSync(filePath:String):Void;
	@throw function writeFileSync(filePath:String, data:FileDataIn, ?encoding:FileEncoding):Void;
}

private typedef FileDataIn = haxe.extern.EitherType<String, js.lib.ArrayBuffer>;
private typedef FileDataOut = Dynamic;

private typedef FileItem = {
	filePath: String,
	size: Int,
	createTime: Float,
}

private enum abstract FileEncoding(String) {
	var utf8;
	var ascii;
	var base64;
	var binary;
	var hex;
	var ucs2;
	var utf16le;
	var latin1;
}

private enum abstract DocFileType(String) {
	var doc;
	var docx;
	var xls;
	var xlsx;
	var ppt;
	var pptx;
	var pdf;
}

private enum abstract DigestAlgorithm(String) {
	var md5;
	var sha1;
}
