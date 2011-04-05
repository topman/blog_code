package controller 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	/**
	 * ...
	 * @author Tower Joo <zhutao@halfquest.com>
	 */
	public class TestCommand extends SimpleCommand
	{
		
		public function TestCommand() 
		{
			
		}
		
		override public function execute(notification:INotification):void 
		{
			trace("called in " + "TestCommand");
		}
	}

}