package com.tywin.client.core {
	import mx.utils.StringUtil;

	[Bindable]
	[RemoteClass(alias="com.tyhb.server.core.net.Packet")]
	public dynamic class Packet {

		public var callback:String;

		public var command:String;

		public var params:Array;

	}
}
