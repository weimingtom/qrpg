package editor.command
{
	import editor.command.menuCommand.edit.CopyCommand;
	import editor.command.menuCommand.edit.CutCommand;
	import editor.command.menuCommand.edit.DeleteCommand;
	import editor.command.menuCommand.edit.EditLayerCommand;
	import editor.command.menuCommand.edit.PasteCommand;
	import editor.command.menuCommand.edit.RedoCommand;
	import editor.command.menuCommand.edit.UndoCommand;
	import editor.command.menuCommand.file.NewSceneFileCommand;
	import editor.command.menuCommand.file.OpenSceneFileCommand;
	import editor.command.menuCommand.file.SaveAsCommand;
	import editor.command.menuCommand.file.SaveFileCommand;
	import editor.command.menuCommand.file.exitCommand;
	import editor.command.menuCommand.help.HelpWinCommand;
	import editor.command.menuCommand.help.VersionWinCommand;
	import editor.command.menuCommand.res.ResAddCommand;
	import editor.command.menuCommand.res.ResDeleteCommand;
	import editor.command.menuCommand.res.ResModifyCommand;
	import editor.command.menuCommand.res.ResNewCommand;
	import editor.command.menuCommand.res.ResRefreshCommand;
	import editor.command.menuCommand.view.actualSizeCommand;
	import editor.command.menuCommand.view.viewLayerCommand;
	import editor.command.menuCommand.view.viewLockedCommand;
	import editor.command.menuCommand.view.viewSelectedCommand;
	import editor.command.menuCommand.view.zoomInCommand;
	import editor.command.menuCommand.view.zoomOutCommand;
	import editor.command.menuCommand.windows.PropertyWinCommand;
	import editor.command.menuCommand.windows.ResourceWinCommand;
	import editor.command.menuCommand.windows.ToolsCommand;
	import editor.command.menuCommand.windows.resetWinCommand;
	import editor.command.other.newSceneDataCommand;
	import editor.type.CommandType;
	import editor.type.MenuCommandType;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 注册相应的Command
	 * @author 陈策
	 * 
	 */	
	public class RegisterCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			//菜单命令
			//文件
			facade.registerCommand(MenuCommandType.NEW_SCENE_FILE, NewSceneFileCommand);
			facade.registerCommand(MenuCommandType.OPEN_SCENE_FILE, OpenSceneFileCommand);
			facade.registerCommand(MenuCommandType.SAVE_FILE, SaveFileCommand);
			facade.registerCommand(MenuCommandType.SAVE_AS, SaveAsCommand);
			facade.registerCommand(MenuCommandType.EXIT, exitCommand);
			//编辑
			facade.registerCommand(MenuCommandType.UNDO, UndoCommand);
			facade.registerCommand(MenuCommandType.REDO, RedoCommand);
			facade.registerCommand(MenuCommandType.COPY, CopyCommand);
			facade.registerCommand(MenuCommandType.CUT, CutCommand);
			facade.registerCommand(MenuCommandType.PASTE, PasteCommand);
			facade.registerCommand(MenuCommandType.DELETE, DeleteCommand);
			facade.registerCommand(MenuCommandType.EDIT_FRONT, EditLayerCommand);
			facade.registerCommand(MenuCommandType.EDIT_MAIN, EditLayerCommand);
			facade.registerCommand(MenuCommandType.EDIT_BACKGROUND, EditLayerCommand);
			//资源
			facade.registerCommand(MenuCommandType.RES_NEW, ResNewCommand);
			facade.registerCommand(MenuCommandType.RES_MODIFY, ResModifyCommand);
			facade.registerCommand(MenuCommandType.RES_DELETE, ResDeleteCommand);
			facade.registerCommand(MenuCommandType.RES_REFRESH, ResRefreshCommand);
			facade.registerCommand(MenuCommandType.RES_ADD, ResAddCommand);
			//视图
			facade.registerCommand(MenuCommandType.ZOOM_IN, zoomInCommand);
			facade.registerCommand(MenuCommandType.ZOOM_OUT, zoomOutCommand);
			facade.registerCommand(MenuCommandType.ACTUAL_SIZE, actualSizeCommand);
			facade.registerCommand(MenuCommandType.VIEW_ALL, actualSizeCommand);
			facade.registerCommand(MenuCommandType.VIEW_LOCKED, viewLockedCommand);
			facade.registerCommand(MenuCommandType.VIEW_SELECTED, viewSelectedCommand);
			facade.registerCommand(MenuCommandType.VIEW_FRONT, viewLayerCommand);
			facade.registerCommand(MenuCommandType.VIEW_MAIN, viewLayerCommand);
			facade.registerCommand(MenuCommandType.VIEW_BACKGROUND, viewLayerCommand);
			//窗体
			facade.registerCommand(MenuCommandType.TOOLS, ToolsCommand);
			facade.registerCommand(MenuCommandType.RESOURCE_WIN, ResourceWinCommand);
			facade.registerCommand(MenuCommandType.PROPERTY_WIN, PropertyWinCommand);
			facade.registerCommand(MenuCommandType.RESET_WIN, resetWinCommand);
			//帮助
			facade.registerCommand(MenuCommandType.HELP, HelpWinCommand);
			facade.registerCommand(MenuCommandType.VERSION_WIN, VersionWinCommand);
			
			//其他命令
			facade.registerCommand(CommandType.NEW_SCENE_DATA, newSceneDataCommand);
		}
	}
}