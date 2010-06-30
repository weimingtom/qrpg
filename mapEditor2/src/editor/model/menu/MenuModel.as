package editor.model.menu
{
	import editor.type.ErrorType;
	import editor.type.MenuCommandType;
	
	/**
	 * 菜单数据
	 * @author 陈策
	 * 
	 */	
	public class MenuModel
	{
		private static var instance:MenuModel;
		
		public var mainMenuData:XMLList = 
			<>
				<folder label="文件">
					<command label="新建场景文件..." data={MenuCommandType.NEW_SCENE_FILE}/>
					<command label="打开场景文件..." data={MenuCommandType.OPEN_SCENE_FILE}/>
					<line type="separator"/>
					<command label="保存" enabled="false" data={MenuCommandType.SAVE_FILE}/>
					<command label="另存为..." enabled="false" data={MenuCommandType.SAVE_AS}/>
					<line type="separator"/>
					<command label="退出" data={MenuCommandType.EXIT}/>
				</folder>
				
				<folder label="编辑">
					<command label="撤消" enabled="false" data={MenuCommandType.UNDO}/>
					<command label="重复" enabled="false" data={MenuCommandType.REDO}/>
					<line type="separator"/>
					<command label="剪切" enabled="false" data={MenuCommandType.CUT}/>
					<command label="复制" enabled="false" data={MenuCommandType.COPY}/>
					<command label="粘贴" enabled="false" data={MenuCommandType.PASTE}/>
					<command label="删除" enabled="false" data={MenuCommandType.DELETE}/>
					<line type="separator"/>
					<folder label="正在编辑的层" enabled="false">
						<command label="前景层" type="radio" groupName="layer" toggled="false" data={MenuCommandType.EDIT_FRONT}/>
						<command label="中间层" type="radio" groupName="layer" toggled="true" data={MenuCommandType.EDIT_MAIN}/>
						<command label="背景层" type="radio" groupName="layer" toggled="false" data={MenuCommandType.EDIT_BACKGROUND}/>
					</folder>
				</folder>
				
				<folder label="资源">
					<command label="新建资源..." enabled="false" data={MenuCommandType.RES_NEW}/>
					<command label="修改资源..." enabled="false" data={MenuCommandType.RES_MODIFY}/>
					<command label="删除资源" enabled="false" data={MenuCommandType.RES_DELETE}/>
					<line type="separator"/>
					<command label="刷新资源列表" enabled="false" data={MenuCommandType.RES_REFRESH}/>
					<command label="添加至场景" enabled="false" data={MenuCommandType.RES_ADD}/>
				</folder>
				
				<folder label="视图">
					<command label="放大" enabled="false" data={MenuCommandType.ZOOM_IN}/>
					<command label="缩小" enabled="false" data={MenuCommandType.ZOOM_OUT}/>
					<command label="按实际大小" enabled="false" data={MenuCommandType.ACTUAL_SIZE}/>
					<line type="separator"/>
					<folder label="显示">
						<command label="所有物体" enabled="false" data={MenuCommandType.VIEW_ALL}/>
						<command label="被锁定物体" enabled="false" data={MenuCommandType.VIEW_LOCKED}/>
						<command label="选定物体" enabled="false" data={MenuCommandType.VIEW_SELECTED}/>
						<command label="前景" enabled="false" data={MenuCommandType.VIEW_FRONT}/>
						<command label="中间层" enabled="false" data={MenuCommandType.VIEW_MAIN}/>
						<command label="背景" enabled="false" data={MenuCommandType.VIEW_BACKGROUND}/>
					</folder>
				</folder>
				
				<folder label="窗口">
					<command label="工具" type="check" toggled="false" data={MenuCommandType.TOOLS}/>
					<command label="属性" type="check" toggled="false" data={MenuCommandType.PROPERTY_WIN}/>
					<command label="资源" type="check" toggled="false" data={MenuCommandType.RESOURCE_WIN}/>
					<line type="separator"/>
					<command label="恢复默认位置" data={MenuCommandType.RESET_WIN}/>
				</folder>
				
				<folder label="帮助">
					<command label="帮助..." data={MenuCommandType.HELP}/>
					<command label="版本" data={MenuCommandType.VERSION_WIN}/>
				</folder> 
				
			</>;
		
		public function MenuModel()
		{
			if ( instance!=null ) throw Error(ErrorType.SINGLETON_MSG);
			instance = this;
		}
		
		public static function getInstance():MenuModel 
		{
			if (instance == null) instance = new MenuModel();
			return instance as MenuModel;
		}
	}
}