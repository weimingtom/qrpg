package editor.core
{
	import editor.action.ActionList;
	import editor.action.AddSceneObject;
	import editor.action.DeleteObject;
	import editor.action.IAction;
	import editor.action.MoveObject;
	import editor.action.PasteObject;
	import editor.core.subControler.OpenSceneFileControler;
	import editor.core.subControler.SaveSceneXMLFile;
	import editor.event.EditEvent;
	import editor.event.EventPool;
	import editor.modul.EditorModul;
	import editor.rpg.AreaSprite;
	import editor.rpg.BackGroundPic;
	import editor.rpg.GameLayer;
	import editor.rpg.RPGScene;
	import editor.rpg.SceneObject;
	import editor.view.CreateEmptyScene;
	import editor.view.help.VersionWin;
	import editor.view.menu.MainMenu;
	import editor.view.propertywin.PropertyWin;
	import editor.view.resourcewin.ResourceWin;
	import editor.view.tool.Tools;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.filters.DropShadowFilter;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * 编辑器主控制器。
	 * @author 陈策
	 */	
	public class Controler
	{
		private static var _instance:Controler;
		
		private var _tool:String;						//正在使用的工具。
		
		private var  redBorder:DropShadowFilter = new DropShadowFilter(0,0,0xff0000,1,3,3,5,1,false);
		private var  yellowBorder:DropShadowFilter = new DropShadowFilter(0,0,0xff6600,1,3,3,5,1,false);
		
		private var _root:DisplayObjectContainer;	//场景放置的显示对象。
		private var _scene:RPGScene;					//正在编辑的场景。
		private var _selected:SceneObject;			//正在编辑的场景物体。
		
		private var _clipboard:*;							//剪切板里找内容。
		
		private var _isMouseDown:Boolean;
		private var _mx:int;
		private var _my:int;
		private var _tmpAct:IAction;
		
		/**
		 * 主控制器。
		 * @param access
		 */		
		public function Controler(access:Private=null)
		{
			if ( access!=null )
			{
				_tool = ToolType.ARROW;
				EventPool.addEventListener(EditEvent.ORDER, orderHandler);
				EventPool.addEventListener(EditEvent.NEW_SCENE, newSceneHandler);
				EventPool.addEventListener(EditEvent.SCENE_XML_LOADED, SceneXMLLoadedHandler);
				EventPool.addEventListener(EditEvent.ADD_TO_SCENE, addToSceneHandler);
			}
			else
			{
				throw new Error("Controler 类不能实例化。");
			}
		}
		
		/**
		 * 放置正在编辑的场景的显示对象。
		 */		
		public function set root(doc:DisplayObjectContainer):void
		{
			_root = doc;
			_root && _root.addEventListener(Event.RESIZE, resizeHandler);
		}
		public function get root():DisplayObjectContainer
		{
			return _root;
		}
		
		/**
		 * 正在编辑的场景。
		 */		
		public function get scene():RPGScene
		{
			return _scene;
		}
		
		/**
		 * 正在编辑的场景物体。
		 */		
		public function set selected(obj:SceneObject):void
		{
			if ( selected==obj ) return;
			if ( _selected )
			{
				_selected.filters = [];
				_selected = null;
				MainMenu.menubarXML.order.(@data==OrderKey.COPY).@enabled = false;
				MainMenu.menubarXML.order.(@data==OrderKey.CUT).@enabled = false;
				MainMenu.menubarXML.order.(@data==OrderKey.DELETE).@enabled = false;
			}
			if ( obj )
			{
				trace(obj.comany)
				_selected = obj;
				_selected.filters = [redBorder];
				MainMenu.menubarXML.order.(@data==OrderKey.COPY).@enabled = true;
				MainMenu.menubarXML.order.(@data==OrderKey.CUT).@enabled = true;
				MainMenu.menubarXML.order.(@data==OrderKey.DELETE).@enabled = true;
			}
			new EditEvent(EditEvent.SELECTED_CHANGE, selected).dispatch();
		}
		public function get selected():SceneObject
		{
			return _selected;
		}
		
		/**
		 * 剪粘板内容。
		 */		
		public function set clipboard(obj:*):void
		{
			_clipboard = obj;
			if ( _clipboard )
			{
				MainMenu.menubarXML.order.(@data==OrderKey.PASTE).@enabled = true;
			}
			else
			{
				MainMenu.menubarXML.order.(@data==OrderKey.PASTE).@enabled = false;
			}
		}
		public function get clipboard():*
		{
			return _clipboard;
		}
		
		/**
		 * 目前使用的工具。
		 */		
		public function set tool(t:String):void
		{
			_tool = t;
		}
		public function get tool():String
		{
			return _tool;
		}
		
		/**
		 * 正在编辑的场景图层。
		 */		
		public function get editLayer():GameLayer
		{
			if ( !_scene ) return null
			if ( MainMenu.menubarXML.order.(@data==OrderKey.EDIT_MAIN).@toggled ) return _scene.main;
			if ( MainMenu.menubarXML.order.(@data==OrderKey.EDIT_FRONT).@toggled ) return _scene.front;
			if ( MainMenu.menubarXML.order.(@data==OrderKey.EDIT_BACKGROUND).@toggled ) return _scene.background; 
			return null;
		}
		
		public static function getInstance():Controler
		{
			if ( !_instance ) _instance = new Controler(new Private());
			return _instance;
		}
		
		public function init():void
		{
			ResourceWin.getInstance().init();
		}
		
		//-----------------------------------------------------
		//                      Handler
		//-----------------------------------------------------
		
		private function orderHandler(evt:EditEvent):void
		{
			//新建文件
			if ( evt.data.@data==OrderKey.NEW_SCENE_FILE )
			{
				CreateEmptyScene.open();
			}
			//打开文件。
			else if ( evt.data.@data == OrderKey.OPEN_SCENE_FILE )
			{
				var fileCtrl:OpenSceneFileControler = new OpenSceneFileControler();
				fileCtrl.openFile();
			}
			//保存文件
			else if ( evt.data.@data==OrderKey.SAVE_FILE )
			{
				var save:SaveSceneXMLFile = new SaveSceneXMLFile(_scene.getXML());
				save.save();
			}
			//另存为
			else if ( evt.data.@data==OrderKey.SAVE_AS )
			{
				var saveas:SaveSceneXMLFile = new SaveSceneXMLFile(_scene.getXML());
				saveas.saveAs();
			}
						
			//撤消
			else if ( evt.data.@data==OrderKey.UNDO )
			{
				selected = null;
				ActionList.undo();
			}
			//重做
			else if ( evt.data.@data==OrderKey.REDO )
			{
				selected = null;
				ActionList.redo();
			}
			//复制
			else if ( evt.data.@data==OrderKey.COPY )
			{
				if ( selected ) clipboard = selected;
			}
			//剪切
			else if ( evt.data.@data==OrderKey.CUT )
			{
				if ( !selected ) return
				clipboard = selected;
				ActionList.addAction(new DeleteObject(clipboard));
			}
			//粘贴
			else if ( evt.data.@data==OrderKey.PASTE )
			{
				if ( !clipboard ) return;
				ActionList.addAction(new PasteObject(editLayer, clipboard));
			}
			//删除
			else if ( evt.data.@data==OrderKey.DELETE )
			{
				if ( !selected ) return;
				ActionList.addAction(new DeleteObject(selected));
			}
			
			//工具面板
			else if ( evt.data.@data==OrderKey.TOOLS )
			{
				Tools.open();
			}
			//属性面板
			else if ( evt.data.@data==OrderKey.PROPERTY_WIN )
			{
				PropertyWin.open();
			}
			//资源面板
			else if ( evt.data.@data==OrderKey.RESOURCE_WIN )
			{
				ResourceWin.open();
			}
			//版本信息。
			else if ( evt.data.@data == OrderKey.VERSION_WIN )
			{
				VersionWin.open();
			}
			//测试
			else if ( evt.data.@data=="test" )
			{
				
			}
		}
		
		private function newSceneHandler(evt:EditEvent):void
		{
			var src:String = String(evt.data);
			var fileCtrl:OpenSceneFileControler = new OpenSceneFileControler();
			fileCtrl.openFile(src);
		}
		
		private function SceneXMLLoadedHandler(evt:EditEvent):void
		{
			if ( _scene )
			{
				_scene.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
				_scene.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
				_scene.removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
				_scene.removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
				_root.removeChild(_scene);
			}
			try
			{
				_scene = new RPGScene(_root.width, _root.height);
				_scene.build(evt.data as XML);
			}
			catch ( e:* )
			{
				trace( "场景XML有问题。" )
			}
			_scene.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			_scene.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			_scene.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			_scene.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			_root.addChild(_scene);
			
			//设置菜单可用
			MainMenu.menubarXML.order.(@data==OrderKey.SAVE_FILE).@enabled = true;
			MainMenu.menubarXML.order.(@data==OrderKey.SAVE_AS).@enabled = true;
			
			MainMenu.menubarXML.order.(@data==OrderKey.CONNECT_SERVER).@enabled = true;
			MainMenu.menubarXML.order.(@data==OrderKey.SELECT_SCENE).@enabled = true;
			
			MainMenu.menubarXML.folder.(@label=="正在编辑的层").@enabled = true;
			
		}
		
		private function addToSceneHandler(evt:EditEvent):void
		{
			var src:String = String(evt.data);
			if ( !src.match(/\.xml$/i) ) return;
			
			var file:File = new File(src);
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.READ);
			var xml:XML = new XML(stream.readUTFBytes(stream.bytesAvailable));
			
			var arr:Array = src.split("\\");
			var xmlFileName:String = String(arr.pop());
			var xmlFilePath:String = arr.join("\\")+"\\";
			var picFullSrc:String = xmlFilePath+xml..item.@src;
			var picWriteSrc:String = picFullSrc.split(EditorModul.sceneFilePath).join("").split("\\").join("/");
			xml..item.@src = picWriteSrc;
			
			var rect:Rectangle = new Rectangle();
			rect.x = Number(xml..frame.@x);
			rect.y = Number(xml..frame.@y);
			rect.width = Number(xml..frame.@width);
			rect.height = Number(xml..frame.@height);
			var point:Point = new Point();
			point.x = Number(xml..frame.@cx);
			point.y = Number(xml..frame.@cy);
			var obj:SceneObject = new SceneObject(picWriteSrc, rect, point);
			if ( xml.hitarea.toString() ) obj.hitAreaData = xml.hitarea.toString().split(",");
			if ( xml.unwalk.toString() ) obj.unwalkData = xml.unwalk.toString().split(",");
			
			obj.x = scene.focusX+(_root.width>>1);
			obj.y = scene.focusY+(_root.height>>1);
			
			ActionList.addAction(new AddSceneObject(obj, editLayer));
		}
		
		private function resizeHandler(evt:Event):void
		{
			if ( _scene )
			{
				_scene.resize(_root.width, _root.height);
			}
			new EditEvent(EditEvent.RESIZE).dispatch();
		}
		
		//Mouse Handler
				
		private function mouseDownHandler(evt:MouseEvent):void
		{
			if ( tool==ToolType.ARROW )
			{
				//箭头工具
				if ( evt.target is BackGroundPic )
				{
					selected = null;
					_isMouseDown = true;
					_mx = _scene.mouseX;
					_my = _scene.mouseY;
					_scene.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
				}
				else if ( evt.target is AreaSprite )
				{
					selected = (evt.target as AreaSprite).parent as SceneObject;
				}
			}
			else if ( tool==ToolType.MOVE )
			{
				//移动工具
				if ( evt.target is BackGroundPic )
				{
					selected = null;
					_isMouseDown = true;
					_mx = _scene.mouseX;
					_my = _scene.mouseY;
					_scene.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
				}
				else if ( evt.target is AreaSprite )
				{
					selected = (evt.target as AreaSprite).parent as SceneObject;
					_scene.up(selected);
					_isMouseDown = true;
					_mx = _scene.mouseX;
					_my = _scene.mouseY;
					_tmpAct = new MoveObject(selected);
					(_tmpAct as MoveObject).oldX = selected.x;
					(_tmpAct as MoveObject).oldY = selected.y;
					_scene.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
				}
			}
			else if ( tool==ToolType.HAND )
			{
				//手抓工具
				_isMouseDown = true;
				_mx = _scene.mouseX;
				_my = _scene.mouseY;
				_scene.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			}
			
		}
		
		private function mouseUpHandler(evt:MouseEvent):void
		{
			if ( tool==ToolType.ARROW )
			{
				//箭头工具
				_isMouseDown = false;
				_scene.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			}
			else if ( tool==ToolType.MOVE )
			{
				//移动工具
				_isMouseDown = false;
				_scene.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
				if ( selected )
				{
					if ( _tmpAct && (_tmpAct as MoveObject).isMove )
					{
						(_tmpAct as MoveObject).newX = selected.x;
						(_tmpAct as MoveObject).newY = selected.y;
						ActionList.addAction(_tmpAct);
					}
					else
					{
						(selected.parent as GameLayer).resetObject(selected);
					}
				}
			}
			else if ( tool==ToolType.HAND )
			{
				//手抓工具
				_isMouseDown = false;
				_scene.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			}
		}
		
		private function mouseMoveHandler(evt:MouseEvent):void
		{
			if ( tool==ToolType.ARROW )
			{
				//箭头工具
				if ( !_isMouseDown ) return;
				_scene.focus(_scene.focusX-_scene.mouseX+_mx, _scene.focusY-_scene.mouseY+_my);
				_mx = _scene.mouseX;
				_my = _scene.mouseY;
			}
			else if ( tool==ToolType.MOVE )
			{
				//移动工具
				if ( !_isMouseDown ) return;
				if ( selected )
				{
					selected.x += _scene.mouseX-_mx;
					selected.y += _scene.mouseY-_my;
					_mx = _scene.mouseX;
					_my = _scene.mouseY;
					(_tmpAct as MoveObject).isMove = true;
				}
				else
				{
					_scene.focus(_scene.focusX-_scene.mouseX+_mx, _scene.focusY-_scene.mouseY+_my);
					_mx = _scene.mouseX;
					_my = _scene.mouseY;
				}
			}
			else if ( tool==ToolType.HAND )
			{
				//手抓工具
				if ( !_isMouseDown ) return;
				_scene.focus(_scene.focusX-_scene.mouseX+_mx, _scene.focusY-_scene.mouseY+_my);
				_mx = _scene.mouseX;
				_my = _scene.mouseY;
			}
		}
		
		private function mouseOverHandler(evt:MouseEvent):void
		{
			var obj:SceneObject;
			if ( tool==ToolType.ARROW )
			{
				//箭头工具
				if ( evt.target is AreaSprite )
				{
					obj = (evt.target as AreaSprite).parent as SceneObject;
					if ( selected!=obj ) obj.filters = [yellowBorder];
				}
			}
			else if ( tool==ToolType.MOVE )
			{
				//移动工具
				if ( evt.target is AreaSprite )
				{
					obj = (evt.target as AreaSprite).parent as SceneObject;
					if ( selected!=obj ) obj.filters = [yellowBorder];
				}
			}
			else if ( tool==ToolType.HAND )
			{
				//手抓工具
				//do nothing
			}
		}
		
		private function mouseOutHandler(evt:MouseEvent):void
		{
			var obj:SceneObject;
			if ( tool==ToolType.ARROW )
			{
				//箭头工具
				if ( evt.target is AreaSprite )
				{
					obj = (evt.target as AreaSprite).parent as SceneObject;
					if ( selected!=obj ) obj.filters = [];
				}
			}
			else if ( tool==ToolType.MOVE )
			{
				//移动工具
				if ( evt.target is AreaSprite )
				{
					obj = (evt.target as AreaSprite).parent as SceneObject;
					if ( selected!=obj ) obj.filters = [];
				}
			}
			else if ( tool==ToolType.HAND )
			{
				//手抓工具
				//do nothing
			}
		}

	}
}
class Private{}