package views 
{
	import events.LoginEvent;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * 与LoginForm绑定的mediator
	 * @author Tower Joo
	 */
	public class LoginFormMediator extends Mediator
	{
		[Inject]
		public var view : LoginForm;
		override public function onRegister():void 
		{
			// 下面的事件dispatch后， robotlegs框架就会处理，相应的监听动作会执行
			eventMap.mapListener(view, LoginEvent.LOGIN, dispatch);
			eventMap.mapListener(eventDispatcher, LoginEvent.LOGIN_RESULT, showLoginResult);
		}
		
		private function showLoginResult(e:LoginEvent):void 
		{
			view.showLoginResult(e.loginSucceed);
		}
		
	}

}