package qrpg.pathfinding
{
	import qrpg.pathfinding.IAStarData;
	
	/**
	 * @author 陈策
	 * @version 3.0
	 */
	public class BmpData implements IAStarData
	{
		/**
		 * 该点是否可以通过。
		 * @param pxX座标。
		 * @param pyY座标。
		 */
		public function isBlock(px:int, py:int): Boolean
		{
			return false;
		}

	}
}