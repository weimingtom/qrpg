package editor.view.windows
{
	import flash.display.DisplayObject;
	
	import mx.core.Application;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.facade.Facade;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class VersionWinMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "VersionWinMediator";
		
		public function VersionWinMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		/**
		 * 弹出面板
		 */		
		public static function addPopUp():void
		{
			var mediator:VersionWinMediator = Facade.getInstance().retrieveMediator(VersionWinMediator.NAME) as VersionWinMediator;
			if ( !mediator )
			{
				var view:VersionWin = new VersionWin();
				Facade.getInstance().registerMediator(new VersionWinMediator(view));
				PopUpManager.addPopUp(view, Application.application as DisplayObject);
				PopUpManager.centerPopUp(view);
			}
			else
			{
				PopUpManager.bringToFront(mediator.win);
			}
		}
		
		/**
		 * 删除弹出的面板。
		 */		
		public static function removePopUp():void
		{
			var mediator:IMediator = Facade.getInstance().retrieveMediator(VersionWinMediator.NAME);
			if ( mediator )
			{
				var view:VersionWin = (mediator as VersionWinMediator).win;
				Facade.getInstance().removeMediator(VersionWinMediator.NAME);
				PopUpManager.removePopUp(view);
			}
		}
		
		public function get win():VersionWin
		{
			return viewComponent as VersionWin;
		}
		
		override public function onRegister():void
		{
			super.onRegister();
			if ( win )
			{
				win.addEventListener(CloseEvent.CLOSE, closeEventHandler);
			}
		}
		
		override public function onRemove():void
		{
			super.onRemove();
			if ( win )
			{
				win.removeEventListener(CloseEvent.CLOSE, closeEventHandler);
			}
		}
		
		private function closeEventHandler(evt:CloseEvent):void
		{
			VersionWinMediator.removePopUp();
		}
		
	}
}