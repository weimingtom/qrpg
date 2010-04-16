package qrpg.event
{
	import flash.events.EventDispatcher;
	
	/**
	 * 事件池。
	 * @author 陈策
	 * @version 3.0
	 */
	public class EventPool extends EventDispatcher
	{
		private static var instance:EventPool;
		
		/**
		 * 事件池。
		 * @param access 
		 */		
		public function EventPool(access:Private)
		{
			if ( access!=null ) super();
			else throw new Error("EventPool 类不能实倒化。");
		}
		
		/**
		 * 得到EventPool实例。
		 * @return EventPool实例。
		 */		
		public static function getInstance():EventPool
		{
			if ( instance==null ) instance = new EventPool(new Private());
			return instance;
		}
		
		/**
		 * 重写addEventListener方法，使之默认为弱引用。
		 * @param type 事件类型。
		 * @param listener 处理事件的侦听器函数。
		 * @param useCapture 确定侦听器是运行于捕获阶段、目标阶段还是冒泡阶段。
		 * @param priority 事件侦听器的优先级。优先级由一个带符号的 32 位整数指定。数字越大，优先级越高。
		 * @param useWeakReference 确定对侦听器的引用是强引用，还是弱引用。
		 */
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=true):void
		{
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
	}

}
class Private{}