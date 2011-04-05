package  
{
	import controller.StartUpCommand;
	import org.puremvc.as3.patterns.facade.Facade;
	/**
	 * ...
	 * @author Tower Joo <zhutao@halfquest.com>
	 * 
	 * 
	 */
	public class AppFacade extends Facade
	{
		static public const SECOND:String = "second";
		static public const FIRST:String = "first";
		static public const START_UP:String = "startUp";
		static public const TEST:String = "test";
		
		override protected function initializeController():void 
		{
			super.initializeController();
			registerCommand(START_UP, StartUpCommand);
		}
		
		public static function getInstance():AppFacade
		{
			if (instance == null) {
				instance = new AppFacade();
			}
			return instance as AppFacade;
		}
		
		public function startup(app : *):void 
		{
			sendNotification(START_UP, app);
		}
		
	}

}