package editor.command.other
{
	import editor.model.menu.MenuProxy;
	import editor.model.scene.SceneProxy;
	import editor.type.MenuCommandType;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.puremvc.as3.patterns.facade.Facade;
	
	/**
	 * 新建场景确定
	 * @author 陈策
	 * 
	 */	
	public class newSceneDataCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			var sceneProxy:SceneProxy = facade.retrieveProxy(SceneProxy.NAME) as SceneProxy;
			var menuProxy:MenuProxy = facade.retrieveProxy(MenuProxy.NAME) as MenuProxy;
			
			var obj:Object = notification.getBody();
			var width:int = int(obj.width);
			var height:int = int(obj.height);
			var filePath:String = String(obj.filePath);
			var xml:XML = <scene width={width} height={height} filePath={filePath}>
				<lib/>
				<block/>
			</scene>
			
			sceneProxy.newSceneData(xml);
			
			menuProxy.setMenuEnable(MenuCommandType.SAVE_FILE, true);	//保存
			menuProxy.setMenuEnable(MenuCommandType.SAVE_AS, true);		//另存
		}
	}
}