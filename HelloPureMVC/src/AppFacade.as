package  
{
	import controller.*;
	import org.puremvc.as3.patterns.facade.*;
	/**
	 * ...
	 * @author Tower Joo <zhutao@halfquest.com>
	 */
	public class AppFacade extends Facade
	{
		public function AppFacade() 
		{
			
		}
		
		public static function getInstance() : AppFacade {
			if (instance == null) {
				instance = new AppFacade();			
			}
			return instance as AppFacade;
		}
		
		override protected function initializeController():void 
		{
			super.initializeController();
			registerCommand(AppName.STARTUP, StartUpCommand);
		}
		
		public function startup(app : Object) : void {
			sendNotification(AppName.STARTUP, app);
		}
		
	}

}