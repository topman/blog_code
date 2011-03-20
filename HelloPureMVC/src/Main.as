package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Tower Joo <zhutao@halfquest.com>
	 * 
	 * Mock the login logic using PureMVC
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			AppFacade.getInstance().startup(stage);
		}
		
			
	}
	
}