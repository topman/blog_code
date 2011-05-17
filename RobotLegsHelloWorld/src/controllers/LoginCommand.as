package controllers 
{
	import events.LoginEvent;
	import org.robotlegs.mvcs.Command;
	import services.UserService;
	/**
	 * 处理登录事件的command
	 * @author Tower Joo
	 */
	public class LoginCommand extends Command
	{
		[Inject]
		public var event : LoginEvent;
		[Inject]
		public var remoteService : UserService;
		override public function execute():void 
		{
			remoteService.login(event.data);
		}
		
	}

}