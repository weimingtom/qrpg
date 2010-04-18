package qrpg.scene
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import qrpg.display.ISceneAddable;
	
	/**
	 * 记录场景里的物体的VO
	 * @author 陈策
	 */	
	public class ScenceObject
	{
		/**
		 * 记录的物体。
		 */		
		public var obj:ISceneAddable;
		
		/**
		 * 物体原来的显示区域。
		 */		
		public var rect:Rectangle;
		
		/**
		 * 物体原来的位置。
		 */		
		public var dest:Point;
		
		/**
		 * VO
		 * @param obj 要记录的物体。
		 */		
		public function ScenceObject(obj:ISceneAddable)
		{
			this.obj = obj;
			this.rect = obj.displayRect(obj.isMirror);
			this.dest = obj.displayPoint;
		}
		
		/**
		 * 显示完成后，要刷新显示的区域。
		 */		
		public function refresh():void
		{
			if ( obj )
			{
				rect = obj.displayRect(obj.isMirror);
				dest = obj.displayPoint;
			}
		}
	}
}