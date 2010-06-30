package editor.view
{
	import flash.display.Sprite;
	
	/**
	 * 场景的显示类
	 * @author 陈策
	 * 
	 */	
	public class Scene extends Sprite
	{
		//显示的宽高
		private var screenWidth:Number;
		private var screenHeight:Number;
		
		/**
		 * 构造函数。
		 * @param screenWidth 显示的宽
		 * @param screenHeight 显示的高
		 */		
		public function Scene(screenWidth:Number, screenHeight:Number)
		{
			super();
			this.screenWidth = screenWidth;
			this.screenHeight = screenHeight;
		}
	}
}