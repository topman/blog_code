package controllers 
{
	import org.robotlegs.mvcs.Command;
	/**
	 * 初始化controller的command
	 * @author Tower Joo <zhutao@lehu-tech.com>
	 */
	public class ConfigControllerCommand extends Command
	{
		
		override public function execute():void 
		{
			trace("called");
		}
		
	}

}