package events 
{
	import flash.events.Event;
	
	/**
	 * 应用级别的事件
	 * @author Tower Joo <zhutao@lehu-tech.com>
	 */
	public class AppEvent extends Event 
	{
		static public const CONFIG_VIEW:String = "configView";
		static public const CONFIG_MODEL:String = "configModel";
		static public const CONFIG_SERVICE:String = "configService";
		static public const CONFIG_CONTROLLER:String = "configController";
		
		public function AppEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new AppEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("AppEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}