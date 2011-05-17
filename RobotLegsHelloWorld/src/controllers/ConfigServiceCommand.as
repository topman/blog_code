package controllers 
{
	import events.ApplicationEvent;
	import org.robotlegs.mvcs.Command;
	/**
	 * 初始化相关的service
	 * @author Tower Joo <zhutao@lehu-tech.com>
	 */
	public class ConfigServiceCommand extends Command
	{
		override public function execute():void 
		{
			// 注册与后端通信的逻辑
			
			dispatch(new ApplicationEvent(ApplicationEvent.CONFIG_MODEL));
		}
		
	}

}