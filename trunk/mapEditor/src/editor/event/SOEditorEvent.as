package editor.event
{
	public class SOEditorEvent extends EditEvent
	{
		public static const ORDER:String = "soOrder";
		
		public static const EXIT:String = "soExit";
		
		public function SOEditorEvent(type:String, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, data, bubbles, cancelable);
		}
		
	}
}