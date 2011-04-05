package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Tower Joo <zhutao@halfquest.com>
	 * 实验目标:
	 * 
	 * 1. 事件监听执行的顺序是否与注册的顺序相同 --- 是相同的
	 * 2. 当前执行的代码是否会等待监听事件执行完成再继续执行?
	 * 3. 事件监听是异步执行(执行顺序不确定)还是顺序执行(根据注册顺序)?  -- 应该是顺序执行
	 * 4.  是否存在消息死循环的问题?(即A->B->A)  -- 存在这个问题
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			AppFacade.getInstance().startup(stage);
		}
		
	}
	
}