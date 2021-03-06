package qrpg.action
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * 动作的帧。帧记录了该帧要显示图片或者显示对象里的哪一部分。
	 * @author 陈策
	 * @version 3.0
	 */
	public class Frame
	{
		/**
		 * 该帧的中心点。
		 */
		public var center:Point;
		/**
		 * 该帧在图片中的位置。
		 */
		public var rect:Rectangle;
		/**
		 * 是否水平翻转。
		 */
		public var isMirror:Boolean;
	
		/**
		 * 动作的帧。
		 * @param x 帧的左上角在图片的哪个位置。
		 * @param y 帧的左上角在图片的哪个位置。
		 * @param width 帧的宽。
		 * @param height 帧的高。
		 * @param cx 帧的中心点。
		 * @param cy 帧的中心点。
		 * @param isMirror 是否镜像。
		 */		
		public function Frame(x:int, y:int, width:int, height:int, cx:int, cy:int, isMirror:Boolean)
		{
			center = new Point(cx, cy);
			rect = new Rectangle(x, y, width, height);
			this.isMirror = isMirror;
		}
		
		/**
		 * 返回该帧的字符串表示形式。
		 * @return 该帧的字符串表示形式。
		 */		
		public function toString():String
		{
			return "[Frame x:"+rect.x+", " + 
					"y:"+rect.y+", " + 
					"w:"+rect.width+", " + 
					"h:"+rect.height+", " + 
					"cx:"+center.x+", " + 
					"cy:"+center.y+", " + 
					"mirror:"+isMirror+"]";
		}

	}
}