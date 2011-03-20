package controller 
{
	import flash.display.Stage;
	import model.LoginProxy;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import view.ViewMediator;
	/**
	 * ...
	 * @author Tower Joo <zhutao@halfquest.com>
	 */
	public class initMVCCommand extends SimpleCommand
	{
		
		public function initMVCCommand() 
		{
			//init_model();
		}
		
		
		override public function execute(notification:INotification):void 
		{
			var stage : Stage = notification.getBody() as Stage;
			init_model(stage);
			init_controller(stage);
			init_view(stage);
		}
		
		private function init_view(stage:Stage):void 
		{
			facade.registerMediator(new ViewMediator(stage));
		}
		
		private function init_controller(stage:Stage):void 
		{
			facade.registerCommand(AppName.LOGIN, LoginCommand);
		}
		
		private function init_model(stage:Stage):void 
		{
			facade.registerProxy(new LoginProxy());
		}
	}

}