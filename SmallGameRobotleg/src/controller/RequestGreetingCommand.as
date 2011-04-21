package controller 
{
	import model.SimpleModel;
	import org.robotlegs.mvcs.Command;
	/**
	 * ...
	 * @author Tower Joo
	 */
	public class RequestGreetingCommand extends Command
	{
		[Inject]
		public var simpleModel : SimpleModel;
		
		override public function execute():void 
		{
			simpleModel.requestGreeting();
		}
		
	}

}