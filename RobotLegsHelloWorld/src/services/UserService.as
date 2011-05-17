package services 
{
	import events.LoginEvent;
	import models.VO.UserVO;
	import org.robotlegs.mvcs.Actor;
	/**
	 * 与后端通信的service
	 * @author Tower Joo
	 */
	public class UserService extends Actor
	{
		private var response : Object = new Object();
		public function UserService() 
		{
			
		}
		
		public function login(data : UserVO): void {
			// 这里会是与后端通信的过程，简化起见，这里省略
			var resp : Boolean = Math.random() > 0.5;
			response["status"] = resp;
			handleResponse();
		}
		
		private function handleResponse():void 
		{
			var event : LoginEvent = new LoginEvent(LoginEvent.LOGIN_RESULT);
			event.loginSucceed = response["status"];
			dispatch(event);
		}
		
	}

}