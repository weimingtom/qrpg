package qrpg.util
{
	public class GameMath
	{
		/**
		 * 将角转为 0 至 2×Math.PI 之间的弧度。
		 * @param value 弧度。
		 * @return 弧度。
		 */		
		public static function normalRadians(value:Number):Number
		{
			var p:Number = Math.PI*2;
			if ( value>0 )
			{
				return value % p;
			}
			else
			{
				return ((Math.floor(-value/p)+1)*p+value)%p;
			}
		}
		
		/**
		 * 将角转为 0 至 360 之间的角度。
		 * @param value 角度。
		 * @return 角度。
		 */		
		public static function normalDegrees(value:Number):Number
		{
			if ( value>0 )
			{
				return value % 360;
			}
			else
			{
				return ((Math.floor(-value/360)+1)*360+value)%360;
			}
		}
		
		/**
		 * 将角度转为弧度。
		 * @param value 角度
		 * @return 转好的弧度。
		 */		
		public static function degreesToRadians(value:Number):Number
		{
			return value*Math.PI/180;
		}
		
		/**
		 * 将弧度转为角度。
		 * @param value 弧度。
		 * @return 转好的角度。
		 */		
		public static function radiansToDegrees(value:Number):Number
		{
			return value*180/Math.PI;
		}
		
	}
}