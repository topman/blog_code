package view 
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import model.UserVO;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	/**
	 * ...
	 * @author Tower Joo <zhutao@halfquest.com>
	 */
	public class ViewMediator extends Mediator
	{
		public static const NAME : String = "view mediator";
		public var name_label : TextField = new TextField();
		public var name_input : TextField = new TextField();
		public var password_name : TextField = new TextField();
		public var password_input : TextField = new TextField();
		public var login_msg : TextField = new TextField();
		
		public var login_btn : TextField = new TextField();
		
		private var _stage : Stage;
		
		public static const LABEL_NAME : String = "Name: ";
		public static const LABEL_PASSWORD : String  = "Password: ";
		public static const LABEL_LOGIN_BTN : String  = "Login";
		public static const MSG_LOGIN_SUCC : String = "logged in successfully";
		public static const MSG_LOGIN_FAIL : String = "logged in failed.";
		
		public function ViewMediator(stage:Stage) 
		{
			super(NAME, stage);
			_stage = stage;
			init_login_view();
			_stage.focus = name_input;
		}
		
		private function init_login_view():void 
		{
			add_label(name_label, LABEL_NAME, 20, 20);
			add_input(name_input, 100, 20);
			
			add_label(password_name, LABEL_PASSWORD, 20, 80);
			add_input(password_input, 100, 80, true );
			
			add_label(login_btn, LABEL_LOGIN_BTN, 40, 120);
			
			add_label(login_msg, "", 90, 120);
			
			name_label.addEventListener(MouseEvent.CLICK, FocusTextField);
			password_name.addEventListener(MouseEvent.CLICK, FocusTextField);
			login_btn.addEventListener(MouseEvent.CLICK,  tryLogin);
		}
		
		private function tryLogin(e:MouseEvent):void 
		{
			var userVO : UserVO = new UserVO();
			userVO.username = name_input.text;
			userVO.password = password_input.text;
			sendNotification(AppName.LOGIN, userVO);
		}
		
		override public function listNotificationInterests():Array 
		{
			return [AppName.LOGIN_SUCC, AppName.LOGIN_FAIL];
		}
		
		override public function handleNotification(notification:INotification):void 
		{
			switch(notification.getName()) {
				case AppName.LOGIN_FAIL:
					// handle login failed
					handle_login_failed();
					break;
				case AppName.LOGIN_SUCC:
					// handle login successfully
					handle_login_succ();
					break;
				default:
					break;
			}
		}
		
		private function handle_login_failed():void 
		{
			login_msg.text = MSG_LOGIN_FAIL;
		}
		
		private function handle_login_succ():void 
		{
			login_msg.text = MSG_LOGIN_SUCC;
		}
		
		
		private function FocusTextField(e:MouseEvent):void 
		{
			// click the label, focus on the input field
			var target : TextField = e.target as TextField;
			switch(target.text) {
				case LABEL_NAME:
					_stage.focus = name_input;
					name_input.setSelection(0, name_input.text.length);
					break;
				case LABEL_PASSWORD:
					_stage.focus  = password_input;
					password_input.setSelection(0, password_input.text.length);
					break;
				default:
					break;
			}
		}
		
		private function add_label(label : TextField, name : String, x : Number, y : Number) : void
		{
			// add Name label and input filed
			//label = new TextField();
			label.text = name;
			label.x = x;
			label.y = y;
			_stage.addChild(label);
		}
		
		private function add_input(input : TextField, x : Number, y : Number, is_psw:Boolean=false) : void
		{	
			//input = new TextField();
			input.type = TextFieldType.INPUT;
			input.border = true;
			input.x = x;
			input.y = y;
			input.height = 20;
			if (is_psw) input.displayAsPassword = true;
			_stage.addChild(input);
		}
		
	}

}