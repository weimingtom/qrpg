package qrpg.display
{
	import qrpg.event.RoleEvent;
	import qrpg.util.GameMath;
	
	/**
	 * 走到终点。
	 * @EventType qrpg.event.RoleEvent.ARRIVE_END
	 */	
	[Event(name="arriveEnd", type="qrpg.event.RoleEvent")]
	
	/**
	 * RPG角色类。
	 * @author 陈策
	 * @version 3.0
	 */
	public class RPGRole extends Role implements ISceneAddable
	{
		/**
		 * 角色的行走速度。
		 */		
		public var speed:Number;
		
		private var _ax:Number;		//角色目的地X座标。
		private var _ay:Number;		//角色目的地Y座标。
		
		private var _angle:Number = 0;		//当前角度
		private var _aimAngle:Number = 0;	//目标角度
		private var _speedX:Number = 0;		//X方向速度
		private var _speedY:Number = 0;		//Y方向速度
		
		private var _state:String;			//状态
		
		public function RPGRole()
		{
			super();
			_state = RPGRoleActionType.STAND;
		}
		
		/**
		 * 角色的状态。
		 */		
		public function set state(value:String):void
		{
			if ( actions && actions.hasState(value) )
			{
				_state = value;
				changeAct(state+"_"+getDirection(_angle), true);
			}
		}
		public function get state():String
		{
			return _state;
		}
		
		/**
		 * 移动角色。
		 * @param ax 角色的目的地X座标。
		 * @param ay 角色的目的地Y座标。
		 */		
		public function moveTo(ax:int, ay:int):void
		{
			_ax = ax;
			_ay = ay;
			
			if ( _ax!=x || _ay!=y )
			{
				_aimAngle = Math.atan2(_ay-y, _ax-x);
				_speedX = speed*Math.cos(_aimAngle);
				_speedY = speed*Math.sin(_aimAngle);
				state = RPGRoleActionType.WALK;
			}
			else
			{
				
			}
		}
		
		override public function step():void
		{
			if ( _ax!=x || _ay!=y )
			{
				//转身
				if ( _angle!=_aimAngle )
				{
					var angleSpeed:Number = Math.PI/8;
					var d:Number = GameMath.normalRadians(_aimAngle)-GameMath.normalRadians(_angle);
					if ( Math.abs(d)<angleSpeed )
					{
						_angle = _aimAngle;
					}
					else
					{
						if ( Math.abs(d)<Math.PI )
						{
							_angle += angleSpeed*d/Math.abs(d);
						}
						else
						{
							_angle -= angleSpeed*d/Math.abs(d);
						}
					}
					changeAct(state+"_"+getDirection(_angle), true);
				}
				//移动
				if ( _ay>y )
				{
					dispatchEvent(new RoleEvent(RoleEvent.MOVE_DOWN));
				}
				else if ( _ay<y )
				{
					dispatchEvent(new RoleEvent(RoleEvent.MOVE_UP));
				}
				if ( Math.abs(_ax-x)+Math.abs(_ay-y)>.5 )
				{
					x = Math.abs(_ax-x)>Math.abs(_speedX) ? x+_speedX : _ax;
					y = Math.abs(_ay-y)>Math.abs(_speedY) ? y+_speedY : _ay;
				}
				else
				{
					x = _ax;
					y = _ay;
				}
				
				//如果完成移动
				if ( _ax==x && _ay==y )
				{
					state = RPGRoleActionType.STAND;
					dispatchEvent(new RoleEvent(RoleEvent.ARRIVE_END));
				}
			}
			
			super.step();
		}
		
		/**
		 * 得到某角度下的方向值。
		 * @param angle 角度。
		 * @param n 按几方向分。
		 * @return 方向值。
		 */		
		private function getDirection(angle:Number, n:int=8):int
		{
			var a:Number = (angle+Math.PI*3/2)%(2*Math.PI);
			if ( n==4 )
				return Math.round((a-Math.PI/4)*n/(2*Math.PI))%n;
			return Math.round(a*n/(2*Math.PI))%n;
		}
		
	}
}