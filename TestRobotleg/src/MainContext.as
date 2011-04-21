package  
{
	import controller.GreetingEvent;
	import controller.RequestGreetingCommand;
	import flash.display.DisplayObjectContainer;
	import model.SimpleModel;
	import org.robotlegs.mvcs.Context;
	import view.SimpleView;
	import view.SimpleViewMediator;
	/**
	 * ...
	 * @author Tower Joo
	 */
	public class MainContext extends Context
	{
		
		public function MainContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void 
		{
			mediatorMap.mapView(SimpleView, SimpleViewMediator);
			injector.mapSingleton(SimpleModel);
			commandMap.mapEvent(GreetingEvent.REQUEST_GREETING, RequestGreetingCommand);
			contextView.addChild(new SimpleView());
		}
		
	}

}