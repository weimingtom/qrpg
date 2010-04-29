package editor.core.subControler
{
	import editor.event.EditEvent;
	import editor.modul.EditorModul;
	
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.FileFilter;
	
	public class OpenSceneFileControler
	{
		public function OpenSceneFileControler()
		{
		}
		
		public function openFile(src:String=null):void
		{
			if ( src )
			{
				loadFile(src);
			}
			else
			{
				var fileToOpen:File = new File();
				var txtFilter:FileFilter = new FileFilter("XML文件(.xml)", "*.xml");
				try
				{
					fileToOpen.browseForOpen("Open", [txtFilter]);
					fileToOpen.addEventListener(Event.SELECT, fileSelected);
				}
				catch (e:*)
				{
					trace("打开文件出错。"+e);
				}
			}
		}
		
		private function fileSelected(evt:Event):void
		{
			var file:File = evt.target as File;
			var stream:FileStream = new FileStream();
			stream.open(evt.target as File, FileMode.READ);
			var fileData:String = stream.readUTFBytes(stream.bytesAvailable);
			EditorModul.sceneFilePath = file.nativePath;
			new EditEvent(EditEvent.SCENE_XML_LOADED, new XML(fileData)).dispatch();
			
		}
		
		private function loadFile(src:String):void
		{
			var file:File = new File(src);
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.READ);
			var fileData:String = stream.readUTFBytes(stream.bytesAvailable);
			EditorModul.sceneFilePath = file.nativePath;
			new EditEvent(EditEvent.SCENE_XML_LOADED, new XML(fileData)).dispatch();
		}

	}
}