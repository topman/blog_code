package controller 
{
	import flash.display.SimpleButton;
	import model.LoginProxy;
	import model.UserVO;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	/**
	 * ...
	 * @author Tower Joo <zhutao@halfquest.com>
	 */
	public class LoginCommand extends SimpleCommand
	{
		private var loginProxy : LoginProxy;
		public function LoginCommand() 
		{
			loginProxy = facade.retrieveProxy(LoginProxy.NAME) as LoginProxy;
		}
		
		override public function execute(notification:INotification):void 
		{
			var data : UserVO = notification.getBody() as UserVO;
			if (loginProxy.remote_verify(data)) {
				sendNotification(AppName.LOGIN_SUCC);
			}
			else {
				sendNotification(AppName.LOGIN_FAIL);
			}
		}
		
	}

}