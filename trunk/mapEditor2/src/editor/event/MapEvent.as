package editor.event
{
	import flash.events.Event;
	
	/**
	 * 编辑器事件。
	 * @author 陈策
	 * 
	 */	
	public class MapEvent extends Event
	{
		/**
		 * 确定
		 */		
		public static const CONFORM:String = "comform";
		
		public var data:Object;
		
		public function MapEvent(type:String, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
	}
}