package view.mediators 
{
	import controller.GameEvent;
	import model.GameModel;
	import org.robotlegs.mvcs.Mediator;
	import view.components.InGameScore;
	/**
	 * 游戏进行中的得分显示
	 * @author Tower Joo
	 */
	public class InGameScoreMediator extends Mediator
	{
		[Inject]
		public var inGameScore : InGameScore;
		
		[Inject]
		public var gameModel : GameModel;
		
		override public function onRegister():void 
		{
			eventMap.mapListener(eventDispatcher, GameEvent.INIT_DONE, onInitGame);
			
		}
		
		private function onInitGame(e:GameEvent):void 
		{
			inGameScore.init(gameModel.score);
		}
	}

}