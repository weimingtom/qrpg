///////////////////////////////////////////////////////////
//  IBmpObject.as
//  Macromedia ActionScript Implementation of the Interface IBmpObject
//  Generated by Enterprise Architect
//  Created on:      29-五月-2009 17:51:07
//  Original author: 陈策
///////////////////////////////////////////////////////////



package qrpg.display
{
	/**
	 * @author 陈策
	 * @version 1.0
	 * @created 29-五月-2009 17:51:07
	 */
	public interface IBmpObject
	{
	    /**
	     * 位图显示物体显示的数据。
	     * 
	     * @param rect    要显示的图片区域。如果为null，则按默认的显示区域显示。
	     */
	    public function displayData(rect:Rectangle): BitmapData;

	    /**
	     * 代表显示区域的矩形。
	     */
	    public function displayRect(): Rectangle;

	}//end IBmpObject

}