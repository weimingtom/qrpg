package editor.view.resourcewin
{
	import editor.event.EditEvent;
	
	import mx.core.UIComponent;
	
	/**
	 * 中间点数据发生变动时发布。
	 * @eventType com.tywin.mapEditor.event.EditEvent.CENTER_CHANGE
 	 */
	[Event(name="centerChage", type="com.tywin.mapEditor.event.EditEvent")]
	
	/**
	 * 设置并显示物体中心点。
	 * @author 陈策
	 */	
	public class ShowCenter extends UIComponent
	{
		private var _centerX:int;
		private var _centerY:int;
		
		/**
		 * 设置并显示物体中心点。<br/>
		 * 默认的中心点是显示的中心，需要其他程序去修改。
		 */		
		public function ShowCenter()
		{
			super();
			_centerX = width>>1;
			_centerY = height>>1;
			draw();
		}
		
		/**
		 * 中心点X位置。
		 */		
		public function get centerX():int
		{
			return _centerX;
		}
		
		/**
		 * 中心点Y位置。
		 */		
		public function get centerY():int
		{
			return _centerY;
		}
		
		/**
		 * 设置显示区域的大小。
		 * @param w 显示区域的宽。
		 * @param h 显示区域的高。
		 */		
		public function resize(w:int, h:int):void
		{
			width = w;
			height = h;
			draw()
		}
		
		/**
		 * 设置中心点位置。
		 * @param px 中心点X座标。
		 * @param py 中心点Y座标。
		 */		
		public function setCenter(px:int, py:int, withDispatch:Boolean=true):void
		{
			var oldx:int = _centerX;
			var oldy:int = _centerY;
			_centerX = px;
			_centerY = py;
			draw();
			if ( withDispatch ) dispatchEvent(new EditEvent(EditEvent.CENTER_CHANGE, [oldx, oldy]));
		}
		
		/**
		 * 按原中心点位置的相对座标设置中心点位置。
		 * @param px 新中心点X位置和原位置的差。
		 * @param py 新中心点Y位置和原位置的差。
		 */		
		public function centerMove(px:int, py:int, withDispatch:Boolean=true):void
		{
			var oldx:int = _centerX;
			var oldy:int = _centerY;
			_centerX += px;
			_centerY += py;
			draw();
			if ( withDispatch ) dispatchEvent(new EditEvent(EditEvent.CENTER_CHANGE, [oldx, oldy]));
		}
		
		private function draw():void
		{
			graphics.clear();
			graphics.beginFill(0,0);
			graphics.drawRect(0, 0, width, height);
			graphics.lineStyle(1, 0xff0000);
			graphics.moveTo(0, _centerY);
			graphics.lineTo(width, _centerY);
			graphics.moveTo(_centerX, 0);
			graphics.lineTo(_centerX, height);
			graphics.endFill();
		}
		
	}
}