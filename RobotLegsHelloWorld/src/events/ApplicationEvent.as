package events 
{
	import flash.events.Event;
	
	/**
	 * 应用级别的事件
	 * @author Tower Joo <zhutao@lehu-tech.com>
	 */
	public class ApplicationEvent extends Event 
	{
		static public const SHOW_LOGIN_FORM:String = "showLoginForm";
		static public const CONFIG_VIEW:String = "ApplicationEvent.configView";
		static public const CONFIG_MODEL:String = "ApplicationEvent.configModel";
		static public const CONFIG_SERVICE:String = "ApplicationEvent.configService";
		static public const CONFIG_CONTROLLER:String = "ApplicationEvent.configController";
		
		public function ApplicationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			return;
		} 
		
		public override function clone():Event 
		{ 
			return new ApplicationEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ApplicationEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}