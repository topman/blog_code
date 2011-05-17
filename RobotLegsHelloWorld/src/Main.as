package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * 整个程序的入口
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
			// 注意：不需要手动调用context.statup()，否则一些某些事件会触发2次
		}
		
	}
	
}