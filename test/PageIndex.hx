package test;

import mini.Page;
import js.Lib.nativeThis;

@:native("main") function main() {
	new Page({
		onLoad : function(query) {
			trace(query.abc);
			trace(query.x);
		},

		data : {
			lol : 101,
			data : [1, 2, 3, 4],
			extra : {
				x : 0.5,
				y : 0.5,
			}
		}
	});
}
