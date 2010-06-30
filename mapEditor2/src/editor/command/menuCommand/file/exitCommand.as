package editor.command.menuCommand.file
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 退出编辑
	 * @author 陈策
	 * 
	 */	
	public class exitCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			
		}
	}
}