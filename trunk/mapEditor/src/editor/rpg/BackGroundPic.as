package editor.rpg
{
	import editor.event.EditEvent;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import util.HashMap;
	
	public class BackGroundPic extends GameSprite
	{
		public var widthPic:int;
		public var heightPic:int;
		public var nodeWidth:int;
		public var nodeHeight:int;
		public var src:String;
		
		private var bitmap:Bitmap;
		
		private var _focusX:int;
		private var _focusY:int;
		
		private var _notLoadPic:HashMap;
		private var _loaded:Array;
		
		public function BackGroundPic(width:int, height:int)
		{
			super();
			
			bitmap = new Bitmap(new BitmapData(width, height, true, 0));
			addChild(bitmap);
			
			_notLoadPic = new HashMap();
			_loaded = [];
			
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		public function get fullWidth():int
		{
			return widthPic*nodeWidth;
		}
		public function get fullHeight():int
		{
			return heightPic*nodeHeight;
		}
		
		public function get showWidth():int
		{
			return bitmap.bitmapData.width;
		}
		public function get showHeight():int
		{
			return bitmap.bitmapData.height;
		}
		
		public function focus(px:int, py:int):void
		{
			_focusX = px;
			_focusY = py;
			refresh();
		}
		
		public function resize(w:int, h:int):void
		{
			if ( w==0 || h==0 ) return;
			bitmap.bitmapData = new BitmapData(w, h, true, 0);
			refresh();
		}
		
		public function refresh():void
		{
			if ( !(widthPic>0 && heightPic>0 && nodeWidth>0 && nodeHeight>0 && src!="") ) return;
			var tmp:LoadSprite;
			var arr:Array;
			var minX:int = Math.floor(_focusX/nodeWidth);
			var maxX:int = (_focusX+bitmap.bitmapData.width)%nodeWidth==0 ? Math.floor((_focusX+bitmap.bitmapData.width)/nodeWidth)-1 : Math.floor((_focusX+bitmap.bitmapData.width)/nodeWidth);
			var minY:int = Math.floor(_focusY/nodeHeight);
			var maxY:int = (_focusY+bitmap.bitmapData.height)%nodeHeight==0 ? Math.floor((_focusY+bitmap.bitmapData.height)/nodeHeight)-1 : Math.floor((_focusY+bitmap.bitmapData.height)/nodeHeight);
			
			if ( minX<0 ) minX=0;
			if ( minX>=widthPic ) minX = widthPic-1;
			if ( maxX<0 ) maxX = 0;
			if ( maxX>=widthPic ) maxX = widthPic-1;
			if ( minY<0 ) minY=0;
			if ( minY>=heightPic ) minY = heightPic-1;
			if ( maxY<0 ) maxY = 0;
			if ( maxY>=heightPic ) maxY = heightPic-1;
			
			for ( var py:int=minY; py<=maxY; py++ )
			{
				for ( var px:int=minX; px<=maxX; px++  )
				{
					arr = src.split(".");
					tmp = new LoadSprite(arr[0]+"_"+px+"_"+py+".jpg");
					tmp.x = px*nodeWidth;
					tmp.y = py*nodeHeight;
					tmp.load();
					tmp.addEventListener(EditEvent.COMPLETE, picCompleteHandler);
					_notLoadPic.put(tmp, tmp);
				}
			}
		}
		
		private function picCompleteHandler(evt:EditEvent):void
		{
			var pic:LoadSprite = evt.target as LoadSprite;
			pic.removeEventListener(EditEvent.COMPLETE, picCompleteHandler);
			_notLoadPic.remove(pic);
			_loaded.push(pic);
		}
		
		private function enterFrameHandler(evt:Event):void
		{
			if ( _notLoadPic && _notLoadPic.size()>0 )
			{
				var arr:Array = _notLoadPic.values();
				(arr[Math.floor(Math.random()*_notLoadPic.size())] as LoadSprite).load();
			}
			
			var pic:LoadSprite;
			bitmap.bitmapData.lock();
			for ( ; _loaded.length>0; )
			{
				pic = _loaded.pop() as LoadSprite;
				bitmap.bitmapData.copyPixels(pic.bitmapData, new Rectangle(0,0,nodeWidth, nodeHeight), new Point(pic.x-_focusX,pic.y-_focusY),null,null,false);
			}
			bitmap.bitmapData.unlock();
		}
		
	}
}