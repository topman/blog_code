package controller 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Tower Joo
	 */
	public class GreetingEvent extends Event
	{
		public static const GREET : String = "greet";
		public static const REQUEST_GREETING : String = "request_greeting";
		public var message : String;
		public function GreetingEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
		}
		
	}

}