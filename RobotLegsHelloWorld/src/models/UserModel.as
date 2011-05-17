package models 
{
	import org.robotlegs.mvcs.Actor;
	/**
	 * 用户相关的model
	 * @author Tower Joo
	 */
	public class UserModel extends Actor
	{
		private var _name : String;
		private var _password : String;
		public function UserModel() 
		{
			
		}
		
		// 下面是AS语言的get和set两种方法，相当于提供一个属性的方法，类似于其它语言的property
		public function get password():String 
		{
			return _password;
		}
		
		public function set password(value:String):void 
		{
			_password = value;
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void 
		{
			_name = value;
		}
		
	}

}