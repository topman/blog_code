package view.mediators 
{
	import controller.GameEvent;
	import model.GameModel;
	import org.robotlegs.mvcs.Mediator;
	import view.components.GameBoard;
	/**
	 * ...
	 * @author Tower Joo
	 */
	public class GameBoardMediator extends Mediator
	{
		[Inject]
		public var gameBoard : GameBoard;
		
		[Inject]
		public var gameModel : GameModel;
		
		
		private function onInitGame(e:GameEvent):void 
		{
			gameBoard.init(gameModel.map, gameModel.filledTiles, gameModel.tileColor);
		}
		
		override public function onRegister():void 
		{
			eventMap.mapListener(eventDispatcher, GameEvent.INIT_DONE, onInitGame);
			eventMap.mapListener(eventDispatcher, GameEvent.START, onStartGame);
		}
		
		private function onStartGame(e:GameEvent):void 
		{
			gameBoard.startGame(gameModel.filledTiles);
		}
		
	}

}