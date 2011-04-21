package 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import org.robotlegs.mvcs.Context;
	import view.SimpleView;
	import view.SimpleViewMediator;
	
	/**
	 * 主程序入口
	 * @author Tower Joo
	 */
	public class Main extends Sprite
	{
		private var context:MainContext;
		
		public function Main()
		{
			context = new MainContext(this);
		}
	}
	
}