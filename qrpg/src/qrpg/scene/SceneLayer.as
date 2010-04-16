package qrpg.scene
{
	import flash.display.BitmapData;
	import flash.events.EventDispatcher;

	public class SceneLayer extends EventDispatcher implements ISceneLayer
	{
		private var _bitmapData:BitmapData;	//保存要显示的层的图片。
		
		private var _isUpdate:Boolean;
		
		private var _width:int;
		private var _height:int;
		private var _centerX:int;
		private var _centerY:int;
		
		public function SceneLayer(width:int, height:int)
		{
			super();
			setScreen(width, height);
		}
		
		/**
		 * 要显示的图像。
		 */		
		public function get bitmapData():BitmapData
		{
			return null;
		}
		
		/**
		 * 设置显示的大小。
		 * @param width 显示的宽
		 * @param height 显示的高
		 */		
		public function setScreen(width:int, height:int):void
		{
			if ( (_width!=width || _height!=height) && width>0 && height>0 )
			{
				_bitmapData = new BitmapData(width, height, true, 0);
			}
			_width = width;
			_height = height;
		}
		
		/**
		 * 设置显示的中心点位置。
		 * @param x 中心点X座标。
		 * @param y 中心点Y座标。
		 */		
		public function center(x:int, y:int):void
		{
			_centerX = x;
			_centerY = y;
		}
		
		/**
		 * 被点击。
		 * @param x 点击的X座标。
		 * @param y 点击的Y座标。
		 * @return 被点击的子物体。
		 */		
		public function click(x:int, y:int):*
		{
			return null;
		}
		
	}
}