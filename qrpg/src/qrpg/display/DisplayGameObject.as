package qrpg.display
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	
	import qrpg.action.Act;
	import qrpg.action.Actions;
	import qrpg.event.GameEvent;
	
	/**
	 * 加载过程中。
	 * @EventType flash.events.ProgressEvent.PROGRESS
	 */	
	[Event(name="progress", type="flash.events.ProgressEvent")]
	
	/**
	 * 加载完成。
	 * @EventType flash.events.Event.COMPLETE
	 */	
	[Event(name="complete", type="flash.events.Event")]
	
	/**
	 * 显示需要更新。
	 * @EventType qrpg.event.GameEvent.UPDATE
	 */	
	[Event(name="update", type="qrpg.event.GameEvent")]
	
	/**
	 * 显示物体的基类。<br/>
	 * 该类不是 DisplayObject 的子类，所以是不可以添加至显示列表里的。<br/>
	 * 要显示该类的实例，需要用该类的 displayData() 方法得到需要显示的图像的 BitmapData。
	 * @author 陈策
	 * @version 3.0
	 * @see qrpg.display.ISceneAddable
	 */
	public class DisplayGameObject extends EventDispatcher implements ISceneAddable
	{
		/**
		 * X座标。
		 */		
		public var x:Number;
		
		/**
		 * Y座标。
		 */		
		public var y:Number;
		
		private var _actions:Actions;				//物体动作集。
		protected var _source:DisplayObject;		//物体显示可能用的显示对象。
		protected var _url:URLRequest;				//物体的图片或者显示对象可能的加载路径。
		
		protected var _bitmapData:BitmapData;		//要显示的图像
		protected var _mirrorBitmapData:BitmapData;	//如果有镜像侦，水平翻转过的图像则会存在这里。
		
		protected var _isUpdate:Boolean;			//是否需要更新。
		protected var _isLoaded:Boolean;			//是否已经加载。
		
		/**
		 * 显示物体的基类。
		 */		
		public function DisplayGameObject()
		{
			super();
			_isUpdate = false;
			_isLoaded = false;
		}
		
		/**
		 * 图片资源。<br/>
		 * 该属性可以是字符，可以是类，可以是显示对象。<br/>
		 * 如果该属性是字符串，则会加载该字符串所代表的URL的资源。<br/>
		 * 如果是类，则会实例化为一个显示对象。<br/>
		 * 如果为一个显示对象，则为需要显示的资源。<br/>
		 */
		public function set source(value:Object):void
		{
			if ( value is BitmapData )
			{
				_bitmapData = value as BitmapData;
				_isLoaded = true;
				checkMirror();
			}
			else if ( value is Bitmap )
			{
				_bitmapData = (value as Bitmap).bitmapData;
				_isLoaded = true;
				checkMirror();
			}
			else if ( value is DisplayObject )
			{
				_source = value as DisplayObject;
				_isLoaded = true;
			}
			else if ( value is Class )
			{
				var tmp:* = new value();
				if ( tmp is Bitmap )
				{
					_bitmapData = (tmp as Bitmap).bitmapData;
					checkMirror();
				}
				else if ( tmp is DisplayObject )
				{
					_source = tmp as DisplayObject;
				}
				else
				{
					throw new Error("参数类型不正确。");
				}
				_isLoaded = true;
			}
			else if ( value is String || value is URLRequest )
			{
				if ( value is String ) _url = new URLRequest(String(value));
				else _url = value as URLRequest;
				load();
			}
		}
		
		/**
		 * 物体的动作集。
		 */
		public function get actions():Actions
		{
			return _actions;
		}
		public function set actions(acts:Actions):void
		{
			_actions = acts;
			checkMirror();
		}
		
		/**
		 * 是否已经更新。<br/>
		 * 注意：该属性是检查从上回一检查该属性到这回检查为止是否有更新。<br/>
		 */		
		public function get isUpdate():Boolean
		{
			return _isUpdate;
		}
		public function set isUpdate(value:Boolean):void
		{
			_isUpdate = value;
			if ( _isUpdate ) dispatchEvent(new GameEvent(GameEvent.UPDATE));
		}
		
		/**
		 * 是否已经加载。
		 */		
		public function get isLoaded():Boolean
		{
			return _isLoaded;
		}
		
		/**
		 * 显示区域。
		 */
		public function get displayRect():Rectangle
		{
			/*if ( !_actions )
			{
				return new Rectangle();
			}*/
			var quondamRect:Rectangle = _actions.currentFrame.rect
			if ( !isMirror ) return quondamRect;
			var rect:Rectangle = new Rectangle();
			if ( _source )
			{
				rect.x = _source.width - quondamRect.x - quondamRect.width;
			}
			else
			{
				rect.x = _bitmapData.width - quondamRect.x - quondamRect.width;
			}
			rect.y = quondamRect.y;
			rect.width = quondamRect.width;
			rect.height = quondamRect.height;
			return rect;
		}
		
		/**
		 * 显示的中心。
		 */		
		public function get displayPoint():Point
		{
			var p:Point = new Point();
			/*if ( !actions )
			{
				return p;
			}*/
			if ( !isMirror )
			{
				p.x = x - actions.currentFrame.center.x;
			}
			else
			{
				p.x = x + actions.currentFrame.center.x - actions.currentFrame.rect.width;
			}
			p.y = y - actions.currentFrame.center.y;
			return p;
		}
		
		/**
		 * 目前该对象的显示是否为水平镜像显示
		 */		
		public function get isMirror():Boolean
		{
			if ( !_actions ) return false;
			return _actions.currentFrame.isMirror;
		}
		
		/**
		 * 是否被显示。
		 */		
		public function get isDisplay():Boolean
		{
			//TODO 未做處理
			return true;
		}
		
		/**
		 * 加载资源。
		 * @param url 资源地址。如果为null则按原来的地址加载。
		 */		
		public function load(url:URLRequest=null):void
		{
			if ( url ) _url = url;
			var load:Loader = new Loader();
			load.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
			load.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			load.load(_url);
		}
		
		/**
		 * 卸载已经加载的资源，节省内存。该方法仅对资源是加载方式提供的实例。
		 */		
		public function unload():void
		{
			if ( _url )
			{
				_source = null;
				_bitmapData = null;
				isUpdate = true;
				_isLoaded = false;
			}
		}
		
		/**
		 * 播放。由外部每帧（或者每隔一段时间）调用
		 */		
		public function step():void
		{
			if ( actions )
			{
				isUpdate = actions.step() || _isUpdate;
			}
		}
		
		/**
		 * 显示的图片数据。
		 * @param cut 是否切割。如果不切割将得到一张整图，需要外部程序自行切割。<br/>
		 * 因为在场景里绘制的时候，也是要再做切割的，所以这里不做切割的话，效率会更高一些。<br/>
		 * 在某些场合，物品有可能不是放在场景里的，所以需要切割后的图片。
		 * @return 要显示的图片。
		 */		
		public function displayData(cut:Boolean=false):BitmapData
		{
			var bmpData:BitmapData;
			if ( _source )
			{
				bmpData = new BitmapData(_source.width, _source.height, true, 0);
				if ( !isMirror )
				{
					bmpData.draw(_source);
				}
				else
				{
					bmpData.draw(_source,new Matrix(-1,0,0,1,_source.width));
				}
			}
			else
			{
				bmpData = isMirror ? _mirrorBitmapData : _bitmapData;
			}
			if ( cut )
			{
				var viewRect:Rectangle = displayRect;
				var cutData:BitmapData = new BitmapData(viewRect.width, viewRect.height, true, 0);
				cutData.copyPixels(bmpData, viewRect, new Point());
				return cutData;
			}
			return bmpData;
		}
		
		/**
		 * 改变动作。
		 * @param actName 动作名。
		 * @param keepStep 是否保持原来的指针位置。
		 */		
		public function changeAct(actName:String, keepStep:Boolean=false):void
		{
			if ( !_actions ) return;
			var act:Act = _actions.getActByName(actName);
			if ( act )
			{
				_actions.currentAct = act;
				isUpdate = true;
				if ( keepStep )
				{
					if ( _actions.pointer>=_actions.currentAct.length )
					{
						_actions.pointer = _actions.currentAct.length-1;
					}
				}
				else
				{
					_actions.pointer = 0;
				}
			}
		}
	
		private function onProgress(evt:ProgressEvent):void
		{
			dispatchEvent(evt);
		}
		
		protected function onComplete(evt:Event):void
		{
			var load:Loader = (evt.currentTarget as LoaderInfo).loader;
			load.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			load.removeEventListener(Event.COMPLETE, onComplete);
			if ( load.content is Bitmap )
			{
				_bitmapData = (load.content as Bitmap).bitmapData;
				_source = null;
				checkMirror();
			}
			else
			{
				_source = load.content;
			}
			isUpdate = true;
			_isLoaded = true;
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		private function checkMirror():void
		{
			if ( _bitmapData && _actions && _actions.hasMirrorFrame() )
			{
				_mirrorBitmapData = new BitmapData(_bitmapData.width, _bitmapData.height,true,0);
				_mirrorBitmapData.draw(_bitmapData, new Matrix(-1,0,0,1,_bitmapData.width));
			}
		}

	}
}