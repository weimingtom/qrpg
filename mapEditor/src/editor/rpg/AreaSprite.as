package editor.rpg
{
	public class AreaSprite extends GameSprite
	{
		private var _data:Array;
		private var _editable:Boolean;
		
		public function AreaSprite(data:Array=null, editable:Boolean=false)
		{
			super();
			_data = data;
			_editable = editable;
			this.buttonMode = true;
			
			draw();
		}
		
		public function set data(arr:Array):void
		{
			_data = arr;
			draw();
		}
		
		public function set editable(b:Boolean):void
		{
			_editable = b;
		}
		
		private function draw():void
		{
			if ( !_data ) return;
			graphics.clear();
			graphics.lineStyle(1, 0xffffff, 1);
			graphics.beginFill(0xff9900, .5);
			var i:int;
			var len:int = _data.length;
			for ( i=0; i<len; i+=2 )
			{
				if ( i==0 )
				{
					graphics.moveTo(_data[i], _data[(i+1)]);
				}
				else
				{
					graphics.lineTo(_data[i], _data[(i+1)]);
				}
			}
			graphics.endFill();
		}
		
	}
}