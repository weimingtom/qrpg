package editor.action
{
	import editor.rpg.GameLayer;
	import editor.rpg.SceneObject;
	
	public class AddSceneObject implements IAction
	{
		private var _obj:SceneObject;
		private var _layer:GameLayer;
		
		public function AddSceneObject(obj:SceneObject, layer:GameLayer)
		{
			_obj = obj;
			_layer = layer;
		}

		public function redo():void
		{
			_layer.addObject(_obj);
		}
		
		public function undo():void
		{
			_layer.removeObject(_obj);
		}
		
	}
}