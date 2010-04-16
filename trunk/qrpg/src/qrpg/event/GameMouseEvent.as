package qrpg.event
{
	import qrpg.event.GameEvent;
	
	/**
	 * 游戏里的鼠标事件。
	 * @author 陈策
	 * @version 3.0
	 */
	public class GameMouseEvent extends GameEvent
	{
		public function GameMouseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}