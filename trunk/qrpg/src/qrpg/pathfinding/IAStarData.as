package qrpg.pathfinding
{
	/**
	 * @author 陈策
	 * @version 3.0
	 */
	public interface IAStarData
	{
	    /**
	     * 该点是否可以通过。
	     * @param px    X座标。
	     * @param py    Y座标。
	     */
	    function isBlock(px:int, py:int): Boolean;

	}

}