package  
{
	import controller.GameEvent;
	import controller.GameStartCommand;
	import controller.GameStartupCommand;
	import flash.display.DisplayObjectContainer;
	import model.GameModel;
	import org.robotlegs.mvcs.Context;
	import view.components.GameBoard;
	import view.components.InGameScore;
	import view.components.Score;
	import view.components.SettingsBoard;
	import view.mediators.SettingsBoardMediator;
	
	import view.mediators.GameBoardMediator;
	import view.mediators.InGameScoreMediator;
	import view.mediators.ScoreMediator;
	/**
	 * ...
	 * @author Tower Joo
	 */
	public class MainContext extends Context
	{
		
		public function MainContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void 
		{
			// 增加model mapping
			injector.mapSingleton(GameModel);
			
			// 增加command mapping
			commandMap.mapEvent(GameEvent.INIT, GameStartupCommand);
			commandMap.mapEvent(GameEvent.START, GameStartCommand);
			
			// 增加mediator mapping
			mediatorMap.mapView(InGameScore, InGameScoreMediator);
			mediatorMap.mapView(GameBoard, GameBoardMediator);
			mediatorMap.mapView(Score, ScoreMediator);
			mediatorMap.mapView(SettingsBoard, SettingsBoardMediator);
			
			// 初始化相关的mediator
			
			contextView.addChild(new GameBoard());
			contextView.addChild(new Score());
			contextView.addChild(new InGameScore());
			contextView.addChild(new SettingsBoard());
			// 开始消息循环
			eventDispatcher.dispatchEvent(new GameEvent(GameEvent.INIT));
			
			
		}
		
	}

}