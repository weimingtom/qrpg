package qrpg.action
{
	/**
	 * 动作类。保存一个动作，动作是由一帧或者若干帧组成。
	 * @author 陈策
	 * @version 3.0
	 */
	public class Act
	{
		/**
		 * 动作类型。
		 */
		public var type:String;
		
		/**
		 * 动作代表的状态
		 */		
		public var state:String;
		
		/**
		 * 动作代表的方向
		 */		
		public var direction:int;
		
		//该动作包含的所有帧。
		private var _frames:Array;
		
		private var _name:String;
		
		/**
		 * 动作。
		 * @param name 动作名。
		 * @param type 动作类型。
		 */		
		public function Act(name:String, type:String)
		{
			this.name = name;
			this.type = type;
			_frames = new Array();
		}
		
		/**
		 * 动作名字。
		 */
		public function get name():String
		{
			return _name;
		}
		public function set name(value:String):void
		{
			_name = value;
			if ( !_name ) return;
			var arr:Array = name.split("_");
			state = String(arr[0]);
			direction = Number(arr[1]);
		}
		
		/**
		 * 动作的帧数。
		 */		
		public function get length():int
		{
			return _frames.length;
		}
		
		/**
		 * 通过XML生成动作。
		 * @param xml 生成动作的XML。
		 * @return 动作。
		 */		
		public static function createByXML(xml:XML):Act
		{
			var act:Act = new Act(xml.@name, xml.@type);
			var xmlList:XML;
			var i:int;
			var len:int = xml.frame.length();
			for ( i=0; i<len; i++ )
			{
				xmlList = xml.frame[i];
				act.addFrame(new Frame(Number(xmlList.@x),
										 Number(xmlList.@y), 
										 Number(xmlList.@width), 
										 Number(xmlList.@height), 
										 Number(xmlList.@cx), 
										 Number(xmlList.@cy), 
										 String(xmlList.@mirror)=="true"));
			}
			return act;
		}
		
		/**
		 * 返回代表这个动作的XML。
		 * @return 代表这个动作的XML。
		 */		
		public function getXML():XML
		{
			var xml:XML = <action type={type} name={name}/>
			var frame:Frame;
			var i:int;
			var len:int = _frames.length;
			for ( i=0; i<len; i++ )
			{
				frame = _frames[i];
				xml.appendChild(<frame width={frame.rect.width} height={frame.rect.height} x={frame.rect.x} y={frame.rect.y} cx={frame.center.x} cy={frame.center.y} mirror={frame.isMirror} />);
			}
			return xml;
		}
	
		/**
		 * 将帧添加至动作，做为该动作的最后一帧。
		 * @param frame 要添加的帧。
		 * @return 添加后总帧数。
		 */
		public function addFrame(frame:Frame):int
		{
			_frames.push(frame);
			return _frames.length;
		}
	
		/**
		 * 将帧添加到动作的指定位置。
		 * @param frame 要添加的帧。
		 * @param index 要添加帧至指定的位置。
		 * @return 添加后总帧数。
		 */
		public function addFrameAt(frame:Frame, index:int):int
		{
			_frames.splice(index, 0, frame);
			return _frames.length;
		}
		
		/**
		 * 得到指定位置的帧。
		 * @param index 指定的位置。
		 * @return 指定的帧。
		 */		
		public function getFrameAt(index:int):Frame
		{
			if ( index<0 || index>=length )
			{
				return _frames[0];
			}
			return _frames[index];
		}
	
		/**
		 * 删除指定的帧。
		 * @param frame 要删除的帧。
		 * @return 被删除的帧。
		 */
		public function removeFrame(frame:Frame):Frame
		{
			var remove:Frame;
			var i:int;
			var len:int = _frames.length;
			for ( i=0; i<len; i++ )
			{
				if ( _frames[i]==frame )
				{
					remove = _frames.splice(i,1)[0];
					break;
				}
			}
			return remove;
		}
	
		/**
		 * 删除指定位置的帧。
		 * @param index 删除指定位置的帧。
		 * @return 被删除的帧。
		 */
		public function removeFrameAt(index:int):Frame
		{
			var remove:Frame = _frames.splice(index,1)[0];
			return remove;
		}
		
		/**
		 * 是否包含有镜像的帧。
		 * @return 
		 */		
		public function hasMirrorFrame():Boolean
		{
			var i:int;
			var len:int = _frames.length;
			for ( i=0; i<len; i++ )
			{
				if ( (_frames[i] as Frame).isMirror )
				{
					return true;
				}
			}
			return false;
		}
		
		public function toString():String
		{
			return "[Act size:"+length+"]";
		}

	}
}