package editor.model.scene
{
	import editor.type.SceneModelType;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	/**
	 * 场景数据代理
	 * @author 陈策
	 * 
	 */	
	public class SceneProxy extends Proxy implements IProxy
	{
		public static const NAME:String = "SceneProxy";
		
		public function SceneProxy(data:Object=null)
		{
			super(NAME, data);
		}
		
		/**
		 * 场景数据
		 */		
		private function get sceneData():SceneModel
		{
			return data as SceneModel;
		}
		
		
		/**
		 * 是否有场景数据。
		 * @return 
		 */		
		public function hasData():Boolean
		{
			if ( !sceneData.xml || !sceneData.xml.toString() ) return false;
			return true;
		}
		
		/**
		 * 设置场景为新的XML
		 * @param xml
		 * @return 
		 */		
		public function newSceneData(xml:XML):void
		{
			sceneData.xml = xml;
			sendNotification(SceneModelType.UPDATE);
		}
		
		/**
		 * 设置被选择的物体。如果为null，未选中任何物体。
		 */		
		public function set selected(obj:*):void
		{
			sceneData.selected = obj;
			sendNotification(SceneModelType.OBJECT_SELECTED);
		}
		public function get selected():*
		{
			return sceneData.selected;
		}
	}
}