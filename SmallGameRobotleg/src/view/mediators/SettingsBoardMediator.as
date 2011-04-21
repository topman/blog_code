package view.mediators 
{
	import controller.GameEvent;
	import flash.events.MouseEvent;
	import model.GameModel;
	import org.robotlegs.mvcs.Mediator;
	import view.components.SettingsBoard;
	/**
	 * ...
	 * @author Tower Joo
	 */
	public class SettingsBoardMediator extends Mediator
	{
		[Inject]
		public var settingsBoard: SettingsBoard;
		[Inject]
		public var gameModel : GameModel;
		
		override public function onRegister():void 
		{
			eventMap.mapListener(eventDispatcher, GameEvent.INIT_DONE, onInitGame);
			eventMap.mapListener(eventDispatcher, GameEvent.START, onStartGame);
			//  接收来自view的事件,并转入robotlegs的事件流
			addViewListener(GameEvent.START, _dispatch);
			addViewListener(GameEvent.SETTING, _dispatch);
			addViewListener(GameEvent.STOP, _dispatch);
		}
		
		private function _dispatch(e:GameEvent):void 
		{
			eventDispatcher.dispatchEvent(new GameEvent(e.type));
		}
		
		
		private function onStartGame(e:GameEvent):void 
		{
			trace(e);
			settingsBoard.startGame(gameModel.shotTime);
		}
		
		private function onInitGame(e:GameEvent):void 
		{
			settingsBoard.init();
		}
		
	}

}