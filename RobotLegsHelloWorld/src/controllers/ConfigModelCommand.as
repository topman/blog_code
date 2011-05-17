package controllers 
{
	import events.ApplicationEvent;
	import models.UserModel;
	import org.robotlegs.mvcs.Command;
	import services.UserService;
	/**
	 * 初始化相关的model
	 * @author Tower Joo <zhutao@lehu-tech.com>
	 */
	public class ConfigModelCommand extends Command
	{
		
		override public function execute():void 
		{
			// 注册一些单例的类，以方便使用
			var singletons : Array = [UserModel, UserService];
			for each(var klass : Class in singletons) {
				injector.mapSingleton(klass);
			}
			
			dispatch(new ApplicationEvent(ApplicationEvent.CONFIG_VIEW));
		}
	}

}