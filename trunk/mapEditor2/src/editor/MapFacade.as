package editor
{
	import editor.command.InitMenuCommand;
	import editor.command.StartUpCommand;
	import editor.model.menu.MenuModel;
	import editor.model.menu.MenuProxy;
	import editor.view.menu.MapMenu;
	import editor.view.menu.MenuMediator;
	
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class MapFacade extends Facade
	{
		// 开始运行程序
		public static const START_UP_COMMAND:String = "startUp";
		
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
			
			registerCommand( START_UP_COMMAND, StartUpCommand );
		}
		
		override protected function initializeModel():void
		{
			super.initializeModel();
			
			registerProxy( new MenuProxy( MenuModel.getInstance() ) );
		}
		
		override protected function initializeView():void
		{
			super.initializeView();
			
			registerMediator( new MenuMediator( new MapMenu() ) ); 
			
		}

	}
}