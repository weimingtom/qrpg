package editor.modul
{
	public class ModulProxy
	{
		/**
		 * 场景的文件名。
		 */		
		public static function get fileName():String
		{
			return EditorModul.fileName;
		}
		
		/**
		 * 场景保存的路径
		 */		
		public static function set sceneFilePath(url:String):void
		{
			var arr:Array = url.split("\\");
			EditorModul.fileName = arr.pop() as String;
			EditorModul.sceneFilePath = arr.join("\\")+"\\";
		}
		public static function get sceneFilePath():String
		{
			return EditorModul.sceneFilePath;
		}
		
		/**
		 * 按元件ID得到元件库里的数据。
		 * @param id 元件ID
		 * @return 元件的XML
		 */		
		public static function getResource(resourceId:String):XML
		{
			resourceId = resourceId.replace(/\#/g, "");
			var resource:XML = EditorModul.resource;
			var xml:XML = resource..item.(@id==resourceId)[0];
			return xml;
		}

	}
}