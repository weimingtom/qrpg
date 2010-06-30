package editor.view.rpgScene
{
	import org.puremvc.as3.interfaces.IMediator;
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
	}
}