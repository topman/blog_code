package model 
{
	import org.puremvc.as3.patterns.proxy.Proxy;
	/**
	 * ...
	 * @author Tower Joo <zhutao@halfquest.com>
	 */
	public class LoginProxy extends Proxy
	{
		private var is_valid : Boolean = false;
		public static const NAME : String = "Login Proxy";
		public function LoginProxy() 
		{
			super(NAME, new UserVO());
		}
		
		
		
		public function remote_verify(userVO: UserVO) : Boolean
		{
			// whether can login
			// the following logic is a mock login verification, use the real remote verfication in your code
			return (userVO.username == "tower" && userVO.password == "zhutao");
		}
		
	}

}