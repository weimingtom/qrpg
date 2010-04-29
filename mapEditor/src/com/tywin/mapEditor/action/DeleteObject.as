package com.tywin.mapEditor.action
{
	import com.tywin.mapEditor.rpg.GameLayer;
	import com.tywin.mapEditor.rpg.SceneObject;
	
	public class DeleteObject implements IAction
	{
		private var _parent:GameLayer;
		private var _obj:SceneObject;
		
		public function DeleteObject(obj:SceneObject)
		{
			_obj = obj;
			_parent = obj.gameLayer;
		}

		public function redo():void
		{
			if ( _parent && _obj )
			{
				try
				{
					_parent.removeObject(_obj);
				}
				catch ( e:* )
				{
					trace("重做删除物体错误。",e);
				}
			}
		}
		
		public function undo():void
		{
			if ( _parent && _obj )
			{
				try
				{
					_parent.addObject(_obj);
				}
				catch ( e:* )
				{
					trace("撤销删除物体错误。"+e);
				}
			}
		}
		
	}
}