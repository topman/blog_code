package view 
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	/**
	 * ...
	 * @author Tower Joo <zhutao@halfquest.com>
	 */
	public class BMediator extends Mediator
	{
		public const NAME : String = "BMediator";
		public function BMediator() 
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