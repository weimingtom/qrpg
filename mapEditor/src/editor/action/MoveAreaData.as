package editor.action
{
	import editor.view.resourcewin.AreaData;
	
	public class MoveAreaData implements IAction
	{
		public var oldData:Array;
		public var newData:Array;
		public var isMove:Boolean;
		
		
		private var area:AreaData;
		
		public function MoveAreaData(area:AreaData)
		{
			this.area = area;
		}
		

		public function redo():void
		{
			if ( !isMove ) return;
			if ( area )
			area.setData(newData);
		}
		
		public function undo():void
		{
			if ( !isMove ) return;
			if ( area )
			area.setData(oldData);
		}
		
	}
}