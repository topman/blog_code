package controller 
{
	import flash.events.Event;
	/**
	 * 定义相关的事件
	 * @author Tower Joo
	 */
	public class GameEvent extends Event
	{
		static public const START_BTN_CLICKED:String = "startBtnClicked";
		static public const SETTING:String = "setting";
		static public const INIT_DONE:String = "initDone";
		public static const INIT : String = "game_init";
		public static const START : String = "game_start";
		public static const STOP : String = "game_stop";
		public static const RESTART : String = "game_restart";
		public static const LEVEL_UP : String = "game_levelup";
		
		public function GameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
		}
		
	}

}