package view 
{
	import controller.GreetingEvent;
	import flash.events.Event;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * ...
	 * @author Tower Joo
	 */
	public class SimpleViewMediator extends Mediator
	{
		[Inject]
		public var simpleview : SimpleView;
		
		override public function onRegister():void 
		{
			eventMap.mapListener(eventDispatcher, GreetingEvent.GREET, onGreet);
			
			dispatch(new GreetingEvent(GreetingEvent.REQUEST_GREETING));
		}
		
		private function onGreet(event:GreetingEvent):void 
		{
			simpleview.updateGreeting(event.message);
		}
	}

}