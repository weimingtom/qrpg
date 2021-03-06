package qrpg.action
{
	import flash.events.EventDispatcher;
	
	import qrpg.event.ActionEvent;
	import qrpg.event.GameEvent;
	import qrpg.util.HashMap;
	
	/**
	 * 动作改变时触发。
	 * @EventType qrpg.event.ActionEvent.ACTION_CHANGE
	 */	
	[Event(name="actionChangeXX", type="qrpg.event.ActionEvent")]
	
	/**
	 * 动作指针改变时触发。
	 * @EventType qrpg.event.ActionEvent.POINTER_CHANGE
	 */	
	[Event(name="pointerChange", type="qrpg.event.ActionEvent")]
	
	/**
	 * 动作播放或者改变时触发。
	 * @EventType qrpg.event.ActionEvent.STEP
	 */	
	[Event(name="step", type="qrpg.event.ActionEvent")]
	
	/**
	 * 动作集。包含角色里要显示的动作列表等与动作有关的信息。
	 * @author 陈策
	 * @version 3.0
	 */
	public class Actions extends EventDispatcher
	{
		/**
		 * 是否为隔帧动作。默认为隔帧动作。非隔帧动作即每帧动作，会让动作更流畅，但需要的图片也越多。
		 */		
		public var hasInterval:Boolean;
		
		private var _acts:HashMap;			//存放动作集。
		private var _defaultAct:Act;		//默认动作。
		private var _currentAct:Act;		//当前动作。
		private var _lastAct:Act;			//最后一个动作。
		private var _pointer:int;			//动作指针。
		private var _runTime:Boolean;		//是否是播放时间。
		private var _isPlaying:Boolean;	//是否正在播放。
		
		/**
		 * 动作集。
		 */		
		public function Actions():void
		{
			hasInterval = false;
			_acts = new HashMap();
			_pointer = 0;
			_runTime = true;
			_isPlaying = true;
		}
	
		/**
		 * 默认动作。
		 */
		public function get defaultAct(): Act
		{
			return _defaultAct;
		}
		public function set defaultAct(act:Act): void
		{
			if ( _acts.containsValue(act) )
			{
				_defaultAct = act;
			}
		}
		
		/**
		 * 当前动作。
		 */		
		public function get currentAct():Act
		{
			return _currentAct;
		}
		public function set currentAct(act:Act):void
		{
			if ( _acts.containsValue(act) && _currentAct!=act )
			{
				_lastAct = _currentAct;
				_currentAct = act;
				_isPlaying = true;
				dispatchEvent(new GameEvent(ActionEvent.ACTION_CHANGE));
			}
		}
		
		/**
		 * 当前正在播放的帧。
		 */		
		public function get currentFrame():Frame
		{
			return currentAct.getFrameAt(pointer);
		}
		
		/**
		 * 播放指针。
		 */		
		public function get pointer():int
		{
			return _pointer;
		}
		public function set pointer(p:int):void
		{
			if ( p!=_pointer )
			{
				if ( p<0 ) _pointer = 0;
				else if ( p>=currentAct.length ) _pointer = currentAct.length-1;
				else _pointer = p;
				dispatchEvent(new ActionEvent(ActionEvent.POINTER_CHANGE));
			}
		}
		
		/**
		 * 是否正在播放。
		 */		
		public function get isPlaying():Boolean
		{
			return _isPlaying;
		}
		
		/**
		 * 通过XML生成动作集。
		 * @param xml 生成动作集的XML。
		 * @return 动作集。
		 */		
		public static function createByXML(xml:XML):Actions
		{
			var acts:Actions = new Actions();
			var i:int;
			var len:int = xml.action.length();
			for ( i=0; i<len; i++ )
			{
				acts.addAct( Act.createByXML(XML(xml.action[i])) );
			}
			return acts;
		}

		/**
		 * 添加动作至动作集。
		 * @param act要添加的动作。
		 * @param name 要添加的动作的名字。如果为null则以动作原来的名字为动作名。
		 */
		public function addAct(act:Act, name:String=null): void
		{
			if ( name!=null ) act.name = name;
			_acts.put(act.name, act);
			if ( !currentAct ) currentAct = act;
		}
	
		/**
		 * 删除动作。
		 * @param act要删除的动作。
		 * @return 被删除的帧，如果未删除则返回null。
		 */
		public function removeAct(act:Act): Act
		{
			if ( _acts.containsValue(act) )
			{
				return _acts.remove(act.name) as Act;
			}
			return null;
		}
	
		/**
		 * 按动作名删除动作。
		 * @param name要删除的动作的名字。
		 * @return 被删除的帧，如果未删除则返回null。
		 */
		public function removeActByName(name:String):Act
		{
			if ( _acts.containsKey(name) )
			{
				return _acts.remove(name)
			}
			return null;
		}
		
		/**
		 * 按动作名得到某动作。
		 * @param name 动作名。
		 * @return 动作。如果动作名不存在，返回null。
		 */		
		public function getActByName(name:String):Act
		{
			return _acts.getValue(name);
		}
		
		/**
		 * 动作集里的动作是否包含某状态的动作。
		 * @param state 状态。
		 * @return 如果饮食该状态返回true，反之false。
		 */		
		public function hasState(state:String):Boolean
		{
			var arr:Array = _acts.values();
			var i:int;
			var len:int = arr.length;
			for ( i=0; i<len; i++ )
			{
				if ( (arr[i] as Act).state==state )
				{
					return true;
				}
			}
			return false;
		}
		
		/**
		 * 动作向前一步。
		 * return 动作是否做了更新。
		 */		
		public function step():Boolean
		{
			_runTime = !_runTime;
			if ( !isPlaying || (hasInterval && !_runTime) ) return false;
			if ( pointer<currentAct.length-1 )
			{
				pointer++;
			}
			else
			{
				switch ( currentAct.type )
				{
					case ActType.LOOP:
						pointer = 0;
						break;
					case ActType.PLAY_DEFAULT:
						pointer = 0;
						currentAct = defaultAct;
						break;
					case ActType.PLAY_LAST:
						pointer = 0;
						currentAct = _lastAct;
						break;
					case ActType.STOP:
						pointer = 0;
						_isPlaying = false;
						break;
					case ActType.STOP_AT_FIRST:
						pointer = 0;
						_isPlaying = false;
						break;
					case ActType.STOP_AT_LAST:
						_isPlaying = false;
						return false;
						break;
				}
			}
			dispatchEvent(new ActionEvent(ActionEvent.STEP));
			return true;
		}
		
		/**
		 * 是否包含有镜像的帧。
		 * @return 
		 */		
		public function hasMirrorFrame():Boolean
		{
			var arr:Array = _acts.values();
			var i:int;
			var len:int = arr.length;
			for ( i=0; i<len; i++ )
			{
				if ( (arr[i] as Act).hasMirrorFrame() )
				{
					return true;
				}
			}
			return false;
		}
		
		override public function toString():String
		{
			return "[Actions size:"+_acts.size()+"]";
		}

	}
}