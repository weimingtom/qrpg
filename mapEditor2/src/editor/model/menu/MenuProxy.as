package editor.model.menu
{
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	/**
	 * 菜单代理
	 * @author 陈策
	 * 
	 */	
	public class MenuProxy extends Proxy implements IProxy
	{
		public static const NAME:String = "MenuProxy";
		
		public function MenuProxy(data:Object=null)
		{
			super(NAME, data);
		}
		
		public function get menu():MenuModel
		{
			return getData() as MenuModel;
		}
		
		/**
		 * 设置菜单中的某项的enable属性。
		 * @param type 菜单中对应的 data 字段的值。
		 * @param isEnable 是否可点击。
		 * @return 如果有对应菜单并设置成功则返回 true，反之返回 false。
		 */		
		public function setMenuEnable(type:String, isEnable:Boolean):Boolean
		{
			if ( !menu )
			{
				return false;
			}
			if ( menu.mainMenuData..command.(@data==type) )
			{
				menu.mainMenuData..command.(@data==type).@enabled = isEnable;
				return true;
			}
			return false;
		}
	}
}