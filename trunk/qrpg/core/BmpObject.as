///////////////////////////////////////////////////////////
//  BmpObject.as
//  Macromedia ActionScript Implementation of the Class BmpObject
//  Generated by Enterprise Architect
//  Created on:      12-六月-2009 22:54:20
//  Original author: 陈策
///////////////////////////////////////////////////////////

package qrpg.core
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	
	import qrpg.action.Act;
	import qrpg.action.Actions;
	import qrpg.display.ISceneAddable;
	import qrpg.event.ActionEvent;
	
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
	 * 显示物体的基类。
	 * 该类不是DisplayObject的子类，所以是不可以添加至显示列表里的。<br/>
	 * 要显示该类的实例，需要用该类的displayData()方法得到需要显示的图像的BitmapData。
	 * @author 陈策
	 * @version 3.0
	 * @created 12-六月-2009 22:54:20
	 */
	public class BmpObject extends EventDispatcher implements ISceneAddable
	{
		private var _actions:Actions;					//物体动作集。
		protected var _bmpData:BitmapData;	//物体显示可能用的图片。
		protected var _source:DisplayObject;	//物体显示可能用的显示对象。
		protected var _url:URLRequest;				//物体的图片或者显示对象可能的加载路径。
		
		protected var _isUpdate:Boolean;			//是否需要更新。
		protected var _isLoaded:Boolean;			//是否已经加载。
		
		/**
		 * 显示物体的基类。
		 */		
		public function BmpObject()
		{
			super();
			_isUpdate = false;
			_isLoaded = false;
		}
		
		/**
		 * 图片资源。该属性可以是字符，可以是类，可以是显示对象。
		 * 如果该属性是字符串，则会加载该字符串所代表的URL的资源。
		 * 如果是类，则会实例化为一个显示对象。
		 * 如果为一个显示对象，则为需要显示的资源。
		 * @param obj 数据源。
		 */
		public function set source(obj:Object):void
		{
			if ( obj is BitmapData )
			{
				_bmpData = obj as BitmapData;
				_isLoaded = true;
			}
			else if ( obj is Bitmap )
			{
				_bmpData = (obj as Bitmap).bitmapData;
				_isLoaded = true;
			}
			else if ( obj is DisplayObject )
			{
				_source = obj as DisplayObject;
				_isLoaded = true;
			}
			else if ( obj is Class )
			{
				var tmp:* = new obj();
				if ( tmp is Bitmap )
				{
					_bmpData = (tmp as Bitmap).bitmapData;
				}
				else if ( tmp is DisplayObject )
				{
					_source = tmp as DisplayObject;
				}
				_isLoaded = true;
			}
			else if ( obj is String || obj is URLRequest )
			{
				if ( obj is String ) _url = new URLRequest(String(obj));
				else _url = obj as URLRequest;
				load();
			}
		}
		
		/**
		 * 物体的动作集。
		 */
		public function set actions(acts:Actions):void
		{
			if ( _actions )
			{
				_actions.removeEventListener(ActionEvent.STEP, update);
				_actions.stop();
			}
			_actions = acts;
			if ( _actions )
			{
				_actions.addEventListener(ActionEvent.STEP, update);
				_actions.play();
			}
		}
		public function get actions():Actions
		{
			return _actions;
		}
		
		/**
		 * 是否已经更新。<br/>
		 * 注意：该属性是检查从上回一检查该属性到这回检查为止是否有更新。<br/>
		 * 所以如果连联调用两次该属性，第二次的结果一定会是false。
		 */		
		public function get isUpdate():Boolean
		{
			var value:Boolean = _isUpdate;
			_isUpdate = false;
			return value;
		}
		
		/**
		 * 是否已经加载。
		 */		
		public function get isLoaded():Boolean
		{
			return false;
		}
	
		/**
		 * 显示区域。
		 */
		public function get displayRect():Rectangle
		{
			return _actions.currentFrame.rect;
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
				_bmpData = null;
				_isUpdate = true;
				_isLoaded = false;
			}
		}
		
		/**
		 * 显示的图片数据。
		 * @param cut 是否切割。如果不切割将得到一张整图，需要外部程序自行切割。<br/>
		 * 因为在场景里绘制的时候，也是要再做切割的，所以这里不做切割的话，效率会更高一些。<br/>
		 * 在某些场合，物品有可能不是放在场景里的，所以需要切割后的图片。
		 * @return 图片。
		 */		
		public function displayData(cut:Boolean=false):BitmapData
		{
			var bmpData:BitmapData;
			if ( _source )
			{
				bmpData = new BitmapData(_source.width, _source.height, true, 0);
				bmpData.draw(_source);
			}
			else
			{
				bmpData = _bmpData;
			}
			if ( cut )
			{
				var cutData:BitmapData = new BitmapData(displayRect.width, displayRect.height, true, 0);
				cutData.copyPixels(bmpData, displayRect, new Point());
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
			var act:Act = _actions.getActByName(actName);
			if ( act )
			{
				_actions.currentAct = act;
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
	
		/**
		 * 当动作有更新时，在这里让动作切换，使isUpdata处于true。
		 * @param evt
		 */
		protected function update(evt:Event=null):void
		{
			_isUpdate = true;
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
				_bmpData = (load.content as Bitmap).bitmapData;
				_source = null;
			}
			else
			{
				_source = load.content;
			}
			_isUpdate = true;
			_isLoaded = true;
			dispatchEvent(new Event(Event.COMPLETE));
		}

	}
}