package editor.modul
{
	import mx.collections.ArrayCollection;
	
	public class EditorModul
	{
		[Bindable]
		public static var company:ArrayCollection;
		
		public static var exhibitCode:String;
		public static var sceneCode:String;
		
		private static var _fileName:String;
		public static function get fileName():String
		{
			return _fileName;
		}
		
		private static var _sceneFilePath:String;
		public static function set sceneFilePath(url:String):void
		{
			var arr:Array = url.split("\\");
			_fileName = arr.pop() as String;
			_sceneFilePath = arr.join("\\")+"\\";
		}
		public static function get sceneFilePath():String
		{
			return _sceneFilePath;
		}

	}
}