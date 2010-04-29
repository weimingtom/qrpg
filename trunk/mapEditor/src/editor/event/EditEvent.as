package editor.event
{
	import flash.events.Event;

	public class EditEvent extends Event
	{
		public static const ORDER:String = "order";
		
		public static const COMPLETE:String = "complete";
		public static const SCENE_XML_LOADED:String = "sceneXMLLoaded";
		
		public static const FILE_NOT_EXIST:String = "fileNotExist";
		
		public static const SELECTED_CHANGE:String = "selectedChange";
		
		public static const RESIZE:String = "resize";
		
		public static const CENTER_CHANGE:String = "centerChange";
		public static const AREA_DATA_CHANGE:String = "areaDataChange";
		
		public static const NEW_SCENE:String = "newScene";
		
		public static const ADD_TO_SCENE:String = "addToScene";
		
		public static const SCENE_OBJECT_EDIT_SAVE:String = "sceneObjectEditSave";
		
		public var data:Object;
		
		public function EditEvent(type:String, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
		
		public function dispatch():void
		{
			EventPool.getInstance().dispatchEvent(this);
		}
		
	}
}