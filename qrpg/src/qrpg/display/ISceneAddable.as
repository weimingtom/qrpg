///////////////////////////////////////////////////////////
//  ISceneAddable.as
//  Macromedia ActionScript Implementation of the Interface ISceneAddable
//  Generated by Enterprise Architect
//  Created on:      12-六月-2009 22:54:21
//  Original author: 陈策
///////////////////////////////////////////////////////////



package qrpg.display
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * 可以被添加至场景的物体。
	 * @author 陈策
	 * @version 3.0
	 * @created 12-六月-2009 22:54:21
	 */
	public interface ISceneAddable
	{
	    /**
	     * 得到显示的BitmapData
	     * @param cut 是否切割。
	     */
	    function displayData(cut:Boolean=false): BitmapData;

	    /**
	     * 代表默认显示区域的矩形。
	     */
	    function get displayRect(): Rectangle;
	    
	    /**
	     * 代表默认显示区域的中心。
	     */	    
	    function get displayPoint():Point;

	    /**
	     * 是否已经加载更新。
	     */
	    function get isLoaded(): Boolean;

	    /**
	     * 是否需要更新。
	     */
	    function get isUpdate(): Boolean;
	    
	    /**
	     * 是否需要被显示。<br/>
	     * 一些场景里不会动的物体，可以设置为不被显示，只画在底图上。<br/>
	     * 只有当会动的物体在它后边时，才需要用它的透明通道不显示那个物体的一部分或全部。
	     */	    
	    function get isDisplay():Boolean;

	}

}