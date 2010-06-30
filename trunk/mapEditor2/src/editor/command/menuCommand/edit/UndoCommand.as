package editor.command.menuCommand.edit
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 撤消
	 * @author 陈策
	 * 
	 */	
	public class UndoCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			
		}
	}
}