package editor.view.rpgScene
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import mx.controls.Image;
	
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
		
		//场景的背景图
		private var bgimg:BitmapData;
		
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
		
		/**
		 * 场景宽。
		 */		
		private var _sceneWidth:Number;
		public function set sceneWidth(value:Number):void
		{
			_sceneWidth = value;
		}
		public function get sceneWidth():Number
		{
			return _sceneWidth;
		}
		
		/**
		 * 场景高。
		 */		
		private var _sceneHeight:Number;
		public function set sceneHeight(value:Number):void
		{
			_sceneHeight = value;
		}
		public function get sceneHeight():Number
		{
			return _sceneHeight;
		}
		
		/**
		 * 设置背影图片。
		 * @param value
		 * 
		 */		
		public function set backGroundSource(value:String):void
		{
			var loader:Loader = new Loader();
			loader.addEventListener(Event.COMPLETE, bgLoadCompeleteHandler);
			loader.load(new URLRequest(value));
		}
		
		private function bgLoadCompeleteHandler(evt:Event):void
		{
			var loader:Loader = evt.currentTarget as Loader;
			
			bgimg = (loader.content as Bitmap).bitmapData;
			
			addChild(loader.content);
		}
		
		/**
		 * 设置显示的大小。
		 * @param screenWidth 显示的宽
		 * @param screenHeight 显示的高
		 */		
		public function setScreenSize(screenWidth:Number, screenHeight:Number):void
		{
			
		}
	}
}