package controllers 
{
	import events.ApplicationEvent;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;
	/**
	 * 整个应用起动的command，用于初始化robotlegs相关的模块
	 * @author Tower Joo <zhutao@lehu-tech.com>
	 */
	public class StartUpCommand extends Command
	{
		[Inject]
		public var event : ContextEvent;
		/**
		 * 接收到事件后，command从这里开始执行
		 */
		override public function execute():void 
		{
			commandMap.mapEvent(ApplicationEvent.CONFIG_CONTROLLER, ConfigControllerCommand, ApplicationEvent);
			commandMap.mapEvent(ApplicationEvent.CONFIG_SERVICE, ConfigServiceCommand, ApplicationEvent);
			commandMap.mapEvent(ApplicationEvent.CONFIG_MODEL, ConfigModelCommand, ApplicationEvent);
			commandMap.mapEvent(ApplicationEvent.CONFIG_VIEW, ConfigViewCommand, ApplicationEvent);
			
			dispatch(new ApplicationEvent(ApplicationEvent.CONFIG_CONTROLLER));
		}
		
	}

}