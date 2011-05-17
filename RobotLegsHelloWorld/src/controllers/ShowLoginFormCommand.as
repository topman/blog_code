package controllers 
{
	import org.robotlegs.mvcs.Command;
	import views.LoginForm;
	/**
	 * 显示login登录表单的command
	 * @author Tower Joo
	 */
	public class ShowLoginFormCommand extends Command
	{
		
		override public function execute():void 
		{
			var form : LoginForm = new LoginForm();
			mediatorMap.createMediator(form);
			contextView.addChild(form);
		}
		
	}

}