package editor.command
{
	import editor.model.menu.MenuModel;
	import editor.model.menu.MenuProxy;
	import editor.view.menu.MapMenu;
	import editor.view.menu.MenuMediator;
	
	import mx.core.Application;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.IModel;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 初始化菜单。
	 * @author 陈策
	 * 
	 */	
	public class InitMenuCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			var menu:MapMenu = (facade.retrieveMediator( MenuMediator.NAME ) as MenuMediator).menu;
			menu.dataProvider = MenuModel.getInstance().mainMenuData;
			menu.labelField = "@label";
			Application.application.addChild( menu );
		}
	}
}