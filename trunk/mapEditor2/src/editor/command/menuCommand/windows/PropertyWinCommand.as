package editor.command.menuCommand.windows
{
	import editor.model.menu.MenuProxy;
	import editor.type.CommandType;
	import editor.type.MenuCommandType;
	import editor.view.windows.property.PropertyWinMediator;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 属性面板
	 * @author 陈策
	 * 
	 */	
	public class PropertyWinCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			var mediator:PropertyWinMediator = facade.retrieveMediator(PropertyWinMediator.NAME) as PropertyWinMediator;
			var menuProxy:MenuProxy = facade.retrieveProxy(MenuProxy.NAME) as MenuProxy;
			if ( mediator )
			{
				PropertyWinMediator.removePopUp();
				menuProxy.setMenuToggled(MenuCommandType.PROPERTY_WIN, false);
			}
			else
			{
				PropertyWinMediator.addPopUp();
				menuProxy.setMenuToggled(MenuCommandType.PROPERTY_WIN, true);
			}
		}
	}
}