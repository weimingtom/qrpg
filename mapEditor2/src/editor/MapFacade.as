package editor
{
	import editor.command.InitMenuCommand;
	import editor.command.StartUpCommand;
	import editor.model.menu.MenuModel;
	import editor.model.menu.MenuProxy;
	import editor.model.scene.SceneModel;
	import editor.model.scene.SceneProxy;
	import editor.type.SystemCommandType;
	import editor.view.menu.MapMenu;
	import editor.view.menu.MenuMediator;
	import editor.view.rpgScene.Scene;
	import editor.view.rpgScene.SceneMediator;
	
	import mx.core.Application;
	
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class MapFacade extends Facade
	{
		public static function getInstance():MapFacade
		{
			if (instance == null) instance = new MapFacade();
			return instance as MapFacade;
		}
		
		override protected function initializeFacade():void
		{
			super.initializeFacade();
		}
		
		override protected function initializeController():void
		{
			super.initializeController();
			
			registerCommand( SystemCommandType.START_UP_COMMAND, StartUpCommand );
		}
		
		override protected function initializeModel():void
		{
			super.initializeModel();
			
			registerProxy( new SceneProxy( SceneModel.getInstance() ) );
			registerProxy( new MenuProxy( MenuModel.getInstance() ) );
		}
		
		override protected function initializeView():void
		{
			super.initializeView();
			
			registerMediator( new SceneMediator( new Scene(Application.application.width, Application.application.height) ) );
			registerMediator( new MenuMediator( new MapMenu() ) ); 
			
		}

	}
}