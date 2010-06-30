package editor.view.windows
{
	import editor.event.MapEvent;
	import editor.type.CommandType;
	
	import flash.display.DisplayObject;
	
	import mx.core.Application;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.facade.Facade;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	/**
	 * 新建场景文件
	 * @author 陈策
	 * 
	 */	
	public class NewSceneMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "NewSceneMediator";
		
		public function NewSceneMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		/**
		 * 弹出面板
		 */		
		public static function addPopUp():void
		{
			var mediator:NewSceneMediator = Facade.getInstance().retrieveMediator(NewSceneMediator.NAME) as NewSceneMediator;
			if ( !mediator )
			{
				var view:NewSceneWin = new NewSceneWin();
				Facade.getInstance().registerMediator(new NewSceneMediator(view));
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
			var mediator:IMediator = Facade.getInstance().retrieveMediator(NewSceneMediator.NAME);
			if ( mediator )
			{
				var view:NewSceneWin = (mediator as NewSceneMediator).win;
				Facade.getInstance().removeMediator(NewSceneMediator.NAME);
				PopUpManager.removePopUp(view);
			}
		}
		
		public function get win():NewSceneWin
		{
			return viewComponent as NewSceneWin;
		}
		
		override public function onRegister():void
		{
			super.onRegister();
			if ( win )
			{
				win.addEventListener(CloseEvent.CLOSE, closeEventHandler);
				win.addEventListener(MapEvent.CONFORM, conformHandler);
			}
		}
		
		override public function onRemove():void
		{
			super.onRemove();
			if ( win )
			{
				win.removeEventListener(CloseEvent.CLOSE, closeEventHandler);
				win.removeEventListener(MapEvent.CONFORM, conformHandler);
			}
		}
		
		//关闭窗体
		private function closeEventHandler(evt:CloseEvent):void
		{
			NewSceneMediator.removePopUp();
		}
		
		//确定
		private function conformHandler(evt:MapEvent):void
		{
			sendNotification(CommandType.NEW_SCENE_DATA, evt.data);
		}
	}
}