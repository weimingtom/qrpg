package com.tywin.mapEditor.core.subControler
{
	import com.tywin.mapEditor.modul.EditorModul;
	
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	public class SaveSceneXMLFile
	{
		public var data:XML;
		
		public function SaveSceneXMLFile(data:XML=null)
		{
			this.data = data;
		}
		
		public function save():void
		{
			var file:File = new File(EditorModul.sceneFilePath+EditorModul.fileName);
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.WRITE);
			stream.writeUTFBytes("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");
			stream.writeUTFBytes(data.toXMLString()); 
			stream.close();
		}
		
		public function saveAs():void
		{
			var file:File = new File(EditorModul.sceneFilePath);
			try
			{
				file.browseForSave("另存为");
				file.addEventListener(Event.SELECT, saveData);
			}
			catch ( e:* )
			{
				trace("另存出错，", e);
			}
		}
		
		private function saveData(evt:Event):void
		{
			var file:File = evt.target as File;
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.WRITE);
			stream.writeUTFBytes("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");
			stream.writeUTFBytes(data.toXMLString()); 
			stream.close();
		}

	}
}