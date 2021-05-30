package test;

import mini.App;
import mini.Page;
import mini.WX;
import mini.Data;
// import mini.cat.Debug;
import mini.cat.AppEvent;
import mini.cat.SystemInfo;
import mini.cat.Timer;
import mini.cat.UpdateManager;
import mini.cat.Navigator;
import mini.cat.UI;
import mini.cat.Animation;
import mini.cat.Web;
import mini.cat.DNS;
import mini.cat.WebSocket;
import mini.cat.Storage;
import mini.cat.Map;
import mini.cat.Image;
import mini.cat.Video;
import mini.cat.Audio;
import mini.cat.AudioRecord;
import mini.cat.Live;
import mini.cat.Camera;
import mini.cat.Location;
import mini.cat.Share;
import mini.cat.Canvas;
import mini.cat.File;
import mini.cat.IBeacon;
import mini.cat.WIFI;
import mini.cat.Contact;
import mini.cat.BLE;
import mini.cat.Bluetooth;
import mini.cat.Battery;
import mini.cat.Clipboard;
import mini.cat.NFC;
import mini.cat.NetWork;
import mini.cat.Screen;
import mini.cat.PhoneCall;
import mini.cat.Accelerometer;
import mini.cat.Compass;
import mini.cat.DeviceMotion;
import mini.cat.Gyroscope;
import mini.cat.Vibrate;
import mini.cat.Worker;
import mini.cat.WXML;
import mini.cat.Ad;
#if mini_game
import mini.game.Touch;
import mini.game.Performance;
import mini.game.Res;
import mini.game.Payment;
import mini.game.OpenDataContext;
#end

class WxMini {

	public static function main() {
		setTimeout(function(){
			trace("setTimeout");
		}, 300);

		if (Math.random() < 1.0) return;
		// never run to here

		var updateManager = UpdateManager.get();
		updateManager.onCheckForUpdate(function(res){
			trace(res.hasUpdate);
			updateManager.applyUpdate();
		});

		Web.request({
			url: "http://bing.com",
			method: GET,
			success: function(res){
				if (res.statusCode == 200) {
					trace(res.data);
				}
			},
			fail: function(x) {
				trace(x.errMsg);
			}
		});

		SystemInfo.get({success: function(res){
			trace(res.language);
		}});

		Storage.clearSync();

		var fm = File.getFileSystemManager();
		fm.appendFile({
			filePath: "./tmp.txt",
			data: "hello",
		});
		fm.readFile({
			filePath: "./tmp.txt",
			success: function(res) {
			}
		});

		Battery.getInfo({
			success: function(res){
				trace(res.level);
			}
		});

		Clipboard.getData({
			success: function(res){
				trace(res.data);
			}
		});

		Accelerometer.onChange(function(p){
			trace(p.x * p.x + p.y * p.y + p.z * p.z);
		});

		DeviceMotion.onChange(function(x){
			trace(x.alpha * x.beta * x.gamma);
		});

		Vibrate.long();

		var worker = Worker.create("");
		worker.postMessage({
			msg: "hi"
		});

		var adv = Ad.createRewardedVideoAd({adUnitId: ""});
		adv.load().then(function(res){
			trace(res);
		}).catchError(function(err){

		});
	#if mini_game
		Touch.onTouchStart(function(res){
			trace(res.timeStamp);
		});
		Performance.triggerGC();
		AppEvent.exitMiniProgram();
		var img = Res.createImage();
		img.onload = function() {

		}
		Timer.setPreferredFramesPerSecond(30);
		UI.setMenuStyle({style:dark});
		UI.onKeyboardComplete(function(res){
			trace(res.value);
		});
		Share.onShareAppMessage(function(res){
			trace(res.title);
		});
		Payment.requestMidasPayment({
			mode: game,
			offerId: "",
			currencyType: CNY,
		});

		Screen.onDeviceOrientationChange(function(x){
			trace(x.value);
		});

		var ctx = OpenDataContext.getOpenDataContext();
		ctx.postMessage({hello: "world!"});
		if (Math.random() < 1.0) return;
		OpenDataContext.onMessage(function(obj){
			trace(obj);
		});
	#else
		new App({
			onLaunch: function(opt) {
				WX.getSetting({
					success: function(res){
						if (res.authSetting[userInfo]) {
							trace("greeting");
						}
					}
				});
			},
			onShow: function(opt){
				trace(js.Lib.nativeThis.globalData);
			},
			onPageNotFound: function(opt) {
				trace(opt.path);
			},
			customData: {
				userInfo: null,
			},
		});
		getCurrentPages();
		new Page({
			data: {
				a: 1,
				b: 2,
				appear: false,
			},
			onShareAppMessage: function(obj) {
				return {
					title: "...."
				}
			},
			onLoad: function(data) {
				var obs = WXML.createIntersectionObserver(js.Lib.nativeThis);
				obs.relativeTo(".parent").observe(".tarelem", function(res){
					js.Lib.nativeThis.data.appear = res.intersectionRatio > 0;
				});
			}
		});
		// canvas
		var ctx = Canvas.createCanvasContext("canvas");
		var pat = ctx.createPattern("", repeat);
		ctx.fillStyle = pat;
		ctx.strokeStyle = "#ff0000";
		ctx.moveTo(50, 50);
		ctx.fillText("you are my fire!", 0, 0);
		ctx.draw();

		WX.requestPayment({
			timeStamp: "timeStamp",
			nonceStr: "nonceStr",
			"package": "package",
			paySign: "paySign",
		});

		DNS.stopLocalServiceDiscovery();

		var anim = Animation.create();
		anim.rotateX(90);
		anim.rotateY(60);

		WIFI.connectWifi({
			SSID: "",
			BSSID: "",
			password: "",
		});

		Contact.addPhoneContact({
			firstName: "jojo",
		});

		BLE.getBLEDeviceServices({
			deviceId: "",
			success: function(res){
				trace(res.services);
			}
		});

		Bluetooth.getBluetoothDevices({
			success: function(res){
				trace(res.devices.length);
			}
		});

		NFC.getHCEState({
			success: function(res){
				trace(res.errCode == 0);
			}
		});
	#end
	}
}
