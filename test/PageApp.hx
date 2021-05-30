package test;

import mini.App;
import js.Lib.nativeThis;

@:native("main") function main() {
	new App({
		onLaunch : function(opt) {
			trace(opt.path);
			trace(nativeThis.customData.a);
		},
		customData : {
			a : 101,
		},
	});
}
