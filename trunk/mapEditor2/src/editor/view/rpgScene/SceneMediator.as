package editor.view.rpgScene
{
	import editor.type.SystemCommandType;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class SceneMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "SceneMediator";
		
		public function SceneMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		public function get scene():Scene
		{
			return viewComponent as Scene;
		}
		
		override public function onRegister():void
		{
			super.onRegister();
			if ( scene )
			{
				//
			}
		}
		
		override public function onRemove():void
		{
			super.onRemove();
			if ( scene )
			{
				
			}
		}
		
		override public function listNotificationInterests():Array
		{
			return [SystemCommandType.RESIZE_COMMAND];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var name:String = notification.getName();
			var data:Object = notification.getBody();
			switch ( name )
			{
				case SystemCommandType.RESIZE_COMMAND:
					if ( scene )
					{
						scene.setScreenSize(data.width, data.height);
					}
					break;
			}
		}
		
	}
}