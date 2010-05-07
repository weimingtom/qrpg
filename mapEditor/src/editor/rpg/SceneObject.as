package editor.rpg
{
	import editor.event.EditEvent;
	import editor.modul.ModulProxy;
	
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
	
	/**
	 * 场景里的物体。
	 * @author 陈策
	 */	
	public class SceneObject extends LoadSprite
	{
		/**
		 * 物体名称。
		 */		
		public var objName:String;
		
		/**
		 * 物体上的脚本。
		 */		
		public var script:String;
		
		/**
		 * 物体脚本的类型。
		 */		
		public var scriptType:String;
		
		/**
		 * 物品属于哪个元件的实例。
		 */		
		public var source:String;
		
		/**
		 * 物体所在图层。
		 */		
		public var gameLayer:GameLayer;
		
		private var _src:String;			//物体加载图片的路径
		private var _rect:Rectangle;		//物体的显示区域
		private var _center:Point;			//物体的中心点位置
		
		private var _bmp:Bitmap;			//物体显示需要的图片数据
		
		private var _hitAreaData:Array;		//点击区域的数据
		private var _hitArea:AreaSprite;	//点击区域实例
		private var _unwalkData:Array;		//不可走区域数据（在编辑器里，不可走区域只用设置，不会用到，所以不用实例化）
		
		public function SceneObject(src:String, rect:Rectangle, center:Point)
		{
			super(src);
			
			this.mouseEnabled = false;
			
			_src = src;
			_rect = rect;
			_center = center;
		}
		
		/**
		 * 按新的XML数据重新设定实例的属性。设定后将会被刷新。
		 * @param xml 数据。
		 */		
		public function rebuildByXML(xml:XML):void
		{
			/* if ( xml.@name!=undefined ) this.objName = xml.@name; */
			
			this.src = xml.@src;
			
			this._rect.x = Number(xml..frame.@x);
			this._rect.y = Number(xml..frame.@y);
			this._rect.width = Number(xml..frame.@width);
			this._rect.height = Number(xml..frame.@height);
			
			this._center.x = Number(xml..frame.@cx);
			this._center.y = Number(xml..frame.@cy);
			
			if ( xml.hitarea.toString() ) this.hitAreaData = xml.hitarea.toString().split(",");
			if ( xml.unwalk.toString() ) this.unwalkData = xml.unwalk.toString().split(",");
			/* if ( xml.script.toString() )
			{
				this.script = xml.script.toString();
				this.scriptType = xml.script.@type;
			} */
			
			load();
		}
		
		/**
		 * 显示区域。
		 */		
		public function get displayRect():Rectangle
		{
			var rect:Rectangle = new Rectangle();
			rect.x = x-_center.x;
			rect.y = y-_center.y;
			rect.width = _rect.width;
			rect.height = _rect.height;
			return rect;
		}
		
		/**
		 * 点击区域的数据。
		 */		
		public function set hitAreaData(data:Array):void
		{
			_hitAreaData = data;
			_hitAreaData.forEach(toNumber);
			_hitArea = new AreaSprite(_hitAreaData);
			_hitArea.alpha = 0;
			addChild(_hitArea);
		}
		
		/**
		 * 不可走区域的数据
		 */		
		public function set unwalkData(data:Array):void
		{
			_unwalkData = data;
			_unwalkData.forEach(toNumber);
		}
		
		/**
		 * 生成代表这个实例的XML
		 * return
		 */		
		public function getXML():XML
		{
			var xml:XML = <item source={source} x={x} y={y} name={objName}/>
			if ( script && scriptType && scriptType!=="none" ) xml.appendChild(<script type={scriptType}>{script}</script>);
			return xml;
		}
		
		/**
		 * 生成代表这个物体的𤕤元件的数据
		 * @return 
		 */		
		public function getResourceXML():XML
		{
			var xml:XML = <item src={_src}>
								<actions>
									<action type="stop" name="default" defaultAction="true">
										<frame width={_rect.width} height={_rect.height} x={_rect.x} y={_rect.y} cx={_center.x} cy={_center.y}/>
									</action>
								</actions>
							</item>
			if ( _hitAreaData && _hitAreaData.length>0 ) xml.appendChild(<hitarea>{_hitAreaData.toString()}</hitarea>);
			if ( _unwalkData && _unwalkData.length>0 ) xml.appendChild(<unwalk>{_unwalkData.toString()}</unwalk>);
			
			return xml;
		}
		
		/**
		 * 复制一个属性完成相同的实例。
		 * @return 
		 */		
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
			file.nativePath = ModulProxy.sceneFilePath+_src;
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