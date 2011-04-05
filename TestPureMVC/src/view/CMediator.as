package view 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	/**
	 * ...
	 * @author Tower Joo <zhutao@halfquest.com>
	 */
	public class CMediator extends Mediator
	{
		private var timerId:uint;
		public const NAME : String = "CMediator";
		
		public var flag : Boolean = true;
		public function CMediator(app : Stage) 
		{
			super(NAME, app);
			viewComponent = app;
			//viewComponent.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		override public function listNotificationInterests():Array 
		{
			return [AppFacade.TEST, AppFacade.FIRST, AppFacade.SECOND];
		}
		
		override public function handleNotification(notification:INotification):void 
		{
			switch(notification.getName()) {
				case AppFacade.TEST:
					trace("called in " + NAME + " for " + AppFacade.TEST);
					sendNotification(AppFacade.SECOND);
					trace("After notification handler finished");
					break;
				case AppFacade.FIRST:
					trace("called in " + NAME + " for " + AppFacade.FIRST);
					//ALongTime();
					sendNotification(AppFacade.TEST);
					break;
				case AppFacade.SECOND:
					trace("called in " + NAME + " for " + AppFacade.SECOND);
					sendNotification(AppFacade.TEST);
					break;
			}
		}
		
		
		private function onClick(e:MouseEvent):void 
		{
			trace("I'm clicked");
			flag = false;
		}
		
		private function ALongTime():void 
		{
			while (true) {
				trace("OK");
				if (flag == false) {
					trace("Out");
					break;
				}
			}
		}
		
		
		
	}

}