package com.tywin.client.core{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.utils.ByteArray;


	public class ServletAdapter {

		public static var SERVER_URL:String = "http://192.168.15.164:8080/exhibit_web/servlet/Amf3Servlet";

		private var parentInstance:Object;

		private var urlLoader:URLLoader;

		private var urlRequest:URLRequest;

		public function ServletAdapter(parentInstance:Object) {
			this.parentInstance = parentInstance;
		}

		public function call(command:String, callback:String, params:Array = null):void {

			var packet:Packet = new Packet();
			packet.command = command;
			packet.callback = callback;
			packet.params = params;

			var ba:ByteArray = new ByteArray();
			ba.writeObject(packet);

			var isCompress:Boolean = false;

			if (ba.length > 2048) {
				ba.compress();
				isCompress = true;
			}

			var temp:ByteArray = new ByteArray();

			temp.writeInt(ba.length);
			temp.writeBoolean(isCompress);
			temp.writeBytes(ba);

			urlRequest = new URLRequest();
			urlRequest.url = SERVER_URL;
			urlRequest.contentType = 'multipart/form-data;';
			urlRequest.method = URLRequestMethod.POST;
			urlRequest.data = temp;
			urlRequest.requestHeaders.push(new URLRequestHeader('Cache-Control', 'no-cache'));

			urlLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, callHandler);
			urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
			urlLoader.load(urlRequest);
		}

		private function callHandler(event:Event):void {
			var ba:ByteArray = ByteArray(event.currentTarget.data);
			var dataLength:int = ba.readInt();

			if (ba.bytesAvailable <= dataLength)
				return;

			var isCompress:Boolean = ba.readBoolean();

			var temp:ByteArray = new ByteArray();
			ba.readBytes(temp, 0, dataLength);

			if (isCompress)
				temp.uncompress();

			var packet:Packet = temp.readObject();

			var methodName:String = packet.command

			callMethod(methodName, packet.params);
		}

		private function callMethod(methodName:String, params:Array):void {

			switch (params.length) {
				case 0:
					parentInstance[methodName]();
					break;
				case 1:
					parentInstance[methodName](params[0]);
					break;
				case 2:
					parentInstance[methodName](params[0], params[1]);
					break;
				case 3:
					parentInstance[methodName](params[0], params[1], params[2]);
					break;
				case 4:
					parentInstance[methodName](params[0], params[1], params[2], params[3]);
					break;
				case 5:
					parentInstance[methodName](params[0], params[1], params[2], params[3], params[4]);
					break;
				case 6:
					parentInstance[methodName](params[0], params[1], params[2], params[3], params[4], params[5]);
					break;
				default:
			}
		}
	}
}