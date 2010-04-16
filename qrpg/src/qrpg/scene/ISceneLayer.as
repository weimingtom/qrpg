package qrpg.scene
{
	import flash.display.BitmapData;
	
	public interface ISceneLayer
	{
		/**
		 * 要显示的图像。
		 */		
		function get bitmapData():BitmapData;
		
		/**
		 * 设置显示的大小。
		 * @param width 显示的宽
		 * @param height 显示的高
		 */		
		function setScreen(width:int, height:int):void;
		
		/**
		 * 设置显示的中心点位置。
		 * @param x 中心点X座标。
		 * @param y 中心点Y座标。
		 */		
		function center(x:int, y:int):void;
		
		/**
		 * 被点击。
		 * @param x 点击的X座标。
		 * @param y 点击的Y座标。
		 * @return 被点击的子物体。
		 */		
		function click(x:int, y:int):*;
		
	}
}