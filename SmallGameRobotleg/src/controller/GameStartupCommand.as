package controller 
{
	import model.GameModel;
	import org.robotlegs.mvcs.Command;
	/**
	 * 游戏启动时的命令
	 * @author Tower Joo
	 */
	public class GameStartupCommand extends Command
	{
		[Inject]
		public var gameModel : GameModel;
		
		override public function execute():void 
		{
			gameModel.initGame();
			dispatch(new GameEvent(GameEvent.INIT_DONE));
		}
		
	}

}