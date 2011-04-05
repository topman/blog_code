package view 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	/**
	 * ...
	 * @author Tower Joo <zhutao@halfquest.com>
	 */
	public class AMediator extends Mediator
	{
		public const NAME : String = "AMediator";
		public function AMediator() 
		{
			super(NAME);
		}
		
		override public function listNotificationInterests():Array 
		{
			return [AppFacade.TEST];
		}
		
		override public function handleNotification(notification:INotification):void 
		{
			switch(notification.getName()) {
				case AppFacade.TEST:
					trace("called in " + NAME);
					break;
			}
		}
		
	}

}