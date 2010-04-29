package editor.view.resourcewin
{
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	public class SaveObj
	{
		private var path:String;
		private var xml:XML;
		
		public function SaveObj(path:String, xml:XML)
		{
			this.path = path;
			this.xml = xml;
		}
		
		public function save():void
		{
			var file:File = new File(path);
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.WRITE);
			stream.writeUTFBytes("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");
			stream.writeUTFBytes(xml.toXMLString()); 
			stream.close();
		}
		
		public function saveAs():void
		{
			var file:File = new File(path);
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
			stream.writeUTFBytes(xml.toXMLString());
			stream.close();
		}

	}
}