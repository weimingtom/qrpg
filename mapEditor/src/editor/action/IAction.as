package editor.action
{
	public interface IAction
	{
		function redo():void;
		function undo():void;
	}
}