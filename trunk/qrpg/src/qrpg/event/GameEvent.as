package qrpg.event
{
	import flash.events.Event;
	
	/**
	 * 游戏的基础事件。
	 * @author 陈策
	 * @version 3.0
	 * @created 12-六月-2009 22:54:21
	 */
	public class GameEvent extends Event
	{
		/**
		 * 物体的显示需要更新。
		 */		
		public static const UPDATE:String = "update";
		
		/**
		 * 游戏的基础事件。
		 * @param type
		 * @param bubbles
		 * @param cancelable
		 */		
		public function GameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		/**
		 * 发布全局事件。将该类的实例由EventPool发布。
		 */
		public function dispatch(): void
		{
			EventPool.getInstace().dispatchEvent(this);
		}
		
	}
}