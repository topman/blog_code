package model 
{
	import controller.GreetingEvent;
	import org.robotlegs.mvcs.Actor;
	/**
	 * ...
	 * @author Tower Joo
	 */
	public class SimpleModel extends Actor
	{
		private var message : String;
		
		public function SimpleModel() 
		{
			message = "Hello RobotLogs!";
		}
		
		public function requestGreeting():void 
		{
			var greetingEvent : GreetingEvent = new GreetingEvent(GreetingEvent.GREET);
			greetingEvent.message = message;
			
			dispatch(greetingEvent);
		}
	}

}