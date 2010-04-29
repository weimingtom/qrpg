package editor.view.resourcewin
{
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;

	public class Node extends Sprite
	{
		private var borad:DropShadowFilter = new DropShadowFilter(0,0,0xffffff,1,3,3,5,1,false);
		private var selectedBorad:DropShadowFilter = new DropShadowFilter(0,0,0x00000,1,3,3,5,1,false);
		
		private var _selected:Boolean;
		
		public function Node(px:int, py:int)
		{
			super();
			x = px;
			y = py;
			graphics.beginFill(0xff0000, 1);
			graphics.drawCircle(0,0,5);
			selected = false;
		}
		
		public function set selected(value:Boolean):void
		{
			_selected = value;
			_selected ? filters = [selectedBorad] : filters=[borad];
		}
		public function get selected():Boolean
		{
			return _selected;
		}
		
	}
}