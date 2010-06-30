package editor.command.menuCommand.edit
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.patterns.command.MacroCommand;
	
	/**
	 * 剪切
	 * @author 陈策
	 * 
	 */	
	public class CutCommand extends MacroCommand implements ICommand
	{
		override protected function initializeMacroCommand():void
		{
			addSubCommand( CopyCommand );
			addSubCommand( DeleteCommand );
		}
	}
}