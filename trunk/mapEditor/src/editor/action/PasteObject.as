package editor.action
{
	import editor.core.Controler;
	import editor.rpg.GameLayer;
	import editor.rpg.SceneObject;
	
	public class PasteObject implements IAction
	{
		private var _gameLayer:GameLayer;
		private var _obj:SceneObject;
		
		public function PasteObject(gameLayer:GameLayer, obj:SceneObject)
		{
			_gameLayer = gameLayer;
			_obj = obj.copy();
		}

		public function redo():void
		{
			if ( !_gameLayer || !_obj ) return;
			var ctrl:Controler = Controler.getInstance();
			var obj:SceneObject = _obj.copy();
			_obj.x = ctrl.scene.focusX+ctrl.root.width/2;
			_obj.y = ctrl.scene.focusY+ctrl.root.height/2;
			try
			{
				_gameLayer.addObject(_obj);
			}
			catch ( e:* )
			{
				trace("重做粘贴出错。"+e);
			}
		}
		
		public function undo():void
		{
			if ( !_gameLayer || !_obj ) return;
			try
			{
				_gameLayer.removeObject(_obj);
			}
			catch ( e:* )
			{
				trace("重做粘贴出错。"+e);
			}
		}
		
	}
}