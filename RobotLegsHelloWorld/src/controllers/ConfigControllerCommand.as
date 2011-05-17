package controllers 
{
	import events.ApplicationEvent;
	import events.LoginEvent;
	import org.robotlegs.mvcs.Command;
	/**
	 * 初始化controller的command
	 * @author Tower Joo <zhutao@lehu-tech.com>
	 */
	public class ConfigControllerCommand extends Command
	{
		
		override public function execute():void 
		{
			// 相关的controller注册点
			commandMap.mapEvent(ApplicationEvent.SHOW_LOGIN_FORM, ShowLoginFormCommand, ApplicationEvent);
			commandMap.mapEvent(LoginEvent.LOGIN, LoginCommand, LoginEvent);
			
			dispatch(new ApplicationEvent(ApplicationEvent.CONFIG_SERVICE));
		}
		
	}

}