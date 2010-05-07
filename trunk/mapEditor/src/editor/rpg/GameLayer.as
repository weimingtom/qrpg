package editor.rpg
{
	import editor.modul.ModulProxy;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import util.HashMap;
	
	public class GameLayer extends GameSprite
	{
		private var _focusX:int;
		private var _focusY:int;
		
		private var _inScreenObj:HashMap;
		private var _unloadObj:HashMap;
		
		private var _viewRect:Rectangle;
		
		public function GameLayer(width:int, height:int)
		{
			super();
			
			this.mouseEnabled = false;
			
			_focusX = 0;
			_focusY = 0;
			
			_inScreenObj = new HashMap();
			_unloadObj = new HashMap();
			
			_viewRect = new Rectangle(0,0,width, height);
		}
		
		public function addObject(obj:SceneObject):void
		{
			_unloadObj.put(obj, obj);
			obj.gameLayer = this;
			refresh();
		}
		
		public function removeObject(obj:SceneObject):SceneObject
		{
			unshowObject(obj);
			var remove:SceneObject = _unloadObj.remove(obj) as SceneObject;
			return remove;
		}
		
		public function build(xml:XML):void
		{
			var resourceXML:XML;
			var tmpSO:SceneObject;
			var tmpXML:XML;
			var tmpRect:Rectangle;
			var tmpPoint:Point;
			
			for ( var str:String in xml.children() )
			{
				tmpXML = xml.children()[str];
				resourceXML = ModulProxy.getResource(String(tmpXML.@source));
				tmpRect = new Rectangle(Number(resourceXML..frame.@x), Number(resourceXML..frame.@y), Number(resourceXML..frame.@width), Number(resourceXML..frame.@height))
				tmpPoint = new Point(Number(resourceXML..frame.@cx), Number(resourceXML..frame.@cy));
				
				tmpSO = new SceneObject(resourceXML.@src, tmpRect, tmpPoint);
				tmpSO.gameLayer = this;
				
				tmpSO.x = Number(tmpXML.@x);
				tmpSO.y = Number(tmpXML.@y);
				tmpSO.objName = tmpXML.@name;
				tmpSO.source = tmpXML.@source;
				
				if ( resourceXML.hitarea.toString() ) tmpSO.hitAreaData = resourceXML.hitarea.toString().split(",");
				if ( resourceXML.unwalk.toString() ) tmpSO.unwalkData = resourceXML.unwalk.toString().split(",");
				if ( tmpXML.script.toString() )
				{
					tmpSO.script = tmpXML.script.toString();
					tmpSO.scriptType = tmpXML.script.@type;
				}
				_unloadObj.put(tmpSO, tmpSO);
			}
		}
		
		public function getXML():XML
		{
			var xml:XML = <gamelayer/>
			var arr:Array;
			var i:int;
			var len:int;
			
			//场景里的建筑
			arr = _unloadObj.values();
			/* len = arr.length;
			for ( i=0; i<len; i++ )
			{
				xml.appendChild((arr[i] as SceneObject).getXML());
			} */
			
			arr = arr.concat(_inScreenObj.values());
			arr.sort(sortByY);
			len = arr.length;
			for ( i=0; i<len; i++ )
			{
				xml.appendChild((arr[i] as SceneObject).getXML());
			}
			
			return xml;
		}
		
		public function focus(px:int, py:int):void
		{
			this.x = -px;
			this.y = -py;
			_viewRect.x = px;
			_viewRect.y = py;
			refresh();
		}
		
		public function resize(w:int, h:int):void
		{
			_viewRect.width = w;
			_viewRect.height = h;
			refresh();
		}
		
		public function refresh():void
		{
			_unloadObj.eachValue(checkOutScreen);
			_inScreenObj.eachValue(checkInScreen);
		}
		
		public function showObject(obj:SceneObject):void
		{
			var i:int;
			var len:int = this.numChildren;
			for ( i=0; i<len; i++ )
			{
				if ( obj.y<getChildAt(i).y )
				{
					addChildAt(obj,i);
					_inScreenObj.put(obj, obj);
					break;
				}
			}
			if ( !_inScreenObj.containsValue(obj) )
			{
				addChild(obj);
				_inScreenObj.put(obj, obj);
			}
			obj.load();
		}
		
		public function unshowObject(obj:SceneObject):void
		{
			if ( _inScreenObj.containsValue(obj) )
			{
				_inScreenObj.remove(obj);
				removeChild(obj);
				obj.unload();
			}
		}
		
		public function resetObject(obj:SceneObject):void
		{
			removeChild(obj);
			var isAdded:Boolean = false;
			var i:int;
			var len:int = this.numChildren;
			for ( i=0; i<len; i++ )
			{
				if ( obj.y<getChildAt(i).y )
				{
					addChildAt(obj,i);
					isAdded = true;
					break;
				}
			}
			if ( !isAdded ) addChild(obj);
		}
		
		private function checkOutScreen(obj:*):void
		{
			var _obj:SceneObject = obj as SceneObject;
			
			if ( _viewRect.intersects(_obj.displayRect) )
			{
				_unloadObj.remove(_obj);
				showObject(_obj);
			}
		}
		
		private function checkInScreen(obj:*):void
		{
			var _obj:SceneObject = obj as SceneObject;
			if ( !_viewRect.intersects(_obj.displayRect) )
			{
				_unloadObj.put(_obj, _obj);
				unshowObject(_obj);
			}
		}
		
		private function sortByY(a:SceneObject, b:SceneObject):int
		{
			if ( a.y>b.y )
			{
				return 1;
			}
			else if ( a.y<b.y )
			{
				return -1;
			}
			else
			{
				return 0;
			}
		}
		
	}
}