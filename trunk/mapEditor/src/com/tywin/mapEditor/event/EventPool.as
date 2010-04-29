package com.tywin.mapEditor.event
{
	import flash.events.EventDispatcher;

	public class EventPool extends EventDispatcher
	{
		private static var _instance:EventPool;
		
		public function EventPool(access:Private=null)
		{
			if ( access!=null ) super();
			else throw new Error("EventPool 类不能实例化。");
		}
		
		public static function getInstance():EventPool
		{
			if ( !_instance ) _instance = new EventPool(new Private());
			return _instance;
		}
		
		public static function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=true):void
		{
			EventPool.getInstance().addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public static function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			EventPool.getInstance().removeEventListener(type, listener, useCapture);
		}
		
	}
}
class Private{}