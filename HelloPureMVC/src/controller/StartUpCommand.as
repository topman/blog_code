package controller 
{
	import org.puremvc.as3.patterns.command.*;
	/**
	 * ...
	 * @author Tower Joo <zhutao@halfquest.com>
	 */
	public class StartUpCommand extends MacroCommand
	{
		
		public function StartUpCommand() 
		{
		
		}
		
		override protected function initializeMacroCommand():void 
		{
			addSubCommand(initMVCCommand);
		}
		
	}

}