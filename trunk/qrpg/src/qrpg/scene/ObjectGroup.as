///////////////////////////////////////////////////////////
//  ObjectGroup.as
//  Macromedia ActionScript Implementation of the Class ObjectGroup
//  Generated by Enterprise Architect
//  Created on:      12-六月-2009 22:54:21
//  Original author: 陈策
///////////////////////////////////////////////////////////

package qrpg.scene
{
	import flash.geom.Rectangle;
	
	import qrpg.display.ISceneAddable;
	import qrpg.util.HashMap;
	
	/**
	 * 有组织的一群物体。
	 * @author 陈策
	 * @version 3.0
	 * @created 12-六月-2009 22:54:21
	 */
	public class ObjectGroup
	{
		/**
		 * 在加载区域内的物体。
		 */
		private var inLoadRange:HashMap;
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
		 * @param obj要添加至组的物体。
		 */
		public function addObject(obj:ISceneAddable): int
		{
			return 0;
		}
	
		/**
		 * 添加物体至特定位置。
		 * 
		 * @param obj要添加至组的物体。
		 * @param index特定位置。
		 */
		public function addObjectAt(obj:ISceneAddable, index:int): int
		{
			return 0;
		}
	
		/**
		 * 加载矩形。在该矩形内的物体才会被加载。<br/>
		 * 该矩形要大于或等于displayRect，大于的部分为预加载的物体。
		 */
		public function get loadRect(): Rectangle
		{
			return null;
		}
	
		/**
		 * 删除物体。
		 * 
		 * @param obj要删除的物体。
		 */
		public function removeObject(obj:ISceneAddable): ISceneAddable
		{
			return null;
		}
	
		/**
		 * 删除特定位置的物体。
		 * 
		 * @param index特定位置。
		 */
		public function removeObjectAt(index:int): ISceneAddable
		{
			return null;
		}

	}
}