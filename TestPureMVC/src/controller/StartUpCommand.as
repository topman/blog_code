package controller 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import view.AMediator;
	import view.BMediator;
	import view.CMediator;
	/**
	 * ...
	 * @author Tower Joo <zhutao@halfquest.com>
	 */
	public class StartUpCommand extends SimpleCommand
	{
		
		override public function execute(notification:INotification):void 
		{
			var app : Stage = notification.getBody() as Stage;
			facade.registerCommand(AppFacade.FIRST, TestCommand);
			facade.registerMediator(new CMediator(app));

			//facade.registerMediator(new AMediator());
			//facade.registerMediator(new BMediator());
			//facade.registerMediator(new CMediator());
			
			facade.sendNotification(AppFacade.FIRST);
		}
		
	}

}