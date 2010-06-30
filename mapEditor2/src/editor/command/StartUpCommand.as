package editor.command
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.patterns.command.MacroCommand;
	
	/**
	 * 开始运行
	 * @author 陈策
	 * 
	 */	
	public class StartUpCommand extends MacroCommand implements ICommand
	{
		override protected function initializeMacroCommand():void
		{
			addSubCommand( RegisterCommand );
			addSubCommand( InitMenuCommand );
		}
	}
}