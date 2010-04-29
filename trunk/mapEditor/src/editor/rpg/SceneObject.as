package editor.rpg
{
	import editor.event.EditEvent;
	import editor.modul.EditorModul;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	public class SceneObject extends LoadSprite
	{
		public var objName:String;
		public var comany:String;
		public var script:String;
		public var scriptType:String;
		
		public var gameLayer:GameLayer;
		
		private var _src:String;
		private var _rect:Rectangle;
		private var _center:Point;
		
		private var _bmp:Bitmap;
		
		private var _hitAreaData:Array;
		private var _hitArea:AreaSprite;
		private var _unwalkData:Array;
		
		public function SceneObject(src:String, rect:Rectangle, center:Point)
		{
			super(src);
			
			this.mouseEnabled = false;
			
			_src = src;
			_rect = rect;
			_center = center;
		}
		
		public function rebuildByXML(xml:XML):void
		{
			if ( xml.@name!=undefined ) this.objName = xml.@name;
			if ( xml.@company!=undefined ) this.comany = xml.@company;
			
			this.src = xml..item.@src;
			
			this._rect.x = Number(xml..frame.@x);
			this._rect.y = Number(xml..frame.@y);
			this._rect.width = Number(xml..frame.@width);
			this._rect.height = Number(xml..frame.@height);
			
			this._center.x = Number(xml..frame.@cx);
			this._center.y = Number(xml..frame.@cy);
			
			if ( xml.hitarea.toString() ) this.hitAreaData = xml.hitarea.toString().split(",");
			if ( xml.unwalk.toString() ) this.unwalkData = xml.unwalk.toString().split(",");
			if ( xml.script.toString() )
			{
				this.script = xml.script.toString();
				this.scriptType = xml.script.@type;
			}
			
			load();
		}
		
		public function get displayRect():Rectangle
		{
			var rect:Rectangle = new Rectangle();
			rect.x = x-_center.x;
			rect.y = y-_center.y;
			rect.width = _rect.width;
			rect.height = _rect.height;
			return rect;
		}
		
		public function set hitAreaData(data:Array):void
		{
			_hitAreaData = data;
			_hitAreaData.forEach(toNumber);
			_hitArea = new AreaSprite(_hitAreaData);
			_hitArea.alpha = 0;
			addChild(_hitArea);
		}
		
		public function set unwalkData(data:Array):void
		{
			_unwalkData = data;
			_unwalkData.forEach(toNumber);
		}
		
		public function getXML():XML
		{
			var xml:XML = <bldg x={x} y={y} name={objName}>
									<items>
										<item src={_src}>
											<actions>
												<action type="stop" name="default" defaultAction="true">
													<frame width={_rect.width} height={_rect.height} x={_rect.x} y={_rect.y} cx={_center.x} cy={_center.y}/>
												</action>
											</actions>
										</item>
									</items>
								</bldg>
			if ( comany && comany!="null" ) xml.@company = comany;
			if ( _hitAreaData && _hitAreaData.length>0 ) xml.appendChild(<hitarea>{_hitAreaData.toString()}</hitarea>);
			if ( _unwalkData && _unwalkData.length>0 ) xml.appendChild(<unwalk>{_unwalkData.toString()}</unwalk>);
			if ( script && scriptType && scriptType!=="none" ) xml.appendChild(<script type={scriptType}>{script}</script>);
			
			return xml;
		}
		
		public function copy():SceneObject
		{
			var obj:SceneObject = new SceneObject(_src, _rect.clone(), _center.clone());
			obj.x = this.x;
			obj.y = this.y;
			if ( _hitAreaData && _hitAreaData.length>0 ) obj.hitAreaData = _hitAreaData.concat();
			if ( _unwalkData && _unwalkData.length>0 ) obj.unwalkData = _unwalkData.concat();
			if ( script && scriptType && scriptType!=="none" )
			{
				obj.script = script;
				obj.scriptType = scriptType;
			}
			return obj;
		}
		
		override public function load():void
		{
			if ( !bmpdata || bmpdata.length==0 ) createBitmapData();
			super.load();
		}
		
		public function unload():void
		{
			if ( _bmp )
			{
				removeChild(_bmp);
				_bmp = null;
			}
			bitmapData = null;
			bmpdata = null;
		}
		
		override protected function onCom(evt:Event):void
		{
			var obj:* = (evt.target as LoaderInfo).loader.content;
			var bmp:Bitmap;
			if ( obj is Bitmap )
			{
				bmp = Bitmap(obj);
			}
			else if ( obj is DisplayObject )
			{
				var data:BitmapData = new BitmapData((obj as DisplayObject).width, (obj as DisplayObject).height, true, 0);
				data.draw(obj as DisplayObject);
				bmp = new Bitmap(data);
			}
			if ( _rect )
			{
				bitmapData = new BitmapData(_rect.width, _rect.height, true, 0);
				bitmapData.copyPixels(bmp.bitmapData, _rect, new Point());
			}
			else
			{
				bitmapData = bmp.bitmapData;
			}
			if ( !_bmp )
			{
				_bmp = new Bitmap(bitmapData);
				_bmp.x = -_center.x;
				_bmp.y = -_center.y;
				addChildAt(_bmp, 0);
			}
			else
			{
				_bmp.bitmapData = bitmapData;
			}
		}
		
		private function createBitmapData():void
		{
			var file:File = new File();
			file.nativePath = EditorModul.sceneFilePath+_src;
			var stream:FileStream = new FileStream();
			try
			{
				stream.open(file, FileMode.READ);
				bmpdata = new ByteArray();
				stream.readBytes(bmpdata,0,stream.bytesAvailable);
			}
			catch ( e:* )
			{
				trace("加载的文件{"+file.nativePath+"}不存在。");
				dispatchEvent(new EditEvent(EditEvent.FILE_NOT_EXIST, file.nativePath));
			}
		}
		
		private function toNumber(element:*, index:int, arr:Array):void
		{
			arr[index] = Number(element);
		}
		
	}
}