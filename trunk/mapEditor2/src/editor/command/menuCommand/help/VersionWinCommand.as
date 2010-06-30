package editor.command.menuCommand.help
{
	import editor.view.windows.VersionWinMediator;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 版本信息
	 * @author 陈策
	 * 
	 */	
	public class VersionWinCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			VersionWinMediator.addPopUp();
		}
	}
}