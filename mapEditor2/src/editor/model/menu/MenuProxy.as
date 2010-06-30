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
	}
}