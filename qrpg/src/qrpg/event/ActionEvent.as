package qrpg.event
{
	/**
	 * 动作事件。
	 * @author 陈策
	 * @version 3.0
	 */	
	public class ActionEvent extends GameEvent
	{
		/**
		 * 当前动作改变。
		 */		
		public static const ACTION_CHANGE:String = "actionChange";
		
		/**
		 * 指针发生改变。
		 */		
		public static const POINTER_CHANGE:String = "pointerChange";
		
		/**
		 * 行走。
		 */		
		public static const STEP:String = "step";
		
		/**
		 * 动作事件。
		 * @param type 事件类型。
		 */		
		public function ActionEvent(type:String)
		{
			super(type);
		}
	}
}