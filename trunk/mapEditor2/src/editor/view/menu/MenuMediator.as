package editor.view.menu
{
	import mx.events.MenuEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class MenuMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "MenuMediator";
		
		public function MenuMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		public function get menu():MapMenu
		{
			return viewComponent as MapMenu;
		}
		
		override public function onRegister():void
		{
			super.onRegister();
			if ( menu )
			{
				menu.addEventListener(MenuEvent.ITEM_CLICK, menuItemClickHandler);
			}
		}
		
		override public function onRemove():void
		{
			super.onRemove();
			if ( menu )
			{
				menu.removeEventListener(MenuEvent.ITEM_CLICK, menuItemClickHandler);
			}
		}
		
		private function menuItemClickHandler(evt:MenuEvent):void
		{
			var xml:XML = evt.item as XML;
			if ( xml && xml.@data )
			{
				sendNotification(String(xml.@data));
			}
		}
	}
}