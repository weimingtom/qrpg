package qrpg.event
{
	/**
	 * 角色（RPGRole）的事件。
	 * @author Administrator
	 * 
	 */	
	public class RoleEvent extends GameEvent
	{
		/**
		 * 向上移动。
		 */		
		public static const MOVE_UP:String = "moveUp";
		
		/**
		 * 向下移动。
		 */		
		public static const MOVE_DOWN:String = "moveDown";
		
		/**
		 * 到达转折点。
		 */		
		public static const ARRIVE_POINT:String = "arrivePoint";
		
		/**
		 * 到达终于。
		 */		
		public static const ARRIVE_END:String = "arriveEnd";
		
		/**
		 * 
		 * @param type
		 * @param bubbles
		 * @param cancelable
		 * 
		 */		
		public function RoleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}