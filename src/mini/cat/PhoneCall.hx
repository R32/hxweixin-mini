package mini.cat;

import mini.Data;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.makePhoneCall.html
*/
@:require(!mini_game)
@:native("wx")
extern class PhoneCall {
	@:native("makePhoneCall") static function make(obj:SFC<ErrMsg> & {phoneNumber:String}):Void;
}
