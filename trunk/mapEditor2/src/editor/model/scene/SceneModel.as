package editor.model.scene
{
	import editor.type.ErrorType;
	
	/**
	 * 场景数据
	 * @author 陈策
	 * 
	 */	
	public class SceneModel
	{
		private static var instance:SceneModel;
		
		/**
		 * 代表场景结构的XML
		 */		
		public var xml:XML;
		
		public function SceneModel()
		{
			if ( instance!=null ) throw Error(ErrorType.SINGLETON_MSG);
			instance = this;
		}
		
		public static function getInstance():SceneModel 
		{
			if (instance == null) instance = new SceneModel();
			return instance;
		}
	}
}