package editor.command
{
	import editor.view.rpgScene.Scene;
	import editor.view.rpgScene.SceneMediator;
	
	import mx.core.Application;
	import mx.core.UIComponent;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class InitSceneCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			var scene:Scene = (facade.retrieveMediator( SceneMediator.NAME ) as SceneMediator).scene;
			var ui:UIComponent = new UIComponent();
			Application.application.addChild(ui);
			ui.addChild(scene);
		}
	}
}