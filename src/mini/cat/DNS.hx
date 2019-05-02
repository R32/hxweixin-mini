package mini.cat;

import mini.Data;
import haxe.Constraints.Function;

/**
 https://developers.weixin.qq.com/miniprogram/dev/api/wx.stopLocalServiceDiscovery.html
*/
@:native("wx")
extern class DNS {
	// 停止搜索 mDNS 服务
	static function stopLocalServiceDiscovery(?obj:SFC<ErrMsg>):Void;

	// 开始搜索局域网下的 mDNS 服务。搜索的结果会通过 wx.onLocalService* 事件返回。
	static function startLocalServiceDiscovery(obj:SFC<ErrMsg> & {
		serviceType: String,
	}):Void;

	// attach...

	// 监听 mDNS 服务解析失败的事件
	static function onLocalServiceResolveFail(callb:ServiceInfo->Void):Void;

	// 监听 mDNS 服务离开的事件
	static function onLocalServiceLost(callb:ServiceInfo->Void):Void;

	// 监听 mDNS 服务发现的事件
	static function onLocalServiceFound(callb:ServiceInfoEx->Void):Void;

	// 监听 mDNS 服务停止搜索的事件, (TODO: The params of the callb are not clear)
	static function onLocalServiceDiscoveryStop(callb: Function):Void;

	// detach...

	// 取消监听 mDNS 服务解析失败的事件
	static function offLocalServiceResolveFail(?callb: Function):Void;
	// 取消监听 mDNS 服务离开的事件
	static function offLocalServiceLost(?callb: Function):Void;
	// 取消监听 mDNS 服务发现的事件
	static function offLocalServiceFound(?callb: Function):Void;
	// 取消监听 mDNS 服务停止搜索的事件
	static function offLocalServiceDiscoveryStop(?callb: Function):Void;
}

private typedef ServiceInfo = {
	serviceType: String,
	serviceName: String,
}

private typedef ServiceInfoEx = ServiceInfo & {
	ip:String,
	port: Int,
}
