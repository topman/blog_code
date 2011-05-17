package controllers 
{
	import events.AppEvent;
	import org.robotlegs.mvcs.Command;
	/**
	 * 整个应用起动的command，用于初始化robotlegs相关的模块
	 * @author Tower Joo <zhutao@lehu-tech.com>
	 */
	public class StartUpCommand extends Command
	{
		/**
		 * 接收到事件后，command从这里开始执行
		 */
		override public function execute():void 
		{
			commandMap.mapEvent(AppEvent.CONFIG_CONTROLLER, ConfigControllerCommand, AppEvent);
			commandMap.mapEvent(AppEvent.CONFIG_SERVICE, ConfigServiceCommand, AppEvent);
			commandMap.mapEvent(AppEvent.CONFIG_MODEL, ConfigModelCommand, AppEvent);
			commandMap.mapEvent(AppEvent.CONFIG_VIEW, ConfigViewCommand, AppEvent);
			
			dispatch(new AppEvent(AppEvent.CONFIG_CONTROLLER));
		}
		
	}

}