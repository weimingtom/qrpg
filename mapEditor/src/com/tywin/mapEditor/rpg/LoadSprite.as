package com.tywin.mapEditor.rpg
{
	import com.tywin.mapEditor.event.EditEvent;
	import com.tywin.mapEditor.modul.EditorModul;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	
	/**
	 *  加载完成后发布。
	 *  @eventType com.tywin.mapEditor.event.EditEvent.COMPLETE
	 *  @tiptext complete event
	 */
	[Event(name="complete", type="com.tywin.mapEditor.event.EditEvent")]
	
	public class LoadSprite extends GameSprite
	{
		protected var bmpdata:ByteArray;
		public var bitmapData:BitmapData;
		
		public function LoadSprite(src:String)
		{
			super();
			this.src = src;
		}
		
		public function set src(value:String):void
		{
			var file:File = new File();
			file.nativePath = EditorModul.sceneFilePath+value;
			var stream:FileStream = new FileStream();
			
			try
			{
				stream.open(file, FileMode.READ);
				bmpdata = new ByteArray();
				stream.readBytes(bmpdata,0,stream.bytesAvailable);
			}
			catch(e:*)
			{
				trace("加载的文件{"+(EditorModul.sceneFilePath+value)+"}不存在。");
				dispatchEvent(new EditEvent(EditEvent.FILE_NOT_EXIST, EditorModul.sceneFilePath+value));
			}
		}
		
		public function load():void
		{
			if ( !bmpdata || bmpdata.length==0 ) return;
			var permit:LoaderContext = new LoaderContext();
			permit.allowLoadBytesCodeExecution = true; 
			var load:Loader = new Loader();
			load.loadBytes(bmpdata, permit);
			load.contentLoaderInfo.addEventListener(Event.COMPLETE, onCom);
		}
		
		protected function onCom(evt:Event):void
		{
			var bmp:Bitmap = (evt.target as LoaderInfo).loader.content as Bitmap;
			bitmapData = bmp.bitmapData;
			dispatchEvent(new EditEvent(EditEvent.COMPLETE, this));
		}
		
	}
}