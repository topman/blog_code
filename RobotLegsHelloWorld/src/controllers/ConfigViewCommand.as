package controllers 
{
	import events.ApplicationEvent;
	import org.robotlegs.mvcs.Command;
	import views.LoginForm;
	import views.LoginFormMediator;
	/**
	 * 初始化相关的view
	 * @author Tower Joo <zhutao@lehu-tech.com>
	 */
	public class ConfigViewCommand extends Command
	{
		
		override public function execute():void 
		{
			mediatorMap.mapView(LoginForm, LoginFormMediator);
			dispatch(new ApplicationEvent(ApplicationEvent.SHOW_LOGIN_FORM));
		}
		
	}

}