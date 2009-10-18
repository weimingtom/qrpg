///////////////////////////////////////////////////////////
//  DisplayGameObject.as
//  Macromedia ActionScript Implementation of the Class DisplayGameObject
//  Generated by Enterprise Architect
//  Created on:      12-六月-2009 22:54:21
//  Original author: 陈策
///////////////////////////////////////////////////////////

package qrpg.core
{
	import flash.display.Sprite;
	
	/**
	 * @author 陈策
	 * @version 3.0
	 * @created 12-六月-2009 22:54:21
	 */
	public class DisplayGameObject extends Sprite
	{
		/**
		 * @param type 事件类型。
		 * @param listener 处理事件的侦听器函数。
		 * @param useCapture 确定侦听器是运行于捕获阶段、目标阶段还是冒泡阶段。
		 * @param priority 事件侦听器的优先级。优先级由一个带符号的 32 位整数指定。数字越大，优先级越高。
		 * @param useWeakReference 确定对侦听器的引用是强引用，还是弱引用。
		 */
		override public function addEventListener(type:String,
																				 listener:Function,
																				 useCapture:Boolean=false, 
																				 priority:int=0, 
																				 useWeakReference:Boolean=true):void
		{
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}

	}
}