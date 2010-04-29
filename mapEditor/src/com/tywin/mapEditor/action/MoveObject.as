package com.tywin.mapEditor.action
{
	import com.tywin.mapEditor.rpg.GameLayer;
	import com.tywin.mapEditor.rpg.SceneObject;
	
	public class MoveObject implements IAction
	{
		public var oldX:int;
		public var oldY:int;
		public var newX:int;
		public var newY:int;
		public var isMove:Boolean;
		
		private var _obj:SceneObject;
		
		public function MoveObject(obj:SceneObject)
		{
			_obj = obj;
			isMove = false;
		}

		public function redo():void
		{
			if ( !isMove ) return;
			if ( _obj && _obj.parent )
			{
				_obj.x = newX;
				_obj.y = newY;
				(_obj.parent as GameLayer).resetObject(_obj);
			}
		}
		
		public function undo():void
		{
			if ( !isMove ) return;
			if ( _obj && _obj.parent )
			{
				_obj.x = oldX;
				_obj.y = oldY;
				(_obj.parent as GameLayer).resetObject(_obj);
			}
		}
		
	}
}