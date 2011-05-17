package  
{
	import controllers.StartUpCommand;
	import flash.display.DisplayObjectContainer;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	/**
	 * 
	 * @author Tower Joo <zhutao@lehu-tech.com>
	 */
	public class MainContext extends Context
	{
		/**
		 * 构造函数
		 * @param	view
		 */
		public function MainContext(view : DisplayObjectContainer) 
		{
			super(view);
		}
		
		override public function startup():void 
		{
			// 注册起动的command
			commandMap.mapEvent(ContextEvent.STARTUP, StartUpCommand, ContextEvent, true);
			// 发送事件，触发起动的command
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
		
	}

}