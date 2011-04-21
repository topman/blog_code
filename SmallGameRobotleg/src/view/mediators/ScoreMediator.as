package view.mediators 
{
	import controller.GameEvent;
	import model.GameModel;
	import org.robotlegs.mvcs.Mediator;
	import view.components.Score;
	/**
	 * 游戏结束后显示的得分
	 * @author Tower Joo
	 */
	public class ScoreMediator extends Mediator
	{
		[Inject]
		public var score: Score;
		[Inject]
		public var gameModel: GameModel;
		
		override public function onRegister():void 
		{
			eventMap.mapListener(eventDispatcher, GameEvent.INIT_DONE, onInitGame);
		}
		
		private function onInitGame(e:GameEvent):void 
		{
			score.init();
		}
		
	}

}