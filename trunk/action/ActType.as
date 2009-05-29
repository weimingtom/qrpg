///////////////////////////////////////////////////////////
//  ActType.as
//  Macromedia ActionScript Implementation of the Class ActType
//  Generated by Enterprise Architect
//  Created on:      29-五月-2009 16:58:52
//  Original author: 陈策
///////////////////////////////////////////////////////////



package qrpg.action
{
	/**
	 * @author 陈策
	 * @version 3.0
	 * @created 29-五月-2009 16:58:52
	 */
	public class ActType
	{
	    /**
	     * 循环播放。
	     */
	    static public const LOOP: String = "loop";
	    /**
	     * 播放到最后一帧后动作跳转到默认动作。
	     */
	    static public const PLAY_DEFAULT: String = "playDefault";
	    /**
	     * 播放到最后一帧后跳转到上一动作。
	     */
	    static public const PLAY_LAST: String = "playLast";
	    /**
	     * 停止播放。
	     */
	    static public const STOP: String = "stop";
	    /**
	     * 播放到最后一帧后停止在第一帧上。
	     */
	    static public const STOP_AT_FIRST: String = "stopAtFirst";
	    /**
	     * 播放到最后一帧停止。
	     */
	    static public const STOP_AT_LAST: String = "stopAtLast";

	}//end ActType

}