package views 
{
	import events.LoginEvent;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import models.VO.UserVO;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * 登录的表单
	 * @author Tower Joo
	 */
	public class LoginForm extends Sprite
	{
		private var _nameLabel : TextField;
		private var _passwordLabel : TextField;
		private var _nameInput : TextField;
		private var _passwordInput : TextField;
		private var _btnSubmit : TextField;
		private var _loginResult : TextField;
		
		public function LoginForm() 
		{
			_nameLabel = new TextField();
			_nameLabel.border = false;
			_nameLabel.text = "用户名:";
			_nameLabel.x = 100;
			_nameLabel.y = 100;
			addChild(_nameLabel);
			
			_nameInput = new TextField();
			_nameInput.border = true;
			_nameInput.type = TextFieldType.INPUT;
			_nameInput.height = 20;
			_nameInput.x = _nameLabel.width + _nameLabel.x + 5;
			_nameInput.y = _nameLabel.y;
			addChild(_nameInput);
			
			_passwordLabel = new TextField();
			_passwordLabel.text = "密码：";
			
			_passwordLabel.border = false;
			_passwordLabel.x = _nameLabel.x;
			_passwordLabel.y = _nameLabel.y + _nameLabel.height + 5;
			addChild(_passwordLabel);
			
			_passwordInput = new TextField();
			_passwordInput.type = TextFieldType.INPUT;
			_passwordInput.border = true;
			_passwordInput.height = 20;
			_passwordInput.x = _passwordLabel.x + _passwordLabel.width + 5;
			_passwordInput.y = _passwordLabel.y;
			addChild(_passwordInput);
			
			var btnContainer : Sprite = new Sprite();
			_btnSubmit = new TextField();
			_btnSubmit.text = "登录";
			btnContainer.x = (_passwordInput.width + _passwordLabel.width) / 2 + _passwordLabel.x;
			btnContainer.y = _passwordLabel.y + _passwordLabel.height + 5;
			btnContainer.addChild(_btnSubmit);
			addChild(btnContainer);
			btnContainer.buttonMode = true;
			btnContainer.mouseChildren = false;
			
			_loginResult = new TextField();
			_loginResult.x = (_passwordInput.width + _passwordLabel.width) / 2 + _passwordLabel.x;
			_loginResult.y = btnContainer.y + btnContainer.height + 5;
			addChild(_loginResult);
			_loginResult.visible = false;
			
			btnContainer.addEventListener(MouseEvent.CLICK, onLogin);
			
		}
		
		public function showLoginResult(loginSucceed:Boolean):void 
		{
			_loginResult.visible = true;
			if (loginSucceed) {
				_loginResult.text = "登录成功！";
			}
			else {
				_loginResult.text = "登录失败！";
		}
			}
		
		private function onLogin(e:MouseEvent):void 
		{
			var event : LoginEvent = new LoginEvent(LoginEvent.LOGIN);
			var user : UserVO = new UserVO();
			user.name = _nameInput.text;
			user.password = _passwordInput.text;
			event.data = user;
			dispatchEvent(event);
		}
		
		public function get loginResult():TextField 
		{
			return _loginResult;
		}
		
		public function set loginResult(value:TextField):void 
		{
			_loginResult = value;
		}
		
	}

}