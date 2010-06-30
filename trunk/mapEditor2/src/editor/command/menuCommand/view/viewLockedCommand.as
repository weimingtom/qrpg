package editor.command.menuCommand.view
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 显示/不显示被锁定
	 * @author 陈策
	 * 
	 */	
	public class viewLockedCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			
		}
	}
}