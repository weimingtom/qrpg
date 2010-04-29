package editor.view.resourcewin
{
	import editor.event.EditEvent;
	
	import flash.display.DisplayObject;
	
	import mx.core.UIComponent;
	
	/**
	 * 数据发生变动时发布。
	 * @eventType com.tywin.mapEditor.event.EditEvent.AREA_DATA_CHANGE
 	 */
	[Event(name="areaDataChange", type="com.tywin.mapEditor.event.EditEvent")]
	
	/**
	 * 编辑区域。
	 * @author 陈策
	 * 
	 */	
	public class AreaData extends UIComponent
	{
		private var _data:Array;
		
		private var _nodeList:Array;
		
		/**
		 * 编辑区域。可对不可走区域，点击区域进行编辑。
		 */		
		public function AreaData()
		{
			super();
			_nodeList = [];
		}
		
		/**
		 * 设置区域数据。
		 * @param data 数据。
		 */		
		public function setData(data:Array):void
		{
			for ( ; _nodeList.length>0; )
			{
				removeChild(_nodeList.pop() as DisplayObject);
			}
			graphics.clear();
			graphics.beginFill(0xff0000, .5);
			graphics.lineStyle(1, 0xffffff, 1);
			
			var i:int;
			var len:int = data.length;
			var tmp:Node;
			for ( i=0; i<len; i+=2 )
			{
				i==0 ? graphics.moveTo(Number(data[i]), Number(data[(i+1)])) : graphics.lineTo(Number(data[i]), Number(data[(i+1)]));
				tmp = new Node(Number(data[i]), Number(data[(i+1)]));
				addChild(tmp);
				_nodeList.push(tmp);
			}
			if ( data.length>0 ) dispatchEvent(new EditEvent(EditEvent.AREA_DATA_CHANGE));
		}
		
		/**
		 * 整体移动区域。
		 * @param px X方向位移。
		 * @param py Y方向位移。
		 */		
		public function moveData(px:int, py:int):void
		{
			var i:int;
			var len:int = _nodeList.length;
			for ( i=0; i<len; i++ )
			{
				_nodeList[i].x += px;
				_nodeList[i].y += py;
			}
			drawLine();
			dispatchEvent(new EditEvent(EditEvent.AREA_DATA_CHANGE));
		}
		
		/**
		 * 重新画出区域线。
		 */		
		public function drawLine():void
		{
			var i:int;
			var len:int = _nodeList.length;
			graphics.clear();
			graphics.beginFill(0xff0000, .5);
			graphics.lineStyle(1, 0xffffff, 1);
			if ( _nodeList.length>0 ) graphics.moveTo(_nodeList[0].x, _nodeList[0].y);
			for ( i=1; i<len; i++ )
			{
				graphics.lineTo(_nodeList[i].x, _nodeList[i].y);
			}
		}
		
		/**
		 * 导出数据。
		 * @return 数据。
		 */		
		public function getData():Array
		{
			var arr:Array = [];
			var i:int;
			var len:int = _nodeList.length;
			for ( i=0; i<len; i++ )
			{
				arr.push(_nodeList[i].x);
				arr.push(_nodeList[i].y);
			}
			return arr;
		}
		
		/**
		 * 在某个节点后添加一个节点。新添加的节点位置处于前后两节点中间。<br/>
		 * 如果参照节点为null或者为最后一个节点，新添加的节点处于最后一个节点和第一个节点之间。
		 * @param node 做为参照点的节点。
		 * 
		 */		
		public function addNodeAfter(node:Node=null):Node
		{
			var index:int;
			var index2:int;
			var newx:int;
			var newy:int;
			var newNode:Node;
			
			if ( node )
			{
				var i:int;
				var len:int = _nodeList.length;
				for ( i=0; i<len; i++ )
				{
					if ( _nodeList[i]==node )
					{
						index = i;
						break;
					}
				}
				index2 = index==_nodeList.length-1 ? 0 : index+1;
			}
			else
			{
				index = 0;
				index2 = _nodeList.length-1;
			}
			newx = (_nodeList[index].x+_nodeList[index2].x)>>1;
			newy = (_nodeList[index].y+_nodeList[index2].y)>>1;
			newNode = new Node(newx, newy);
			if ( node )
			{
				_nodeList.splice(index+1, 0, newNode);
			}
			else
			{
				_nodeList.push(newNode);
			}
			addChild(newNode);
			drawLine();
			dispatchEvent(new EditEvent(EditEvent.AREA_DATA_CHANGE));
			return newNode;
		}
		
		/**
		 * 删除一个节点。
		 * @param node 要删除的节点。
		 * @return 如果成功删除，返回被删除的节点。否则返回null。
		 */		
		public function deleteNode(node:Node):Node
		{
			var i:int;
			var len:int = _nodeList.length;
			for ( i=0; i<len; i++ )
			{
				if ( _nodeList[i]==node )
				{
					_nodeList.splice(i, 1);
					removeChild(node);
					drawLine();
					dispatchEvent(new EditEvent(EditEvent.AREA_DATA_CHANGE));
					return node;
				}
			}
			return null;
		}
		
	}
}
