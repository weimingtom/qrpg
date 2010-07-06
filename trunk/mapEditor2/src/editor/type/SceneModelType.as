package editor.type
{
	/**
	 * 场景数据变化类型
	 * @author 陈策
	 */	
	public class SceneModelType
	{
		/**
		 * 场景数据有更新。（笼统的更新，需要全部刷新）
		 */		
		public static const UPDATE:String = "sceneModelUpdate";
		
		/**
		 * 场景里某物体被选中或者取消选中状态。
		 */		
		public static const OBJECT_SELECTED:String = "sceneModelObjectSelected";
	}
}