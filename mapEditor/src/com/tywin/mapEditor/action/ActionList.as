package com.tywin.mapEditor.action
{
	import com.tywin.mapEditor.core.OrderKey;
	import com.tywin.mapEditor.wiew.menu.MainMenu;
	import com.tywin.mapEditor.wiew.menu.SOEditorMenu;
	
	/**
	 * 动作列表。
	 * @author 陈策
	 */	
	public class ActionList
	{
		public static var maxLength:int = 100;
		public static var pointer:int=0;
		private static var _list:Array = [];
		
		public static var subPointer:int = 0;
		private static var _subList:Array = [];
		
		/**
		 * 动作列表。用以记录用以记录用户的操作，实现“撤消”和“重做”功能。
		 */		
		public function ActionList()
		{
			throw new Error("ActionList 类不能实例化。");
		}
		
		/**
		 * 添加动作。
		 * @param act 要添加的动作。
		 */		
		public static function addAction(act:IAction):void
		{
			if  ( _list.length==maxLength )
			{
				_list.shift();
			}
			if ( _list.length>0 ) _list = _list.slice(0, pointer);
			_list.push(act);
			ActionList.redo();
		}
		
		/**
		 * 撤消。
		 */		
		public static function undo():void
		{
			if ( pointer==0 ) return;
			pointer--;
			IAction(_list[pointer]).undo();
			if ( pointer==0 ) MainMenu.menubarXML.order.(@data==OrderKey.UNDO).@enabled = false;
			MainMenu.menubarXML.order.(@data==OrderKey.REDO).@enabled = true;
		}
		
		/**
		 * 重做。
		 */		
		public static function redo():void
		{
			if ( pointer==_list.length ) return;
			IAction(_list[pointer]).redo();
			pointer++;
			if ( pointer==_list.length ) MainMenu.menubarXML.order.(@data==OrderKey.REDO).@enabled = false;
			MainMenu.menubarXML.order.(@data==OrderKey.UNDO).@enabled = true;
		}
		
		/**
		 * 添加子程序动作。
		 * @param act 要添加的动作。
		 */		
		public static function addSubAction(act:IAction):void
		{
			if  ( _subList.length==maxLength )
			{
				_subList.shift();
			}
			if ( _subList.length>0 ) _subList = _subList.slice(0, subPointer);
			_subList.push(act);
			ActionList.redoSub();
		}
		
		/**
		 * 撤消子𥤊程序动作。
		 */		
		public static function undoSub():void
		{
			if ( subPointer==0 ) return;
			subPointer--;
			IAction(_subList[subPointer]).undo();
			if ( subPointer==0 ) SOEditorMenu.menubarXML.order.(@data==OrderKey.SO_UNDO).@enabled = false;
			SOEditorMenu.menubarXML.order.(@data==OrderKey.SO_REDO).@enabled = true;
		}
		
		/**
		 * 重做子程序动作。
		 */		
		public static function redoSub():void
		{
			if ( subPointer==_subList.length ) return;
			IAction(_subList[subPointer]).redo();
			subPointer++;
			if ( subPointer==_subList.length ) SOEditorMenu.menubarXML.order.(@data==OrderKey.SO_REDO).@enabled = false;
			SOEditorMenu.menubarXML.order.(@data==OrderKey.SO_UNDO).@enabled = true;
		}
		
		/**
		 * 退出子程序，动作列表清零。
		 */		
		public static function exitSub():void
		{
			subPointer = 0;
			_subList = [];
		}
		
	}
}
