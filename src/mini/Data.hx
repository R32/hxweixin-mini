package mini;

/**
```haxe
WX.getSetting({
	success: function(res){
		if (res.authSetting[userInfo]) {
		}
	}
});
```
*/
enum abstract AuthSetting(String) to String {
	var userInfo = "scope.userInfo";
	var userLocation = "scope.userLocation";
	var address = "scope.address";
	var invoiceTitle = "scope.invoiceTitle";
	var invoice = "scope.invoice";
	var werun = "scope.werun";
	var record = "scope.record";
	var writePhotosAlbum = "scope.writePhotosAlbum";
	var camera = "scope.camera";
}

enum abstract ScreenDirection(Int) {
	var D0   = 0;
	var D90  = 90;
	var NEG90 = -90;
}

enum abstract Align(String) {
	var left;
	var center;
	var right;
}

enum abstract AudioSource(String) {
	var auto;
	var buildInMic;
	var headsetMic;
	var mic;
	var camcorder;
	var voice_communication;
	var voice_recognition;
}

enum abstract DeviceInterval(String) {
	var game;
	var ui;
	var normal;
}

enum abstract Lang(String) {
	var en;
	var zh_CN;
	var zh_TW;
}

typedef UserInfo = {
	nickName: String,
	avatarUrl: String,
	gender: Int,
	country: String,
	province: String,
	city: String,
	language: Lang,
}

typedef P3D = {
	x:Float,
	y:Float,
	z:Float,
}

typedef QueryData = haxe.DynamicAccess<String>;
typedef KeyValue = haxe.DynamicAccess<Any>;

// FileSystemManager.stat() => EithType<FileStat, haxe.DynamicAccess<FileStat>
typedef FileStat = {
	mode: String,
	size: Int,
	lastAccessedTime: Float,
	lastModifiedTime: Float,
	isDirectory: ()->Bool,
	isFile: ()->Bool
}

typedef Rect = {
	?top: Float,
	?right: Float,
	?bottom: Float,
	?left: Float,
	?width: Float,
	?height: Float,
}

typedef ErrMsg = { errMsg: String }
typedef SFC<T> = {
	?success: T->Void,  // (T & ErrMsg) is illegal, but you don't need ErrMsg in success
	?fail: ErrMsg->Void,
	?complete: ErrMsg->Void,
}

typedef ErrCode = ErrMsg & { errCode: Int }
typedef SFCX<T> = {
	?success: T->Void,
	?fail: ErrCode->Void,
	?complete: ErrCode->Void,
}

// for wx.startSoterAuthentication
typedef AuthResultJSON = {
	raw: String,
	fid: String,
	counter: Int,
	tee_n: String,
	tee_v: String,
	fp_n: String,
	fp_v: String,
	cpu_id: String,
	uid: String,
}

typedef WeRunData = {
	stepInfoList: Array<{
		timestamp: Float,
		step: Int
	}>
}

typedef AppLaunchOptions = {
#if (!mini_game)
	path: String,          // 启动小程序的路径
#end
	scene: Int,            // 启动小程序的场景值
	query: QueryData,      // 启动小程序的 query 参数
	shareTicket: String,   // 获取更多转发信息
	referrerInfo: {        // 来源信息。从另一个小程序、公众号或 App 进入小程序时返回。否则返回 {}
		appId: String,        // 来源小程序、公众号或 App 的 appId
		extraData: Dynamic,   // 来源小程序传过来的数据，scene=1037或1038时支持
	}, //
}

typedef PageNotFoundOptions = {
	path: String,
	query: QueryData,
	isEntryPage: Bool,
}

typedef WindowResize = {
	windowWidth: Int,
	windowHeight: Int,
}
