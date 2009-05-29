///////////////////////////////////////////////////////////
//  Act.as
//  Macromedia ActionScript Implementation of the Class Act
//  Generated by Enterprise Architect
//  Created on:      29-五月-2009 16:58:52
//  Original author: 陈策
///////////////////////////////////////////////////////////

import qrpg.action.Frame;

package qrpg.action
{
	/**
	 * @author 陈策
	 * @version 3.0
	 * @created 29-五月-2009 16:58:52
	 */
	public class Act
	{
	    /**
	     * 该动作包含的所有帧。
	     */
	    private var frames: Array;
	    /**
	     * 动作名字。
	     */
	    public var name: String;
	    /**
	     * 动作类型。
	     */
	    public var type: String;

	    /**
	     * 将帧添加至动作，做为该动作的最后一帧。
	     * 
	     * @param frame    要添加的帧。
	     */
	    public function addFrame(frame:Frame): int
	    {
	    }

	    /**
	     * 将帧添加到动作的指定位置。
	     * 
	     * @param frame    要添加的帧。
	     * @param index    要添加帧至指定的位置。
	     */
	    public function addFrameAt(frame:Frame, index:int): int
	    {
	    }

	    /**
	     * 删除指定的帧。
	     * 
	     * @param frame    要删除的帧。
	     */
	    public function removeFrame(frame:Frame): void
	    {
	    }

	    /**
	     * 删除指定位置的帧。
	     * 
	     * @param index    删除指定位置的帧。
	     */
	    public function removeFrameAt(index:int): void
	    {
	    }

	}//end Act

}