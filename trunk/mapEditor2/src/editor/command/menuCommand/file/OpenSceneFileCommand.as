package editor.command.menuCommand.file
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 打开一个场景文件
	 * @author 陈策
	 * 
	 */	
	public class OpenSceneFileCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			var test:Object = notification;
		}
	}
}