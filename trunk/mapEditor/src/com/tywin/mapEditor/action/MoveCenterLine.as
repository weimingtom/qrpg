package com.tywin.mapEditor.action
{
	import com.tywin.mapEditor.wiew.resourcewin.ShowCenter;
	
	public class MoveCenterLine implements IAction
	{
		public var oldX:int;
		public var oldY:int;
		public var newX:int;
		public var newY:int;
		public var isMove:Boolean;
		
		private var centerLine:ShowCenter
		
		public function MoveCenterLine(obj:ShowCenter)
		{
			centerLine = obj;
		}

		public function redo():void
		{
			if ( !isMove ) return;
			if ( centerLine )
			centerLine.setCenter(newX, newY);
		}
		
		public function undo():void
		{
			if ( !isMove ) return;
			if ( centerLine )
			centerLine.setCenter(oldX, oldY);
		}
		
	}
}