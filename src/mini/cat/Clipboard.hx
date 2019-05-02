package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.setClipboardData.html
*/
@:native("wx")
extern class Clipboard {

	@:native("setClipboardData") static function setData(obj:SFC<ErrMsg> & {data:String}):Void;

	@:native("getClipboardData") static function getData(obj:SFC<{data:String}>):Void;
}
