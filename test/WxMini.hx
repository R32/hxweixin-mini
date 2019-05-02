package test;

import mini.App;
import mini.Page;
import mini.WX;
import mini.Data;
import mini.cat.Debug;
import mini.cat.AppEvent;
import mini.cat.SystemInfo;
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

class WxMini {

	public static function main() {

		App.make({
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
		}, {
			globalData: {
				userInfo: null,
			},
		});

		if (Math.random() < 1.0) return;
		// never run to here
		Page.getCurrentPages();

		Page.make({
			data: {
				a: 1,
				b: 2,
				appear: false,
			},
			onShareAppMessage: function(obj){
				return {
					title: "...."
				}
			},
			onLoad: function(){
				var obs = WXML.createIntersectionObserver(js.Lib.nativeThis);
				obs.relativeTo(".parent").observe(".tarelem", function(res){
					js.Lib.nativeThis.data.appear = res.intersectionRatio > 0;
				});
			}
		});
		//
		var updateManager = UpdateManager.get();
		updateManager.onCheckForUpdate(function(res){
			trace(res.hasUpdate);
			updateManager.applyUpdate();
		});

		DNS.stopLocalServiceDiscovery();

		Web.request({
			url: "https://www.baidu.com",
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
		//var audio = WxAudio.createAudioContext("id_audio");
		//var map = WxMap.createMapContext("id_map");

		Storage.clearSync();

		var anim = Animation.create();
		anim.rotateX(90);
		anim.rotateY(60);

		var cav = Canvas.create("canvas");
		var pat = cav.createPattern("", repeat);
		cav.fillStyle = pat;
		cav.strokeStyle = "#ff0000";
		cav.moveTo(50, 50);
		cav.fillText("you are my fire!", 0, 0);
		cav.draw();

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

		WX.requestPayment({
			timeStamp: "timeStamp",
			nonceStr: "nonceStr",
			"package": "package",
			paySign: "paySign",
		});

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
		NFC.getHCEState({
			success: function(res){
				trace(res.errCode == 0);
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
	}
}
