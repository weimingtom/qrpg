package editor.view.windows.property
{
	import editor.model.scene.SceneProxy;
	import editor.type.MenuCommandType;
	import editor.type.SceneModelType;
	import editor.type.SystemCommandType;
	import editor.view.rpgScene.Scene;
	
	import flash.display.DisplayObject;
	
	import mx.core.Application;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.facade.Facade;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class PropertyWinMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "PropertyWinMediator";
		
		public function PropertyWinMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		/**
		 * 弹出面板
		 */		
		public static function addPopUp():void
		{
			var mediator:PropertyWinMediator = Facade.getInstance().retrieveMediator(PropertyWinMediator.NAME) as PropertyWinMediator;
			if ( !mediator )
			{
				var view:PropertyWin = new PropertyWin();
				Facade.getInstance().registerMediator(new PropertyWinMediator(view));
				PopUpManager.addPopUp(view, Application.application as DisplayObject);
				view.x = Math.max(0, Application.application.width-view.width>>1);
				view.y = Math.max(0, Application.application.height-view.height);
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
			var mediator:IMediator = Facade.getInstance().retrieveMediator(PropertyWinMediator.NAME);
			if ( mediator )
			{
				var view:PropertyWin = (mediator as PropertyWinMediator).win;
				Facade.getInstance().removeMediator(PropertyWinMediator.NAME);
				PopUpManager.removePopUp(view);
			}
		}
		
		public function get win():PropertyWin
		{
			return viewComponent as PropertyWin;
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
			sendNotification(MenuCommandType.PROPERTY_WIN);
		}
		
		override public function listNotificationInterests():Array
		{
			return [SceneModelType.UPDATE,
					SceneModelType.OBJECT_SELECTED,
					SystemCommandType.RESIZE_COMMAND];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var name:String = notification.getName();
			var data:Object = notification.getBody();
			switch ( name )
			{
				//收到场景数据有更新。
				case SceneModelType.UPDATE:
					if ( win )
					{
						win.updateSceneData(data);
					}
					break;
				//场景内切换被选中物体。
				case SceneModelType.OBJECT_SELECTED:
					if ( win )
					{
						win.changeSelect();
					}
					break;
				//改变显示大小。
				case SystemCommandType.RESIZE_COMMAND:
					if ( win )
					{
						win.x = Math.max(0, Application.application.width-win.width>>1);
						win.y = Math.max(0, Application.application.height-win.height);
					}
					break;
			}
		}
	}
}