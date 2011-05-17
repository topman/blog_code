package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Tower Joo <zhutao@lehu-tech.com>
	 */
	public class Main extends Sprite 
	{
		private var context : MainContext;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			context = new MainContext(this);
			context.startup();
		}
		
	}
	
}