package qrpg.action
{
	/**
	 * 描述动作类型的类。
	 * @author 陈策
	 * @version 3.0
	 */
	public class ActType
	{
		/**
		 * 循环播放。
		 */
		static public const LOOP:String = "loop";
		
		/**
		 * 停止播放。
		 */
		static public const STOP:String = "stop";
		
		/**
		 * 播放到最后一帧停止。
		 */
		static public const STOP_AT_LAST:String = "stopAtLast";
		
		/**
		 * 播放到最后一帧后停止在第一帧上。
		 */
		static public const STOP_AT_FIRST:String = "stopAtFirst";
		
		/**
		 * 播放到最后一帧后动作跳转到默认动作。
		 */
		static public const PLAY_DEFAULT:String = "playDefault";
		
		/**
		 * 播放到最后一帧后跳转到上一动作。
		 */
		static public const PLAY_LAST:String = "playLast";

	}
}