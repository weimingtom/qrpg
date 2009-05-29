///////////////////////////////////////////////////////////
//  ObjectGroup.as
//  Macromedia ActionScript Implementation of the Class ObjectGroup
//  Generated by Enterprise Architect
//  Created on:      30-五月-2009 1:10:47
//  Original author: 陈策
///////////////////////////////////////////////////////////

import qrpg.display.ISceneAddable;
import qrpg.display.IBmpObject;

package qrpg.scene
{
	/**
	 * 有组织的一群物体。
	 * @author 陈策
	 * @version 3.0
	 * @created 30-五月-2009 1:10:47
	 */
	public class ObjectGroup implements IBmpObject
	{
	    /**
	     * 在加载区域内的物体。
	     */
	    private var inLoadRange: HashMap;
	    /**
	     * 在显示区域内的物体。
	     */
	    private var inScreen: HashMap;
	    /**
	     * 在加载区域外的物体。
	     */
	    private var outLoadRange: HashMap;

	    /**
	     * 添加物体。
	     * 
	     * @param obj    要添加至组的物体。
	     */
	    public function addObject(obj:ISceneAddable): int
	    {
	    }

	    /**
	     * 添加物体至特定位置。
	     * 
	     * @param obj    要添加至组的物体。
	     * @param index    特定位置。
	     */
	    public function addObjectAt(obj:ISceneAddable, index:int): int
	    {
	    }

	    /**
	     * 加载矩形。在该矩形内的物体才会被加载。<br/>
	     * 该矩形要大于或等于displayRect，大于的部分为预加载的物体。
	     */
	    public function get loadRect(): Rectangle
	    {
	    }

	    /**
	     * 删除物体。
	     * 
	     * @param obj    要删除的物体。
	     */
	    public function removeObject(obj:ISceneAddable): ISceneAddable
	    {
	    }

	    /**
	     * 删除特定位置的物体。
	     * 
	     * @param index    特定位置。
	     */
	    public function removeObjectAt(index:int): ISceneAddable
	    {
	    }

	    /**
	     * 位图显示物体显示的数据。
	     * 
	     * @param rect    要显示的图片区域。如果为null，则按默认的显示区域显示。
	     */
	    public function displayData(rect:Rectangle): BitmapData
	    {
	    }

	    /**
	     * 代表显示区域的矩形。
	     */
	    public function displayRect(): Rectangle
	    {
	    }

	}//end ObjectGroup

}