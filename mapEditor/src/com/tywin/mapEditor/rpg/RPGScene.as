package com.tywin.mapEditor.rpg
{
	import com.tywin.mapEditor.modul.EditorModul;
	
	import mx.collections.ArrayCollection;
	
	public class RPGScene extends GameSprite
	{
		private var _focusX:int;
		private var _focusY:int;
		
		private var _bgpic:BackGroundPic;
		private var _bg:GameLayer;
		private var _main:GameLayer;
		private var _front:GameLayer;
		
		private var tMPuNWALK:XML;	//TODO 临时用。以后改掉。
		
		public function RPGScene(width:int, height:int)
		{
			super();
			
			_focusX = 0;
			_focusY = 0;
			
			_bgpic = new BackGroundPic(width, height);
			addChild(_bgpic);
			
			_bg = new GameLayer(width, height);
			addChild(_bg);
			
			_main = new GameLayer(width, height);
			addChild(_main);
			
			_front = new GameLayer(width, height);
			addChild(_front);
		}
		
		public function get focusX():int
		{
			return _focusX;
		}
		public function get focusY():int
		{
			return _focusY;
		}
		
		public function get background():GameLayer
		{
			return _bg;
		}
		public function get main():GameLayer
		{
			return _main;
		}
		public function get front():GameLayer
		{
			return _front;
		}
		
		public function build(xml:XML):void
		{
			//背景块
			_bgpic.widthPic = Number(xml.@width);
			_bgpic.heightPic = Number(xml.@height);
			_bgpic.nodeWidth = Number(xml.@nodewidth);
			_bgpic.nodeHeight = Number(xml.@nodeheight);
			_bgpic.src = xml.@filesrc;
			
			//临时企业数据
			var tmpObj:Object;
			var coms:XMLList = xml.companys.company;
			
			var i:int;
			var len:int = coms.length();
			if ( len>0 )
			{
				EditorModul.exhibitCode = xml.companys.@exhibitCode;
				EditorModul.sceneCode = xml.companys.@sceneCode;
				EditorModul.company = new ArrayCollection([{label:"不属于任何企业", code:"null"}]);
				for ( i=0; i<len; i++ )
				{
					EditorModul.company.addItem({label:coms[i].toString(), code:coms[i].@code});
				}
			}
			
			//背景层
			_bg.build(XML(xml.bg));
			
			//中间层
			_main.build(XML(xml.main));
			
			//前景层
			_front.build(XML(xml.front));
			
			//不可走区域
			tMPuNWALK = XML(xml.unwalk);
			
			//刷新
			focus(_bgpic.widthPic*_bgpic.nodeWidth>>1, _bgpic.heightPic*_bgpic.nodeHeight>>1);
			_bgpic.refresh();
			_bg.refresh();
			_main.refresh();
			_front.refresh();
		}
		
		public function getXML():XML
		{
			var xml:XML =<scene width={_bgpic.widthPic} height={_bgpic.heightPic} nodewidth={_bgpic.nodeWidth} nodeheight={_bgpic.nodeHeight} filesrc={_bgpic.src}/>
			var tmpXML:XML;
			
			//展的𥊤临时信息
			trace(EditorModul.sceneCode)
			if ( EditorModul.sceneCode )
			{
				var exhibitXML:XML = <companys exhibitCode={EditorModul.exhibitCode} sceneCode={EditorModul.sceneCode}/>
				var i:int;
				var len:int = EditorModul.company.length;
				for ( i=1; i<len; i++ )
				{
					exhibitXML.appendChild(<company code={EditorModul.company[i].code}>{EditorModul.company[i].label}</company>);
				}
				xml.appendChild(exhibitXML);
			}
			
			//不可走区域
			xml.appendChild(tMPuNWALK);
			
			//背景层
			tmpXML = _bg.getXML();
			tmpXML.setName("bg");
			xml.appendChild(tmpXML);
			
			//中间层
			tmpXML = _main.getXML();
			tmpXML.setName("main");
			xml.appendChild(tmpXML);
			
			//前景层
			tmpXML = _front.getXML();
			tmpXML.setName("front");
			xml.appendChild(tmpXML);
			
			return xml;
		}
		
		public function focus(px:int, py:int):void
		{
			_focusX = px;
			_focusY = py;
			if ( _focusX<0 ) _focusX=0;
			if ( _focusX> _bgpic.fullWidth-_bgpic.showWidth ) _focusX = _bgpic.fullWidth-_bgpic.showWidth;
			if ( _focusY<0 ) _focusY=0;
			if ( _focusY> _bgpic.fullHeight-_bgpic.showHeight ) _focusY = _bgpic.fullHeight-_bgpic.showHeight;
			_bgpic.focus(px, py);
			_bg.focus(px, py);
			_main.focus(px, py);
			_front.focus(px, py);
		}
		
		public function resize(w:int, h:int):void
		{
			_bgpic.resize(w, h);
			_bg.resize(w, h);
			_main.resize(w, h);
			_front.resize(w, h);
		}
		
		public function up(obj:SceneObject):void
		{
			if ( obj.parent==_bg )
			{
				_bg.setChildIndex(obj, _bg.numChildren-1);
			}
			else if ( obj.parent==_main )
			{
				_main.setChildIndex(obj, _main.numChildren-1);
			}
			else if ( obj.parent==_front )
			{
				_front.setChildIndex(obj, _front.numChildren-1);
			}
		}
	}
}