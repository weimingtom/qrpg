package qrpg.display
{
	import flash.display.BitmapData;
	import flash.events.Event;
	
	import qrpg.action.Actions;
	
	/**
	 * 角色类。
	 * 该类实现角色在未加载前显示默认的形象。
	 * @author 陈策
	 * @version 3.0
	 */
	public class Role extends DisplayGameObject implements ISceneAddable
	{
		/**
		 * 角色在未加载完成前使用的图片。
		 */
		static public var defaultSource:BitmapData;
		
		/**
		 * 角色在未加载完成前使用的动作。
		 */
		static public var defaultActions:Actions;
		
		private var _realActions:Actions;	//在未加载完成前如果已经有动作，暂时保存在这里。
		
		/**
		 * 角色类。
		 */		
		public function Role()
		{
			super();
			if ( defaultSource ) source = defaultSource;
			if ( defaultActions ) actions = defaultActions;
		}
		
		/**
		 * 角色的动作集。
		 */
		override public function set actions(acts:Actions):void
		{
			if ( isLoaded )
			{
				super.actions = acts;
			}
			else
			{
				_realActions = acts;
			}
		}
		
		/**
		 * 卸载已经加载的资源，节省内存。该方法仅对资源是加载方式提供的实例。
		 */		
		override public function unload():void
		{
			if ( _url )
			{
				if ( actions!=defaultActions ) _realActions = actions;
				_bitmapData = defaultSource;
				actions = defaultActions;
				_source = null;
				_isUpdate = true;
				_isLoaded = false;
			}
		}
		
		/**
		 * 加载完成的时候。
		 * @param evt
		 */		
		override protected function onComplete(evt:Event):void
		{
			if ( _realActions ) super.actions = _realActions;
			super.onComplete(evt);
		}

	}
}