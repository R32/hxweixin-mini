package mini.game;

import mini.Data;

/**
 开放数据, 开放数据域

 https://developers.weixin.qq.com/minigame/dev/api/wx.onMessage.html

 https://developers.weixin.qq.com/minigame/dev/tutorial/open-ability/open-data.html#%E5%BC%80%E6%94%BE%E6%95%B0%E6%8D%AE%E5%9F%9F
*/
@:native("wx")
extern class OpenDataContext {
	var canvas: mini.cat.Canvas;
	function postMessage(obj:KeyValue):Void;
    @IN_MAIN static function getOpenDataContext():OpenDataContext;

	@IN_BOTH static function setUserCloudStorage(obj:SFC<ErrMsg> & {KVDataList:Array<KVData>}):Void;
	@IN_BOTH static function removeUserCloudStorage(obj:SFC<ErrMsg> & {keyList:Array<String>}):Void;

    @IN_SIDE static function getSharedCanvas():mini.cat.Canvas;
	@IN_SIDE static function getUserCloudStorage(obj:SFC<{KVDataList:Array<KVData>}> & {keyList:Array<String>}):Void;
	@IN_SIDE static function getGroupCloudStorage(obj:SFC<{data:Array<UserGameData>}> & {shareTicket:String, keyList:Array<String>}):Void;
	@IN_SIDE static function getFriendCloudStorage(obj:SFC<{data:Array<UserGameData>}> & {keyList:Array<String>}):Void;
	@IN_SIDE static function getUserInfo(obj:SFC<{data:Array<UserInfo>}> & {openIdList:Array<String> ,lang:Lang}):Void;
	@IN_SIDE static function onMessage(callb: KeyValue->Void):Void;
}

private typedef KVData = {
	key: String,
	value: Dynamic
}

private extern class UserGameData {
	var avatarUrl: String;
	var nickname: String;
	var openid: String;
	var KVDataList: Array<KVData>;
}
