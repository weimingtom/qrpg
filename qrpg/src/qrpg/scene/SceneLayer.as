package qrpg.scene
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	import qrpg.core.DisplayGameObject;
	import qrpg.display.ISceneAddable;
	
	public class SceneLayer extends DisplayGameObject
	{
		private var _bmp:Bitmap;
		private var _objList:Array;
		
		private var _displayRect:Rectangle;
		
		public function SceneLayer()
		{
			super();
			_bmp = new Bitmap();
			addChild(_bmp);
			
			_objList = new Array();
			
			_displayRect = new Rectangle();
			
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			
		}
		
		/**
		 * 图层宽。
		 */		
		public function get layerWidth():int
		{
			return _displayRect.width;
		}
		public function set layerWidth(w:int):void
		{
			_displayRect.width = w;
		}
		
		/**
		 * 图层高。
		 */		
		public function get layerHeight():int
		{
			return _displayRect.height;
		}
		public function set layerHeight(h:int):void
		{
			_displayRect.height = h;
		}
		
		/**
		 * 图层显示的左上角在场景里的X座标。
		 */		
		public function get layerX():int
		{
			return _displayRect.x;
		}
		public function set layerX(px:int):void
		{
			_displayRect.x = px;
		}
		
		/**
		 * 图层显示的左上角在场景里的Y座标。
		 */		
		public function get layerY():int
		{
			return _displayRect.y;
		}
		public function set layerY(py:int):void
		{
			_displayRect.y = py;
		}
		
		/**
		 * 添加物体。
		 * @param obj 要添加的物体。
		 * @return 该层的物体数量
		 */		
		public function addObject(obj:ISceneAddable):int
		{
			_objList.push(obj);
			return _objList.length;
		}
		
		/**
		 * 添加物体至指定图层。
		 * @param obj 要添加的物体。
		 * @param index 指定图层。
		 * @return 该层的物体数量。
		 */		
		public function addObjectAt(obj:ISceneAddable, index:int):int
		{
			_objList.splice(index, 0, obj);
			return _objList.length;
		}
		
		public function draw():void
		{
			
		}
		
		private function get hasUpdate():Boolean
		{
			var i:int;
			var len:int = _objList.length;
			for ( i=0; i<len; i++ )
			{
				if ( _objList[i].isUpdate )
				{
					return true;
				}
			}
			return false;
		}
		
		//--------------------------------------------------------------------------
    	//
    	//  Event handlers
    	//
	    //--------------------------------------------------------------------------
		
		private function enterFrameHandler(evt:Event):void
		{
			if ( hasUpdate )
			{
				draw();
			}
		}
		
		private function mouseDownHandler(evt:MouseEvent):void
		{
			
		}
	}
}