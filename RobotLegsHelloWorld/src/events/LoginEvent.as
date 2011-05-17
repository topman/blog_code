package events 
{
	import flash.events.Event;
	import flash.utils.SetIntervalTimer;
	import models.VO.UserVO;
	
	/**
	 * ...
	 * @author Tower Joo
	 */
	public class LoginEvent extends Event 
	{
		static public const LOGIN_RESULT:String = "loginResult";
		static public const LOGIN_FAILED:String = "loginFailed";
		static public const LOGIN_SUCCEED:String = "loginSucceed";
		static public const LOGIN:String = "login";
		
		public var data : UserVO;
		public var loginSucceed : Boolean;
		public function LoginEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			var e : LoginEvent = new LoginEvent(type, bubbles, cancelable);
			e.data = this.data;
			e.loginSucceed = this.loginSucceed;
			return e;
		} 
		
		public override function toString():String 
		{ 
			return formatToString("LoginEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}