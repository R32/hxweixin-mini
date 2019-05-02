package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.vibrateShort.html
*/
@:native("wx")
extern class Vibrate {
	@:native("vibrateShort") static function short(?obj:SFC<ErrMsg>):Void;

	@:native("vibrateLong") static function long(?obj:SFC<ErrMsg>):Void;
}
