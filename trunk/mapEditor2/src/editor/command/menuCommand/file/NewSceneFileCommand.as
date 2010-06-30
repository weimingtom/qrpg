package editor.command.menuCommand.file
{
	import editor.view.windows.NewSceneMediator;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 新建一个场景文件
	 * @author 陈策
	 * 
	 */	
	public class NewSceneFileCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			NewSceneMediator.addPopUp();
		}
	}
}